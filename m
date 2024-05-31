Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93478C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 17:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9318D40108;
	Fri, 31 May 2024 17:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RP0RSRJOcn_n; Fri, 31 May 2024 17:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5756542441
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5756542441;
	Fri, 31 May 2024 17:38:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1F801D55AD
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA4E14172C
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgQUGtGyPYmb for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 17:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6063F4144C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6063F4144C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6063F4144C
 for <buildroot@buildroot.org>; Fri, 31 May 2024 17:38:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97A36C0003;
 Fri, 31 May 2024 17:38:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sD6Cp-00FJsn-0Q;
 Fri, 31 May 2024 19:38:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists--- via buildroot <buildroot@buildroot.org>
References: <20240521134159.2268664-1-yegorslists@googlemail.com>
Date: Fri, 31 May 2024 19:38:19 +0200
In-Reply-To: <20240521134159.2268664-1-yegorslists@googlemail.com>
 (yegorslists's message of "Tue, 21 May 2024 15:41:59 +0200")
Message-ID: <87le3plw50.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/ncftp: bump to version 3.2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

>>>>> "yegorslists---" == yegorslists--- via buildroot <buildroot@buildroot.org> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Fix download location.

Fix as in it wasn't working for 3.2.6 or just that it isn't available
for 3.2.7?

 > Remove already upstreamed patch.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/ncftp/0001-fix-gcc-10.patch | 24 ------------------------
 >  package/ncftp/ncftp.hash            |  2 +-
 >  package/ncftp/ncftp.mk              |  4 ++--
 >  3 files changed, 3 insertions(+), 27 deletions(-)
 >  delete mode 100644 package/ncftp/0001-fix-gcc-10.patch

 > diff --git a/package/ncftp/0001-fix-gcc-10.patch b/package/ncftp/0001-fix-gcc-10.patch

You forgot to remove it from .checkpackageignore as pointed out by
utils/check-package:

Applying: package/ncftp: bump to version 3.2.7
.checkpackageignore:1089: ignored file package/ncftp/0001-fix-gcc-10.patch is missing

 >  ################################################################################
 
 > -NCFTP_VERSION = 3.2.6
 > +NCFTP_VERSION = 3.2.7
 >  # use .gz as upstream .xz tarball has changed after the hash was added for
 >  # 2017.02. Can be changed back to .xz when version is bumped
 >  NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz

How about that? How about using the .tar.xz?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
