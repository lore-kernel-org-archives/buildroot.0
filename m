Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07CCC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7158041762;
	Mon,  4 Dec 2023 21:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7158041762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EN4yvdzgWmDP; Mon,  4 Dec 2023 21:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2264341763;
	Mon,  4 Dec 2023 21:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2264341763
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71FC11BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BA0F40301
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA0F40301
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUMXZB9WDG41 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:18:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61B8B402A9
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B8B402A9
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D10FA4C0C51;
 Mon,  4 Dec 2023 22:18:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47898)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGKN-0007Q9-0u;
 Mon, 04 Dec 2023 22:18:07 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:18:04 +0100
Message-Id: <20231204211807.12746-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724687;
 bh=mDje63Uqu92I/WObLOC4pie923SmpVD8yTzT2r4h2nA=;
 h=From:To:Cc:Subject:Date:From;
 b=J0u7h/KuDFYcdEZmfTpRkYfYj3t7NQ/n9tbJPWb2oPkF/asl3epf3gYx1UytBYGyR
 KQ/MEVoQDh0tw29z8sDlzNPOU0wguchGVAg8fTPS64zP4LM9ridEBrAV0/yVdnHQ7P
 Es5INWU2q1XbVoCO5yhgJAVWpNfs6WrH3APAGxxnXE1KnOYrUhMfXdSoOgkhpY4RMG
 RLbUu4k6nPxc+SgtK/TlHGO371xR7UQgRoog4LC4DFVJ70JFLboLYr7x8F+0kcKjKG
 Hk0rgp+uU+8gqloU/rrJx9G5Sb5J/96KPrwfZAYmpQ5+AlH2zP92OFrZtZe2hE/+Oo
 IQLLnyMU/e49A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=J0u7h/Ku
Subject: [Buildroot] [PATCH 1/4] package/intel-gmmlib: bump version to
 22.3.14
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index c71f2593d1..01b573d1e9 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  14ec859936aea696a65e6b9488e95a0ac26b15126ef65b20956ef219004dd9a6  intel-gmmlib-22.3.12.tar.gz
+sha256  63b879a5a20756b6f74244068f4555a56c4f705c96cbc87e5163448a893e133f  intel-gmmlib-22.3.14.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 578a6ab762..c1a92aaf4f 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.12
+INTEL_GMMLIB_VERSION = 22.3.14
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
