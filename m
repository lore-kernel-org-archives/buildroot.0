Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70762C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 226D441466;
	Mon,  4 Dec 2023 21:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 226D441466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7eetlLaL7gx; Mon,  4 Dec 2023 21:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 143EF419CF;
	Mon,  4 Dec 2023 21:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 143EF419CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B58381BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E3F140969
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E3F140969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0XWfHGxISL3 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:18:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72B8540963
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B8540963
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3283A4C0F40;
 Mon,  4 Dec 2023 22:18:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47898)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGKN-0007Q9-1N;
 Mon, 04 Dec 2023 22:18:07 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:18:06 +0100
Message-Id: <20231204211807.12746-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204211807.12746-1-bernd@kuhls.net>
References: <20231204211807.12746-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724687;
 bh=4lwel9DvH7bkxJ+O8cTHBHzvo0TpfE+dlSNYkrrHKJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f7913RVGdknLr9GI/v6d2FxBJUFZgfTYW3htgXmwkTJNJf6ODjGUjwOfdzTKuPKre
 7dmWq2PE3azSSd8SEwRPxDS2XRH53fG2rYB+U00SPePtrdfY+72xqZ3QA507bDqbcM
 ReeFEv/aMCXBD6rnwWcA+QBsat6LZ1FC1Z/5TIlSB/NTCO5EBfblmd9t6JQJkmGuS0
 rjvhcSs6aJz8wNq5YezufPmQcJRoXqj8nH6fh/EIkkvRiSkP09BC2ovnoBSIPhCFps
 ZqSD5320qUqKiBDulZKqlc709jruc9KDaLu0Vyp0oh6iFkr5P3v+raZfjcEdi35EBK
 POnt8lKUGbHWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=f7913RVG
Subject: [Buildroot] [PATCH 3/4] package/intel-mediadriver: bump version to
 23.4.2
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
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 93930f07f2..d3173260b1 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  67fd15654bb3c596feb8c85e81221de5632e11f598421c35adc4453d727f0130  intel-media-23.3.5.tar.gz
+sha256  321f2ade9e55ed5b8809ca875d80c81245093fe9f8a26a39712d2f4a6be18d18  intel-media-23.4.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 58cc83fc27..fbcb569477 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 23.3.5
+INTEL_MEDIADRIVER_VERSION = 23.4.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
