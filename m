Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B77C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 16:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D12B1408C5;
	Mon, 11 Apr 2022 16:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p94bnYX_bvOV; Mon, 11 Apr 2022 16:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66D3C4086A;
	Mon, 11 Apr 2022 16:23:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6A81BF2E4
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 16:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B0D84020B
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 16:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOJ_3Pggysur for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 16:23:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B9C240174
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 16:23:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w4so23756970wrg.12
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0OS0xT2xa+pmFzfinwUdC6bbWC4EW/h0bgBJrshDGLA=;
 b=lNsUZLHBgBKLg20FGAVWVFwj/YB+dPuLEniF+GvhfgwetDdYXienB4C3XWWiolr/mz
 HMXtuWzdrNtOjteRwI5Z7Dn8973YXjbMZzh6ATDdFvcLpzAfo+1DO5QB8VUAd90vJug9
 CKuRvQvSfFBrAPZX5AKwR6ncaiPJj6PRU+1+k45Gkfk6V9HUFSa/VjidoVntV4rnAysH
 urL91ZFZN72EDpBi7iQ/natwbCrOsyzRgBdC+wijjms6qWHUA40EDb99O6B5XSC40RCS
 SAWiG4Ih2k1RzVki1G4XbwhTmORihKlKQ9UfzW1PZJ1s23qaJ7eiAh47W+kPqORK3vT/
 wGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0OS0xT2xa+pmFzfinwUdC6bbWC4EW/h0bgBJrshDGLA=;
 b=mNjLdv1354m5emaPVGOLTr8u+VWwB6+ZkMiSiiEsueiQ1wviQ4qHOQDEOCRqs1XSku
 2ckE2DUFulC7oqoRXH/uc2o7yNPU7JGQcGZuvo7Nd63BeSssvvE3LuL3ru5mSzjSVan2
 JVm1iqDPO2CAiWNA/ESOz9qLen9kerU67xR3+TCgBf4G97p9p2oXjjKM1ieIpQWNLudl
 L8tWdPIyVA0zh3YQjBIfcSQtVJceSvw2Lm0qsFtEO5fJn/sFyyIcGQa1tlE6lZZpLWIP
 TIPepBPfGd2BtzCvY8O1rmaj17VB0NZ7/aW54cRCbR0uKm+Igz+H1wjvKWwm+E3JyDgj
 /NDw==
X-Gm-Message-State: AOAM532+CmY+9QOqkTGsgpCjS+q04zr6nwyAkgr0kTI/do+wEA/HlzJw
 a7pI45eVFaJPxgW8LJwWeDolyzwVd4A=
X-Google-Smtp-Source: ABdhPJxxyaKcttgEcnOPTy5ufEfMIdPjULsAQMlY0nyO9ISMNEnoC4j5b9tpe6n9nnlSvX1TP4cOzA==
X-Received: by 2002:adf:c38a:0:b0:207:9daa:d881 with SMTP id
 p10-20020adfc38a000000b002079daad881mr9729433wrf.334.1649694180182; 
 Mon, 11 Apr 2022 09:23:00 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm22421467wmq.35.2022.04.11.09.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 09:22:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 18:21:07 +0200
Message-Id: <20220411162107.8704-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: fix
 maybe-uninitialized errors
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
Cc: Min Xu <xuminready@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

local.c: In function 'create_and_bind':
local.c:218:12: error: 'listen_sock' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  218 |     return listen_sock;
      |            ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-fix-maybe-uninitialized-errors.patch | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch

diff --git a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
new file mode 100644
index 0000000000..5275323e65
--- /dev/null
+++ b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
@@ -0,0 +1,93 @@
+From 0c23224e926463b1097414979367655a27fa6d60 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 7 Apr 2022 18:27:58 +0200
+Subject: [PATCH] fix maybe-uninitialized errors
+
+Set {listen,server}_sock to -1 when needed as already done in
+src/manager.c by commit ecf1fcc84594b09ed2d61e3677cd8e62bd897ccb to
+avoid the following build failure:
+
+local.c: In function 'create_and_bind':
+local.c:218:12: error: 'listen_sock' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+  218 |     return listen_sock;
+      |            ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/shadowsocks/shadowsocks-libev/commit/0c23224e926463b1097414979367655a27fa6d60]
+---
+ src/local.c    | 2 +-
+ src/redir.c    | 2 +-
+ src/server.c   | 2 +-
+ src/tunnel.c   | 2 +-
+ src/udprelay.c | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/local.c b/src/local.c
+index b1ab040bb..47d634ce5 100644
+--- a/src/local.c
++++ b/src/local.c
+@@ -168,7 +168,7 @@ create_and_bind(const char *addr, const char *port)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp;
+-    int s, listen_sock;
++    int s, listen_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
+diff --git a/src/redir.c b/src/redir.c
+index 4a5a489f0..e60bd4870 100644
+--- a/src/redir.c
++++ b/src/redir.c
+@@ -147,7 +147,7 @@ create_and_bind(const char *addr, const char *port)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp;
+-    int s, listen_sock;
++    int s, listen_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
+diff --git a/src/server.c b/src/server.c
+index e9cdc2619..073e38b22 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -550,7 +550,7 @@ create_and_bind(const char *host, const char *port, int mptcp)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp, *ipv4v6bindall;
+-    int s, listen_sock;
++    int s, listen_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
+diff --git a/src/tunnel.c b/src/tunnel.c
+index e0886bdb9..6641fe62a 100644
+--- a/src/tunnel.c
++++ b/src/tunnel.c
+@@ -129,7 +129,7 @@ create_and_bind(const char *addr, const char *port)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp;
+-    int s, listen_sock;
++    int s, listen_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
+diff --git a/src/udprelay.c b/src/udprelay.c
+index 23a042497..580ad4bd8 100644
+--- a/src/udprelay.c
++++ b/src/udprelay.c
+@@ -446,7 +446,7 @@ create_server_socket(const char *host, const char *port)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp, *ipv4v6bindall;
+-    int s, server_sock;
++    int s, server_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
