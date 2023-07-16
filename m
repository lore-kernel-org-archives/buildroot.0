Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FFDEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EACCE40185;
	Sun, 16 Jul 2023 16:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EACCE40185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahsJ2wxLqvBg; Sun, 16 Jul 2023 16:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46BA34049A;
	Sun, 16 Jul 2023 16:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46BA34049A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5A91BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7E3F40141
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7E3F40141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFjxCVUu5ReA for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:37:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F7B2400FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F7B2400FB
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:37:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19179A4C066D
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 18:37:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41836)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL4k7-0006Xh-2i
 for buildroot@buildroot.org; Sun, 16 Jul 2023 18:37:07 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:37:07 +0200
Message-Id: <20230716163707.420531-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689525428;
 bh=qO1x0ULXnXu6UaPeDtnuge4ixgJcQZu14Ci93/3FtC8=;
 h=From:To:Subject:Date:From;
 b=F0gFq8GOhexnk8B/JoHuCXjrPHx/tVlCiNnY7GRkpJIvemBBLG7waApfdo7dQ0d7Q
 gn7qyQ9PP/f/4Ka7mOExdzLL2CKjDHQmKKjmZxBdo+JszSz01XRJAhusmpDU02ekrN
 2PXbsI/FHP4wDuzvaUs2K4ioNMZEivq2ONUqz60Vx0T1Yvnv0Wn19cXTWgQrdnVqtm
 cs7Hjjn0bGDUuMIVlTlT07XZQKXaF8ZVBoQVJqKeBBEPIA97VkihlG2p/WCbpAsvYq
 nkZFRAEvU/rucAHFUburp/Er/RyFCsLa+/0DI8xhToAIj8zcHaEfqb2tCN6mQt5v8O
 EKNMg88LfIaIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=F0gFq8GO
Subject: [Buildroot] [PATCH 1/1] package/yaml-cpp: fix library name
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the current state this package install libyaml-cppd.so due to "d"
being added because the variable CMAKE_DEBUG_POSTFIX is not set:
https://github.com/jbeder/yaml-cpp/blob/master/CMakeLists.txt#L137

This breaks the build of mongodb which expects the library name
libyaml-cpp.so:
https://github.com/mongodb/mongo/blob/master/SConstruct#L5090

Fixes:
http://autobuild.buildroot.net/results/304/3044d040dec090a2f528a96f201d4e554f6779b4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/yaml-cpp/yaml-cpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index d65298ffb9..367df27ff1 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -13,6 +13,7 @@ YAML_CPP_CPE_ID_VENDOR = yaml-cpp_project
 
 # Disable testing and parse tools
 YAML_CPP_CONF_OPTS += \
+	-DCMAKE_DEBUG_POSTFIX="" \
 	-DYAML_CPP_BUILD_TESTS=OFF \
 	-DYAML_CPP_BUILD_TOOLS=OFF
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
