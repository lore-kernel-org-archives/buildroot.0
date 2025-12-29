Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FD9E92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22211607EA;
	Mon, 29 Dec 2025 17:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRWZM1r9zfIV; Mon, 29 Dec 2025 17:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACEB60AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767030845;
	bh=HtOkrZ7pj+3Q8zoR8HFuHSXoXBvg9/I5eXAgaAE69Ac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QgVXmlG5mJlHiJbgumJGJFsj4zWBLzacG4TYCflPReQ4/Yy3XBiI0Ms2dxQBvQrtn
	 7DZQYydWtpFtxODY1uSF/yZoD/jWvxmCRLF/ObZ5nlMQj9TFA6/C99iiu+A3gRwwom
	 ICKeI61SQhKl5ENVA7P3naJe+qeKkcBvfKgYfWIjonVRT4AsZhD6Ey5rPhDdWt5HzW
	 5RWdeXhANDgB6aPdLKKsOJuVb3rNqxjxWadm5v9MHMeFdGpB9Odd9qSFdBHOavFsLP
	 hWVmEinE7XlGa6AgwRGiDNNmW8Xy9Im9F/LFUoENobdegFUxSVpzyGMedpzP97NjyS
	 J2jkOqv9g5ZHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CACEB60AF3;
	Mon, 29 Dec 2025 17:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA8561E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACB6460AF3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O40YLFqSWyay for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3DCE607EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3DCE607EA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94B3787BA7; Mon, 29 Dec 2025 17:54:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 18:53:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5396f730d7f77c572a67993ef139ed735650398f
X-Git-Newrev: f784c823ef8357aa36828342f83d5fd59995937e
X-Patchwork-Hint: ignore
Message-Id: <20251229175401.94B3787BA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packages/linux-tools: perf: enforce
 PKG_CONFIG_LIBDIR
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
Content-Type: multipart/mixed; boundary="===============6692737951034040052=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6692737951034040052==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f784c823ef8357aa36828342f83d5fd59995937e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For kernel patched with 440cf77625e3 ("perf: build: Setup
PKG_CONFIG_LIBDIR for cross compilation"), if neither PKG_CONFIG_LIBDIR,
PKG_CONFIG_PATH nor PKG_CONFIG_SYSROOT_DIR are provided, the perf
Makefile while try to set some default value for PKG_CONFIG_LIBDIR,
which will not point correctly to buildroot staging directory. This
issue will lead for example to a failure to find libtraceevent even
if it is correctly enabled and installed in the staging dir, and so it
will make perf fail to build.

Make sure to call the perf make command with PKG_CONFIG_LIBDIR variable
set and pointing to buildroot staging area to make sure to properly
detect perf dependencies.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-tools/linux-tool-perf.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 1e19ee7f1c..3238948d76 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -23,6 +23,7 @@ PERF_MAKE_FLAGS = \
 	JOBS=$(PARALLEL_JOBS) \
 	ARCH=$(PERF_ARCH) \
 	DESTDIR=$(TARGET_DIR) \
+	PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	prefix=/usr \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \

--===============6692737951034040052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6692737951034040052==--
