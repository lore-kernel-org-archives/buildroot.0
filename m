Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB18606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jw+PuBse
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6D281490;
	Fri, 23 Oct 2026 12:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98rjATzg5ke2; Fri, 23 Oct 2026 12:24:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8926281493
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758277;
	b=oGUzIPHqTdqNI9CjoM9092qz/80KcIXvpG+N/xwva93/eWy6vqOa47Jofjy3G8g5pTwU
	 QkddfxWpXjSvBAvhqxKcauuZXysKVw7EcA0haOgutJTtWeniEuUxVg9Sym+emkzZMhdc6
	 KTkY0/t+fQVe+8BmqLhMjN+OT3Mx5UqAKWXLe4BjWPPL4i4mOp+AX9p7iZ+BS97vMRoXV
	 ubOVtUV2wh2WiGQrw52mKLn+RILI/rfkwgj3X19fXj58kyZOqqgfclWfPYgYn2rwo4vqB
	 53l78b6aXvF0zt7p9FtEn+j9i1cZDKCNoh2zy9sbxGLycnpM4K2HF5R2C2ecOgIgRQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=iOKxJWd5VXcKY2mdRpq90IEVus0eDrzv/Tnsl66qKG0=;
	b=FMn9tBUp0+SSBZZpNU7DxXftsTORvWogCpAVqWzpRsiZT7EQUQnspIr33XBZjMpGd1uD
	 wwRdqkO/1mdWHMLPiHUGyiFBAcEQT7TJlf0aiMvQxOZnPwnD1Ost0J93jz7x8P8W3I12m
	 3EIMJiHNx4LjPrOhuIjnAzZd/MavhqFgIup7pugpjGNErxMAsMTfSAbxDPffomwGP+PUO
	 zc8i5kCyH/d4OEPvCpco6SZu4BgxZ7kh1EME0h5H23ek0Q9hi44/UV9/+B5IiXuzEfkkl
	 LgUEXOd7LLz6JbIGAPo7KZ83sYAFiWIPUqzjr9D7oh6IKi+Rva6cLKc1KgfA5GN3+5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758277;
	bh=iOKxJWd5VXcKY2mdRpq90IEVus0eDrzv/Tnsl66qKG0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jw+PuBseGA07WAkpVWlJEYEbi1sMY9rcu04zSzi8r+fEZ6U6o7Qz1pLx7XsyYvLLL
	 9eqT65UbddxuMXGb2BoI4G/pHXa+tk0C8lNCONxzkKOQy0cFdXNvUxUdw7XgGeaLgM
	 x3xxvh+k6QP8CBxKuFuhsPJo3zKbhaTwPSy541dHuopvqwlyIJ58zCHTmeY/6FE3T/
	 FiBfs7Q/yUCOCrHOOuE8OhicbnyrkfJc6M+YHCYluDoxgYaDAvVIFVwx6H8YXlMq0p
	 UPO1MO9H5xojSDOZKDWVuzupXLurwAaB6e/fkKvlC7cgcfp6PPLNknjyxFvEA2V7V/
	 Q07JAop6kHDkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8926281493;
	Fri, 23 Oct 2026 12:24:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4EE023A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B287A401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrNPn51GflK3 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 16FBA400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758270;
 b=B4vh4HaPTtxLjCqDtaJftk7e6rZZBAH7MzR0s2QOu2gl+99FWKPNAdY366tC9pwga3+X
 wiGxmcn4ZadyU6wrHyEqlmsgi7fqsvoYfn3UHaL0TS9kmcwrAK8B8RAfjt/GjsNsI9C4J
 SaLCdVZm43TytEnD1WXtHC+iXX9G5874YSinifhKEVXkvI8K46fpa//nkGL9jm2bQYIjj
 PwSACjuKNrV5qp2sMnibh1Nbpr/7IsGwgPFtYIK1SAF9edOUMWk4Pqa7kdASlsB8vZT2C
 e08+WxqBD76MHxD6OCMJelvBHzDyHe5ncJmZxnX24RACsJy4X3usUeS/77i/tbI4j+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758270;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NXeNgY7oliKohTzICbk75giZli/WLQOI7BiscF95uGM=;
 b=nmil8gVQ0pzmfXpj6+BwlSQapgUwb2ZsFZdnXz8ThHlFHDVME6hNaD0RkozMkgHoa5fG
 2g7hHXQb5xhBByebG8xPLdiNftqBHvFdAmdbrvYs/Rihv8i3CIuSFYuWN3M/n50ne1eXV
 5/+NlbIcEWFl6Tdse/xakwAblJrorWZIaG6yRp/kZNzaZEUJ5xg0qDDBOhWKRr2EMzCWz
 PhC6u6VPayRy7Jxq5g9DpTqsEJUSSQZLoiBSBEIkuxvEiOut28J6HwKLJZzBloPk4t8Za
 y2HbApHS6/RAY9w52Gc6pGU5zxQq1mIdasxQ7f3TVRAxLhr8bhJbvEYVR7dgALcRmpQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16FBA400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91F3C9C66B; Fri, 23 Oct 2026 12:23:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b8471364de8a7708e37ff702a558378419345914
X-Git-Newrev: 74432125e4abf2250b29ff0d817dd613f2329691
X-Patchwork-Hint: ignore
Message-Id: <20261023122305.91F3C9C66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 configs/lafrite_defconfig: switch to Bootlin glibc toolchain
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
Content-Type: multipart/mixed; boundary="===============7467933184092177230=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7467933184092177230==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74432125e4abf2250b29ff0d817dd613f2329691
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

As recommended since:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 437e7be84309782f322526a636526caa962ca784)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 configs/lafrite_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index 5f70706fa0..2454d2b7ff 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/librecomputer/lafrite/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

--===============7467933184092177230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7467933184092177230==--
