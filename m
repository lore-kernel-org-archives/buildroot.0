Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70173606A323
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hfFXlqC4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 295DC815FD;
	Thu, 12 Nov 2026 10:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBUbWeOK0HSz; Thu, 12 Nov 2026 10:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BE3D4811FE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794478744;
	b=BksJHSOFX7U+FHihg5cBJrB7O8fYcrRTK8DPmNEjQkAbLqyso6rWwtzfl5wHWPT9Af+6
	 KTK263rKx2mmJ8wtLDBDGMIjcax/NfRcrkvRVH2xsZs2+UFu9n8rNOZr3Y7hfhV/N+jf6
	 ebQBMfBJ68xkeqZymYjHBmFYhGYHG0j1dR82X/axeTdpX9lRD+GI31tk5U+AaoP5SF9+T
	 qHxmfeLA9y0BBPlZ790Z1ZqCYvglh0g6d+omOKFQtrtT6Ro4GfhAgZIXWrckN/1R1xsQL
	 uRKhe7z0MsxWGY5VZ+oZ0tdh/QHTzzesDc7Nc+dpY1ihl258gzzRftnlnRBcNcHQq5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794478744;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SR4pAuIvQc2jOzyMiy9I01TWMkky06HpFnKc0FzqcNA=;
	b=idp1vWxlZQb8l2CDLD2xka9ZZANQWY8/2jsnhKh7qDnSDFUb2gRfENJcCOe8ry1AJ50K
	 0pONkwlkvwhI/gT7dO3mT4j1pFJ4QSCKspetLgjWL9uN5+0x5osZzsHPIXxb6a6NfGSw8
	 6KsEtqehtAJeH+tIM1n1sIUXJgtM72uptnTFF+GX/N0hxjtGH3Xvi9I4er3w6oDd5SNLx
	 4Q8BX3ypcnd4RLHyDUEvOrORUG/8aBk/c2xeedcPim8G7ZWL0m43Rhpc4NNAoYworX7yi
	 rjRI+greD0jV65QMihpt2eeAX0Vwc2VhMf5pv3Oo+6FqoX9NDGUeUJOHkLuOrqYNRnQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794478744;
	bh=SR4pAuIvQc2jOzyMiy9I01TWMkky06HpFnKc0FzqcNA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=hfFXlqC41P/HZoY1WrdubnypNT9ozvzvBOpuDVR6EI9XYz7C2CDSOs1til9lPSgZF
	 +qfPV5w7wUOyDgczz4yg9mXchcpusBUaD/gbKJxWZa/s4CVxhwHryHRe+JUTGp7aZy
	 CLhqy35Pa1AijdeBL7SIjNttPicvMcgBqR+uuywJZKMe/gAMnDCJK6g61Kpa2PNUDS
	 rLaZyxYD63fXUfrpCx0f6tiysHaehCv5eO9Stj+VzdWxtlz7tdFB3WSv2InYGEwQic
	 WMrw4NdskAsv+NMq3fGSkldXhUpCuq//QGfY1Kqh5jZ3DDfbWAgXUONc2LVArpxA7v
	 qy86sA6JDtDbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3D4811FE;
	Thu, 12 Nov 2026 10:19:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FEBC28C
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D29B60784
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyQOyHv_JBia for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 10:19:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 29E6A60626
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29E6A60626
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:18:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so43049215e9.2
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 02:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794478738; x=1795083538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PT3xxAlhN3QHqJvVndUb1Yd4J6fYNBgiZTg9Ei+fuFU=;
 b=zyJHZizTkpwUrjaO4f8nduPumMpaEQ8hO/pXDD4ZDdf6bcKPfZvZHrnDY8yO7zO19r
 DbMjpVhvA+/KNDmhIpSVRDXxHq+KjyDvzWd43mJ2Hdi9KQ1wKNPpP0XjfPQ8k8yJml9B
 8sjg+jpiCO62WG7SSA585DvjChEv0ff0YbxkoPUkjrJUCThefg0/XvHJn+fqyBTb4uHj
 5x3ThGWHlAGG7VRC6u3WJC2YjirQKQttSbLwQrYjayr+qCqCx7CxbQPdlyvRqRjP7Zns
 my6cQNthlb3MBVVH1QrcfRlfMHCmgTfWiicaEx9B0YdK+hx6VUlfKYvBuSbceBrUVFdg
 0hXQ==
