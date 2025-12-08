Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9F3D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6CA5821BA;
	Fri, 12 Dec 2025 07:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3kl9iM97rTO; Fri, 12 Dec 2025 07:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2613842A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526324;
	bh=//MpHdmL5oL/s5fvUA+j5mbLLyIzcfnao40RMmlpE1g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nBeFOawDKHy5bXCJX6wl2KvE6KdwxBn+UAAchQNajNyo+lKMA5SSAtno/YdZaI2C9
	 g8hM6ooi4fqHDcrFbsC4Dx3VKOKEwLy/hhqGcjqxy0c2kSvjQgn3fAO6KS3fcNap/v
	 qsyYjA4YuNF0JLw0pYw6g61WxEu7Z/RLryKS/h3d/JBuaB4RgOrovAxi0pmdaFyapy
	 ftkLxC2qFxBJCpagOgFLG1JkOktwvuKg9yL6X4cjjA/GQTRXhJJn4SiT1ARsLzBpxm
	 oK+A839yis1RtPSatOMuNGW+P6xUaSS0OQNE0XslpPUQngCUiz4OApjWSWOszkZ2Ya
	 oXeahPBxSguBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2613842A8;
	Fri, 12 Dec 2025 07:58:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FF0EE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB74D4116E
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVNCGYUusZZq for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B484118A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97B484118A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96CF3869E8; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 21:17:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bb8ea3ff11dd032a6cede3a101cfe129c7023d6
X-Git-Newrev: d7f2a7b85b17a9e933805d01c03bdfff16c5a0e8
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.96CF3869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/read-edid: fix cmake 4
 compatibility
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d7f2a7b85b17a9e933805d01c03bdfff16c5a0e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/read-edid/0004-cmake4.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/read-edid/0004-cmake4.patch b/package/read-edid/0004-cmake4.patch
new file mode 100644
index 0000000000..4530a9d3b9
--- /dev/null
+++ b/package/read-edid/0004-cmake4.patch
@@ -0,0 +1,17 @@
+Fix build with newer CMake versions
+
+Downloaded from
+https://gitlab.com/liguros/liguros-repo/-/blob/develop/x11-misc/read-edid/files/read-edid-3.0.2-cmake4.patch
+
+Upstream: sent to pyrophobicman@gmail.com
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/CMakeLists.txt	2014-02-05 17:27:26.000000000 +0100
++++ b/CMakeLists.txt	2025-08-27 23:01:08.868613931 +0200
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.10)
+ project (read-edid C)
+ 
+ option(I2CBUILD "Build I2C get-edid implementation" ON)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
