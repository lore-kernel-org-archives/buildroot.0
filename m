Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43072606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hn0RmTnH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E1881118;
	Fri, 30 Oct 2026 12:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODmxatWMtyAV; Fri, 30 Oct 2026 12:07:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2BDCC810F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793362058;
	b=FY/zShCZLew56qoaDuw/GcPyWe2FWNvUEoAV3/U80YyzMO3nUG9Iu2qKBoYK7BXfolva
	 wStuOhnYcZGyt1vfN3ZAW8Ts9Ob6HEZGi+0bzP2h3EBtXsEO3uav0dkljvWeCN9wsRJbD
	 lYm2XBi9I9SMCJSBMajwqQF+HiIBVOP5/rLSbrOKrzYD6syA8/UVAQBp97m4KdGMPF08T
	 FYWwmeY+vFLm7IpgTcYULqwj4rMi0j7lCVSnIdxc2pgdr1qm3eM/i+OZ5oxXNGguYlV0q
	 GZa+gitvBZOxTCnXmR8nts+a2TFwlb6lHYd9R/WU4cN8vyTT2KY+lh0hXeKDHYxxJwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793362058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=adxEBOJczd5FNxtepMEm04eIDGOpWl0XTKwZdUkPONY=;
	b=GVhWzL8RiJdnzoJFjaCQEeewFAEHvVyqp8/PYXAPHi06pHUX/94ackY9XVzTlN0SsRqp
	 OCF1Hj4aXytNgkqWcp4lZURTRTLhxmuGDxg6aWkor29qsVNKrVGwIx6I24AUqJNVqUzrm
	 s23taYZbH9PxXtTA0Oyp0qb89yz5JFWoTUUuK9KOGs6hRPt2W8HJEorVKAcy/j6bx+C9H
	 WX1l1H8Q//cKRm6at+rMm4PG22bUjeQRcCO5BL+rNlIbyJvZ1eKusWhM8qBOnNbHQx63u
	 AXc1Vt+IEDfPilFyQfFU8yjzQX30Fx6EJwqXLqbG+mqyjQqIObG9dss8Cwwc0/37tQw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793362058;
	bh=adxEBOJczd5FNxtepMEm04eIDGOpWl0XTKwZdUkPONY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hn0RmTnHUeF54z72IBhDysSUEert0CDbqHBodFWSFDHh7Il5qDZaHnoMlmbJgSnmD
	 cDCyzjOHbztf86GDiQ8xmi55ei4RvPaZyThWOZTIrzJLwvoiGBGFlEykra2lossZ3K
	 DumWyXL/SwS6Gct4MrT5FF1hgWa++n/AuyDyqpLheUAT4qsxAr8TOcOQc1kbV4Ax/o
	 9TlzDLl1cZI70USmRPx6fkGN/a189PhUmdk6LYEDC2TlIN8Juyq2jHn4yTmX0Aw76g
	 kFUXNSliLVNQQl1AHY0cVKDtLyaoDy++BcJAKnK5QNs6bfDs1RdoGnqcHjVG9z2/n/
	 itC2DW7crCXhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BDCC810F5;
	Fri, 30 Oct 2026 12:07:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FBA44BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1148481112
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rflc6BWPUP_I for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 12:07:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 02094810F5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793362056;
 b=oBdpyqgqhRUYlNlVDnu/GAz9VSdXFeCog5MuaX0YRi/RKh6KO9LWT/YRuG61HWtZOGxP
 RcCKiO+r7yec+o+i4ggtVD1WkGNbhjGh186DSa3qlCbhF+jrrjdsNhsyw+sJJ0zynuJvE
 oUhXhlghompyF3WqTrXyTkOsdIGjaTj6VsBSabE7hgpSB6QmP2iubvgDOhLaWeAa24UAh
 ZH6qKwruqdfXd/9PT6tPctOhQFnnJjcQ0ySGX7py3BKwo1i3FOnom6E/YLfgEmN6QzeRd
 137yUSjS4zk3D/eL6mFhWFZK5MTspds7u2MMrea/3j+mCYxLOMJpk3mMOyqjVDcYOdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793362056;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=R27bN97hQPh91BvH9VKbP59n8/dMxtEuzJcQ2HC++yI=;
 b=d3E2Nl4fSl1l3ir7P1G3CaBi7xqSO89+lBj4J7ONsvS4did7RqawaPxKLjxJAIftdn72
 dt0Bu4GY7edPyFagHrXT9TlM0owkAZt4BpSt3Zi3eM4vaN7lkpJTEABR96FtAbpAtwV0e
 B7FepHzxG3REwGvNYru1/nTdm9eslE6q4GDkr43IjqAfYQB0ttPpM9jWtVOTTVdBY4vCm
 AxC/UY+d+w5Y5r1jEfdBHUqSDzE9QjGfCk7LsO3X1xmaJ5QoadOYgRcj1eZjPTRjOnKQG
 sAsu/w6qm1Q15B3z6MSmS9Y+QiMaH9Pbt7j2/bX9STb4lM8nukez/qW9b4kV1LXqJag==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02094810F5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:07:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 075919D385; Fri, 30 Oct 2026 12:06:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 13:05:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc7d8b6b899ed85fa7c4ee04653e390751bd3711
X-Git-Newrev: 93156d584867848edb1ff6d93083517b8cfe6d8b
X-Patchwork-Hint: ignore
Message-Id: <20261030120608.075919D385@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx93frdm_defconfig: fix U-Boot
 build without host GnuTLS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93156d584867848edb1ff6d93083517b8cfe6d8b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The mkeficapsule tool is enabled in the U-Boot config for this board,
which needs GnuTLS. If GnuTLS is not present on the build host, it fails
with:

  tools/mkeficapsule.c:20:10: fatal error: gnutls/gnutls.h: No such file or directory

Enable BR2_TARGET_UBOOT_NEEDS_GNUTLS, as the other i.MX93 defconfigs do.

Fixes: 638c9592cf ("configs/imx93frdm_defconfig: new defconfig")
Signed-off-by: Daniel Drake <ddrake@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx93frdm_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx93frdm_defconfig b/configs/imx93frdm_defconfig
index f5a5f973a0..e97eb28c02 100644
--- a/configs/imx93frdm_defconfig
+++ b/configs/imx93frdm_defconfig
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_frdm"
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