X-Gm-Message-State: APuU4Z8imnZbx8OIEoT2HPIrjFOHmZTngEm8LdgpeNs7kyXBb5MEn20Y
 SfHtRz9xbsRaFqLp4LmprHhPTQBa+F4S+RmXm4DmiaVxg5WOBxOhxmAOCnEiMhEmQxdb1a9uqpt
 efBEW
X-Gm-Gg: AYBFou3RD7rnWwi6YZswYVepH/EBGyxvIV6R9OXWH094IXqmB0OaOOZoTko6yiC35Dd
 8FSNK9VSP4Crll6zT/a/tRUaJkmne7Qp8SctTudthoXZF1I1pqGFZH4X+EdRTZewUgagkyeyZw2
 N7H0ISFxbljyM7CkHD76piVSt/sFy0dbgMW7H4gHUz1GbT58utYVE1HcDGTZGKbYtpN++em6XXk
 L6FTGD87qrB453254CV0jI7Yqqfd5u6I5E3WCs8OdMpjayiM5JI8WjOuSWiYL2e4ElYA1AmGury
 5AmX6qdKee7asbQ4jpbt5cdOaOWWr7MQgPxzPBpQ3O83RoA2OQBj2Qa0bugEekRcEWfndNNl/vn
 j+x0lCuTrzeSA1PG42fru0GVizbCE11o75zWrUKgo+MxyW7YpIU6RxFuX7otNzGuV4wFhR7LmHY
 EdBe8eDP38hOOidwGNseFe3ILYD9zpvHSY0DfuC2kMp5dL/5c9EFo816Krj2l7xjupbvKxzFA9O
 5T/VqMXa/yAo07BIcCTmMAGmJhKd9gHToEYScJGVNBDUk1OZLcSOHz9eQZt0A9g+pJwq+Sbj0tv
 kAam3cKqN0kY9GUmHHQV/2BuFuCujKdop+rsUwMHGQ==
X-Received: by 2002:a05:600c:a00d:b0:4a2:1a:a129 with SMTP id
 5b1f17b1804b1-4ba093b7ffcmr95327495e9.35.1794478737752; 
 Thu, 12 Nov 2026 02:18:57 -0800 (PST)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2adf53sm58560975e9.15.2026.11.12.02.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 02:18:56 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 11:18:33 +0100
Message-ID: <20261112101833.51799-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/qt6: security bump to
 v6.8.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, raphael.melotte@mind.be,
 Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes (at least) the following vulnerabilities:
- CVE-2025-10728 in qtsvg
- CVE-2025-10729 in qtsvg

See the release notes:
https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.5/release-note.md

(alternative to commit 3ddce4821102aba53c6cd214f38a8afbd131cff2)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/qt6/qt6.mk                                     | 2 +-
 package/qt6/qt6base/qt6base.hash                       | 4 ++--
 package/qt6/qt6charts/qt6charts.hash                   | 4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash         | 4 ++--
 package/qt6/qt6declarative/qt6declarative.hash         | 4 ++--
 package/qt6/qt6graphs/qt6graphs.hash                   | 4 ++--
 package/qt6/qt6languageserver/qt6languageserver.hash   | 4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                       | 2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash           | 4 ++--
 package/qt6/qt6opcua/qt6opcua.hash                     | 2 +-
 package/qt6/qt6quick3d/qt6quick3d.hash                 | 4 ++--
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash     | 4 ++--
 package/qt6/qt6scxml/qt6scxml.hash                     | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash             | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash           | 4 ++--
 package/qt6/qt6shadertools/qt6shadertools.hash         | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                         | 4 ++--
 package/qt6/qt6tools/qt6tools.hash                     | 4 ++--
 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash | 4 ++--
 package/qt6/qt6wayland/qt6wayland.hash                 | 4 ++--
 package/qt6/qt6websockets/qt6websockets.hash           | 4 ++--
 21 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 056e30fac1..9e3b36939c 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.8
