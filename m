Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB7606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iPaDti2F
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9CA18115D;
	Thu, 26 Nov 2026 19:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55CLooFg08UP; Thu, 26 Nov 2026 19:25:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DB8748119C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721106;
	b=MdSc99UZgNtE5zPv+5qhzkEzHWd/d25SSh9hX+VXNu//oRvxqsmxXi03EFHG1jo1TNMG
	 lVY/zZgbtykpR6dUbRCKCGTa1IRzl0nl/zTM09aF4y5m+5dMYZjH0rQVFF+bqPpa5eM+L
	 LNLYQ1iGVeGL/rR0jbAvU8nb/49oduk7Gf20UptzmSU4yrgW02mhMnQfCfXm1zSD4d7EX
	 0/CpUQOvOyJ5KZWWKXI84PoFYkaFt8pIQGsrRUkQBDqruEgDENec7SUUPO5jmBr2Hgu66
	 CPZwwdWeh+k4MeV/lOti/yjqbKLH4vQ4EojRFkK0FegKO3xE4Hi8g7rdgUfQe/ax7XQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721106;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Pat/u/dEPCNPSp3UigbkpRp91xAu7c0IYu9zIe2FSbQ=;
	b=KtGEvTqyjK2MdEY+AowzWzdqoxvCAVHdO9hqHH51b9eCvQXAfccwhYkNN4vvgZro+YPZ
	 sCUF6VwGMX060ssTrRDMXNKqmlRoIHwCgjUvK9OpnkNHgoFV4G+Uc45MEBbA7IvQUWlk5
	 f4+YHdnBXdx77NAfGF5lPWEsows8CR73xs6fdM3Dop2lNV15wbuahLahPEpDNhdnHfMVc
	 Ii5zKbxGODbUo7nSpr7KsDHPeeynLox3UXh7iA+9vO2Zhv1JbJRFdR2uMF3XBmjvPdO8I
	 i4iOOspOIiBG9r5568K1ZD7aNOM5kvIwxuEueChernmekqAgxl/V4W4REhfnmEJ6nIA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721106;
	bh=Pat/u/dEPCNPSp3UigbkpRp91xAu7c0IYu9zIe2FSbQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iPaDti2F6eUPROjGuJb08osMb9uWZLrMdTDN1MfyrbOKFGazcw+ZrehJ1BDs4CkBc
	 TIBLD17E6zjJ5vsZ3N67Z9/usgRuMvEXSaXSa5gBN+gWIVQcCuHGMHvP5tep5savNZ
	 FG8OQytoGcJx0IeGhDm7uJUjnsBPFtlZgYX81ZdBAg+OsW27j0GitxjJcj662/Hl0o
	 Z/ri43XSa4sPDrx134WpLRBe52DuctFslvEszzarCrHqXgmug4i0xUcsZZPKL5aK1f
	 vu6BHBRC8jnFUecIlAUgfZSefHgBSBkGQVh87djXwgwKx5PS3XjDHfirsH1cpMbR7f
	 RLSbolp0mw9YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8748119C;
	Thu, 26 Nov 2026 19:25:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8C5E260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5CF640902
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeTgljoR4CBt for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:25:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E1989408EA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1989408EA
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:01 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721099; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:EMIii61pOxmYpxtt4gKnxip3pfhL
 MWEsdpp2+0CnFmTh5aDeLD5b+mqObuaCyiMlQlMTPN4QiHPgP4T7vEu/MfnzZQ9asQVQUmqxGSV
 /1VE5Hb5Y/KgcIj2WvS59ptFWAWIqbK4qTIJYhFYNMZCVnKC5v32gHBT4bRV/l07UQNGv97Qcyr
 BGDNMYGY9cD8qVupwIOGy244uHLAxe88D7i3THjS/Y8pYO9QlTNap7TD8eakNxLwSqqqlUkBlcK
 QdqEZzDPH2B4BMWkqrF+tHv5z789qgCj3Ppe8eWHejPA3brMlgBUeRDXOyssieTBECNP25GFFWU
 zGv49oTkEI39wA==;
Message-Instance: m=1; h=sha256: f1NrXKK8heJsAwUame7e9X4CBEK0fCsqXgT/8NBG0os=:
 LktuV2P2QQuGsbs9np90VSZ+raNtT9Obzo5+sZBJHI0=, sha512:
 qOfgniaKJ6q+uClKatYPZKVJyT/M/iPVzm5tjLnC1hBx1AWcN8Ik/KMH2BtL+7X2ZaLCpSX1TVP3R6f9g44Jvg==:
 FRobXS30U1Tom5WCOH2yJbV+JZfblGT+lU3Pt0sS1dMWgqb/nb76BpxxCgg/yCTITLNRdetqojJ9NAElYOegdQ==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQvCv-1xufE41Ijn-00QcCN; Thu, 26
 Nov 2026 20:24:59 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:33 +0100
Message-ID: <20261126192435.1826415-9-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3FZLW3bwiuJe9BgHrlUfUrgrHSALXfCVoFXYMV+ouRXlGmvBtEd
 fBIFq0OKFuO9gx689L4lbv++kn58HKkslMAkRjhleMHewMkWf/yL4lwOJYJ/0f3KQhUeGJZ
 367MXJ3B1IfDLfcLScD+2UGlvlv/3s9Uh2T3ruJKYH/wXWoW2/rPOVf0D9alPqZpoEjQ9j+
 U9WtL3UAf1AQzo1HcJ7cw==
UI-OutboundReport: notjunk:1;M01:P0:Chdnl1VFxqw=;Aw4JfV2KW/2iqHFqiDHcPxiEP1w
 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
 gih9AWZKLF7Iw0EgKjZjR5XwnmLoiIZ4ou
Subject: [Buildroot] [PATCH 08/10] package/dracut: install and use systemd
 modules
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

If systemdsystemunitdir is empty during install, systemd modules are
excluded, even though only symlinks to Dracut module files are
installed there.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/dracut/dracut.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 7f69b62c53..8918eebfae 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -28,7 +28,13 @@ HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
 # Dracut is not a real autotools package, and the hand-written
 # ./configure script does not preserve LDFLAGS for make.
 HOST_DRACUT_MAKE_ENV = $(HOST_CONFIGURE_OPTS)
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+# set systemdsystemunitdir so Dracut installs systemd modules
+HOST_DRACUT_INSTALL_OPTS = systemdsystemunitdir="$(HOST_DIR)/lib/systemd/system" install
+else
 HOST_DRACUT_INSTALL_OPTS = systemdsystemunitdir="" install
+endif
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
 HOST_DRACUT_CONF_OPTS += --enable-dracut-cpio
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
