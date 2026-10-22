Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6F606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YaloRFsy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D592F8165F;
	Fri, 23 Oct 2026 12:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yt_CRA_ltNxv; Fri, 23 Oct 2026 12:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9AFA581471
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758775;
	b=qCzhnlXWV7SfX0Kfb76Rxc+0uNnwUOeNUR2wCB3p1UMD3SWdcr8BuzQ1O9080efUxtZf
	 /gDol+NMBxV+v1qTW6thdrbn/JXs+iKY3bvfKbQnh+ayzT7WLfYFOQR50wwcuivEqARaW
	 YF254xcmFIhOm6PrqHRFav1ejJU/XrE1Wi8lKEGeZZaesIeIE+6zO3WUEokY8UDeYU+DO
	 93x3EC6eG35ELazTYMdYsNY0HCDXbJfiI1H9/+JPR4WodMnBgelJEyr45/FjMq9AFh6+x
	 oPShs0gXtlTGBc8UuXhnkdJtO1ZmU910FWlmt3tPhyf1OK3EIFacXum7dDtl4K4qWVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=aOuKFqDm6E7fHcaDbQtQMDw+uQ+sE55LedRNWts77ZQ=;
	b=r2UOz5ACnQCluPDIONrYe49KQ2OBjHO5p4rnvTE+IizAHaEEdvFjSSLdcfnfdmq08MtX
	 tZ6TQNPQS+QwpD4MNMnHaXTp1YexWpu177we0F21MRyt5keuWLeWo1dchdYTPoaZPU3jP
	 p0WQCOK0QdVasyKzzsoKMmW75IzE9y7kgFHQeCVNceylojGEq7WBUJDmHZqphuQR8WZid
	 6VzrR8YxQOntx/0TIHunQiKGfXiGWPpDpuDV2Zr1qtsYA36lWOm+38UpV06rWRDYJro4k
	 e66ctM/hmB255INYEdHRxISiGuuxKzR3DexBlQ6jBXxhysjYxpef6pwLg3nnmO6fs0A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758775;
	bh=aOuKFqDm6E7fHcaDbQtQMDw+uQ+sE55LedRNWts77ZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YaloRFsyJNFGBXQAmh/2neKDFzzRWZZY/iqI2FLGKHxJQYAEPPLBBklF8YzXyM2Wu
	 pmSOM18TP9s541qryOSM/jLac9i9fx26NG8mYgsR+9m4Z/uZ3y57oNOMwPNx1jKYaV
	 f6S1ne+c9xCwN2wVUEOfy/9IE3YB4mg4adBrdlaVls5GI9qxMAqkZOr0WNv/YjtXzB
	 QOZRwZgjEm70LYlFaWvCEayiBF+9zefS97Q5lF8Z0WYWFWNr7FhNHwQGPDbnvqifkr
	 o1LJBPa4d0gQ1Zke4XCteopAASY88mleczNoxgVUc/DZ6YvOHHEV8Uwz9/EeoCPFx0
	 TC6WYo8lC1JYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AFA581471;
	Fri, 23 Oct 2026 12:32:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FE8F49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C2C281510
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDwbiwLoVBiH for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CB33281496
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758731;
 b=OijmKou7TJe45CyY+4Lwj4wNBaeo1XI+JmWwn+s1n8dzxHP3CQlpZE6uLAOtUlkLqJf0
 /PcRvH9x/aS/4opdDCpPII1H6DfQhqlwPYosWmiXb6swzGzBvhSBIBhtCj5cKD2tsLcd5
 gWDFFfvl5+H0GB0ns2X8YkLRIlseWfMQu+lsbo8OxiO1Ec74AOqtNdhYbXtaZY0C4dlpb
 qLoz460K47uv+hA8aPKHdfLtSUDoAxtZds9F159aoAI0Va9h6Vokuw1mIoy+2+2OVX4ti
 838DtZozytm6Kig7wCxOZKjh+Tprmd7iAy49IR2qr69HLSaj3Z+fpd8XMCCA+wUMuXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758731;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1o0rIsX/RbWwqBS65nnu/ys5BwjQj/Tw9ir1nfS+PsQ=;
 b=f6LPMC9oicOFB2rJztzAq4tG+T+TXnEYRgx/bmYcVUf12ZA6idr7eAnHhWi0jD4+R5gH
 JBnVUiR2im+AZibVQZ/CVJig915w49HD1OcwLmL3BJ6bxrPkEg9rQ/JgN0jhUJExkmJG6
 Yg2wnsNsOA31hHFhZfYKtuDpInfuOauHDdEbnE2CNq/cOvmpuLl46GlRfsqoxaIgSTPjX
 MvbKS3KcDv3m+6ASxZ/0YogeYXmKz0aEisGxXJX7PdF/qZln8Tjniza359gq+dA4aVeBu
 Wvam+3zBec4kenB7YADzpRmgGqW2t22toLF1IvWOFaAVAPQyHhxNPir6cnwNOyi6rQg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB33281496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A7EA9C669; Fri, 23 Oct 2026 12:30:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:30 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 683478294a1424f948be2c3fda554fc9820a0d85
X-Git-Newrev: 34a50e1a0c978ecc2fa449737c3b6529be5936b2
X-Patchwork-Hint: ignore
Message-Id: <20261023123047.5A7EA9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 support/testing/tests/toolchain/test_external.py: use HTTPS for downloads
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
Content-Type: multipart/mixed; boundary="===============4193131678290260277=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4193131678290260277==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34a50e1a0c978ecc2fa449737c3b6529be5936b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The servers already redirect from HTTP to HTTPS. Use HTTPS directly to
prevent manipulation along the way.

Also switch from the autobuild.buildroot.net alias to
autobuild.buildroot.org, like all other toolchain downloads from the
Buildroot autobuilder.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d04496c8c14a84c6ff9f23a023eb70eea61c683a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/testing/tests/toolchain/test_external.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index b3bb961aac..038b072d1b 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -80,7 +80,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
@@ -109,7 +109,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
         BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
@@ -137,7 +137,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
         BR2_TOOLCHAIN_EXTERNAL_LOCALE=y

--===============4193131678290260277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4193131678290260277==--
