Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52425606A31C
	for <buildroot@archiver.kernel.org>; Sun,  8 Nov 2026 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PS74a/FP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E85C605F8;
	Sun,  8 Nov 2026 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRShyS5expHa; Sun,  8 Nov 2026 20:13:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 83294605FD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794168833;
	b=qU9YBNv7DSe5ku95U+oCMs2INr73RHfnzys50emdackBioaUHMvidfmMp514CDLnAtYI
	 2sbQAmBhuE3y2wiFJbbHsW+NYsm16z5aq22xQ4sSr4SVBLDcJpP00AOdxXEywi22cG0Bm
	 vn28fa0/vslirLjoXt/TjS8ClQiYFxs9xoz3gS/JuS0p4G52DDEfU85l7QrTxuTPEqdZM
	 780l3u8IoTxC22tkebiBJsXivSthg2HEpuRi5pmc6mV5quYUSZP+2uGwRk7tOSNz73WVJ
	 L0FWQyFA8bIEmprXLbWezcOnCiQT2tKceuhQ6h95Iz0C3I11jglNjGbynU8znFEHsdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794168833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GYgfMcmV+2cXxyAhQoUaY1ar0/Hl+Ki6zgl8YAPfDxA=;
	b=UEXyaJwRiMoXuyt76Z+SdU4zF1SGp0Iv01y2Hkv730FEDBfOasKXoWMFTSUbOy+cLHDq
	 zuUDjyR2aBHvIWOnBEJLvsfAZHie5fd+u9AIWvt4LneEgEkJAVbRk44rDqYGlMQP50i31
	 XfVLsPkXf24zdLQ11JBtoeSwXbEqHRuy4lPNS0hA3oHu+8xSfCjjSUjXiZAbvk5T0NY8r
	 Y2ZO9nDEA0tlfbcHEDNAK2EoCSySCW5/Kf2YYubq0KMH8DvlMQgXXnJ0oPRyIodGsy0v2
	 6/kussiku3WXyykDlyHejwzD1lvI9PtwCnZR6k8XHqZ81dgJNsrmh2bCdyW1BNJmGCg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794168833;
	bh=GYgfMcmV+2cXxyAhQoUaY1ar0/Hl+Ki6zgl8YAPfDxA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=PS74a/FPXjF/BHtxS/5kYJdOWF1R+o9suS8d+4xIqWf2Jx2wvbrcEfytTM2nFeRpL
	 Ah0cobibNTBFsAn73eggYVwKVgapKVn6Vp0dxNT5wI4zjJHZgyXIZrAGZcLo96307J
	 nlT/Cr+wlRbIgDkmR1DRMadNQa5M71tE/gNExjauFSiGNYFzkNPOr/DmItjkWLGpJi
	 52z8FvggHMaZPSQvoHXhFnSM0A8ve3p7tnXlteu/cKHyx0LfqDCzJ4kbLthgsX7zw4
	 CXxyTCoXMf55YhQ1CknUqMzG2qpT084yDba1IptRD+T350mp7khYHgQ6v/MJVflafu
	 GYVfIMZF2IcBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83294605FD;
	Sun,  8 Nov 2026 20:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A6631F
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2720605FD
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 20:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YU39bfnz4dVr for <buildroot@buildroot.org>;
 Sun,  8 Nov 2026 20:13:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BED23605F8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BED23605F8
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 20:13:50 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c4d30639709so27229466b.0
 for <buildroot@buildroot.org>; Sun, 08 Nov 2026 12:13:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794168828; x=1794773628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tfmT0lJLVd/7U3uElubluHmoh2F1u9eRWcDlkqFlB6k=;
 b=Afv//JqolVH+vCshtxBVKn8+CWlaOFFq+wCTth5zmPjiPmrZJdYd+4wYI/DWK1Em4Z
 UzZTFtGIaBYKduPJphMTJKXOZu2NTPFhuXcOASlsu43icIvM92oozUDW8F7DheMPCHgU
 4l0BOVeFIq7Ox907LKH6MnYyVQhUZscpr+CL2HjsipENulqSKC16Bk7QOoUrvdhW2AaB
 IZ4V1w84t3i4qzzaCu8xESxq5mRZG/oG6Y/JbdxlcVdQ1wIwFdwdszQjm14lokh9ktIt
 Zk3tESEljVn3bzLujKCP7M8HMN26n3yoeei736kSllvAoKi67njrrBR/LfhslUALBrVO
 Rhsg==
