Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA68606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 22:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P/LMT35/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7F760600;
	Tue, 27 Oct 2026 22:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtZ9VRt99V-m; Tue, 27 Oct 2026 22:09:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25CEA6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793138943;
	b=GG0FNe2FRFjSkjJQNMMyn/wRjl8Vciio2bVfTwFUVNIDdpRlfonXwgZaknI0SmKhWui3
	 v0OxP5V9PtGj4P6LdAuONggxwTnsnf+oYFwbyts2Stv46WfMinvcNglEbFDt1sqa83pRz
	 Pzj52+JfPPGRyzFCXFSmFoNHiJOTvuinosl/2Ez2dEiUkP/qohZMqSO63lDsD2sOSLbpy
	 otoZR4Y+tefK34BpUz8/v0xtjBAytalN06m0UD0WZH/fAjrByJJHRs3qEeuOj0/CWYQQw
	 LNmGEhcwL6kKUIOZSQ2/XW40pZ8/zZABDq9eCUNdmi2f9c2YGAKJh/vv+Pp9G8F/Z0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793138943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KaOtwMwEEOlcogCy3OPeVEkaKRQ+a6wJHY1bNeBZ1Js=;
	b=Y5OLs73cXh+UlT0S6TwS0BmDqU+HFGdRA1Epnbk2QPxWGA8DS7WZ1SUe8Je+3A7bj+93
	 P+J6xCV+sEIutflxfi6yZQTEdC4GsBb8f7Nl4kyQo3ZklHOGLnWvYkO4hSUGrSeliojmE
	 ErlyC8ngBxDUorCHoqHtNdYgcz9jngMuvLnc4Df1lUy7z7ggTDxzs3I0MoTxOj/3PLLWg
	 s0WcSf9eZIV7GH1Z/0vRtrZbgldm4U9wCO8sw82MwuUvVoDaDElPyO7W5F3x54CoCKWw6
	 TqjhVrRyhD5rGtkQMgS0YwwC5vsPcCdIM+gzvDXGFqQI4C2uL7ps+v0IJ05RMVy/yRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793138943;
	bh=KaOtwMwEEOlcogCy3OPeVEkaKRQ+a6wJHY1bNeBZ1Js=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=P/LMT35/JMpKTR2sWtOReHLFF+ApnfQsXrNbMficDxKiA90fzO2hZOwGWZdFji1IJ
	 CZhLbV5jmUgL9+wc9xLevhwDqwVLuipg4eD7BtaEngp7EfouncDZpDXUZBWc2mG0QN
	 Wiydmc/hT3O69XGb866STFSk1BVmN8Nn8uqR9hLsSyrl4Y6yytGY5KSdSCiLYJAXv/
	 lE/Wp+b1j0yBbTNGHDDuKk4UtM68EaLg+fxVhfR4TbsYiFOZ6ylJS3vaPgTYmwW+Ue
	 FFczPyK7/AodPfuD5ZcbS0HWu8EZYFKCqVn/xeU6ep/plRVTx513m70fjf9PJDJ3C1
	 39P6AaGaEmTlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CEA6060B;
	Tue, 27 Oct 2026 22:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D41A8529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5BB5808D9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SE6wluEy7uTc for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 22:08:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D60BB80937
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793138939;
 b=DJbXUZs73wmrFHsDVRI1UrKZwJKuuAzlN6d3gDKiMRDX5GmIatqDI6XyCoxi4JTIMJsc
 LFLnBxIIYd7+u8sq5MXotPrD/cCMkbhtefK3ED3yL3t5LZ4kVSvWbcH0NAnmGOPgeJS7G
 2BDWPFQK8r6Dh92/gZBvSEM1P9ISfSUAuBO+rHn0XHyVxLeilUGhFGiPWoLLPmP3IjSJZ
 vRUZSPwZDszK4e/Kv3y3XTVDa4+V5UpSEkuMVqp+ezqwFMIQT+Xu/9+9Z5ZNWdaZ7SOgj
 1p4SJzS2DOVaq1iAZ8sGOmiCX+TcAD1leguoj4E+jxZ2NKlfRDEVb8rPBDlq8q7XXpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793138939;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=8zmtyjNUXV3hWiys8IubtaWj+K8ecFYGfBp98oIBDsw=;
 b=rs4IQz3j7vJ60j+ATOfwZlcZZ9NnWqFC76k/8oZBrlTmUyZ1Lj+rc9t83mE5J1gHPL/6
 mo9dc/6sCfRcEyTaGMEmunXZLP5mTJ5T9I4suWuzO0jYr6FsCnGm1FUPuJVI8wGcvcMu6
 0K0DlIx4cfnFjenRlTgPBMFvE6AsOXezmh2t/lSEWmEOKkH0OuU5/PjBEqFkS27r3hzBQ
 zofuW96tTCzFSPw6Job2gkioWRnI14R+Ubsi/DtZT8zTslSB3N1IxP1xn08E9+O7U9RHS
 gpMgpnqiybWOtNTor477ZeynPgUyG+68NxlnqkVz53uWNrDGwKTBohKmO7dExoxGBCQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LJTmJTMq; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D60BB80937
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:08:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DDC7F5FFAA;
 Tue, 27 Oct 2026 23:08:51 +0100 (CET)
To: buildroot@buildroot.org
Cc: Lubomir Rintel <lkundrak@v3.sk>, Romain Naour <romain.naour@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 27 Oct 2026 23:08:40 +0100
Message-ID: <20261027220841.1349170-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/qemu_x86: explicitly select i386
 architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] changed the default CPU architecture from i386
to Arm AArch64. Since Buildroot defconfigs are kept in their minimal
form as generated by "make savedefconfig", the defconfigs using the
i386 architecture now needs to explicitly select it.

This commit adds BR2_i386=y to qemu_x86_defconfig.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/qemu_x86_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 21e3d7657e..6b3b799068 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -1,3 +1,4 @@
+BR2_i386=y
 BR2_x86_pentiumpro=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
