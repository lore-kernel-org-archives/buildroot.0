Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E92DE8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6354409B4;
	Fri, 26 Dec 2025 18:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDMkH_ExRUs6; Fri, 26 Dec 2025 18:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E334097F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773282;
	bh=OZSfxYqpYgQmQn1tEJucIVU6Qmw7Mrhp/trAmqwapyc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ca2pPKp7c0XSvHpsaR0adfgTOjT+qClKlEztBvgwNNCzQuICZqMAWzKNhDwnaSJbI
	 b8gpTWyKACTp0wmm86O+tNT3Cm2nU8Z5w05SLPqyp0CFype15RY04HlLNN9yHcbOZ6
	 QfAYXP2zP6mSIa/NgHmIjiEvNCPdgzczmEBfsmmMBzv+EsXuXe56+9KrRoQkXrRtmB
	 UnkP8IVh78UFh6o7b5nf+ZazjFRj1uOljNeIO5T1jdCD0/mgY/r8NUp2n7Tx93IsT5
	 y5ja83iLeA4D2lxQWxGq4R3C9XaZS+JkV+vu5t57veju4H6jnupnghJ7VwISxLmVhH
	 0WSbl2aP5GlwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E334097F;
	Fri, 26 Dec 2025 18:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D040B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EA3580C87
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xjtuVXupzmq for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2865680B34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2865680B34
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 237A38461E; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c21dec12130c083d569a499f0badb4084988531e
X-Git-Newrev: cf2471a9d958b0eaa2db3508e96b465eaa481f3e
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.237A38461E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/thrift: bump version to 0.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf2471a9d958b0eaa2db3508e96b465eaa481f3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/apache/thrift/blob/v0.22.0/CHANGES.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/thrift/thrift.hash | 4 ++--
 package/thrift/thrift.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index 20d6baeace..a517900c82 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/thrift/0.14.1/thrift-0.14.1.tar.gz.sha256
-sha256  13da5e1cd9c8a3bb89778c0337cc57eb0c29b08f3090b41cf6ab78594b410ca5  thrift-0.14.1.tar.gz
+# From https://downloads.apache.org/thrift/0.22.0/thrift-0.22.0.tar.gz.sha256
+sha256  794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5  thrift-0.22.0.tar.gz
 # License files, locally calculated
 sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index c36efce2ed..177b75903b 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.14.1
-THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
+THRIFT_VERSION = 0.22.0
+THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
 THRIFT_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
