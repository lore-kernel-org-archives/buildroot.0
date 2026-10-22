Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E2B606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ca4+XzZb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B619812D2;
	Thu, 22 Oct 2026 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCQ7uNl34O4y; Thu, 22 Oct 2026 21:05:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5D435812A3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703152;
	b=iy/kO0XIrV5N6rveGgBS4RQodYYNBdUZUCcch7pPCmVGMGO/Xwc23ylqP66tuBbJhZHS
	 9/goYQ8uCTeI3OR9VjxGWXaGEUL/2FZ1Lvd1cj1GQoUqAa768IOCcYRMmNg/LuWabNuXW
	 ZpXNFUFl8HH+pxgEZioZZxBnfHZdfbtubcFeHu5ScOOOTyf3Wpd3xKmoIqcMiufbi84id
	 bzkl3bNetXODr0A6/ViPwZEt8PhwZxbb3sVFXrilQ0wFwVqpTwvB1zhmPISFw/4ua4bBk
	 ILlvzFhuioZY8/ky7GTvel939mJFN42SpqXaTw/MdRi0uujPk/FGzrczK9mvURDEnyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TydF4xCS9k4dBYhRVq1toextGkisGFFKJVgv/PIRBUE=;
	b=UyU4cXGI062eSuY53/ptfDXeMP0PKxyjdOxt/O6o2CHAmtOxpepDLhFh3aTDP+FFdi2Y
	 myiYfchAYYPC0I5iMo3aS6xA45H1IDrErxKESZZ95LwKuBdgLABdIY/IrLzRiteDbNynF
	 6IX8QJeEobPWniD8dUEBvnZ0kagI+mIS/y3/MS3qlAUJGIdTCh5X8y7+FZ2nz4qUCmi/e
	 Rier/UgU1Cj0b1MRRtdPss2VbBbnaHHWsHw9tvwcNYXxZ7VOjmNJGmpGSG6JU/wDHPiOJ
	 MsX0se7ne/XdmJhvoa1DXSSJJfQS6F6O89f6ttZfOlx+A/gD7wtgvXvtKO5U2+xuKEA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703152;
	bh=TydF4xCS9k4dBYhRVq1toextGkisGFFKJVgv/PIRBUE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ca4+XzZbDIEL54Nd46iYwkOtjXif38PIihOqzaVvi8aLUcWNtTDlIErjCwPN4wLtt
	 ge/jkDJ6RnTLnHgEJLu4yLvU0qmN/Tse77jdyfqbZI2vfxbJsHzRR+8Lv+BI96XgoR
	 BbCzH2QRYT06cr+qBp3OTKobQcqGdeZd2rZPfUlQ/3p9dL2IUKY4FLtxYnk+oJAyIq
	 Er/eG/tPHaHoOWbgnmuuXEkh5gf/vEwH/X9T6+mLM65zM7G7aiEpFEeWMfMXaUwgb+
	 KOpyVab4C7ATqUM4V74HlWsj3gARhJxvciqaScnxqrFlcXMdrl+Bnx1pXXhpZh4fb8
	 qZCQ/ZRir0W9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D435812A3;
	Thu, 22 Oct 2026 21:05:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC6233C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C27FB8125F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDRG45jLMCgX for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B6458122A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703147;
 b=NzWaI0lenY4r4bTQhhjY1bDQrBFtg1XEzq4cI2IAZTZqbVZXGefbUW9nRcQwwpP+k6c9
 dt7kroS3gEalsqYrOKHnQ3xT3WO4ztSEXEAYmr4h9FDXlNMNpImF+v3rt5Duw6O5RpQpy
 u7+VqYljatej6CcEKd7gH0XAqFUucQNBQzCRh07mlIKAvsIytDAdyjPhPjEhphwq34LxD
 yCoQtvT1LfISN1iVvzLu+iX/ytKtTYp10H4TaaKRPt5E+9aQCJjwpnm74yaX3PDa89UOw
 N99GBBIZ0q5xP1j4x2+eG47SaeIrcfDBk70BYO0/qTiOrHU1Jz3CvLykEw01f6CaBsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703147;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cjcW/cHbl2NUGqqPzBvaUVt2b4/1VO9YdR2OtAFRl/8=;
 b=B+tfpcgWVSyw+TDqB2VH2y5AIwg5/UUT8+Ny0ts94Bcv2IWipdGlrdtR0wFqndSjFhkU
 kSP4pWzsL3VUrh4FzavhaNP+Uqq7ilO4/VTnRND9Du+zXNPYgAT4ivCS5FbWYbU7WTEmf
 esfPr+PhRXUSyt3EPNHX1Jb6mQVnoXgtgf5ic8ligxknJRxMjJAE/7QfHG6R/ZDttBA/+
 XmwhPeVvppNXHhPH9kE5WN7qtavBfb4Y5PnkDQXrp4PbixHzz40awwz2NXgSv64j0NqYD
 /EfzbjLRGASQ6pN6HFn6agQ9qGWZwG5VtgThntM0FQLe88/vEdmzAzIrmQyBuwQEldw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B6458122A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD6339BC0B; Thu, 22 Oct 2026 21:04:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:04:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e6dc3eed0ec1fda79960fe15708b80f8fee18b5
X-Git-Newrev: 86a9a153451071dfcf462a666d55850fa3ea2d2a
X-Patchwork-Hint: ignore
Message-Id: <20261022210422.DD6339BC0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: enable missing kernel
 options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86a9a153451071dfcf462a666d55850fa3ea2d2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable NF_CONNTRACK_MARK and its NETFILTER_ADVANCED dependency for the
nftables connection mark save/restore rules. Enable NFT_COUNTER for
older kernels where counter support is separately configurable.

Enable the networking and TUN prerequisites, IPv4 policy routing and
Unix domain sockets. Also enable procfs and its sysctl interface for
IPv6 detection and network configuration.

Enable packet sockets for the TS_ENABLE_RAW_DISCO receiver.

Drop NF_TABLES_INET, since Tailscale uses separate IPv4 and IPv6 tables.
NF_TABLES and NFT_NAT already select NETFILTER_NETLINK and NF_NAT, so
remove those redundant fixups.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tailscale/tailscale.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index ff4c68f0fd..950f9786ca 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -30,20 +30,30 @@ TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
 endif
 
 define TAILSCALE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_ADVANCED_ROUTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COUNTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV4)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PACKET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_SYSCTL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX)
 endef
 
 $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
