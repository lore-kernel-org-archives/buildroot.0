Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F39606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XyQC+pI2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 985A3812DE;
	Fri,  6 Nov 2026 15:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-_ACVAuhDx2; Fri,  6 Nov 2026 15:59:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23A9D812BB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980754;
	b=hwvGgkzu9YtymXpFOt+t+c16rwOfLXO/ToQYWO0/SM9AR2fxfKbcAufN7LAS9DoJcKXm
	 w5+JVdHEvd45HswtoCvr7IZx2/6Uww7Y3LwrEbQXrh1GkO0x3HvHF14gjVUOQQdcU42dz
	 TRRHUQKFwbqY/JwUgQOuWSMzQHxd4dkT+FyeFgMqEYQ+ZXO9m5HQbzPEdU6LgigNgAokt
	 dxHWVW1C4WQOo6b+hRCEPyUsLke+TBezJeH6kdjAtRwn8BsY7s/CHGNBwArC08/bEYyq8
	 8KjH7SKYvlWHXLlcL1nehPWBl8p1aruJOUUUgJNjzt5gns3TAorUW1AsHCWdP78V7vg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1FO6R2/deIz9XhQeXJVTX0Q+TE0f1qaAslhufzgCmYo=;
	b=QxKDSltfdyj3/DU2kBtWlR34f6sSUoCTcbPnPBEK56uvtClmCreEoCxHicIX4qyJlDEd
	 ba/mK31I5UOAZBnk0wHAhOn2ETJXWCF1L6KvFf7MRofewESgjD/Fc4D99EZ4AtHVyQTUm
	 S//H8AMa9ATf1kLBir+GiU6D8bm/JyxaaDnSlqHehqrzJp5GRh4iHwffbrJDI36Woh75u
	 dozkWioICHNOkxZzCDFHiObfg7U8D2DSLGdUj8uidbm6LNtIcZNxmxU/1787WVcWP3X2X
	 YcadfuDawfI4IdY4Bmi09KXhHuCJDUpYXssp2STnRXaBJu/wqJzqAiHrMce/WrhsYfQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980754;
	bh=1FO6R2/deIz9XhQeXJVTX0Q+TE0f1qaAslhufzgCmYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XyQC+pI2P2V4yjLmq9gj0aJy8QbSPoTFL421v4qse5Flu3pnv7tWgIaBucLHEGO6q
	 O28dhGinlYZ/qfo+q0hFSRYPZXZQTxT4ot0eREF5h+D+DZrcZN0WKgNd9ho745n6T9
	 lpMq3dAXMqlLijUQVHLoRb73MOJPboIb+deoFG4BMl9WaOGEEK3Dxa7C2BlmMHzD2F
	 6icsARZh9Zn4FLzeqiWhpHEuntITsHdx8yQo7uqBWXvIrUZfMxOe83nO8Svr9CZJFA
	 mwBkUD06JCdlr2Q1qxsj7hGlk81tnZlFggDDcwo/tHPS4P0SOR/XwX9vbbHbo5184J
	 yshnHhggOSi+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A9D812BB;
	Fri,  6 Nov 2026 15:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A077B32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9260940913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yOeV42dOqH3 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4936408FB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4936408FB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECFF29E0A8; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 89f18f45aae1eecfb34927831ad1708f67b5ee7e
X-Git-Newrev: 566bbdc0f014e417c33f95de88bd125336b11779
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.ECFF29E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpuinfo: don't
 support ARMv4
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
Content-Type: multipart/mixed; boundary="===============6782549994423745107=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6782549994423745107==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/566bbdc0f014e417c33f95de88bd125336b11779
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Building the package cpuinfo with an ARMv4 architecture would result in
the following error message:

```
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: CMakeFiles/cpuinfo.dir/src/init.c.o: in function `cpuinfo_initialize':
init.c:(.text+0x28): undefined reference to `cpuinfo_arm_linux_init'
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: libcpuinfo.so: hidden symbol `cpuinfo_arm_linux_init' isn't defined
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: final link failed: bad value
```

This can be reproduced with the following defconfig:

```
BR2_arm=y
BR2_fa526=y
BR2_PACKAGE_CPUINFO=y
```

As stated in the README of the upstream project [1] only ARMv5 and later
CPU are supported. This commit then exclude ARMv4 from the supported
architecture.

[1] https://github.com/pytorch/cpuinfo/blob/main/README.md#supported-environments

Fixes: ea1cc1af55 ("package/cpuinfo: new package")
Fixes: https://autobuild.buildroot.org/results/f14/f14e4afacaa61021463c457def1cad3c81d35f29
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ccdd1ca4aac11d913f10eb071d7c15d5fbede9a4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/cpuinfo/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
index 64477c2bd7..4aecf2e060 100644
--- a/package/cpuinfo/Config.in
+++ b/package/cpuinfo/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
-	default y if BR2_arm
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
 	default y if BR2_i386
 	default y if BR2_x86_64
 

--===============6782549994423745107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6782549994423745107==--
