Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9D4606A31E
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k8SsLDdn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35026409E7;
	Sat, 24 Oct 2026 15:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaXq-MhbQtj1; Sat, 24 Oct 2026 15:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 393EE407C4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854656;
	b=OrUQR73Ds8YLf6N9UPlyXzvs5dWO1b0WpPKv40MUByG7nd1JnEH3BxAQkpHUKodKiS0K
	 xuJbuCPU8VijNGlfNTrEugVw/bxPoxysc9loL7GOiggiV/euQ++pldCjqFMAMNf1wMyia
	 uIbbC35OUcr+giBSDNkKD9ubZIvDZLtwKQTCBuv6q4aJhIImdM06nMXknDt3k6bZ31dLA
	 Kqhx7MQP6K7WjonANMSQtY9XkvGkRx+24hBKeAyrW/ThtdZb4H7xqb2hA7KrdupVUUCx7
	 ++HXsmE3QQaZ7fgqVAMOSjCErHKqUQt7F4CR6TxvCPEC4WPgwA6oJMfPWx7Nzd5GbYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854656;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+lumCLvfOooUZVb2DZAFXZhgkN4s2l3nfe+zNGnH8S8=;
	b=KE/KNqstRkd88ymvIheWVN6e2qH9BNynp/20+w31wiw0RKqnI1opculpEmXN5XMT6rj6
	 aV+Q6xeT0DOyBWu3en49gU0ftDFbsLJsjnmwN1+cZXGNkNKilCfHsaqufDrfhFol1SkQ5
	 hzHqodMghggVvlgLsMz7umlltKJx2GIa/Soy+T7R645Y7UhiIk3Igxts5N+LxDtjJe/XA
	 wVC7nv81Bdg5B8TtH8JoTq+eJfert/PeZMiBLLoQX9n12tMvA+80PYhzfWPfF7QlZZdwy
	 LzuBUtcQtaMCKpK/cnVCN/hOxst6g/cYCDr8O4o7++mtXIWkDhIm3zHOmFUt1mjOT2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854656;
	bh=+lumCLvfOooUZVb2DZAFXZhgkN4s2l3nfe+zNGnH8S8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=k8SsLDdnq3+S7Zv/gemV0pujoGAQWU+rZTZZ9ezkgqUwlTn89Vg1o5mH80jiud7qo
	 OO5Un8AgqaoAcS889H+qfbmhgYyNDS3M7a1nK4/M8ziC0vKsz7V9p1mcdjrSxrmzPi
	 QK169eZ5HAX1UWeftKb/SNMRfs5y80kmOf5839y1pVMjnfjUWGFMRvOUqe6JwmqkxE
	 RIri4J7uQU8f/1l+8ZZbUikJU9DASHmYQgEBJcRO+oyCc++ifvE28RvTpVP0WnobTr
	 IkUdaS5i78piVykVbbZ1sPnESJRPh7zFgOZtz7OUEhiGB4a9pz2VNzJE9tZK5hx2/1
	 +UPpsHIa88g/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393EE407C4;
	Sat, 24 Oct 2026 15:10:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7C943AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99964407FC
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Boe39IXZV1a4 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:10:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 13469407C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854653;
 b=R6IY0o3+e7hFL7IvY88Q96IqwTslJoTV32qjo+lnpxi1NwwJ3bzpYmqvobhDaSzOY7RT
 /robWu4GZufLvKDE5QKeffffXlmSDUJXYnMpfLjp5qCH7rdrzvKX/v1BofuRp4K6kSKJR
 4dQ5UxV9Q6rwrz3s7OkfGLIlso4PYvpRa7mNiRVQsnbNYgzhGleV4pOGPRA4E4T3Qba1e
 ++k1hZajN11T5TjNn4dqGL3qr30M6cdi5/9P3gyNYs3td8KT9gwnu4GIv3Z+MVdeC8GjR
 ISFgAj0OMKF0gCwInfRTNyaA/HfQzmdSe4A/VJG/OSbC6bj5jmNNXTrRsKSiO9aO9Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854653;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=n+VawOAi4WT4S5bt/c3lx50O6KvWiiEucpYkn3RqFmA=;
 b=LzazULjL+NYvVvg1PlcbOSaOPhgjPmt8J+hng5EQczLWY1+w/Mn0T92+rR66UpWPZe0O
 RC047JkM5TL+UHxzO3vjLKjaM+J8cIynLUh7Zri/ydymwS/Ia0abykLNhG0OaIAJWh5OO
 6+MioyVz+NM782APW+xEShZLH6rzCLJ8nO/JyAezf5jgSTV64Jk9+sbJZHn1svox9IrXm
 36ciaVvDqs9LFmhQyc4/THWbac7llKqg5uG9OxnBwwl+anVovvAhj4AjBNu8a7ftZ82NN
 7OFW+Gm0BIVXcTbMBzXfGG4Sb+8IGejlvWdK5jtCekKMJMq0fP0iY4LiFqjzn92vc4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PEpF39OR; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13469407C4
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:10:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lYB-1xLSTR2Hid-002oIQ; Sat, 24
 Oct 2026 17:10:50 +0200
