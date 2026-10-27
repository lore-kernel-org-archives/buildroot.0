Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616C1606A327
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FcwBIDWO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=bElKcKbT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC8380F40;
	Tue, 27 Oct 2026 15:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yg1VYnpJKFhq; Tue, 27 Oct 2026 15:53:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0640F80F34
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793116429;
	b=TIESzksvJfc8nPcU092jqEi+DJqp3ayZeIGAHAnTRiMg4kUiEepFf4J85/ld5HjpmLEP
	 6KXMKIqOpVHctTNWdN8k0T4lk6Twu2Qe/U4EWjlj3xUcxIUV2K2/WA9zT9jvri5bORdx1
	 /zPBP3uhgeZGLyU+76Yza5EBlRngCB1RgGmLM+WuxkEDjgE3ph/Kbhlx4D1GYV3YCMLI+
	 js1Vm6UgFzuz5mQ+T4WUALse5OzSwFIsz5D9Yc+U1JPo4okhaC+AwBKyC0gK/LyC1FPIO
	 PUYPFXp7ECHBoCK3b4gu+SSNBasX/nBNo6F3zDxmbN8fSgLdfoSrX048hwTkrHZDvkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793116429;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qN37K60VJIAXEVWeOvkQ/4ZA9iKrSXlHIuUtMN7VGhg=;
	b=l6etwV7wZ9yQjynXlmRImANGQyIUojT0yhIeMg0niFtn92ChF/HIr26nKx8ZYhA/9vhJ
	 EcLXH6WpDlCTGtrsiKMQTrxtlxYnpUYnUJLaVzn+Ic7sA7WDQDqg7H/Cm3legMXI1njkq
	 XMyp24UIoKDVR9oTnK3jZ9+24oV2RYAhBAFxjYbnrtOsgZn7ChTWcr6PkusUbsxRXYDSu
	 EQd2tdaThFnU+EsHMzcQTbk4TSEmafLx/vJQFLhJffTxj3ILexBAlbTiXtmnM/uogXhI/
	 5gNXUJRSPTbr8O59HRfy2sxCwHS/gLi6S/pGQ3D2UKJWxXdnEj2jsDQgsB5HU0b356A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793116429;
	bh=qN37K60VJIAXEVWeOvkQ/4ZA9iKrSXlHIuUtMN7VGhg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FcwBIDWOy4ZSNso5e9rwTvC1K8RmgP4QQ+WUSjNwLMXr4BP4cbYn77Flw6K4ke8x6
	 BGqYDzMleH/gXGVbJAbAlR3gGV4u7+U3OYR/P62U07bRwLr1vEem7zc5LpvJ3x+300
	 qFBDkqTGhynwJhNgzpE/8kolfW0wsgGr+mTKKZrlQVqwAV94Sf1EJDHlUk2caRBdR1
	 FZAMZ+IYz6OladAKemtURgranMXkb6kL8qV0slt6/8z+Y/lSi3w8YxDle3REudXF7Q
	 6Sk0wf6l+5YvtR2x4ooShjk8Prb5EfNc2eFJGV9rRJQxIK+BUjauV0pq7caP6pYzIP
	 1a65f4At5mg6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0640F80F34;
	Tue, 27 Oct 2026 15:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A1C772
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BC75402D4
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCn_g7MKtE8l for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 15:53:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 15DA7402BD
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.155.132
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793116425;
 b=lyRge7wHd8n94kiC4KCeOyPbKyC41Q+SeUSUWHIJIcSBs+qIMr8RXfC5KpNjhCtaRopW
 6YRx3Nx5iCi88Hx12558kgt/rA2FNucoTqLfOofbF9XyqN98C8zOJB704TeIa0xJH46h8
 a1DMQdT0N6oTz6EAWLMSumZeN3Wotos/m7+TLo0YWVqRihpTFzYtR/HcGgBPFhv5nDeGY
 UkGvA3ay8TljhZIjik+seAlSsLFok9O/DGRiUv9YH5Jyr4SMGnuMw/gsL75vuwNvC/RUt
 ZlhUz8BgX8mmNJrtULJUtiWKJsDBTVR6b7b6+0dlfzKk4pXE5bGj1EbOwBPs91hT6jQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793116425;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=2rgVyouG/RPWdL+UAj0r6WHYxgaNSvSxUXD/lFzmq4g=;
 b=VA/SoHjjMjxFkdmgwbFP+DpuzBEBv+HusLEvywpf9NkfiDc1lIWrYgVR96gI+XkBb08q
 VX9tXuWxoERTi+PVS7aYZZhiZFhD9CZYCfvrP3jWfYjn444i+EeAgxOJcCXNZ+UP1RzhX
 bDqbVBbZlw++LQRnrvqvAxFgSlLv+s4j8Ren9RIB3vOQ9mGFFsq2KNhn5nczjVU86SEJ2
 azXn4uW59Eha/5xWhbKmjKa7oCiMGcwk+jL/3UwBZnXqCOU44v1Ng3tJ680ckdoHiCDQf
 2fKflglc7fW+jHqytE82AvPZbPggTKbutvbpLgtCN+yQHHP/t3mqC5D4fS1x9otseVQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=bElKcKbT; 
 arc=none smtp.remote-ip=62.149.155.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bElKcKbT
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15DA7402BD
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:53:42 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LjUZxBpckgnmRLjUaxqUxV; Tue, 27 Oct 2026 16:53:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793116420; bh=qbASLAOleKWfLTq2GBYuXEjcQqC8BSMuZ6NAZKnCjWM=;
 h=From:To:Subject:Date:MIME-Version;
 b=bElKcKbTM4UQ/jZ19JPAKekUB7KliudEHfnej7mbXILanTBB/ioSKr/k5z+VCjNbC
 iZyaaTr3DMCWZfvE3iwi5tjc4g+emTuvJaJIvyusRwB3KwlJR4Rz9OVxDoB/SduHFN
 8hDaCp13atmU9MI3i6lrfqLVkuA7b9dVnMImO0gxfezkvuYPAp4T4vnUvJ1rRQo1Vp
 rZnUxQ1HtgKz39+DgWJ4EiDxr2p5mV3WYwcf2fEBcD0vsqzsXB6PrQag/Jpwvf0vGq
 6jHma2vGsHkn443VaQWzwQKUm4XPqonVHWxk54Fh0Mkk0MKqGiWCHgrJwLAcrscK2/
 tupP5SX0WQE/Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 27 Oct 2026 16:53:39 +0100