-QT6_VERSION = $(QT6_VERSION_MAJOR).4
+QT6_VERSION = $(QT6_VERSION_MAJOR).5
 QT6_SOURCE_TARBALL_PREFIX = everywhere-opensource-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 57707befbf..79ae6b698d 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtbase-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  532dfbf3fa3cbc68fa37441ea9e81c5009da044eaecda78ffaeafd8bd125532f  qtbase-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtbase-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  fc95010e94d8b1ec342eda9281fd278d5f096cf9ad8f1a0adfba9575438b0abc  qtbase-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 3fd8accd59..df1d54af03 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtcharts-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  2120c2927c8a72dcdd55082e9464ddbe6409f1b2b5a3e97331e597e9d6a3b531  qtcharts-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtcharts-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  a14b555d28038a4e83fcb4762e27f6357d9d0b38cda5d534b478815fbcd19119  qtcharts-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 91ff19f35e..545c9990fe 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qt5compat-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  9c1e9a3801887eb986d0bf2e09bbaa833ec1275cd315ef7aff23d14c37ec1081  qt5compat-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from: https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qt5compat-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  111c3a13cbacfa2c663a8fa12b13f05680754b42385736aff70e4bca93d09453  qt5compat-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 6dcf206930..e6317d5d09 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtdeclarative-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  e4e68aad4c07fbb9da670ecd621fabe51b56a2bfcce8da775653bdf8dcd768fc  qtdeclarative-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtdeclarative-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  7173e8d620a5d4da9c9a3f42a8795bea883b2d2841092925d9e8bd5d6a187461  qtdeclarative-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 99652991cb..eb4eb68cca 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtgraphs-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  3b0a2502c88ca02ae57814f432b46155d56f1e4fe263352e31260a9ff5fb2ab5  qtgraphs-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtgraphs-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  fbe74644f182c46fb58f073a3987b21e18e200e93fe3632cb93424ae0cd36948  qtgraphs-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index 0ad4652327..1d94063e88 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtlanguageserver-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  747a8e406d6b67c6b724f35a34849489ca7859161392e9dffa979113fecc6ac9  qtlanguageserver-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtlanguageserver-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  a73c2979fc26208a18a62fa0fa9a6dfe69cb6e735570c1413f6f8f08abf5533c  qtlanguageserver-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 9cea2ae2f1..f90c78fdb9 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  ac5827afaa10bfbcb3e473d53f422715e53b6732d19987249195c17a534e0f1a  qt6mqtt-v6.8.4-lts-lgpl-git4.tar.gz
+sha256  ecf2abd2c0547a2db66a3e30e04879ba06237a5c49549a9b01586838e27db5fc  qt6mqtt-v6.8.5-lts-lgpl-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 7e9e720554..75e51644b9 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtmultimedia-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  01737014580d97fe6768ba4bf95b81233c488c8349dfb5b8861e48b6930c7ad2  qtmultimedia-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtmultimedia-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  356b2325d1d3cfecb19755559dda3ff756ce2b261fc9dd879b6a803355854d62  qtmultimedia-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files
 sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 6e910ca7fe..eb361c0730 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  53b80bc87ed164844f1cc742063f8b7735f3ad7219ef0c8fa91b1be569d3e3c6  qt6opcua-v6.8.4-lts-lgpl-git4.tar.gz