To: buildroot@buildroot.org
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 24 Oct 2026 17:10:42 +0200
Message-ID: <20261024151043.1971569-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XPfKEqy20339T8EwrKIVTMiQaz6j7cb2TsKXAO/d2/dO70/RwWs
 eK/cyuVN9ASdNTxadTMl9KTz4RnSutQdE+2po0WnKIJWldx+rLz9vdYQYpasGSCsj4PDvUC
 rGEG/1qojDEMp/9+bSP3vpUuSriyGjTrWgAAmmB4W5lp6cHZr3lM2y6M2IZIZPQ+rwgxfqU
 ik2T/Xw9Le/ccDr9v9ifg==
UI-OutboundReport: notjunk:1;M01:P0:4WjU7aGxpAo=;cYANyt37eEe11ssEHRYR0wfhKo5
 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
 NiQoxLC/SoQs=
Subject: [Buildroot] [PATCH 1/2] boot/uboot: make binman dependency on
 host-python-pkg-resources optional
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

Binman needs pkg_resources only in U-Boot versions before 2025.10,
otherwise the dependency is unnecessary and best avoided.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Tested with engicam_px30_core_defconfig, which uses U-Boot
2025.04. With BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES=y the build
works, without it binman fails because it cannot import pkg_resources.

engicam_px30_core_defconfig appears to be the only defconfig that uses
binman *and* a U-Boot version < 2025.10 according to output of:

grep UBOOT_CUSTOM $(grep -R -l BR2_TARGET_UBOOT_USE_BINMAN configs/)

Nonetheless, if any defconfigs you care about use binman, please
verify and if needed (preferably) update U-Boot or enable
BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES=y.

 boot/uboot/Config.in | 14 ++++++++++++++
 boot/uboot/uboot.mk  |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 381a12197d..3e46293796 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -379,6 +379,20 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 
 	  https://docs.u-boot.org/en/v2026.10/develop/package/binman.html
 
+if BR2_TARGET_UBOOT_USE_BINMAN
+
+config BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES
+	bool "Binman needs pkg-resources (U-Boot version < 2025.10)"
+	depends on BR2_TARGET_UBOOT_USE_BINMAN
+	help
+	  In U-Boot versions before 2025.10 binman uses the Python
+	  module pkg_resources, which used to be provided by
+	  python-setuptools before version 82.0.0. Select this option
+	  to use backported pkg_resources when building old U-Boot
+	  versions.
+
+endif
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a7e831f6c3..ed66feafd1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -312,10 +312,12 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
-	host-python-pkg-resources \
 	host-python-pyyaml \
 	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+ifeq ($(BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES),y)
+UBOOT_DEPENDENCIES += host-python-pkg-resources
+endif
 endif
 
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