Message-ID: <20261027155339.1566596-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfObBDxiS4GSAkittAB1q10RZFF2adMIUPTzTLk/NTRGMAQW4+3fN8y92dTlh/bAenciPJ4Qn6tDf7msUKB+TfXxzg+D12WKgTczZeahUXZP575xKSuGs
 wFsnjFLgTvl6+x0dVTyRdsaUmv+8j/ajsBHh9SGI4S5VK7N6mxD7PNUhY9tAQ7SYJPx84MKcxyFzhwK0v5UW/msohzBPIAaO4GJ1RJeXovfStDUdSzqKPiV2
 1Ljj0p8kd0EnMpKKyksFYf3eI2Qq1s2WVzLnVSqikgd26mB7ZEfYWlPowR3pbBZBiIB6YZaGF580Ue9IZbRHwg==
Subject: [Buildroot] [PATCH] package/rtl8188eu: bump to version 2026-10-27
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This version allows to build up to Linux version 7.2.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 2e21e45224..0fb5fd45bd 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ec126dc722b4e0837c866ec3f73eea9f0835d518fef38b880e2c37fd2fac55a  rtl8188eu-cca7c28087db740d7d745e81e4096c9eb9084f9a.tar.gz
+sha256  8c941d91f1ae70edf053e0550317ee36f7944328844710922e1a482d5f63a407  rtl8188eu-db2131b227dd439587f37ea38927178286b980b5.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5f378e0b6e..91bdbcab92 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
+RTL8188EU_VERSION = db2131b227dd439587f37ea38927178286b980b5
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
