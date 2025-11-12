Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFC3CD484D
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 21:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9D2F40AFB;
	Wed, 12 Nov 2025 21:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJ7Cv-lXL5yQ; Wed, 12 Nov 2025 21:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E2040B02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E2040B02;
	Wed, 12 Nov 2025 21:35:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2656D158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2387540B02
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMI_rQlyFefB for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 21:35:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 188B440AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188B440AFB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 188B440AFB
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:35:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -478704422; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 21:35:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJIV0-000wTc-1O;
 Wed, 12 Nov 2025 22:35:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20251112210641.161073-1-thomas.perale@mind.be>
Date: Wed, 12 Nov 2025 22:35:30 +0100
In-Reply-To: <20251112210641.161073-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Wed, 12 Nov 2025 22:06:41 +0100")
Message-ID: <87ecq3q6hp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=jybKmxj+OIooMb2c1fT3oQJ1Oe3frqfh52D6b4QwuUhH65gssIP77GdBiGj+1sumxnUMj2B+WJ+1iA3JLF6Itag+xtKBxvuzlebydGKcTFEuAptViBlFf1cglovjm+m6kFkxaoEM3fbjNvi0uYzf44g1ecIPcmo8ThSC3s8xEuzLePAlyWaeixqiqPhfzpqwbRHZ6gToAHTPDkZ558GW/+qB0QwiogO7U9hCcxgE3mjHGST41axGR9hAAGbiXGQN3YDZ+u+9yxUwYFFN6xA9plXzVxaPm5JxTVRovEy0bdpoRJGBgr3JTWOFvGXmikmhUWNC0xF1Up8azJou440yaA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=tOQ5nl9YzqpU+KctZBjhfabzMJdsI6SY+/pMqBGAWx4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=jybKmxj+
Subject: Re: [Buildroot] [PATCH] package/tpm2-tss: security bump to v3.2.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > For more information about the release, see:
 >  - https://github.com/tpm2-software/tpm2-tss/releases/tag/3.2.3

 > Fixes the following vulnerability:

 > - CVE-2024-29040

 > The JSON Quote Info returned by Fapi_Quote has to be deserialized by
 > Fapi_VerifyQuote to the TPM Structure `TPMS_ATTEST`. For the field
 > `TPM2_GENERATED magic` of this structure any number can be used in the
 > JSON structure. The verifier can receive a state which does not
 > represent the actual, possibly malicious state of the device under test.
 > The malicious device might get access to data it shouldn't, or can use
 > services it shouldn't be able to.

 > For more information, see:
 >   - https://nvd.nist.gov/vuln/detail/cve-2024-29040
 >   - https://github.com/tpm2-software/tpm2-tss/security/advisories/GHSA-837m-jw3m-h9p6

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  package/tpm2-tss/tpm2-tss.hash | 2 +-
 >  package/tpm2-tss/tpm2-tss.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
 > index c9fa4e6ae0..d8730ba0e1 100644
 > --- a/package/tpm2-tss/tpm2-tss.hash
 > +++ b/package/tpm2-tss/tpm2-tss.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed:
 > -sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
 > +sha256  6279a9a1983ea6ffe41925067b7f0de3a6ed95020a30e7c97d80fa2754259534  tpm2-tss-3.2.3.tar.gz
 >  sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
 > diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
 > index 81a1a0e59b..095b57baea 100644
 > --- a/package/tpm2-tss/tpm2-tss.mk
 > +++ b/package/tpm2-tss/tpm2-tss.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -TPM2_TSS_VERSION = 3.2.2
 > +TPM2_TSS_VERSION = 3.2.3

I guess your tree is not uptodate, master is using 4.1.3 since:

commit 04533b70e6dd908dcaaa275b47de55fed0b9908d
Author: Abelino Romo <abelino.romo@gmail.com>
Date:   Wed Nov 5 12:32:08 2025 +0100

    package/tpm2-tss: security bump version to 4.1.3

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
