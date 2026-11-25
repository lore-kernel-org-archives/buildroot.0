Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED52B606A326
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RdOnaBd6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=J1+NEVrw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B1580EED;
	Wed, 25 Nov 2026 10:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHtOh9IbYYnI; Wed, 25 Nov 2026 10:17:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFDF980E36
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795601833;
	b=Tn8vMbbY0r086TQF+/nDM9Nt53YX3zwqL5fM/oEg514paMEoEQkjo1tSuTnrMsGW+VQv
	 /VG1VNlg3NwUmPrZE8PiJk6rcrQajhlLJyDMi/oQEhJUEV79eB6yLEDdaOovZ/uMutGyy
	 9Nl8xfjO7CF6LXP4UpabRMPQ4+MfJYeDBuQoQTxYe4vtO86jCIDv3ClkCfvRhAkUmqMAB
	 50AAs8PkotgeWOtFZpr1DVQEFBzUdfw7FSFUCoZb6Nzp8Ud9tLvEiznIPWm2NODB5NWfF
	 m5kAWTW2+4ZRlo5wXHa3TqHqMro+0a+KQhHssPgGK1oIcC2BG2WTdW9ioxeubZWClKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795601833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=thZRidb5pT0B3WiPDvNZp/Z2J6SvZ18uUrrDjxNz2bE=;
	b=WMG4FSvwE9wOU44EnfcRT1y6D5UbdedB8U5ECdo8oOde6aNQ6GdRTFY32pn2cN/vhPl/
	 LBgj/89IHSni1dGi9/dwoZxuosv5gKKJhtKOhvwBp8kYLNavxS9NqiDaHKI56/DfAudcW
	 WUtoU0GoVwqoQaZ6kwPRuUbSJkLkz4gpe7wtp1esGkGuNJ4x8MNrxJo3/VeJ4Y/75lPz/
	 tNbUTNkPIahaNkQVeDV1zt+I8kBtOM0Lq6FFW8lVCYGSDQ6T7tcMKfum378/KgWr+krWP
	 S1JCkBpVvOrUv9uWV20lYj718uN1kzQfDdDANZtFWEbVrhmkjfYnm3xbmvN73T1PD/w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795601833;
	bh=thZRidb5pT0B3WiPDvNZp/Z2J6SvZ18uUrrDjxNz2bE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RdOnaBd6wbqpaWXijVQbF51L8gnKXHA5c8OU5pv7C3VplbJq5h/5zUBz8Z/us/odr
	 SLemDcLSqaFBT7CuncnxFo+QygOZdKJORBwxyfgtAvBlJWtmOJGw24rwBpYRpEZBBd
	 +MyQaAy5S2vd5cevknL8fc/gc1larENYm4bEdWZwV9KmBPhYa4HxFEXbv7aBvLgULG
	 tAO7L1tGaeSlAiED8FgsmV3bhgqeoi9n+H5fpMmPUCsmgu7qdWRkpsSd/zDYG6VYS3
	 IGX/E7UxK7XAOVM5CoHsI0rkWYqqOb7BxNMkEFHsKNrM8soFv7Cgn4cM3QOE5Q5SLu
	 Yj/ePi+gSNcgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDF980E36;
	Wed, 25 Nov 2026 10:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43B0F1C9
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34CF640655
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3rERXeA-5Y0 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 10:17:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1F8A740603
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=J1+NEVrw
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F8A740603
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:17:09 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id WA3mxrx6wtleFWA3mxQEHB; Wed, 25 Nov 2026 11:17:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795601827; bh=1C2MFLWvNqaGe8pCqADR8MzpNcdJFJdRn7tRsWEYB9U=;
 h=From:To:Subject:Date:MIME-Version;
 b=J1+NEVrwyRzZ7h8Uo9SxrNlnShcUpTamrRfWRRAVki3AqJfh8rsKQMPNQjvlt2GhW
 kyJ0f7JAeU3ghMHmaYpsZ30s3RBucp8Z+yiEPw9BwvtuWDOcpzUsawDo5Xfd0gpeA9
 6+m7H2LZT2rvcKqiff5/QIdOjae78FPkToVrjd/CIMsliNwbmqN3fHiK09ZueJdPID
 Fu9oWD8Vc/EhG3YEOVT0/wf9XI6ulB4SgfifKm+jgvL0GbjLyoNhfp0Eln7ZgzGs4q
 i7EI22R4tNNrEioxApN9NE57uam09/S/IxrvzVqrwO9b1DCKuh7LTKg2xfPOwQGsIQ
 P/l9l3aWOBFGg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Wed, 25 Nov 2026 11:17:06 +0100
Message-ID: <20261125101706.12032-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBkC1koNVicj+L8bcxcX9J7IocRbgZ/MtD99hxDcXisOhrooGDwr3Xi3RDpp7KI0+vkkoTPKzT4EI275oE/gXyLsRf6/MpujcANjOJG3qSln2MsCb8sp
 iIbMVfFUh7Lxg5a7LvhzmgEpHj2WsL9gunMSMMux6eHzC937KiIoJfCN5QRD0YdHBJdmntHUAfpufcyIMLfiDk4efIsXgPMsw6nhrZcItGTEgjIfcdXHhUl6
 DVkA0BfHXJEFm/BrNNyCYFNi0OKtjiHQRWIMoc9gjBZV6ii4TPoyZKy+I+KEo2J/v5WeeagCZTR8VSPxLdw5uqEG4jM7kNQTnpvQXvH2b3g4X1kX1t/PvQRQ
 /K0KqdfmMjNKXfr82MPrwexjfZjBZ0oy9XluNBbVBc9EoFaIRGw=
Subject: [Buildroot] [PATCH v2] package/librdkafka: fix build with LibreSSL
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

librdkafka doesn't support LibreSSL, since it uses OpenSSL functions that
LibreSSL doesn't provide, so the build fails with:

src/rdrand.c:81:23: error: implicit declaration of function 'RAND_priv_bytes'; did you mean 'RAND_pseudo_bytes'? [-Wimplicit-function-declaration]
src/rdkafka_ssl.c:1269:9: error: implicit declaration of function 'SSL_certs_clear' [-Wimplicit-function-declaration]
src/rdkafka_ssl.c:1679:21: error: implicit declaration of function 'SSL_CTX_use_cert_and_key'; did you mean 'SSL_CTX_use_certificate'? [-Wimplicit-function-declaration]
src/rdkafka_ssl.c:1773:9: error: implicit declaration of function 'SSL_CTX_set_cert_cb'; did you mean 'SSL_CTX_set_verify'? [-Wimplicit-function-declaration]

So let's enable SSL support only when BR2_PACKAGE_LIBOPENSSL is selected.

Fixes:
https://autobuild.buildroot.org/results/fb7/fb71058572ec270c46ff5de542c186c73bc06ceb/

Fixes: 390d60ac667ca9c8464f1770d68a93625f5d4c64 ("package/librdkafka: new package")
Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* added Fixes: tag pointing to the commit that introduced the issue as
  suggested by Thomas Petazzoni

 package/librdkafka/librdkafka.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librdkafka/librdkafka.mk b/package/librdkafka/librdkafka.mk
index 636765b3f5..a68f5e9523 100644
--- a/package/librdkafka/librdkafka.mk
+++ b/package/librdkafka/librdkafka.mk
@@ -41,7 +41,7 @@ else
 LIBRDKAFKA_CONF_OPTS += -DWITH_ZSTD=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBRDKAFKA_CONF_OPTS += -DWITH_SSL=ON
 LIBRDKAFKA_DEPENDENCIES += openssl
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
