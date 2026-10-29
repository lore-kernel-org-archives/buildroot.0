Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FDF606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IDtGHv1C
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901F240CC9;
	Fri, 30 Oct 2026 14:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EF9x-dgEYnQ1; Fri, 30 Oct 2026 14:19:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 83A5A40CEB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369954;
	b=WD8p2St5knaq+pVxxOwqGf+pCizbERLAbzWyCTUMUv123SJC8RIByoi5y7J30VE3/9iV
	 CEIhugBSCFLPmgbp8QtRLP8B/l1zJLxgySzmlhzOWWx9WdyFIIlbFyTBRYaM9/1i97XSn
	 JIxilzdKaaNnfTWPBKIAUBzM/vgx7mUt2emlaqZq2QqXj95F5RmdCwu5tFQvySX7JBV62
	 JJjKKiL5/fXoJijAUdQ/zX7O/SGljcmn20X2FzfKEoUZ0IiipytF371q5vfzeD1V8rgd9
	 ek3U9cX6aSkn9SP9+ENm4z3RN6B9ZT1XX/TqTF/09w0hLH2S6bhcdqdY5WpEMrCgirQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fAzgwwkbRmypZHIfci4rMNuc8xQjSTKkqJ8KqX23jV0=;
	b=NQEb8Fk86ceSpnfebVJ6qV0c5UwvZZ1UdUl+aj/uAcEQ4kPCG41YvHOQvhrLqYZNYZpD
	 Tum1Pu/SesZOHo/8yEbuP1/lnwDAEwaPf2bwy5W9yCFH6E3ovuUQVfilkJv38zmeBO0mY
	 a2Ob6rNxnXE71LKRy0MwFwDdhVqbE7ujdMnQ6hGziZ5IwPDIOrwAoc16rMjBN98WWQakm
	 YzHYuMjq3qldbF5NVLWLdfchiyDfeoqQdrlqQ8rG0EEH9f4zIvrDfvc5IlZckYcatMTJA
	 DW4+i7erTsaMRxMlWQNetHzMyZGvGZzpVvtxr69NYLEC+F1T1Ou3Q4LRJ0MRyW3N8Rw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369954;
	bh=fAzgwwkbRmypZHIfci4rMNuc8xQjSTKkqJ8KqX23jV0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IDtGHv1CDtkZeuGBjJZpPplYDQc9ir7TzVOrpQzpYI29sSMwCNC1EerzcYCXfoCju
	 7i3r6xnuP3Y9vrdBHsfDaRvvIoBNfmyUyg32EWLBK/hLnX+MsGb6sd1o+UIWxnnyU3
	 YxE50Suk720OzncI1rWpvju4db5ZH3M3eKUTns5Va/OLsPz8pcOivd+YvjxKytxHkT
	 RjgbSxx42qpSA96dIgzHfxCYtE/MSmbJsIJ/kTxyZJFiJHRk7I748T6W4RdzX2iM7u
	 MdlRyqPg1F5JHs9aLIUR0Td9l1ViVQ3DywQuBrhcOj4OdPe3cKiOra4JwGBsmedSb/
	 0E8iP10ESuMbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A5A40CEB;
	Fri, 30 Oct 2026 14:19:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8828D712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E8C940541
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOhHj_HHmlva for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A4CF74052F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=sDgW4lqMdaPTvQrWiCRYSoOHqNqfkq+3i9oi2AaSiXLuR35f4NFhcsqjF80YQA+I9ZDH
 U/1MhZUT5oikdmEGTQ7SpN69z2+XjN2w8ArbjKCc5emdhbjva7xlNVvEs6tK4JIrRCnw/
 nBWMpNLiyFdfkmBdd4mb22+mpFGGIn2riabnSdla6+EtffTX9Qm2cvhN3DUk8qJrTzgMi
 RijJ9YovLbaeiXuIab+nvOJA0b7Xmlnvtr4sd/66RFhRgTiW3guxfLptwfUoEZAqcQi0l
 Iq4/aWJpxnsH5OCk0DzbmedGWqhZkZ1Op7B6OVRk5xMliEz8slszOwErmaHM/Y6qBYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1kwHwNozCsKpsL55gTWFLzM2KmrdtmP3lesFliiU7lo=;
 b=BTDypYDzDL76Pj0lzHun1BHm+53Sz/RffyAFso+37QXT9YQebeEp+K20P4R08Jk3kNhI
 hLv/U+Tc7wxqjodkjJXK4Kf7mZYVHGdPEIJR+lxe0U01CvpPfDToMZWaR5HOn2AEuCxvJ
 V1uqDpNG08aoRbEq7PPXAI1tiCpE0GawpKx/FldULSK0CjDJNDBZAs2FypgPPFMYg94cA
 QyA0KCn+bGQrY9W46iy9kejn9bXK/MpZ1WDFKHG/YSyaomeZFCrXOeIVfzDgFY1cg5mfQ
 DPSk4TuHXdlcYNvnskuKyjJeLQ07Q9Y1Vb614T1OZB1Ybl07mE7AS2+2Lww/Dja+JUg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4CF74052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6C1C9D38A; Fri, 30 Oct 2026 14:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8e933f125ab79fd8a1739b68ef9d4561946bc5db
X-Git-Newrev: d24372d61e129bcd4aa1675838d5fac9ff7b066d
X-Patchwork-Hint: ignore
Message-Id: <20261030141642.B6C1C9D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pcmanfm: fix
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
Content-Type: multipart/mixed; boundary="===============0406361927489369195=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0406361927489369195==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d24372d61e129bcd4aa1675838d5fac9ff7b066d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============0406361927489369195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0406361927489369195==--
