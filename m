Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540B606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O1yEXPeQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9330481E60;
	Wed, 21 Oct 2026 20:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrd2RUd2ZNHn; Wed, 21 Oct 2026 20:09:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9300181E61
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613382;
	b=d9rEAugaqJJ8ix9X+gDlv6e0S4vWrbqcwXhXu2jopoyJqXiiNUjyH5o0B9rJ7vfmmeO4
	 c/DJMrzhSNnxqZrYexhqzb9FDaosE0vikdMvmt4Q3UPm6EYctES4F06KqJa47vT2trnnT
	 Cxfiyn0kaqhNuFtn1+7r7tLES9gFPjRId0J43wfD4zpV6VrBfe5EFNzTOwvO0ZUCzcfTY
	 xdHrG3ht5y2QgHipRUS4UlTNOl/jq1PjkCUXiG4TZTv96a+T9SpzmTVuSg4Qsu8oPYROD
	 a+Gkfn4LnSXEJRcima0rbulRPeBR5PB8grtPJ+U1X/J307DAL5UaIzaAIs67GBGoCvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=HjY1yALt11SlHbrh8f8Em6qU5ESh+ZTkO6XBJ2Z0HWQ=;
	b=VEF0bWx7vmq8q1RInZpg5lcej8jDb1CRypiPayYnYYoQDvxu5Y3O7IzUIv77Ab5i59EA
	 HG3E+xxmci7bL4qzYH+qDDZLuqBx2wQgcJIdczAuIeP3q3bBcXaP/ciCroDSXKaS+4Efj
	 5Tm5iKKZkeRfs1y9F9wK6PK3buC5PjwpDDSjbtp1FIaTkSqTvB+lenppZtGHAbWTVWV0d
	 HoXCW4arYudDjGK/pdU34UBtbifwUlZ0TU+geWYmD0IWcUh0j9ORIhQB0134KXpf6UKBN
	 +lfXlzsiG0/I8WCeMeO4NBW5gYHXnNB2b7p/+A+lBocUOccAon82evXx+3DO030/bcg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613382;
	bh=HjY1yALt11SlHbrh8f8Em6qU5ESh+ZTkO6XBJ2Z0HWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O1yEXPeQl2i0NEc1UrW94Ohq6zfVZE+BmFSGfAxdr7hMLTdPkjvIOnA8zOuhqDGEe
	 h1vfVsgqi4weZvolvtyG1npMvkUJ3p/R9eiIfWs7RfV8A2OhlsbebOisvYFSa0Y7Ib
	 IYAuUS6NhigP5gxrXX1WNRDcSEL1tvCWg8yEw4QgGNQP8UZVSPJIGvHU22IDRPzDAb
	 9ykuKpeTvjkNTnBbd45Y1fD/53ymKGAFXw4CsK48qA0uVmqBH2jHnEleTRMEDPD8rO
	 srzAbadGJ327jzVFN3/xR5Oy0wHpTcFw7v0ng0eSM0a9a0TgLz+2QyHg3kG+nX3MNE
	 b47jDwXVXkG0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9300181E61;
	Wed, 21 Oct 2026 20:09:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D82F51184
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F6C94016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31vN1N61LQv9 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:09:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7330F40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613379;
 b=kQ2fF0kx85gdHR5GBbSzJTBWGaOC+gQrqmnz1Cu8N5ah+cGKfCMqht56599dLoKVEtaO
 QE9JFwBoBMjfXy8Dx9Ntqw1cB3Ils+kor7SrUnSt1EJxzBsEva8ovjN8xUWJ/C1SvJM3h
 cUXibVBAY7ey5r43r4e2xLiWu06ocgcn0XeqvODGfiFt0jfb7Q6NzPAVWLeye/r1+zlrT
 xXwTFV2AGjRAEX7bGj0+yeUZCspDF9nI7+XEtoz8SFecmU1UKh9MhdL0T3hIwv4Uv1IaP
 Enf+JuDft+DCE5khQnR0MVsP9zXMX1cEAu6ss1bR2PdAocZZS+AtUlHg+IsZq2l3uNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613379;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w95n5H2LxQVXJ4mqV3LLI4m9BLS6U6tRUraw5Zj4g4U=;
 b=d8t0srWJEpA6IB4Hc6a06mBWbQygAukC7B4uAWC60PMw//in+9Zb0xCJPGdq6JHk+66V
 Wfp+PB9vtSryLNu1rcpOWbBzl57EXxDKi2MkuMWM8TeOLPilHx8Cal5lrf5H6MMBacLg7
 wfqu8s3qis/BLyheTaK5//iuqQk09JDvv09QZYOVeFsHkwOxtUTV0FlW1HKc2+pUMQyQk
 uyNTHPWdnGa75+2UQsZiImDmUIAkniU/OexV7WtU2khVNoJQO0M614EVbWIlsws6jru1w
 tfcMy+fKeh7mvgDAATcxjARVzOC0S9qmIbPXglEivZGkLwNYi8cj1AhW52IV/K6IL5Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7330F40042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:09:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF22599B49; Wed, 21 Oct 2026 20:08:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:08:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e10a14ddb93674d05f8b407020a0d330abb512c
X-Git-Newrev: 7d1f43fe182b999979e624995b3f1a2ae7c970ce
X-Patchwork-Hint: ignore
Message-Id: <20261021200815.BF22599B49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcmanfm: fix build with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4805179161471214403=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4805179161471214403==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d1f43fe182b999979e624995b3f1a2ae7c970ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Once the libfm build issues with gcc >= 14 are fixed, pcmanfm then
fails to build with:

