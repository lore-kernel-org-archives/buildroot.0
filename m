Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C28EC07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 17:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6569E41A0D;
	Fri, 23 Sep 2022 17:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6569E41A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPMvLRFv4qph; Fri, 23 Sep 2022 17:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B58419F9;
	Fri, 23 Sep 2022 17:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B58419F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D5A81BF366
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7583440A37
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 17:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7583440A37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTIAyOVb9_hz for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 17:51:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A186B4015A
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A186B4015A
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 17:51:47 +0000 (UTC)
Received: from 91-153-34-150.elisa-laajakaista.fi ([91.153.34.150] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1obmq0-003asg-6h; Fri, 23 Sep 2022 19:51:43 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 90939260;
 Fri, 23 Sep 2022 17:51:32 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 20:51:32 +0300
Message-Id: <20220923175132.3174421-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D6sO+ZlvL2clpVr+Ng7SPCxM/9luOy2A5A+BI/yBXG4=; b=ekQLxLKklQvyYVM/nVs/pt/DDv
 TcElx9LVQT172A0Hr4F4+Xv501GLXopT7oEPh+GBdHvaQi4PeHr+N6gxcTdhLTsYYY/I2oSWOFU1s
 QfTvMMJWY1e3yHMvJe+4JJ8c9t13wu4DTD3WBq5ScAJrxIHaNl5Okj5JFlaQWfIApV2O7tTQj+yEV
 bM19IXUQJZe6v6NA/EoYroipHn/NtcHuwzCzxFUfpJ3cW6uDDMuiFZDIjiBzTOt96UzIzsMwVVg7x
 17HuRum9Xo1getQa+vu54imhBy8frf1c/9xnppgIb/uq5+HNEa+tYmL0FVy1/2dqVrl27u1OxqLvX
 3GsdWbxQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=ekQLxLKk
Subject: [Buildroot] [PATCH] package/libmanette: fix static build
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Import a one-line patch that removes the hardcoded usage of
shared_library() from the Meson build system in favor of plain
library(), which allows to choose a static build as well.

Fixes:
- http://autobuild.buildroot.net/results/7263324435d6d25d7da98824d4313e7c45071de8
- http://autobuild.buildroot.net/results/9e6c807455b5a4e8986e8388426d98024119aa9c

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...n-hardcode-building-a-shared-library.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch

diff --git a/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch b/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch
new file mode 100644
index 0000000000..a93a1f7219
--- /dev/null
+++ b/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch
@@ -0,0 +1,34 @@
+From 003c2e84d95357bbbef72fb395ef85f1650097a3 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Fri, 23 Sep 2022 14:35:51 +0300
+Subject: [PATCH] Meson: Un-hardcode building a shared library
+
+Use library() instead of shared_library() to allow specifying which kind
+of library to build with "meson setup --default-library ..."
+
+This allows more easily incorporating libmanette in an application e.g.
+as a Meson subproject which gets built into a program as a static
+library.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://gitlab.gnome.org/GNOME/libmanette/-/merge_requests/84]
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index c140cac..b71d090 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -63,7 +63,7 @@ if gudev.found()
+   libmanette_deps += [ gudev ]
+ endif
+ 
+-libmanette_lib = shared_library(
++libmanette_lib = library(
+   libmanette_module,
+   libmanette_sources,
+   c_args: libmanette_c_args,
+-- 
+2.37.3
+
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
