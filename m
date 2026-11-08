Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB9606A31C
	for <buildroot@archiver.kernel.org>; Sun,  8 Nov 2026 20:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YEfdX05z
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F7F9405F5;
	Sun,  8 Nov 2026 20:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03nzge4dXkJA; Sun,  8 Nov 2026 20:13:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0C2EA40681
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794168836;
	b=UBGAtOCCDPtKejyxhHO7Jg2Z9q6MIti0Sr8/QjP7iPxkzet+X0A05SIzQh/eeJskmPKN
	 8lLcn38J5+RtPczlcr39c86QOqX+byh0pHbQW7wbxeUAjQG63dSm7/5pl2QOeqBFihJwl
	 T5x1RbtA+aTxdKdusclIQZ9PRvd46yruOPxgjQRfeOTQFTXYJ9mg2gyNHJhyZ5B1rGJng
	 zpnaaL+ogt2a6EgaKBXlSa/1eKNWdBGluLgLVuWHwxVP0kpvH/+yAxr95GwtA0xbE1xxA
	 9iR5QyxG6/q/6tE86FL8tPZDtVgqZ3E6Bm29ltbQ9T23F1zSrG6+ELMUa+RZzQBw+Tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794168836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OeijM9EHutjl2/AegnFhuLeaIggWRhfVnZjySn9aVpk=;
	b=i4085HvxqQ1kiM+r78h1x+IeKT53xantb+weNqGH1kvVUEkVi/VpSaHPLwwLpMNsW01I
	 SqDFIwi/4LaXlRFHBK6FO4deQZ/hajYrFKauFm+cykRZIPLWhRVcw4E3vmlImQ9OHvuND
	 1okT8tM8de4/tsrcRJHMewkmp1S3byE6umripw1jq2OeqTSiP293KRp7H08r+CO0t0XXd
	 YqREW0FnhrUqYyRZ6Xg4FdxUWSw4RO5v/jIqE/a/rYa400iRb20mHjfzWt30OHfjrGxYX
	 6bxv11ON9VN9XTBPnVyMqdA7Fi8jsvirjm6F3oSIihBXjiVF6HxJ9g/XW03gtP8ibWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794168836;
	bh=OeijM9EHutjl2/AegnFhuLeaIggWRhfVnZjySn9aVpk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YEfdX05zDMdj1zlyrMqMN073JyfHy3FT4kWyoc9aVZEAAYIBlRUuw6+/9424cS2Ng
	 ZGXfZxNMlMSz6NZbZazGliqBlDNN3WfY+wzi3NlagHkeER0uJZKEC7s/Qwl4gLKt5V
	 3M7OC2SV7lxtsNdLtk5ZatKq7iAUMfbfOVMUAhRSeKiCyAedBBzv1prWEgQ6+otOPY
	 qO4qMkut1YShfrv7NGi5IqyLR3GiLcdtpOl0vc89lExFclFUTmfSfLU3piFnV53ex1
	 pMLghq9cs2xP+2gJY8rLeqkuCnejO7FrFLhCcOaMHFD1DzGscMaP9BCKB30nZSJnpy
	 3caq5SJIXiN/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2EA40681;
	Sun,  8 Nov 2026 20:13:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65443317
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 20:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5697380E0A
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 20:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hl9j4SXjuTFA for <buildroot@buildroot.org>;
 Sun,  8 Nov 2026 20:13:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 32C4180D98
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32C4180D98
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 20:13:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c4d28f75d62so34808166b.0
 for <buildroot@buildroot.org>; Sun, 08 Nov 2026 12:13:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794168829; x=1794773629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BW2e0wl/mFdUYafJUGhlhWUwhzW5OvbvfjU9W+2jZXE=;
 b=oR3o2/rrjbDvfReQrQ3sjkdOAIEdCtDC4LFNCRlVzIxvUXygGDSBFFgqfXcGprLKb0
 XjGLR1NKPk5UDRFfaMj/UqFj81N9gaVUcSLjZV2yi/fNO26gU9ILKbS1zflAIQ0yii9j
 URL6Gk8h8xYjukocbbR1YwnNUetEssWG4pckRLV8BPOMr5WC4KXeuY5+5PTRPzM/pR2y
 1jiWGbNhvvAmxrSWqUfxIi5n+6XG0hGFGkpgJD5+ne/zDgGn/slaHE9NYfsT5x5CWwCN
 SepWuzbA/3qxTt2sgNfXh1ttO5w0K4ZqzvJk1fx87bb2QGGRZK3ZWd/YaaV4nUJYJzyP
 CCRA==
