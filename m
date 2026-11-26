Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F47606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FKnj+Kaa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6490D81164;
	Thu, 26 Nov 2026 19:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0T4HFw4t3_-e; Thu, 26 Nov 2026 19:25:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 91E778111A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721101;
	b=XDz7TJXrxLHOTNwJwSip79fPGuVqmLCS9vc5c9H8rfkyjOB7bLoK1OP5p0JqiGZKldt8
	 lYp+a9aQVC36L1eyXdlCagKm44ZP7Hj/kTD7gSu2hxsRIyfAsduiUM3gHAgpwvLNYhvsv
	 Z1m8i/3pN4Xpbd2uk63ra5UkP0NTVV4N9uYewrzg8WrkMfwUZCn+LO0QhxxEc0k+gH6l3
	 7gZmivKZpX89X5JtRwk5ihjyFFmRRksDCsI8z0Dy2mkLkUDbN4ObNAI8VAJ+biCDjd1i2
	 qMrbO4akTfo6RlhrSosXSlLN8dhBZzyG/rIxIWogtcnaSPBKRrIFJWj4fz1/H9EmsTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=OMt+xJku9ba/yV08gOOUX4dDqUDEcNBlTdtPFy0U7Uk=;
	b=ssP+meXsTBb8kbQkLnQhEeINnf2kbgIquK4ZbISms+liCoM44Lc8U6OEZip/8jtsoKrS
	 cL5zrznPyzR0IsJULqmMuz2kopQ7dfDTLWemK6GbEA1/zfI+Yzxt+6BEZU+jN7uzgtAbb
	 qA+L/ul3Tv2dwsOPS3I6hPEp9yREZBXCcP5e4mhtNwfSCix+l8pcM7w34kyis8s37iePF
	 5wVei9+i8vYeOq5Z9ntgGLWlrtukK/WwvZkVoGnSSRj4n/YEzUamN7NSWT8GjyQRL5EcE
	 CCPxpumL8TmNDJaeSk4sFbtBZtstTqDue2vSrOqFExcY3wJJq0xfant62F0s1OcMUiA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721101;
	bh=OMt+xJku9ba/yV08gOOUX4dDqUDEcNBlTdtPFy0U7Uk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FKnj+KaaIILGZUWuL12TN6O4gnIcWbk9Ib3RsAWEQ3qGQoxcZf/dxL4pDe6B250vV
	 6rsNglQmQnr8icjdr9kObQ9wZAGwirJe3nyvU5hFB0FZMb2+Vipndw8bz2bsbCgkAq
	 4nXbOZfpmNCoobAt4gqHVuWWKVG2/WRt+DUGZ0ma1Qv2c6wmXcn2MLGbcP9xyQ03WI
	 GypAzGXY7yTv6kSsAyMiRkgltoRrDIk+HajUCbJLz1TDA+1DpiRcxB1pQ1cMJcQoSr
	 Fa76MjnccivZ5Uzw88L2kllsjE7yPCK0Jr0WB83k97KMR1cr+HvIz12WsXjVtby9ah
	 ZAV1toDfgXpkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91E778111A;
	Thu, 26 Nov 2026 19:25:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78EA1260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EA6240902
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RE6TJJkRJKdO for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:24:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 13570408EA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13570408EA
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:24:58 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721096; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:LGhC8QKZfdHwuMok0cyAWFA7mMBj
 etFin8HoyzOgaZgqffDf0WV7HIRzqSZo8kuOSQjVcXiP9/+ULK6KRS2pVaTP3POexBUkZgjL1z9
 K51+QuK9aiQ8yuMIlzwGWyREgh1Ae9/h0b+tNF6YJ2rsPqpRie3ZeoXo9mm9V31LfiXQa2QmLvt
 NOLiVu+WgYGPqYPGk0MnM/BhzlfXl+vy2TNdJmMBB4aG/yZZByeeONNsuPVvoWc17SJD/1H0YL2
 jCCq/cyKYLqQG4onCH+GurDy1RnfWhPsZSaeBPI591DKabybsTl8eUBFEf71AJv1gGZRWO8d5xp
 JdJhj1iLblWceA==;
Message-Instance: m=1; h=sha256: /JDOGSCPeE1QEPNWzkXyDHtNua42jXhS2mv1vYEcSZ8=:
 k6qWLg0RXt/Uqp9eSUVpQmZ7pGuCDAU8ZPApkoFFweM=, sha512:
 f34XlzERWMQaEXy4dyqwQXnHpEzdoPRHGF/zfYWqbd/CNfR9eQcD90iljc6ouTG68HZ8FB0w7PlMZUjMm91UIQ==:
 lJnzBGCyV66P4ZGvhSBjRlSI94SIu+i2dXn88q1HfJnWEI8kHsZTPurgNssBwVa4IK2CfVSFj8bCh8rK/PaClw==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1ybShf2lYB-00s0w7; Thu, 26
 Nov 2026 20:24:56 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:27 +0100
Message-ID: <20261126192435.1826415-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:M+yoPJCzv3aiRnciTjFXYKMA67L+P0fVUaevUMXRZQGjpRFr6NQ
 J7N8FJz6xIqYhiuKWXORdceD+IAU5IgQmTirxaGP6+aM/wDuDMAqtXT+nWmTmsCgSDqAK8C
 z+/S40oTd6hzKyI4C7YP+Xc5jlCTEinucqsTx0h+8SX9OAziIVIH/GfJiZwyvCvJkmd2jc/
 gNvbvNSM6lBCsC23Gf6qw==
UI-OutboundReport: notjunk:1;M01:P0:kRsXOsLxYm8=;tTqQlZmqZwdjwHwhDySLUFliPGq
 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
 sUwgVO1k0K1xtb9MYW/pVqf3mb+RXrbAK
Subject: [Buildroot] [PATCH 02/10] fs/cpio: set DRACUT_INSTALL_PATH to
 target PATH if using Dracut
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

DRACUT_INSTALL_PATH is documented as an environment variable to use
with --sysroot [1], to override PATH when searching executables within
the sysroot.

[1] https://dracut-ng.github.io/dracut/man/dracut.8.html#_environment

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 fs/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 9c33c62fc2..7647dda676 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -84,6 +84,7 @@ define ROOTFS_CPIO_CMD
 		cp -a $(m)/* $(HOST_DIR)/lib/dracut/modules.d/
 	)
 	export DRACUT_ARCH="$(ARCH)"
+	export DRACUT_INSTALL_PATH=$(BR2_SYSTEM_DEFAULT_PATH)
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
 		-c $(ROOTFS_CPIO_DIR)/empty-config \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
