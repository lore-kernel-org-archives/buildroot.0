Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3348CD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 17:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A5EC41B68;
	Mon,  4 May 2026 17:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSIzN93MXdm6; Mon,  4 May 2026 17:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C129F41B6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777915061;
	bh=ZOmJzpTH2WzOaRkB9i6CeeloQiJp9/Il0NcpoJgurv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tAoNgXxtBfl5QQqMVOWLj2GnaCXHSwK/9HIIphY2oGcg/s0LmGy7X/kEhbldVGqk1
	 dWPYkW0Hx2gKKIveibbhcCA0R57fmHP6VS+P2BEV7h6Dfx86mahAhTEmtPmEVw0ADd
	 IekYIobC7XtiY1gD+rynOn1afOp6R965v4QcknhKKoWpouZt/X0Vv2da2CiKb3XWI2
	 ebfnnBK/xvDfHqN0h4khOOPrJzH/QE8Z2b9Qykwtk7aXDUii0q38jXq6mQslV4Uqi0
	 ykXeMTm0U15uuPDBktF/8Ng7wMnt9WxB0L8Pzm8e7NBmxrVp3L5EzsCJc6DeRvHVzO
	 /m0I4iMSKl8xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C129F41B6F;
	Mon,  4 May 2026 17:17:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E081204
 for <buildroot@buildroot.org>; Mon,  4 May 2026 17:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FD5D41B6F
 for <buildroot@buildroot.org>; Mon,  4 May 2026 17:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPNsGO8EbOmg for <buildroot@buildroot.org>;
 Mon,  4 May 2026 17:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B1BB41B68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B1BB41B68
 for <buildroot@buildroot.org>; Mon,  4 May 2026 17:17:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CCCC8439A; Mon,  4 May 2026 17:17:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 May 2026 19:11:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22f1e90d6ba61e9e6306d98461adad29debd6c7b
X-Git-Newrev: 206cd3cd31e1bff61f42b2bde9f71e0e003f6c14
X-Patchwork-Hint: ignore
Message-Id: <20260504171739.6CCCC8439A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mutt: bump version to 2.2.16
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/206cd3cd31e1bff61f42b2bde9f71e0e003f6c14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bugfix release fixing crash / NULL pointer access issues and gsasl
authentication compatibility with Microsoft servers.

Mutt 2.2.14 was released on February 20, 2025.  This is a bug-fix release,
fixing a couple possible crashes, in GPGME and with IMAP when logging out,
and correcting a small issue with unnecessary encoding of "." in attachment
names (2231 encoding).

Mutt 2.2.15 was released on October 2, 2025.  This is a bug-fix release,
fixing an IMAP search/limit bug, a compilation issue, and containing a
workaround for gsasl SMTP authentication issues with some MS servers.  A few
parts of the documentation were also improved.

Mutt 2.2.16 was released on November 22, 2025.  This is a bug-fix release,
fixing a resource leak when compiled with OpenSSL/LibreSSL, which could
eventually result in new connections failing.

http://www.mutt.org/news.html

The 2.2.16 release is not available on bitbucket, so change to the official
ftp.mutt.org location instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 72c7924e9b..4fd71fd6ab 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb23faddc1cc97d867693f3a4a9f30949ad93765ad5b6fdae2797a4001c58efb  mutt-2.2.13.tar.gz
+sha256  1d3109a743ad8b25eef97109b2bdb465db7837d0a8d211cd388be1b6faac3f32  mutt-2.2.16.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 9a6be6d4a0..503f2d283e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.13
-MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
+MUTT_VERSION = 2.2.16
+MUTT_SITE = http://ftp.mutt.org/pub/mutt
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
 MUTT_CPE_ID_VENDOR = mutt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
