Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45917CA0EF8
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 06:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F74840D9;
	Thu, 21 Aug 2025 06:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8gc9BEq5QRc; Thu, 21 Aug 2025 06:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF0D8840DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF0D8840DD;
	Thu, 21 Aug 2025 06:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2083AE0A
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 06:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1257B416DE
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 06:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9rAEK-De0fP for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 06:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F0C1416C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F0C1416C3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F0C1416C3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 06:47:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1184873501; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 Aug 2025 06:47:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uoz5M-00FN8X-14;
 Thu, 21 Aug 2025 08:47:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
References: <20250820165502.1984588-1-angelo.compagnucci@gmail.com>
Date: Thu, 21 Aug 2025 08:47:44 +0200
In-Reply-To: <20250820165502.1984588-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Wed, 20 Aug 2025 18:55:02 +0200")
Message-ID: <87y0rdkw6n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nllM8OQGatnU/hn31cEmW9DEBNlls51TGJzOnsfhGh2hoK82gypsMrBMY7BkwBXKrCr9wUoTZOVfbf8USakKw/EAtAU7wUk3DG922vD/kk2vCxQb71s81xWQ7LFV0kNO8ddzis333LdJ9SvGQG7WPSWA3PzND0S5iuT2LceAkhL5YHHt2HogpGhIW2A02n6hd2QW1REin9b3upcPgTAiFFxNgFZ1yttKg7p8CG4li2/9NS7GaUVDbd8Cz7KQEscmdYMs6atBL2faNrT69kdb4ANip3f52JPWSy5rNgC7jApyG1qBfI5JNJ0H8z5iY6pQa6CXnHtYN5EFH9M7Ih2ZVA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=3tOt/2hA6hiJgBBRna+E9S3/f9jcTx4KV+IYzd2An/U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=nllM8OQG
Subject: Re: [Buildroot] [PATCH v3] package/jq: security bump to version
 1.8.1
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

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Changelog:
 > https://github.com/jqlang/jq/releases/tag/jq-1.8.1

 > COPYING:
 > Add LICENSE notice of NetBSD's strptime() to COPYING
 > https://github.com/jqlang/jq/commit/78045d8aa9d155ec0f82ab102aa752300c2349f1

 > Fixes the following security issues:

 > - CVE-2025-49014: Fix heap use after free in f_strftime, f_strflocaltime.

 >   https://www.cve.org/CVERecord?id=CVE-2025-49014

 > - GHSA-f946-j5j2-4w5m: Fix stack overflow in node_min_byte_len of oniguruma.

 >   https://github.com/jqlang/jq/security/advisories/GHSA-f946-j5j2-4w5m

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > ---
 > v1-> v2:
 > * Updated COPYING hash (Thomas P)
 > v2-> v3:
 > * Adding new license (Julien Olivain)
 > * Adding security issues links (Julien Olivain)

 >  package/jq/jq.hash | 4 ++--
 >  package/jq/jq.mk   | 5 +++--
 >  2 files changed, 5 insertions(+), 4 deletions(-)

 > diff --git a/package/jq/jq.hash b/package/jq/jq.hash
 > index 344f73d463..4596134620 100644
 > --- a/package/jq/jq.hash
 > +++ b/package/jq/jq.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  jq-1.8.0.tar.gz
 > -sha256  ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  COPYING
 > +sha256  2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0  jq-1.8.1.tar.gz
 > +sha256  ad2b4a266b2268939c1446979759706077421cf906a203aa188c6f396e8cfd74  COPYING
 > diff --git a/package/jq/jq.mk b/package/jq/jq.mk
 > index f3f4704f37..c1b47ce829 100644
 > --- a/package/jq/jq.mk
 > +++ b/package/jq/jq.mk
 > @@ -4,9 +4,10 @@
 >  #
 >  ################################################################################
 
 > -JQ_VERSION = 1.8.0
 > +JQ_VERSION = 1.8.1
 >  JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 > -JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 > +JQ_LICENSE = JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation),
 > +	BSD-2-Clause (strptime)

This is not even legal make syntax :( Fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
