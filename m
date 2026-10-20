Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2E606A31D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aimzhPLI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CE380DDE;
	Tue, 20 Oct 2026 14:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OmDaV1dC6oo; Tue, 20 Oct 2026 14:09:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23E7980D8F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792505380;
	b=ddcIJEiAsWiTEK6eMCa5D+Nt2uaGv01H6XGfo5woHT5PWPu1sNZ4MqnmPl5Mkd4jfnVB
	 5LIykQX2sWqXmH3XF+mL9Ump9g+oTKAcnfmc26z6runbq5O6UU2k+v0WdTSJaAC941cN2
	 uOvwYSUOL8JgO+O2sE6/nhM9s0LfsD7XwS+bWs5y1wxBc8HohBBhuyvd38RN0tz1NIg2A
	 +kxyDycEQB6nYJ6qCTOCX1N3yKC7rqCO07PrbfdunjmGe2hodSdKtPO3BRsaxmZOlhnOH
	 gQWMgwWGzQQ5oMXT4wPH4+BfcHkjudAp2B8r4Wg/Cy6BBNnDfygHyOjp2deAQLmmi2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792505380;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GM6pI0V/byIXbygr/zjAhle4vIoNvwVrHaVfv4kj1Rk=;
	b=QmZJYf+pba2ArsWJAeVSoViyFaiec7OIvko3GAxGHxHqH8/qnPD3uOEdo4jZ74KxrgJd
	 5u+l73v72tb1lYjwvutu1u4aIt5vh/J9Ds0Ii7UYgVubDpgXoh48SsJa0OXsKpfBkpJm1
	 6F5yu9d/4B/co6qG8O9JVFF4IlytwHgrkA8KqsK5GoSD8qSeJPBS9mYnVM3HuN9ObnCbx
	 0mxExcUMKqx1+/fcyj6LbKNFmuj6gv2wr54UHaPkSGtxixwCRw/2xnhU3ZvqNntthUXFC
	 1DooBweNUS8bXhrDu7MIJ4DQ1GxkyGOBVQ1Zd2RFhOHiwxvxqlmTjvVpqIV4SLxGmYA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792505380;
	bh=GM6pI0V/byIXbygr/zjAhle4vIoNvwVrHaVfv4kj1Rk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aimzhPLIr1nP+SpnPhT/lbGA15+9wA6Sf+ggWqMTHgM9Ax+cT20VkSrkR25l2kD2u
	 evWyi/NYaAKi2p/CPnrlBjtpbUR1JI1BxANBjKKSoZHBALmJcNAymdSfXkrpAtl7mZ
	 oeRIoxIcOnnfS2l4oTlKCq+A+0nX5bBppuXH9AFPo2JitpYJLfdeqj0Sdock+9BQoC
	 GwcMFpkuQsTjTCJonZqfGjWg2JRSl60hKEEtThVgiWiRWZ8VWDB+ba//TUOAfYx7fT
	 TCRvHzHe+BaQWAc/iEQujrQs/fgHPNulvc3ovfTFGa6EoZ/byUymKOkcX0YaZf5Bap
	 WWyTreyQP84og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E7980D8F;
	Tue, 20 Oct 2026 14:09:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 896AA769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F24F80D8F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTCsLlZyd2hH for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 14:09:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 28B4480D84
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792505377;
 b=S+UuExXeUKMbCgXfCVP+IzOhOInhDigFT963VPiUYpDGoh0uVbpo4dEj8h0LU5tFEFsk
 8L1WdOKi8jKMmA6+b/f+yT3Si1di6P3oMElerMs6aGe/LrVPzzdvCiJPT+I5uXF1kg3lu
 7O4slSBWCkd4Z7Pyui0b5sRoL9CWLgeV7WC3ZPQ9az4BM8gcw9TqoqCOxbGapvI9juyop
 2gFiqEoZ+yHlqfLV/jASEAsg4IxrBIHko+6JdjurhVyEdWgQXc9yfSVgmL1/gW4lIiRRP
 37s2KigfguOEEYDG6K+opTrHOUpYSd4rYlt3g4DUmNtA1ms5kLa/tfcQq6a3FCnM6wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792505377;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=6x8ZqTa2QqQciUXI/Qa7lQEHYyU1d9z0w+3CPwBBj6o=;
 b=keclLr7tHBcT1+QvmkaNaYikiMU/LvNFMpbcVzq/E9oNsecHBg2MSPbI/KPS9o3i7NKG
 WilrMYM9kq/HCdFjnsn4ih3/C/hna1xf4pa+y1kArG/96aR7CVdMnzRngpQg0xtv7+uq9
 cC9mGGp7E+By40cBFK49C51204PO6NPwRqhp4d57KO3ahfTAN/+qp9zWAjQmIXWxrudbz
 KLcSJR5DQmaJ87s/dGUsatu2CU3Fo5ULvyn0I0sysk3l4LaBabd2g5bxxQBrWgngbIiPm
 4KhcFJ063g6lKWR6TP36nG5ezqdt5lMnVuKgJCWIF/BfEufla0ZdmNI1BnsiexqZE3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0pvH6gA9; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28B4480D84
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:09:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8DE71C62200
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:10:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 024C460393
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:09:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44D8910328DD0; 
 Tue, 20 Oct 2026 16:09:32 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 16:09:28 +0200
Message-ID: <20261020140929.1632016-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020140929.1632016-1-thomas.petazzoni@bootlin.com>
References: <20261020140929.1632016-1-thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 2/2] package/network-manager: rework jansson
 handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jansson is needed for BR2_PACKAGE_NETWORK_MANAGER_OVS (which selects
BR2_PACKAGE_JANSSON), but practicaly speaking, network-manager's
meson.build detects jansson regardless of ovs=true. So we make this
jansson optional dependency explicit.

This commit doesn't fix anything, it only makes the dependency more
explicit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v1->v2:
- Change the correct variable: DEPENDENCIES, and not CONF_OPTS
---
 package/network-manager/network-manager.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 5071546c27..2a562db726 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -107,9 +107,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+# No option available to explicitly enable/disable
+NETWORK_MANAGER_DEPENDENCIES += jansson
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
 NETWORK_MANAGER_CONF_OPTS += -Dovs=true
-NETWORK_MANAGER_DEPENDENCIES += jansson
 else
 NETWORK_MANAGER_CONF_OPTS += -Dovs=false
 endif
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
