Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44041606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BOtLgpcz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=NHR45r0P
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E90408E8;
	Thu,  5 Nov 2026 21:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFPZLQhDxdsO; Thu,  5 Nov 2026 21:55:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D55E408E3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793915729;
	b=OuWOcMbTxMmFgq5aVsbPxJ4fqp3Xtnj+zxd0yAT1DsUOdzDo8YaALzIF2DaLgXhIe39U
	 S6MB1RoUXIENsV7JTyaIpSqmxkSz3mAZAtPBRKmrGgmfEZOM/4vvcnIoNS5bDSLsmTyQ5
	 xP2VDeW2SQ8BWbdZ7zZmTX3Wp/S2sImi9oYk680Bhpq/V2oYEVh5j4o1y5AwszccblkgN
	 zvGX+ECUcW4VjHyUiT6Xa7LmMQd5fXylY1P7CFanUbg6o1Cq4p51lzHGPxrkQZod4d+lk
	 lqBGSJo0a2yCstZj6CZflQFsNIFAXuZ5Ve+txJ1de+wu+XI49HEK3pSOynJ18Whvipw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793915729;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JO6/GC+OePsIChqp2hFrIPvZ/V3OhGyPfTdJB87P4QI=;
	b=GTJz4Hj05fOmZib3l7FXFd3uFBy+AHaDfAcZp1+aKWC/0JcaMBDeISC+y4/NgWWfiDxz
	 Qwpd9H58lMF/gbx6B7aissY2zJfsDDWPbiOrso1xsw/mMaXJ/QKoJVm+KBlCLi2CHwrbl
	 50vKTfKLb7FKV/7IiSWZPb0V6DtCbxccVglyAKTLylUyuOdHgmSji+L6fYV+1VY64//iI
	 +6tG1PNxtgnXNe9InXjoj6lbkegpZWTGKoOYCOXtjz76yu5+Z++QGlxx2ohQEp/9GdaPP
	 Jm2CB9Q2fxy1OFndv3g77r3K0A1c/FBMHPyiYx+wnTVyauYvHmbR6N1+ZDuUI4MHy3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793915729;
	bh=JO6/GC+OePsIChqp2hFrIPvZ/V3OhGyPfTdJB87P4QI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BOtLgpczc/XT+WJ8VxyFW5/1KDaMVvW3F6vx850E+v6a9D3DuEt6N1yCFjzsa7OMQ
	 bWOi8CQp2CMK0kzCGV7+BP+D8mTbU7epg5HCOeaor4TmbVyjswTS2W9mHifLGzVCN9
	 seihbEovDP6/WVgQfKd/Wopf8BUFPbWmCF/YSQhn0x1V6PcD8+hO7/jFt9ZFCQFSQF
	 Yfe9PXAlXBpQgbx73NM3Zq4CsJA69ohQC7r6aqcvo03/TeFgtJn7pjSFbNPJo+VedT
	 VI/ANRMF2tfB1YwBgTVrcNwUwSD1WBlowWqjI/HqVsWZaaULCoQVU+iNq6ffVWZ03z
	 cc4BfqD9xxd4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D55E408E3;
	Thu,  5 Nov 2026 21:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC758B7E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E3A96085F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe7PecpJqZdk for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA44B6085B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NHR45r0P
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA44B6085B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793915724;
 bh=Ll6HUc+FnKuCh8X5ELeZTgbtpWO4Qtkt0do3k5rhgu8=;
 h=From:To:Cc:Subject:Date:From;
 b=NHR45r0PoC8fYXu8jnRvbyw6H5byT0Jnm1/NYMN/bL/uYxJ2hfQzF9tlFnyJE50Kl
 ajyq5FxdEyVNLbmKQZ8MptBa8zpDOIqdHyIGz7zj9LvaqIK4fXbnnyOCIXRDVFSHx+
 otspEWPupCm9ZK5mjSjEa5OlsimjXP4uayEVGm3f26nadFy64rlkEQ4EGOdq3iC5tY
 Ew3fL2v7wAad9TT7j0B2hNuGos1ME0nLND97MciAnkivLTYPf+G9omBqI4tEu9Pec5
 KfsqSS+DrV/dN9WBzsIL327a/Ra4L3C1lP1U5A6BHVO3j9rCMKJIv8QGeYtSVXQrzg
 y7IiW0ZXsa5uw==
X-KAS-Sym: v3:f51bdf72230551df:oBFdRS2G8zfHBKRj6bG8Ba8AHJg7PXKupIQoU300YtD6J
 tzNbxyL69nUvBs0dh9dS989O1obLAFF6Hdf4ZLvvNkOyCHBtxzmxbHsHJBRDGOBayWkDMwH9NDD
 LQePK7osGqt2/g/FFH5/ja14WOBlEiEsA65gV8U/TFcLU/BUSQIV5BGXWlamtlPQFlpjMtWmzeN
 hO4BFtEMIEZ9r0iQ7LMNU5Z2+bNVKkVtYsbJxkV5wyr6okmE94aIwxIuLG+ZI4v+xmGRMuJdvmn
 pPNBFV2kRJ65+8CckieQVnIGJcS8hhT5jSeM+ux2U5EJdmruwawqxEhHVVwh5kCcKPfGu7DQ==:
 FZtBWXS6SF44PAbncd9Xnw9aWhieZ9oyExLcXgts/SXT0dSIbKRVzBsv9si1QlKyeRE/f4SWCKA
 iz7SlcfZMBQ/wcKT1UI/fBxLqt/zxu9czQGEkhHYJurz+0BeThuvaso5KfuEz3qdeNbe4BQeeDW
 8QXRgPGFwoHWezyOu2pIgqQVnYE3e/nO9jHIt16H9bAgZPi+CwdIRxlha8cYQDRk7Ntn4XnssYG
 W7kpuIY8Yo28t7jpfgXunfT2xZgZbHRR//st5OxLO9VkK3G4ILg25qMF8h5axZjzJffEc3jMMuo
 k84Q+s5gWORfAgKu0EWAKrhXcQwnp8BrGDDEcXXBi99nrhOLASSRN761Cu98pRb/fXEc1ATN8Ip
 qrw4HSnKffy13sruXf4gJsO8utd0SVkKfTNvERveY4XkKZ2HNZXGhu9FcwbqlwvV4DYEzr8L66J
 4SbMdPUnN5oNoHLwFra0QhxVjqDijqJPnLSAEGTzDvUAlfq7jnNfDX0jx3Du/CqZ+k77N/Bgy8Z
 tYNyUlbNnebKOk5f5vAw0sIq/xpD3oAy5/INdrufgYhx4hFnxWaIOFdRRYX5ie6TMQw7f+L5UDv
 tH2j+/Zce3BmlQSnCp8W1oPjqkB2xqHbZ4KAHZTTiZtHyd8AoOLUJODywLzPoJA=
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A6A1A4C38F3;
 Thu,  5 Nov 2026 22:55:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59934)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP5QZ-0000000049H-3jjv;
 Thu, 05 Nov 2026 21:55:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Nov 2026 22:55:23 +0100
Message-ID: <20261105215523.1641743-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: bump version to 2.44-70-g21442dba0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 51e29673c3..9deb97a267 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  902d628994c2f3b30af4a7f507835079852cc8ed21d8a7f340e45dc5dae148bf  glibc-2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746-git4.tar.gz
+sha256  5e09d1c1717d779862645ee5ad4a0a3665f2a185dc0832b1daa7b9f593f195e0  glibc-2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 435a97361b..2c202b1ce8 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
+GLIBC_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index becbdfae7f..8cef67f2c4 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
+LOCALEDEF_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
