Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E03CD6E5E
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E31660F38;
	Sun, 31 May 2026 14:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmPtbIpWhudg; Sun, 31 May 2026 14:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9455E60F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780237826;
	bh=moLs+ox0pjgFIjse+C/PyMWaptUNNbBB+MLLtffNjdg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CvBmo36YvzkjDVxWJIy7S480bwQXsoHpHGZbvP579EJM8Gc3iusgKGOtuD1kuZs7x
	 QBeIWux1mbARxUXW5oXhHM15vY7Vq4PTEQZyJsx4LKDvkHHNL6RdNJLIfcWU0Uzpx3
	 0vBsktDc8dP4vOPdv6mN5Wb98HUk8Y4UxM3KR5vNSnjyQ7CaOmaEdtpBwq4ecfburR
	 G9gLRNgiLgJDM4He92HdySmyYXoXPEkxDt8MeZ/l9+NLqq7PLZI2viekyQaKr7gzRF
	 ZW2kX9r/Himy50JxbNMqorN+vAkBY7+I/4ORC2bkMlhbWEmVMCFohLDglktHT78nkN
	 ZwII949Y3t3lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9455E60F2E;
	Sun, 31 May 2026 14:30:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2926389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D87834032F
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0ArAxlq3I1H for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346AC40183
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346AC40183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6D5C876DD; Sun, 31 May 2026 14:30:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:22:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f0c3c8ea77915342f1424f70adcfb481c3640e56
X-Git-Newrev: 13325a9ba3897308ec00857963fdbf7fb350ce0a
X-Patchwork-Hint: ignore
Message-Id: <20260531143009.A6D5C876DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireplumber: mark
 broken on uClibc
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
Content-Type: multipart/mixed; boundary="===============8873929524692870135=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8873929524692870135==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13325a9ba3897308ec00857963fdbf7fb350ce0a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

../lib/wp/log.c:780:49: error: implicit declaration of function ‘gettid’;
 did you mean ‘getgid’? [-Wimplicit-function-declaration]
  780 |   g_autofree gchar *tid = g_strdup_printf("%d", gettid());

The problem was hidden by pipewire being broken with uClibc since at
least Sep 2024: https://autobuild.buildroot.net/results/ee5/ee50c8331946814c2fecb0ca56ca51c1bb0bc551/

Pipewire was bumped from 0.3.81 to 1.2.2 in Aug 2024 with buildroot commit
93b72692c36f8357e867650f4b8fac91dff375f5 which afaics caused all uClibc
builds to fail due to missing tss_t() whose usage was added to pipewire in
version 1.1.81, see
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/de0db48f17aa391917ff5b430b7b9fe1dac443fe
and later removed with
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/9c19284f7f062a50e059b0593068429b345acf34
in version 1.3.81.

In wireplumber the relevant part of code with gettid() was added in
version 0.5.9. Buildroot bumped wireplumber from 0.5.5 directly to 0.5.10
with commit c42b26bb471a260e2bb3da7988af77f78b2b4280.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: unwrap URLs in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireplumber/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wireplumber/Config.in b/package/wireplumber/Config.in
index 6528a2e102..5f07a7c664 100644
--- a/package/wireplumber/Config.in
+++ b/package/wireplumber/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_WIREPLUMBER
 	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # gettid
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -15,8 +16,9 @@ config BR2_PACKAGE_WIREPLUMBER
 
 	  https://pipewire.pages.freedesktop.org/wireplumber/
 
-comment "wireplumber needs a toolchain w/ wchar, threads and Lua >= 5.3"
+comment "wireplumber needs a glibc or musl toolchain w/ wchar, threads and Lua >= 5.3"
 	depends on BR2_PACKAGE_PIPEWIRE
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_UCLIBC || \
 		(!BR2_PACKAGE_LUA_5_3 && !BR2_PACKAGE_LUA_5_4)

--===============8873929524692870135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8873929524692870135==--
