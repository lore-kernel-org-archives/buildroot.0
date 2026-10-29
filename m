Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C28C606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kna6nIao
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6D560B3B;
	Fri, 30 Oct 2026 14:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWO2wdRA7isk; Fri, 30 Oct 2026 14:06:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DF11A60AD3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369204;
	b=L7lcdXFC9p/Pgt5YJAu0CE6CUOmFd49TCBlkzlDkq5Da5i5BZvmj7oEUsasZ+8ZKtHZB
	 C7LAuX9s1GxqFtWJPgel0FMhymSXAF54Z6Er2xKmCE2bCbTgs+4VqEtndjay/clk1Fctf
	 MqZP/f4HcaAVb4lIw8H1Jsmuy7d4O3JCiVUUy7fE4I/l0DcGwpnZHEO+5FZ8qsl8V+MN1
	 g+7cSVFQeBwMPVEzu979yl/kkhDfEIp40tJNNe39yOlkKG8pBCuowVfQdxIX59GwLauEG
	 k45xHn9QygPMAWIvoDWotJIqZZjx0I2Bc+EiUkGxTasaBo9g3VpVzj8LVM5AbjJoYog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=o5Q5h4bgk7GjYvYdgADDL3cLR30jsfBiyWYFYfwpqZ0=;
	b=eAMYi77oADkVfmaHNT3HzmYmGi0PPdx1Swg5Q6/jc1Ay9PWksbEK19IWwRClKlu6l4ej
	 Rvh68zskxzQfZ4EgXiFs1mKz/xnSHiMsa5dtKAy8LMrKoWHwjGa/OsP5agS8FfcXE5a76
	 /U4vk0/NfepWE0/WbqbpHOEBE0oFF4CmMixCOKpKX+C+OOmSOkupA3q5nxdugZVjt7nPl
	 8I9R35pbTgyH0QQJsrBt8+oM07d9CC0RcZK0hqtVuN9JsEEEYyhZDyf7SiYXUhf+tTpu0
	 zdd/NGorBFXD4PDXYszzoo1nXnWjuU8KvtRrsEHEw2utp/TBFrxGw7iqnJf00dXOwiw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369204;
	bh=o5Q5h4bgk7GjYvYdgADDL3cLR30jsfBiyWYFYfwpqZ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kna6nIao1WOuBomUwEP0LqpJG+W7/MjOkCD6xM+kwCKlz5pH3Z9px29HlpMd+H2KY
	 x3Y85EOpDqsE152GjMKpTISFGtAxqDbxkOP371j8ID9aqugFXMGToIClu52l5X2INX
	 3WTqssAFOE6aEB0geu8Ob1EvgRoJA7e25aonFEJEljRW/h/eYyLz2BpzafdrrUxBHi
	 TZ3I2bQj1S2nUI9KTnEbQkOR/MaEyf7TKyUoz38zujyLjZPJtlyc7IzdCROQsimJSo
	 ReLQh8bUHQjreikHhxqCln27/ultghiLaunQYqYd513Dg4EQHvnFkeV8+v91HJZvBo
	 4Q3tw3hfuV6Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF11A60AD3;
	Fri, 30 Oct 2026 14:06:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A80D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8EEA60AD3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYrNm6qVTZAK for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B79F460AE5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=UpZD1eSxVsOWp7XFD57yMezboDpF7uhxenQ+IlQhUh3L4OmlBxB6RFD3PIB35NCCap2V
 kkhn9eqgPfcKXD6oPcm3e0eMwq4bbNChNvbHrYGghr+jvgeRM11AAVA6OOy5P/uLvYoqs
 q2rhdBb0jO5Yg/oW0PkF71rcsciGPbcVSw5pQOs+wvlieMsxokiU2CIq1o6fDbfQKcWZr
 7kpnO9CgpQgChW4M4wDIfEt8U056xv68vSFL8FZDouDrXGQnVPA2tZVi9VMXu8ws9jS9y
 tnmEh54eD+FLTy6DcY/7PpaoYoJRYD9j98zABHGCMLt8GWEuD8gz//D5Bm2QFfcp5lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rCvabqGcwH47Rfwjj/3jPgbby4rlZEske5dDPxbmLVA=;
 b=mksvxI0/WRX/Clv1+FZg9NWs6ehKtxYLuWwmJVjY1A7N2+i2d4d2I2x19iBCSv/C6ufs
 WR2rRiFT/wxmoOg/4ndGTQeuCCLfWPDOSI1XReZ43nB1fR+C4j9p70VWs+KmVxbGShNOB
 DKax2CaX3a5td9ISFA2GaaGn5mBtJydVngyDcUNlNoZVd8Stv1ZsgIUMUZVMdCdYkyuyd
 iOajPaYhBUxjPkgReo1i88kiAMBGStuj+WdrJRnxzog5jV4oAokl7tw5t0qiqObKPZHgw
 ZMAT8k/LuBJ8rRR/MZAlBHKKXpBDvHCC1zpdb3vpiMXU3N6GXeYB98IwarjcwjbWB7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B79F460AE5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6E5D9D389; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 156ec6a7b6634ea20717628afd2260cf896626f6
X-Git-Newrev: 05e8450c6546bc9b5c7d7540e4b260ed2abcb626
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.D6E5D9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pcmanfm: fix
 build with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1946912608098034064=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1946912608098034064==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05e8450c6546bc9b5c7d7540e4b260ed2abcb626
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 7d1f43fe182b999979e624995b3f1a2ae7c970ce)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============1946912608098034064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1946912608098034064==--
