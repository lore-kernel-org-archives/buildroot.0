Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B462060A6F47
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tFNvW5fC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A3981669;
	Fri,  6 Nov 2026 16:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEPv6SHnc-6d; Fri,  6 Nov 2026 16:09:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A6C5D8159B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981343;
	b=WA84oBR8ajFHz/+dSl0QzWdZf0+zEChfm2HIoF19/Kt42pEkg9nHO/QpkJcNYiIJLMyn
	 bhav6ab8QyDVxYQKKdUF3RsabWNAwKt/m2cx5Kt70+5bgb/N+dgRwnjUTfC5YO2Pu/S9y
	 lQ4Wy5UoXexdf4Jv7jBPN6+SjQUp6h7cZYmwjIHaTdJkPXeWVnQCxY+TQKQz3dR/vKPc2
	 jD/ULYjCJ1EpLXIBgaS7hpr77Yg9LKrnaULUHBh4845nJPwqofwv5PqEODqopxO5uFzRW
	 h7Xus3Pga9QPP11tkyESL0jutM8pki5EcwYCC1xZgIDn6MDHIwdzno6THZdt9jZ/kbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981343;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WaGOV81qly/plURxcvB7IZmMAxdb139AYCFWbOeB2aI=;
	b=R0T4xKD6G+ahUcMt3OG67nMGe5ff44ZskLaYF9mHdt1tit5bU7yu43lk/chyjb+2zYx3
	 WPhwJ/o+DkhlIbMLrkTKnr+1T1SzLVcJHtp15WhUt+qlAqHrb2p/NK2sup8aCTYDUsIE4
	 LY3n2UzfZ3Vs+uHYJ5bXodEtDNvxPfIofvSd5k542tobauSOFgNPddOCeVpKTlD2XT2He
	 VHAw+kDQ59aUv8iq0YJ1xaTkgS55+6vd8rQTNimE7a1w02/PWqafJ5GdDBx3ShXNO0HBH
	 I2tVwcakImHQg/xQXdUAAqMaEM/FWANQWxQgvsnhATzESUWPxIf2OqwuoXFzOOZBfhA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981343;
	bh=WaGOV81qly/plURxcvB7IZmMAxdb139AYCFWbOeB2aI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tFNvW5fCgN3bc69h0vspuMOMOPZ5gb3X0MXo6idAjqqDuNfxLUSsN0zGGdGCh+vGd
	 T2pUdwGfC021pCJQ11m6MGkZGR1r9I/wFpx17StPmK21ULSmgpKyrN74eWJIRGiW6u
	 E9kPUzBPUxZk7E04xamO4HPlo74kuK7J9mk4oNdJZJqWI5WE3r3bmdhRzMTpDDvWSX
	 35qCj9NFSjk0FjmaWLwusrOgvLuTRCm5eSIGNjGVXbGeknUMBrykRV/IuXHvtzcRrO
	 jgkJLScUzci7MK2avKT6mNpfBA15QKPx07f/sGnALul0SGe0hKOICroi/+0xzOvkND
	 7AmnK3xr8u7kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C5D8159B;
	Fri,  6 Nov 2026 16:09:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 410147AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2650F8146B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gr5mjgArRuEb for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4BC3781423
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BC3781423
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 804829E09B; Fri,  6 Nov 2026 16:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c4ec2745e380b5c42433e647289921614397f124
X-Git-Newrev: 2ff4fd410ec966e8518d5a50bc8629d1512ce99b
X-Patchwork-Hint: ignore
Message-Id: <20261106160702.804829E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-platformdirs: bump to version 4.12.2
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
Content-Type: multipart/mixed; boundary="===============7203791001910537455=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7203791001910537455==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ff4fd410ec966e8518d5a50bc8629d1512ce99b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2c57957318c33414228ce7c46c3dea1e31f184dd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 3e2f4ea59a..a237667ad8 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  6b9f7a12243ab0609a433bcf2f641c6b  platformdirs-4.9.6.tar.gz
-sha256  3bfa75b0ad0db84096ae777218481852c0ebc6c727b3168c1b9e0118e458cf0a  platformdirs-4.9.6.tar.gz
+md5  9d6b65f596852735dcdcb3109127d454  platformdirs-4.12.2.tar.gz
+sha256  eab5f70271a490ef74618bb314fbb86e3c7e82fa3b9c922c2ea0e0a1a155d329  platformdirs-4.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index c3a7df9037..d3463254f4 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.9.6
+PYTHON_PLATFORMDIRS_VERSION = 4.12.2
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9f/4a/0883b8e3802965322523f0b200ecf33d31f10991d0401162f4b23c698b42
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/17/c8/721b3855fe457da514fe249247d404b9b39c5d16532278f70ebaa6acf18b
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE

--===============7203791001910537455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7203791001910537455==--
