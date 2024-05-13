Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E530FC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 09:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A7CB83337;
	Mon, 13 May 2024 09:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54h1g20skq-M; Mon, 13 May 2024 09:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6ECB832DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6ECB832DC;
	Mon, 13 May 2024 09:20:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6C01BF239
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 09:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3804481FE0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 09:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKZqf11Xs0jX for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 09:19:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D05081E96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D05081E96
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D05081E96
 for <buildroot@busybox.net>; Mon, 13 May 2024 09:19:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4z6q-1sXmOL05S8-012J3H
 for <buildroot@busybox.net>; Mon, 13 May 2024 11:19:53 +0200
To: buildroot@busybox.net
Date: Mon, 13 May 2024 11:19:48 +0200
Message-ID: <20240513091950.30116-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513091950.30116-1-ps.report@gmx.net>
References: <20240513091950.30116-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hZ890/VXKHT9yZN4dct6wEZjEcGpCr9sX3rSmVgIWx0u/It3NVt
 U6HoGRZ3YxOkWmYiwbUQOt/Z+NW/SLXcb3iyU5Txw50XJO9F37/qQhnyQWaBe7Hcv6jiA0X
 glXXPCmyJ/+jdjN998CjnWcQhzlJSKWi13LuI2XlKXfaYorNeE9LHo40wKdtOd83AVgV9ja
 o+T+kw5GenF1ShrIjyiYg==
UI-OutboundReport: notjunk:1;M01:P0:V9TUyY2XM+E=;gDeFoP9KWrFGb+by4pCe4e3n+D5
 GOTAwhA3tKQkXxQdPNOQajUv/NqmmU90neB7ZpqRGpM2BGLknwCvOzbRj1duzR/eHw+dnkx5r
 MQ5u30cQJi4qYhBXfsvqpokOF4TYeQx1xywwmXbRw4knKoizEKJALNS4JGpLuoZuqUg0KcrVu
 2dvEiCYJGPkaFZ39OZn188YkPdTGumofWPmBeitWTC3cUTJzD2GkATrXoJVbWuuRjTyLZ//HM
 ZTZns15mDLuEKw6YoYSDxjRiGKuEKxGco//lO+ZayQSGxm+HiU27n5lRYzUx+oOQlptBqcJKX
 kPd7zynkBYEqqW0gGbx6gh+zdhqbJGpGcMBR02oHgdfe1QkhBWUYSj+8boX2QVoEKS/s6UOar
 jsBqd760OqKNLGEJ0SYXrAYNOj+UUg2ryKpYNtVQQPbSrPYeQmpYFAcQ5g50h1Ce3eZXG8YLo
 96oxvF+4Qu+6vhSOaNhonp++dBQjtqTT2Ktpb9Tu9E2cWHKWVc6/tvIhG2dTtBSCZC9aVOBrM
 gmiTwN/ko70dvDicZLGRQhs+jRSsy2hnFXPTt3SrwRVwJnBpLjjz/GQf+RIz70+cYtbe8vD+T
 OmVa7E8OiwwUbkVFY2fJh2AGK0iF+oT6Kaz4U2M8HhkmyaA6CMY0pTDKm2MDg1G8du4uRP0r5
 zNElg4nMfr2ibjYh/LtfnjgezZR6nMc/mMFTOIvhIqTF1Bmqt/D6SfJn4mPQwsglGdHb2AlhJ
 HUqzUQJAIwLbDsKwwfgnTWBKms8e5AoPUh7YgF1ftEAG36NqUohYtmOs5fTbt//GxXQEEGAhU
 7VKC5ZfvRhh02OcQ1kd5IZCN+3uuKLB9lCdFZx8DeX3CQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715591993; x=1716196793; i=ps.report@gmx.net;
 bh=M1LrUl8EqpgNaXA6Ad/6x2B3aBbXMUrp1AKW2JqNErg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qVzPpmbN7R1ed7z0b+PZ8LaIA3Hn4iZwlxZV4Qh3hIyi19+l2JW3NP5EOzMvtAvY
 nsYXSrAxK/G/TZ/aiRcmyNc93N5arzk2cVttRIqCJirsfH2j+6t4c2lS/7QgIvJq8
 n/nljo9YoajmfCxMZQVBJ70bhzBSHJgUc8lIKvblhixmq8rVwfMkqrB0dmW4nSQbO
 vbmyIeqwyUrkjelgys9waoxubtSpkzh9MGaZaAWIAuixV1xEMpYc1dJJOIpl9TMSM
 yOHEqSrVjpnTShroH8nHPIEEEzdJnyVHR6+gdCGAfXJAlEuBKMp4iVyYPp0VVEc6I
 MguXKfgdnuoS6HxQ3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=qVzPpmbN