X-Gm-Message-State: APuU4Z/syR3mMbGp1S7mf5+OQ5sKQi62aEMcMkHDZGs0BzjyxAer55Qp
 fSnd+O7PVrrQ/aKDvh6w6Vhx4cvgy9fmK7JWnqqx+WGnA4avvgKbIi/DkjhfOA==
X-Gm-Gg: AYBFou1cjY8y0H8H1R2DOfN7pmYVnPynhFotuMf2XpHYO7BRgdabtxnC93xF5o4/K2x
 tnBR6doqRlBkadUClIKsIIJTLehwf1UaT2weWdGjgUdLfN/p+gaNbczIpIjj06HR3+bbnBYRcMA
 tXRIA6qNbNL349/VmwBnLazdmu++BnO0r8Smx2L3qTF9UfmhEDNkd7gzxYUmGUCh77IMKznu9VT
 ge/Wlkccvgs8Xna8/MVA0jRjjaN16ecHG3Wpf8Y0wLZyz9t+WYKhBxcNyFLgvolPw4kjpJA3NVW
 QIpkek07M88UJOQWVQ5u/DEyfweh2V5n7CML49GCOPxV/qMAwTZb21/BcE1BiHNpXf5XHCgBWno
 gE4PgPubHXrIEmfTiJwRcXm+I59GhBrgDOzpkNuIREqzObXwCmx3Hx1ii8sQSH5LzBzQAYvgpcS
 TSVo0qWAS0PCXAJtioP8TnpRYeBlkju6jTw0FXae9KypB485d2ioBMMMScYeFNT19plFyl91Yh/
 P5nCFVQWyY5dcTVX3vbw0QCnRi8e9oNSgi5CE7lzbxGwjzOGR3FxStXfhtj7XGdrLf8xVQO7ddr
 tQPXFFU6kZK2LH3hTSM033+M56nPJRTcXS+DeYR3L18dAl2Rc/irpuDHlALg8DHt8FILjw/QoDE
 OhG+cvsUk
X-Received: by 2002:a17:907:1ca1:b0:c4c:b681:38b2 with SMTP id
 a640c23a62f3a-c4d6d4f2e14mr145442166b.19.1794168828609; 
 Sun, 08 Nov 2026 12:13:48 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d6a4af563sm86432366b.52.2026.11.08.12.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 12:13:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  8 Nov 2026 21:13:46 +0100
Message-Id: <20261108201347.3052372-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261108201347.3052372-1-yegorslists@googlemail.com>
References: <20261108201347.3052372-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/glibmm2_66: bump to version 2.66.10
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
(G_DECLARE_FINAL_TYPE), so glibmm 2.66.8 fails to build with the
current libglib2 2.90.1:

  ../untracked/gio/giomm/dbusactiongroup.h:32:7: error: conflicting declaration 'using GDBusActionGroupClass = struct _GDBusActionGroupClass'
  ../untracked/gio/giomm/emblem.h:31:7: error: conflicting declaration 'using GEmblemClass = struct _GEmblemClass'

glibmm 2.66.10 contains the backport of the upstream fix,
commit d26083c41219 ("Gio: Emblem and DBus::ActionGroup: Don't derive
gtkmm__Gxxx types").

The license files were reformatted and the FSF address replaced by a
URL, without any change to the license text.

https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.9.news
https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.10.news

This issue has been present since commit fabeb8ac213d
("package/libglib2: bump to version 2.90.1"), which pulled in the
final types. It is not part of any release yet.

Fixes: fabeb8ac213ddbeb182644c8f4324d75b35ddf9a ("package/libglib2: bump to version 2.90.1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/glibmm2_66/glibmm2_66.hash | 8 ++++----
 package/glibmm2_66/glibmm2_66.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
index 20249977e8..7cfffa122a 100644
--- a/package/glibmm2_66/glibmm2_66.hash
+++ b/package/glibmm2_66/glibmm2_66.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.8.sha256sum
-sha256  64f11d3b95a24e2a8d4166ecff518730f79ecc27222ef41faf7c7e0340fc9329  glibmm-2.66.8.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.10.sha256sum
+sha256  2b61780203aed98e701d3ea57c8f353e7c8ada9706a79be782f6c5153dd035c0  glibmm-2.66.10.tar.xz
 # License files, locally calculated
-sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING.tools
diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
index bbf1a97f3f..0cd2abf0d1 100644
--- a/package/glibmm2_66/glibmm2_66.mk
+++ b/package/glibmm2_66/glibmm2_66.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIBMM2_66_VERSION_MAJOR = 2.66
-GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).8
+GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).10
 GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
