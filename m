Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CF3CFA443
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 20:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E9E240C24;
	Thu, 20 Nov 2025 20:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHmNbVTNCiKN; Thu, 20 Nov 2025 20:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 981A840C25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 981A840C25;
	Thu, 20 Nov 2025 20:34:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F083117
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3101140526
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIJbNR3OHweS for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 20:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D98EB4024F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D98EB4024F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D98EB4024F
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:34:17 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1066138761; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Nov 2025 20:34:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vMBM1-00000004BVM-30fD;
 Thu, 20 Nov 2025 21:34:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Sen Hastings <sen@hastings.org>
In-Reply-To: <20251119213420.7480-5-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Wed, 19 Nov 2025 22:34:20 +0100")
References: <20251119213420.7480-1-thomas.perale@mind.be>
 <20251119213420.7480-5-thomas.perale@mind.be>
Date: Thu, 20 Nov 2025 21:34:09 +0100
Message-ID: <87o6owjvem.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ePTrLXMfj7je9Ws1HVFNhoBJ5efD9k3jugo8mm38sqTvGgIu2SXh+tq2XIQgwX4p/zhsLl/ik18U8s7eaUxCJyXiH+VbKAyqRbcFIBM8WgJq0iVhNllUjVm0Yy8LT7kVAufKnH6IL9doEnCtVL0x20O4j5TpA129heMJQxKb7Ry1NcZlKCJxJJmKxFwgIEUdUt6qnjNtShcG78lt6nA43NYyX4XB35s2uJlTcBukG1j6w1NEFb7cZCOOPpZ+WvDcPSOO77Awdy7AXOAUXtxlu2Eco0LqnDslccqHQQu0U6oHsHAg3dPHC5YCfaF/VLhx/kkSCwdbG+eG1KYHX8Us3w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=95Sd2mSddv0rLBuKIOAYoabM4YE6RTyVuDzV4U1pKZU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ePTrLXMf
Subject: Re: [Buildroot] [PATCH v2 4/4] docs/manual: add information on
 CycloneDX
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

 > This patch adds information on how to generate a CycloneDX SBOM in
 > Buildroot. It also mentions how to track CVEs with that given SBOM.

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  docs/manual/common-usage.adoc | 27 +++++++++++++++++++++++++++
 >  1 file changed, 27 insertions(+)

 > diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
 > index 43caa3a9bc..c561944be5 100644
 > --- a/docs/manual/common-usage.adoc
 > +++ b/docs/manual/common-usage.adoc
 > @@ -180,6 +180,33 @@ a newer upstream version for those packages.
 >  make pkg-stats
 >  ----
 
 > +=== Generating CycloneDX SBOM
 > +
 > +Based on the output of +show-info+ Buildroot can generate SBOM in the CycloneDX
 > +format specification. While it doesn't offer any additional informations,
 > +CycloneDX is a format specification that can be consumed by other projects.

The wording sounds a bit odd to me, so I slightly changed it to:

Based on the output of +show-info+ Buildroot can generate a SBOM in
the CycloneDX format. While it doesn't offer any additional
information, CycloneDX is a format specification that can be consumed
by other projects.

And committed, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