Subject: [Buildroot] [PATCH v2 4/4] package/openssl: move
 libopenssl/libressl/.br2-external.in.openssl source statements outside of
 the choice
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/libopenssl/Config.in:5:warning: choice value must have a prompt
  package/libopenssl/Config.in:7:warning: defaults for choice values not supported
  package/libopenssl/Config.in:15:warning: choice value must have a prompt
  package/libopenssl/Config.in:18:warning: defaults for choice values not supported
  package/libopenssl/Config.in:19:warning: defaults for choice values not supported
  package/libopenssl/Config.in:20:warning: defaults for choice values not supported
  package/libopenssl/Config.in:21:warning: defaults for choice values not supported
  package/libopenssl/Config.in:22:warning: defaults for choice values not supported
  package/libopenssl/Config.in:23:warning: defaults for choice values not supported
  package/libopenssl/Config.in:24:warning: defaults for choice values not supported
  package/libopenssl/Config.in:25:warning: defaults for choice values not supported
  package/libopenssl/Config.in:26:warning: defaults for choice values not supported
  package/libopenssl/Config.in:27:warning: defaults for choice values not supported
  package/libopenssl/Config.in:28:warning: defaults for choice values not supported
  package/libopenssl/Config.in:32:warning: defaults for choice values not supported
  package/libopenssl/Config.in:33:warning: defaults for choice values not supported
  package/libopenssl/Config.in:34:warning: defaults for choice values not supported
  package/libopenssl/Config.in:50:warning: defaults for choice values not supported
  package/libopenssl/Config.in:54:warning: defaults for choice values not supported
  package/libopenssl/Config.in:58:warning: defaults for choice values not supported
  package/libopenssl/Config.in:62:warning: defaults for choice values not supported
  package/libopenssl/Config.in:66:warning: defaults for choice values not supported
  package/libopenssl/Config.in:70:warning: defaults for choice values not supported
  package/libopenssl/Config.in:75:warning: defaults for choice values not supported
  package/libopenssl/Config.in:79:warning: defaults for choice values not supported
  package/libopenssl/Config.in:83:warning: defaults for choice values not supported
  package/libopenssl/Config.in:87:warning: defaults for choice values not supported
  package/libopenssl/Config.in:91:warning: defaults for choice values not supported
  package/libopenssl/Config.in:95:warning: defaults for choice values not supported
  package/libopenssl/Config.in:99:warning: defaults for choice values not supported
  package/libopenssl/Config.in:103:warning: defaults for choice values not supported
  package/libopenssl/Config.in:107:warning: defaults for choice values not supported
  package/libopenssl/Config.in:111:warning: defaults for choice values not supported
  package/libopenssl/Config.in:115:warning: defaults for choice values not supported
  package/libopenssl/Config.in:119:warning: defaults for choice values not supported
  package/libopenssl/Config.in:123:warning: defaults for choice values not supported
  package/libopenssl/Config.in:130:warning: defaults for choice values not supported
  package/libopenssl/Config.in:134:warning: defaults for choice values not supported
  package/openssl/Config.in:12:error: recursive dependency detected!
  package/openssl/Config.in:12:	choice <choice> contains symbol BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
  package/libopenssl/Config.in:5:	symbol BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC is part of choice BR2_PACKAGE_LIBOPENSSL
  package/openssl/Config.in:17:	symbol BR2_PACKAGE_LIBOPENSSL is part of choice <choice>
  For a resolution refer to Documentation/kbuild/kconfig-language.rst
  subsection "Kconfig recursive dependency limitations"

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix typo in subject line (statements vs. statemetns)
  - move 'if BR2_PACKAGE_LIBOPENSSL' from package/libopenssl/Config.in
    to package/openssl/Config.in (suggested by Yann E. MORIN)
  - move 'f BR2_PACKAGE_LIBRESSL' from ackage/libressl/Config.in to
    package/openssl/Config.in (suggested by Yann E. MORIN)
  - move .br2-external.in.openssl source statement outside of the choice
    (suggested by Yann E. MORIN)

Notes:
  - with this solution for .br2-external.in.openssl exactly one alternative/
    external openssl library can be provided (previously more than one
    additional entry could be provided inside the choice)
---
 package/libopenssl/Config.in |  4 ----
 package/libressl/Config.in   |  4 ----
 package/openssl/Config.in    | 19 ++++++++++++++-----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 0c8db52e2e..53112ff927 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -1,5 +1,3 @@
-if BR2_PACKAGE_LIBOPENSSL
-
 # 4xx PowerPC cores seem to have trouble with openssl's ASM
 # optimizations
 config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
@@ -132,5 +130,3 @@ config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
 	bool "enable compression"
 	default y
-
-endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 600829cb9e..2146481faa 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -1,9 +1,5 @@
-if BR2_PACKAGE_LIBRESSL
-
 config BR2_PACKAGE_LIBRESSL_BIN
 	bool "openssl binary"
 	help
 	  Install the openssl binary to the target file system. This is
 	  a command line tool for doing various cryptographic stuff.
-
-endif
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 3d14988d99..bee22aa69f 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -28,8 +28,6 @@ config BR2_PACKAGE_LIBOPENSSL
 
 	  Note: Some helper scripts need perl.
 
-source "package/libopenssl/Config.in"
-
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -44,12 +42,23 @@ config BR2_PACKAGE_LIBRESSL
 
 	  http://www.libressl.org/
 
+config BR2_PACKAGE_OPENSSL_EXTERNAL
+        bool "from an external tree"
+        depends on "$(BR2_EXTERNAL)" != ""
+
+endchoice
+
+if BR2_PACKAGE_LIBOPENSSL
+source "package/libopenssl/Config.in"
+endif
+
+if BR2_PACKAGE_LIBRESSL
 source "package/libressl/Config.in"
+endif
 
-# openssl from br2-external trees, if any
+if BR2_PACKAGE_OPENSSL_EXTERNAL
 source "$(BASE_DIR)/.br2-external.in.openssl"
-
-endchoice
+endif
 
 config BR2_PACKAGE_HAS_OPENSSL
 	bool
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