+sha256  c53648e04a78f6aeb5803a2dfdcb1f3f3615cba0781a72e192c607febbea49ba  qt6opcua-v6.8.5-lts-lgpl-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index f6f626e3ad..f316e74720 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtquick3d-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  a1e6239c20115f0f5bd08d6c5f288f0a79f6e98ce0e910665bb6b3545b231d43  qtquick3d-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtquick3d-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  04aa17ba5a4e2e9ac49184438b99ebe576d0b7b5f8ea3e8d1a3dfc784a1ffffe  qtquick3d-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index db56e0dd1a..d590c4410f 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtquicktimeline-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  c0eec3e952e9f4d4acc843054dbcb23662359e768e968747554311e5dec39e2c  qtquicktimeline-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtquicktimeline-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  758395707844463d90c67e34eeb996ea51155b4add48fcd5c4ed5d8092d0d84b  qtquicktimeline-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index b63f57e319..ef9cbca949 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtscxml-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  639bb421b25e3b7b0db00b9e3b2086d7504e44cbacaea11fe4dbecaccae1b1da  qtscxml-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtscxml-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  a7fa346a90247d37b3fe563dbc9cf3f09492d781718f4cdf5adb7494d9264535  qtscxml-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index e98609effe..d9caba9872 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtserialbus-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  23782360cf662e8a2f3272e9f5a105b70d6c35ee10ed37775b5d68bae0b2f5f0  qtserialbus-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtserialbus-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  cfc5d5bacffcce2af35530d818331b9763661891db3d2bff9fcf7a99ef9a9fb3  qtserialbus-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 25fe084e1f..bc46e717c7 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtserialport-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  8a91c7fd4839795f1ab6b3673ad51be7c84bf9c1fa50b88f8e08b46ddb8e11bb  qtserialport-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtserialport-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  477129e3ff191cf9c969964349b82679cfb5ebe6894d7c80af3cd99bef302bcf  qtserialport-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 9de49be57d..299f17f0c2 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtshadertools-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  379a70692b52903b82897869112c4759f7f6f4e76abc4987700e9cdd87c87ebd  qtshadertools-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtshadertools-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  6efd0f6a1049530923a95e3c420c185ff7e487b814d672115726b29570750f24  qtshadertools-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index df47d8e87d..34e68b5a2a 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtsvg-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  e2a83b315b97eeaffa1d3f17e8192436541fe53e62171e82c7311c56ee9aac07  qtsvg-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtsvg-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  8ef4841a8b81d7192d908ea344137cf66a29cc110382588d91c62508e0e15e3a  qtsvg-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index c53f37f064..230a45c26e 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qttools-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  c6030ea66d7be1ca7e3b40578beb35b0f4ff4014277d8e051d3219759f6ab399  qttools-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qttools-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  e8a1d632f9e9091852244b83c7b77f7dad0e1213e4e5b8b612071ae169659aa9  qttools-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index 142f9425c0..ee96365f43 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtvirtualkeyboard-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  7bfe9a4d1ded37e1e10e28098dccf1768e75ec26bb0d1d27fcb3d83988397d98  qtvirtualkeyboard-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtvirtualkeyboard-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  519f7eb26df1e83074857234de07a87adcc423c0c96547d67f4f33eef68a3309  qtvirtualkeyboard-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index 8ab0f5a21b..817d7f3d10 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtwayland-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  b2475cfae9f5b8f40ea456b762cc634e7d083873aa554eb63954ee20e8a7bb8b  qtwayland-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtwayland-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  f68dcab870a1979584d8c5302c413302bd3acd93a8adc2bbacf6d56fb9e0948c  qtwayland-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 665c3e0008..f316565b66 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtwebsockets-everywhere-opensource-src-6.8.4.tar.xz.sha256
-sha256  acadb896c557659fe8a2f29f130ad3553c1497524a1bf5165aacd346e1349521  qtwebsockets-everywhere-opensource-src-6.8.4.tar.xz
+# Hash from https://download.qt.io/archive/qt/6.8/6.8.5/submodules/qtwebsockets-everywhere-opensource-src-6.8.5.tar.xz.sha256
+sha256  18babfa2b54d2cce5b34f61155ead5d7f3e20ebe685be93e15e776fed3a3781c  qtwebsockets-everywhere-opensource-src-6.8.5.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