X-Gm-Message-State: APuU4Z/TUiI+YVWtHcbhbbFm39HHr3Y8yXWFyOuUhaRO//sTZJ6DPJa9
 cHL0UuXUVqlioEgULpZMWUJl8TzWMR1g7Se0idf5HytgwX7dcTDhSLr0l6++Nw==
X-Gm-Gg: AYBFou1Sm3QvjkeGq9/O3ubTAl5qUgosBDnaUxUzocm0UqRVG9+fbnJNXvFp3zE68ZX
 Tw8W6EkK06CRsDRlBLYcFkwj6oousvT3bYRFnvvztzjLfMue6OQlDjeoGtOTA16IynpXRNQxVlO
 4VDDBXveFoM4Czbm6plvHR89MBAGZQm9AST3XqmS5xcYaP1giy92JOUdmSZDOjr4K3Cefc1/xdt
 IVkGbDD8JU9DlvG9LhRtEDW0N/ZWN/LO7a1M6GcqP+ebe6ZAkD1MINOOPuX9TLfJwa+I4Ucw2eO
 tiRjJbz9Re2s95r/o6jsekWkzWin2vKdBm4ISFdBvbLGHU4ljv+ix12tThPeuypI/5cA8x7gVVL
 Xs5wHTdElTVrgSkq5Bzxmzzot4e3ZlBpf55SytNbrTvpR6quQUz9F+7IIZe97fPMCmcgg34Jl4f
 8oezZ2Ph3Mj1rSOXJj7bogco3c0WpqVnQmIbqGq1osUkqrJQNlJcnWdU7mw7wfU3F3H4qG0lCdF
 GaVTHTRCOnXk8GA8HqOXo+vY2W47WHTNeUNiRRENY52n8WAi95F0UkBuwuJHUCQ4yk9lGCGLekG
 TEP0lr6cYktIjDp2xpsD5Xe45w1pnOpm8YYvXkoNmgaSmUPs7xVgHxPoxJwejp8M/3uge3zI+Fr
 auS9Mo4TQ
X-Received: by 2002:a17:907:3e15:b0:c31:e9b7:f10b with SMTP id
 a640c23a62f3a-c4d6dd7cf61mr143919166b.42.1794168827930; 
 Sun, 08 Nov 2026 12:13:47 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d6a4af563sm86432366b.52.2026.11.08.12.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 12:13:47 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  8 Nov 2026 21:13:45 +0100
Message-Id: <20261108201347.3052372-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/glibmm: bump to version 2.90.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Daniel Lang <dalang@gmx.at>, James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since GLib 2.89.2, GEmblem and GDBusActionGroup are final types
(G_DECLARE_FINAL_TYPE), so glibmm 2.76.0 fails to build with the
current libglib2 2.90.1:

  ../untracked/gio/giomm/dbusactiongroup.h:32:7: error: conflicting declaration 'using GDBusActionGroupClass = struct _GDBusActionGroupClass'
  ../untracked/gio/giomm/emblem.h:31:7: error: conflicting declaration 'using GEmblemClass = struct _GEmblemClass'

This is fixed upstream by commit 00508a702de1 ("Gio: Emblem and
DBus::ActionGroup: Don't derive gtkmm__Gxxx types"), first released
in glibmm 2.90.0, which requires glib >= 2.89.4. The API of the
glibmm-2.68 series is backward compatible, so just bump the package.

The license files were reformatted and the FSF address replaced by a
URL, without any change to the license text.

https://download.gnome.org/sources/glibmm/2.90/glibmm-2.90.0.news

This issue has been present since commit fabeb8ac213d
("package/libglib2: bump to version 2.90.1"), which pulled in the
final types. It is not part of any release yet.

Fixes:
https://autobuild.buildroot.org/results/7eca302646c5469921b1699d579198ec95cf9276

Fixes: fabeb8ac213ddbeb182644c8f4324d75b35ddf9a ("package/libglib2: bump to version 2.90.1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/glibmm/glibmm.hash | 8 ++++----
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index ee50ccdb01..12e821d8ab 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.76/glibmm-2.76.0.sha256sum
-sha256  8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2  glibmm-2.76.0.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.90/glibmm-2.90.0.sha256sum
+sha256  e2efa45643f16b9fea2d6299f2f403d672eaeacddf0ff7f8094e1af9b0f5980b  glibmm-2.90.0.tar.xz
 # License files, locally calculated
-sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index da95329a3d..35eb3f2645 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.76
+GLIBMM_VERSION_MAJOR = 2.90
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
