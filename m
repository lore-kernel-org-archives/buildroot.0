Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EEF606A32C
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Cs+myjNt;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=jp4veijQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C23812F9;
	Fri, 20 Nov 2026 07:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xhziq517SazJ; Fri, 20 Nov 2026 07:23:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9BA4D8122B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795159417;
	b=mb3sOQ+2ooADFZ3AQqjZ1ZzSEvKXEa92u+zv8R1rXp95N6RjZkLOOm4kxrKjje0VqjJO
	 MNsF7uRMf1YA41jvhg/GXFsq80z9ljFkZ8fJzIeO5/QmfpMCu8jMIaPTZC9b60B9ZUAFY
	 yFdwHts50tv2CtiuQkS5UPUrO7BCQTXy7bRqAjz5FMX9OfUe8el+OJggM85UNXeq7+E9u
	 ZrwBn7VmkuRuHt/Hxh/rOvVNr6eQPq6FSINGAnWUXCPL3x9Oq0tQTxM/NoI4Tv2P3+SZj
	 dWt8dZJdYdSjHeeNjkEz3ryQ9TbAm/+m9Q0h7p0AtvLAaSLXOClLoq36bXZP94FzZmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795159417;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DqSlzK+tkIo9BsI0VIHG6R+HSiRUrmcYWqSomkvTJ7A=;
	b=kgBs050kHc6BDVegQDFhmJ5kUuu4Wtnv9hHi2aVt8boO4xExhB/aZOwh4xQVoxe7qkCm
	 sSZEJ+hLUD9py+eBDC3QVHEoRE5A9sOMl8xABPKU13V7o/FHFtk9+hIrs67EzRWkYfYUU
	 yaMNBe8BGESfwzHiinFpm4sI5MnNChovuX+ZvQqtFgY2ULXYIPjMiD4n2e9VuuGp3WbUF
	 nVvk3f4iw1/7vh/K6HDLthyhOY/q5zRulxwDVkrvyK5g1+/wZOtSaK7YwF1SZs+WX/A8L
	 MWJ0jdQt725rIU/ode+Q2BOR2d/ocJX4lbajXqJC+TFUm+ca+OOFdqvHDFbibKMroyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795159417;
	bh=DqSlzK+tkIo9BsI0VIHG6R+HSiRUrmcYWqSomkvTJ7A=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cs+myjNtMRLxIZ+YgFCCQmK1sH0OMm5KVS1cmGOAumiX8O5sdQp5GUvSPZOJxD7Zx
	 fpaG38hVin35huHAgQ24ajyYiuMRiB9q3LKmtTOaCnprXHbm6eFrs2l5Pn4cFcRslJ
	 Tu8poEk9RkegAp2FcAGtSRbpCfTFskH5lpVzacf0cKMQsF1i8OSFVRt1fn0bL1JeSP
	 CyAjrdliKCKbIVXrL5962eKnQuNuGGRU2JAIEiFqUnS2daB9rs21evUBLdOYXLbIYy
	 pnHdrd4tQuVw/GogMrbo4doAjV6pR4j4orl1Gvk9ZBRxzaedlDdrqN5CqReIZaamzP
	 k/frtIlQAx+og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BA4D8122B;
	Fri, 20 Nov 2026 07:23:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A7122B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB35F4020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WV_8eVMYxWft for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 07:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D59BD400D6
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D59BD400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795159410; bh=ptX1nhDWABSPqjXPIm8cTkEubqWLmuj733+KJrc6xfg=;
 h=Date:From:To:Subject:From;
 b=jp4veijQvwo689U0B6GicXOnqigXJCJj1L9IJy0EGy9Fl5xyrADZhYvb5q2MCq6hS
 Gr+OEumPErctvhz1Ctk0pSs5HNAWbBSNgN/LHFlP9Kt05eXlH1XSQx/MvfWzATQsuD
 HYQjjTXK5CMyKdfLK+EctUWE5Vgn3dXS7Pw/IYSom++Y3aqhI+8BZ/xnKoz+wIOWIu
 3YaUQijBd4UL2aw6bl9BY5RdSbwwCSlX2MkXysrOHRoQaMcuXJ+QnQ6vbGM5Zi/H05
 VZDxBGu5ujKFBb1shj3sMzabMabICSiYiJ5ecPs4feerG1BEboWkWtEMe9OjJj/eSP
 aNautT4a4Xclw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 35CAF31E0B83; Fri, 20 Nov 2026 08:23:30 +0100 (CET)
Date: Fri, 20 Nov 2026 08:23:30 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <av_1cutwNfEvosnM@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/asterisk: bump to 24.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update to latest LTS.
See here for a ChangeLog:
https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-24-current.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index de4da24559..f27bb9453f 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
-sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/24.0.0/asterisk-24.0.0.sha256
+sha256  ece42a75bc965180007c56b03f2fd1dc8484eb84fc4cddc090db0ee5d5da1af9  asterisk-24.0.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 0be8249fe2..008911b0b0 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -6,7 +6,7 @@
 
 # When bumping asterisk's version, verify that the versions of pjsip,
 # libjwt and sounds below are still matching.
-ASTERISK_VERSION = 22.11.0
+ASTERISK_VERSION = 24.0.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
