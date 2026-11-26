Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1322606A32A
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VoPMkHi/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89E1D608E9;
	Thu, 26 Nov 2026 11:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZfcKWa_JwWY; Thu, 26 Nov 2026 11:40:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8BB47608E4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795693215;
	b=jG4j44Ll1fvwV3mK+2t3Xa8iOI6UcLIXyu92v+fYIQD14G6qF38GFq5qK/VVTT1G0aT9
	 MG9IBhq/8ZEmSK2g0o86Z5gnx09dieqv631ztWpZ4Jj7JXg76cgUeIP2xajrbJVwAgC/m
	 3U/ng+PkQYIxBIFps9B6AY3iSeNfmGet8WvE3lB5Nv3iJdtvlHzzdi4weXgMHQf3ir6tX
	 ufiqCfNOifeG5Yq3oHjt8s0MV4+AcNj5sj8RznZo7uNo3pbmPW7BESXTqzaymvAQ/HbS5
	 jua1Ted0oQeYf8JKUVkiIFAI/GyxHeAmYWdcRIcdx1ik+dvBW92Wi9oidHBaNfgLYxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795693215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6PgCJxtrL69h4EIPZtDV5xchrjyEQa1wlPlMGydKIWU=;
	b=T2xlDkFhke0PSl7iJTBhROiNLgB62eWU12Gc/9OGN6KIxcg2W2lrjQGliHZp6iFcFV6U
	 sSrSrchnJYbhYmliK9S/zVX//pdBtX4UU/WZ3aFyfaFOdlwibSuSRrA0ikBoTx+Cek8fX
	 lz/ii+bXFuv6aaaUD8BQ+H3Yl0o3bLPy+YbC4eeXB2hZFSL5hZZVpZTbBvPwmFq6twVbK
	 ZeWRRhtguWIi/ZFiF2OIPe4OnB9FW5KRnmQDJjr3lgbZo5U4Q7KO6Bj4JolgnlVIXKCuK
	 ZEUB4befvm0dAKApqrnOCAl5TnCciDLZejKxVPDnlFRnfeam04Bbs9t3rnaRg1XzO9A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795693215;
	bh=6PgCJxtrL69h4EIPZtDV5xchrjyEQa1wlPlMGydKIWU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VoPMkHi/hoHEfaT6PxWP/gfUvk8Il0QOFLFFf3XMZi8E5gv9dr4YYbjFJp/ueSAqx
	 RMPrwusg+HJ95bi87xNciFFPIyWhUGz7Sjk6jitmcXiutFemiYoM6FwfK7fErMM0D7
	 iSBcxxQbCRKgRzeSsr0Bh7IddKuC+HVkNtYVo5hxUFNoZf1aMQHyIPyujwRWw1MpCv
	 Z3hMNL8nAxqpYMtsTRKdey23Kcv5hVNNVYxbpABqSk6VnX+mx62ONCM2xh/5FGnZ51
	 Ml5rWnaibqE2bo+93Rsyepf4s4f/hpmbk2NKyoRm72o/b+hGkJSLhSiLKnc8pRoQed
	 wwnNrrSdY0k/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB47608E4;
	Thu, 26 Nov 2026 11:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D34A43
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC8081116
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fR-bM-9XpbE for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 11:40:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EAC528108C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAC528108C
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:40:11 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795693209; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:T4liRNoCGMaPHbcX/C/6DWgucAA5
 Dz9USpiILXD+H804LFE653axfltUza/99w9KVdgM+99ALe/xZicTIGJFVc3tUkq8zPfl55AqKHa
 qclcN1BmnauYa2oDyMokdb5MPFeQTCXk78GWlKIjqO+NSfUp/uaJI1Snw6NB1qKM6LIcRtv4uva
 qmGH2Vin8Q+MxAJPxj9/ky/AmG85Km7+gvQWvCzUAGA91DWgjGBiLrWHOYzdtTbnXo/RqBYi7Jg
 Zph9kf3rfq8qcy0DvZsU+GW1NUDs7w2BDPH6RulN6FX7f9fQe6rwYbNZaKC9grZI8OXMOeaaEJe
 No3vdBn3rGPIpw==;
Message-Instance: m=1; h=sha256: WkwX0jPhusC4DBhNAnOFHZFNVENA+1CAEuwZ/7x2O6I=:
 h3AqljWmnN1wnISo8/+Tks3SWFxlF6XqzOdcKT1+w1Q=, sha512:
 7fCAlnWCwojmKEp1UpeFYG+7VRbiXzI4UiwKoUFeb2FFZ21gVf5EapN9Db1AfIlRzdzmlWiVUEnUW/J3XQK2mQ==:
 3D2OUmdZgwOHeQadboS0sa7EWe8AeI0YpSrLvGz7hznNvapwoo/5aYDM4Tr1JGS8aoJpYHw9sPK7gV+WvoPIfw==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLi8g-1xoDF32gi0-00Wxm6; Thu, 26
 Nov 2026 12:40:09 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 12:39:25 +0100
Message-ID: <20261126113925.152685-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:X/Ow65kdPivzO5id8DOttZSZctKTy7xFuf3sj02xM4qLPkApfC3
 zQJx0sCgYJJ0kGG6KD+hOL75G/R4Ezf9ivXb6P/kNTTTE+aGtuKt2SKWBro3jAbYtB/wj3a
 uAJajWGXTBNYmaQiR+ZIfOfmN0OKfc8FyJd+jqlEMddcx0Czims8uZCoZ4cSlVogzjxW6VH
 Hi6koe34SS7qzUmUmNXjA==
UI-OutboundReport: notjunk:1;M01:P0:NxwrJbuEirw=;NAopp1gR5VgSLBZgMwGMHwB2OQD
 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
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: install host
 fdt_add_pubkey with FIT signature support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

fdt_add_pubkey is a tool to add public keys to the U-Boot control DTB
as valid signers for FIT sigantures, unlike mkimage with -K/--key-dest
it does not require access to the matching private keys. It was
already built if BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y,
but not installed. Rename HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN to
HOST_UBOOT_TOOLS_INSTALL_FIT_SIGN_TOOLS to make the slightly expanded
meaning clear.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/uboot-tools/uboot-tools.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 72b387c41c..e161ee2131 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -152,8 +152,9 @@ endif
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
 HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_LIBCRYPTO=y CONFIG_FIT_SIGNATURE=y
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
-define HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
+define HOST_UBOOT_TOOLS_INSTALL_FIT_SIGN_TOOLS
 	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(HOST_DIR)/bin/fit_check_sign
+	$(INSTALL) -m 0755 -D $(@D)/tools/fdt_add_pubkey $(HOST_DIR)/bin/fdt_add_pubkey
 endef
 endif
 
@@ -240,7 +241,7 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkeficapsule $(HOST_DIR)/bin/mkeficapsule
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
-	$(HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
+	$(HOST_UBOOT_TOOLS_INSTALL_FIT_SIGN_TOOLS)
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(HOST_DIR)/bin/fw_printenv
 	ln -sf fw_printenv $(HOST_DIR)/bin/fw_setenv
 	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