/home/thomas/buildroot/vala/output-gcc14/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/gobject/gobject.h:533:28: error: returning ‘FmDesktopItemAccessible *’ {aka ‘struct _FmDesktopItemAccessible *’} from a function with incompatible return type ‘AtkObject *’ {aka ‘struct _AtkObject *’} [-Wincompatible-pointer-types]
desktop.c:1457:12: note: in expansion of macro ‘g_object_ref’
 1457 |     return g_object_ref(item);
      |            ^~~~~~~~~~~~

This is fixed by backporting one upstream commit. The second is just a
cleanup on top of the fix, also upstream.

There are no autobuilder failures, but the build failure can be
reproduced using:

 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2025.08-1.tar.xz"
 BR2_TOOLCHAIN_EXTERNAL_GCC_14=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
 BR2_TOOLCHAIN_EXTERNAL_OPENMP=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
 BR2_PACKAGE_MESA3D_OPENGL_GLX=y
 BR2_PACKAGE_XORG7=y
 BR2_PACKAGE_PCMANFM=y

With this fix, pcman builds fine up to and including gcc 16.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ith-gcc14-Werror-incompatible-pointer-typ.patch | 40 ++++++++++++++++++++++
 ...3-Use-ATK_OBJECT-rather-than-a-plain-cast.patch | 36 +++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/package/pcmanfm/0002-Fix-build-with-gcc14-Werror-incompatible-pointer-typ.patch b/package/pcmanfm/0002-Fix-build-with-gcc14-Werror-incompatible-pointer-typ.patch
new file mode 100644
index 0000000000..c5c3232ba0
--- /dev/null
+++ b/package/pcmanfm/0002-Fix-build-with-gcc14-Werror-incompatible-pointer-typ.patch
@@ -0,0 +1,40 @@
+From b97c630af9794c0f87bf3b8a0b77531b034d31a7 Mon Sep 17 00:00:00 2001
+From: Mamoru TASAKA <mtasaka@fedoraproject.org>
+Date: Fri, 26 Jul 2024 12:13:32 +0900
+Subject: [PATCH] Fix build with gcc14 -Werror=incompatible-pointer-types
+
+gcc14 now defaults to -Werror=incompatible-pointer-types.
+
+Add required casts to the returned pointers.
+
+Upstream: https://github.com/lxde/pcmanfm/commit/12abd7e179adb9e31d999824048a5f40f90218fd
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/desktop.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/desktop.c b/src/desktop.c
+index 0686a59..b358f50 100644
+--- a/src/desktop.c
++++ b/src/desktop.c
+@@ -1267,7 +1267,7 @@ static AtkObject *fm_desktop_accessible_ref_selection(AtkSelection *selection,
+         item = items->data;
+         if (item->item->is_selected)
+             if (i-- == 0)
+-                return g_object_ref(item);
++                return (AtkObject *)g_object_ref(item);
+     }
+     return NULL;
+ }
+@@ -1454,7 +1454,7 @@ static AtkObject *fm_desktop_accessible_ref_child(AtkObject *accessible,
+     item = g_list_nth_data(priv->items, index);
+     if (!item)
+         return NULL;
+-    return g_object_ref(item);
++    return (AtkObject *)g_object_ref(item);
+ }
+ 
+ static void fm_desktop_accessible_initialize(AtkObject *accessible, gpointer data)
+-- 
+2.56.0
+
diff --git a/package/pcmanfm/0003-Use-ATK_OBJECT-rather-than-a-plain-cast.patch b/package/pcmanfm/0003-Use-ATK_OBJECT-rather-than-a-plain-cast.patch
new file mode 100644
index 0000000000..0c56015f79
--- /dev/null
+++ b/package/pcmanfm/0003-Use-ATK_OBJECT-rather-than-a-plain-cast.patch
@@ -0,0 +1,36 @@
+From 3ae0e8d2e26e6ee5836df76b4db3378b7b61c8e8 Mon Sep 17 00:00:00 2001
+From: Adam Sampson <ats@offog.org>
+Date: Fri, 11 Jul 2025 13:59:56 +0100
+Subject: [PATCH] Use ATK_OBJECT rather than a plain cast
+
+Upstream: https://github.com/lxde/pcmanfm/commit/cb2e81e4e545ff26dd6a410ccc52366cc98ba858
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/desktop.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/desktop.c b/src/desktop.c
+index b358f50..28b19ca 100644
+--- a/src/desktop.c
++++ b/src/desktop.c
+@@ -1267,7 +1267,7 @@ static AtkObject *fm_desktop_accessible_ref_selection(AtkSelection *selection,
+         item = items->data;
+         if (item->item->is_selected)
+             if (i-- == 0)
+-                return (AtkObject *)g_object_ref(item);
++                return ATK_OBJECT(g_object_ref(item));
+     }
+     return NULL;
+ }
+@@ -1454,7 +1454,7 @@ static AtkObject *fm_desktop_accessible_ref_child(AtkObject *accessible,
+     item = g_list_nth_data(priv->items, index);
+     if (!item)
+         return NULL;
+-    return (AtkObject *)g_object_ref(item);
++    return ATK_OBJECT(g_object_ref(item));
+ }
+ 
+ static void fm_desktop_accessible_initialize(AtkObject *accessible, gpointer data)
+-- 
+2.56.0
+

--===============4805179161471214403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4805179161471214403==--
