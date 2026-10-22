Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE70606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qRywoAl+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98CF381516;
	Fri, 23 Oct 2026 12:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYp5Pl5OoPp5; Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5D86E814BD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758734;
	b=jxf2zEitterD1qyrc7kp9ph36TDZsH407JNielPLhGga9r4iWfW+wcrESnBkLF0jq39f
	 4jZnqMSywYWMrs98PHhiT4mwCrS8pufR50S0Qaan5SYG2GizIsQpqKLxbjGcQeitkt+sA
	 2l6ZEO8vhMPzYKoTTTyJ/vJDQj0AhdjRkaCKhj8AHKsqM/qFjmKV6iUAhpOB+dWO6Gcbe
	 CBkyg9z8kRPqIPBYU8jYPsQTD3g9oZ8vQ2TJC/bPp9zVSeozO7Fy27LpuFbK3tPCxepm4
	 TbsSHIWLHxxYpi3RKqYL03rUWxOD7PeHIkbk02EhXFdb8f7V7krjTuhAI0JnRm6iZlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758734;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=aErwzm/BR/abTzw7lw72o9UpYs0BPNosMeMNTtFRBiA=;
	b=rYI1RqHjpY3sVuCBESErnB5RBgALWYLP1cQgKBBAhFmZthcNzTUh5rBDvA/sX1CpBt3+
	 TzhZMt3/80ermATV3GR3+cL2u/qqgw5x9pU1XXSRc7TKa7JeIGVJXrO/Qj3B/OTnfHkve
	 R71ca0YjFoIyzSXC/VAF4TCTyq2ZA32XvFt9/Q2DPrGcnUUBoWeIvJBJq+cbW21PXQApN
	 q5u2Z8NaN/rTh/wRgOfO0Nuo698PjVILtNc6sOumd+d6P2lSY9nOb2jzL3/kWHm4XepAc
	 Ww9kYFWAclYgp0gufMa7ML0gGNrIyqGoWMidtdYECKWsLpy1TXtbdbI1fsB01gGEViA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758734;
	bh=aErwzm/BR/abTzw7lw72o9UpYs0BPNosMeMNTtFRBiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qRywoAl+IEobxct4uK6cNnTfGbuqZnZmuH/cX5dn2y/nNqCVRyPP3cKUv4wylqhgf
	 fbsr9g6E1edmeXUj1iOhVvPjObJ0pGBEhBZQJf7p6liUE04yqq/OfH72/n1FciX9hN
	 IkDuvlvchEGL9ArGPFweGcThpZP00FicMVfl6v/Re+NEkpICJS62H7w1Y+5C5hEr2q
	 bwetzJOkVv6GQln4EoO4MQGngZ4bK7274vi1l4s1KSYx9dzXq+0m4hbqfWZq7bXWbk
	 QITs86On2KZU7st+wCWCEgXa2YWtz+F9DX8sMq8Lgws9CVW2Tn1BpBPE+x/wvZCLmu
	 o80VbOKcFyizw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D86E814BD;
	Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF43AB02
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4F33606BF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sECh6mHqRXT2 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECB8C6067E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=dTPMlJV1UPxpdymnH33DTh8dx/hUZi5UvdoLSm6vrfoVtDQp1ME0qOun6b8O+mrq4d/Q
 Y79BXq31/9HrEH5dLmBnZ6lWNVbS4zp7MrDyj2sbPDwmbwS9iEhFL/c9ptXyG9CNuhOtA
 9XdI7vfn3OIhH6WfzTZxujxSHiQpJ1bov2aVywt9l5ARRkRCBto8FOf/tdqBvONNIJGUu
 T3CYIkJSaYBrq36HoOcPe/QzQgns28DwWropZB6X1/YbJv0QWulEhaupvSFj/U6TjgQcU
 Coh+qvpM6J5Gn0Nt6GrGCAJHCtg9UzXsBHbg9qgT8BvVY3Xhp2TFTXjEbXjGwQHws8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BBJjR0wXCU0g7y3QAOdB+Xn6ffM+mGoWs+XGWMH20kw=;
 b=d0fJsnrgNpOaRAYoJ5v+R2vRFy7adItzzG142doM6X7GooOz0KjR2MgKlu9cCJJ3AFeu
 /3Ov9rW689zFvMNqDYxRt3N5ofeIP46WsSiq5H0YDlMhuZ7AEyVbAIqBPy++CUi5c1Xka
 CIXVBOt0pwNa8MGJh5njvpvgxa3M5sY+/ZeTjco9Xd8eukBRjdw3yoCF1bde/+7qrH2Rz
 d5g4xG5Ca4hvHXfwOGzXNOVYnkl74UNbItYU80x6akSFDdjsjsPibkGzh7awGCZ8wB2Ly
 1Sw+bTx5XmP6Hx8FP0sjoMsO5l6A+W53I9liCvHUpvWJNOkXkKtu8W1ZpM0fvyFiMiw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECB8C6067E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 732509C669; Fri, 23 Oct 2026 12:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:23 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6313c1cced0001bfc6475bea24126258f4e1609c
X-Git-Newrev: 87dd5fcf9c6336e951a4e58d06637427a5b102f1
X-Patchwork-Hint: ignore
Message-Id: <20261023123041.732509C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 configs/sipeed_licheepi_4a_defconfig: glibc needs gcc >= 15
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
Content-Type: multipart/mixed; boundary="===============1957958324824274271=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1957958324824274271==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87dd5fcf9c6336e951a4e58d06637427a5b102f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The sipeed_licheepi_4a defconfig doesn't build since the glibc version
bump to 2.43 [1]. Glibc increased the minimal gcc version for riscv
w/ ISA RVV in commit [2].

Select gcc 15 in this defconfig to be able to build a glibc based
toolchain.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914049 (sipeed_licheepi_4a_defconfig)

[1] 227378b5930b681c79a13476ae60a98753a98a03
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=47975914fb106b83c42bc0baf6435a0944a23d30

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2a1b2030c73a4576097b3179d2d8664d1fda4291)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 configs/sipeed_licheepi_4a_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
index c7867ed05d..602cd50e0b 100644
--- a/configs/sipeed_licheepi_4a_defconfig
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -2,6 +2,7 @@ BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
 BR2_RISCV_ISA_RVV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GCC_VERSION_15_X=y
 BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"

--===============1957958324824274271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1957958324824274271==--
