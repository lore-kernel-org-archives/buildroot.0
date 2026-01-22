Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106AFD3EE84
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 16:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96FCD405AC;
	Thu, 22 Jan 2026 16:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVQJ7ebUbhWt; Thu, 22 Jan 2026 16:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 857CA405A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769098649;
	bh=3LNxbtvbk74DC8DUNE5hl7FAZH8fy3ry2PMbmdcAcGw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QSZRSecjw7tUNAdjNBv/xuoZPGEkwUc4A5ykP9EfSKW7zNKOn0Bpi15EKdmjISZjG
	 5blYLMxdSbJX8F24+QA5uOXG61Sowd/sjuUYqs920d+eVhp9NkFk6/V9VIOf5PtdpL
	 SotbjrMO0YBc5DFw1CVMSm366iO9MQPXowNB6RnQCjvulrYVy6yt6Dvp3iCjok3OR+
	 jQ37OWzMsfOPMEF5vEB5DmKITHK9buKD0uj2m8pvGpAhoFtz1CRWzxZyWcL5aqku9C
	 tWkiwFBhdSuU3KdL5ETFgIofn1X6//k1iURCvra+ryxewO0sayVESQ93z7imsI1DFn
	 7m2PpmcYAe4XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 857CA405A4;
	Thu, 22 Jan 2026 16:17:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 908974DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 16:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FD2B8121A
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 16:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oHEcYYydjCh for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 16:17:28 +0000 (UTC)
X-Greylist: delayed 349 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 22 Jan 2026 16:17:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 590078120D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590078120D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=81.169.146.220;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org;
 receiver=<UNKNOWN> 
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 590078120D
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 16:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769098291; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=tgQGjhQIcNbeHlRRqAWHu/bB3ki7K3umXNLH0qftqqTZO+A4s6+unE3fxQdfxhzxZ+
 43nlS3cLvaoecDTORXSCzYywbOsiBX84T1pyCFeT+Hhzz108s01IKxIpsfEBbFc2GrOH
 cbgGuBgxcr+k06evVQ53DEztZWUIY7HAuN6WvQDKrfvnQ+gJP6p2eWPh/eJLh1LgfdCs
 ntP4QhIbN95sPe2AJ5Ob90nbdBEQD47mGtgMju7Lk0HQowheEf9TwdJXwZm54/ky4tAO
 3I/8bEWcBb0ZaAhFX6REpzL6HsTXnAoP1Mka+cxLtmjKsg1CbMQqzMIBNnmvUEkcvB8j
 ft6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1769098291;
 s=strato-dkim-0002; d=strato.com;
 h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=eyoN3JYqFPY6rxIjxKAVy7fQ+MI8GX2ck9f0ReIiT9k=;
 b=WoPKldtWV3CHcnmF6RoL0bgS9b+ihBwberIS4oYPX3s36FftCgtgobUAhtbLXzJ6WF
 21ZwiepXiujXqpu0GEwlerUouGgonmEOxwB4yEEHc2xF8jpzFa8zXpXR4AMGnhIEKWyK
 apUeYc8ruQqlVtl9h2we81D7atgIvTpqJpfjMtCNhpdMnC29AtfwDeU6JRW8LVMqDUuv
 aJL7YGxkQJJasuCVMho3YW3U/IT+DyERoObFfzcSBp/Lqc4fqNCMyO2pvc1Rol9XgpWa
 hNNREAdVcM3XD0vTELmMYQqJ1zgvrr+xLtTkAtC733nQh1byZ+3A1726JAgMjAL8sGyo
 Lohg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk5Zv9blcw/Guou9tnmlcuyckiRtoUADSX0hlaD7EdqIwtaVv1c="
Received: from jester.. by smtp.strato.de (RZmta 54.1.0 AUTH)
 with ESMTPSA id Jfe7b620MGBVnfB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 22 Jan 2026 17:11:31 +0100 (CET)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Julian Vetter <julian@outer-limits.org>
Date: Thu, 22 Jan 2026 17:11:16 +0100
Message-ID: <20260122161116.885373-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1769098291; 
 s=strato-dkim-0002; d=outer-limits.org;
 h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=eyoN3JYqFPY6rxIjxKAVy7fQ+MI8GX2ck9f0ReIiT9k=;
 b=ai5n7UB0Iyb6QPqz2vxbk/Y+q/51wXnMlL42ZEarsaq4kkvZ2Yaiv+jDdrG2YRNZ6Y
 +7qjwC6eR2stbquAC2UAv44235k0W3UHby4A/tBcKLh0wQlBCNfEpkT/GWdkeDUmM8Ex
 kWuRsNArEuNM62H8sb5erf3KBnjLo8GzmyCIpI8s3b9bfOOD/L2W4OFKd+dp/PYSZYV/
 BRDBezjZJbHZW0zvmEiZPEJZ8EARqWIdz15U3WOGNn/tlyFjceegr4DEzBOurQqfQyz7
 By6GUjRz5ohWa1GzbbLxY0e665yHOlg3lbs5+e+KH0D4/50F5y8XoCB+61Q7isufGY0p
 Ccyw==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1769098291; 
 s=strato-dkim-0003; d=outer-limits.org;
 h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=eyoN3JYqFPY6rxIjxKAVy7fQ+MI8GX2ck9f0ReIiT9k=;
 b=sqxwVV6DooOJWaRvOIkyTQrkiv3hdbw8GGxVfuharUvx9YYPLHp0Wid0y1pq3hqZxy
 ffMB7k5XNyIccccYvyAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=outer-limits.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=outer-limits.org
 header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002
 header.b=ai5n7UB0; 
 dkim=pass header.d=outer-limits.org header.i=@outer-limits.org
 header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=sqxwVV6D
Subject: [Buildroot] [PATCH] package/php: Add parth to ca-cert
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julian Vetter via buildroot <buildroot@buildroot.org>
Reply-To: Julian Vetter <julian@outer-limits.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If BR2_PACKAGE_CA_CERTIFICATES is present, add the ca-certificates.crt
to the php.ini, to not get SSL errors when using PHP.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
 package/php/php.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 2c91ef7b63..3c79ae4589 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -362,6 +362,14 @@ endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 
+ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
+define PHP_CERTIFICATES_FIXUP
+$(SED) 's%;openssl.cafile=%openssl.cafile=/etc/ssl/certs/ca-certificates.crt%' \
+		$(TARGET_DIR)/etc/php.ini
+endef
+PHP_POST_INSTALL_TARGET_HOOKS += PHP_CERTIFICATES_FIXUP
+endif
+
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(PHP_CXXFLAGS)"
 
 HOST_PHP_CONF_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
