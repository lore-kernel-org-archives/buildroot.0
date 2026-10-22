Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59368606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 06:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UnGSrrTe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=HOXUWAfw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A41F40867;
	Thu, 22 Oct 2026 06:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzAe9jbin6ve; Thu, 22 Oct 2026 06:02:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CEB474082A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792648943;
	b=NutmNhiEW41qf+u5SwJapnGXslodokS+H9Hy7zD1j+r1yGkvpyQg1tiYbStbgLBUEMVY
	 CZcLBLJTux4Y1g3zaOHaZd7eUuD5lsbObrp9z++Ms+88/WkpnBThxC+BnWZrjmYYDEdc1
	 okayMEmDFbGmNawmm1Rn/VB+4RCAxJpEmKbJZda2wvjQqavsnqzNgU1WWCyV/AyWnD315
	 GVWyI6/pHNrwNKrLQzlNdvsZbIkWK9V81XZbw8IBqMvG1YH8uHsIc8F/DnF+VYRUTZFnv
	 KRIhLcrAON45/l3KZzlGcJO7id0EPng7Ht9bZ37ueXLjrn3NG7oDKQsFDPM59lXNOGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792648943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vP78dO7HsFSb27QuXN4Y6f7a/w4cVscwb7Q/umT6pHY=;
	b=D5pvP8qLDpACgEoyza+12WI1rRbfkw6u469sl6iO8+77LKTAeQYOlmIUwFuskwtd1XIR
	 xJ78uwxBAKqxiaqG0Gd2AK40KLXS/s5AwT7lKVzobw3sliFpycZq9LjmcZvbVn/PCdzqR
	 Zbb1ZmEHkJLx5sd3D3S3JmlJtfZxP/5Vjcrp8/79zSPOahQ0eCd5SKaf15lEayRH5NugQ
	 q+XHyFPW5HEyWgz4xyWs3N/kk+90a2yNyOZuhCThc7zLCPx5Usd0QxrmJV/2lK+hVvW7L
	 kdT5VxscYZrIUr9w7qdUh2K7X+txA/KBPjAPCdOdIHuuefjc42wX8WgbGg/WWa0ESdw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792648943;
	bh=vP78dO7HsFSb27QuXN4Y6f7a/w4cVscwb7Q/umT6pHY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UnGSrrTejFo3oYnQ8HOrlThHmWY4qoOVgYsL+AGQQEr8bi5dc3/q1NrWsLIQL1afc
	 9UcZ3dgnybKJlKdY5oeZ+fvScu342DsZ25Rskd+aJYV2rRdr1JMWXu8wiQRZcZStXf
	 fPHJM8TVM5cZVEmhF0WjrP96CQAfSjIJbntpRcLutjyKNZs+EJGwfpnVHN53VxNnvK
	 KvxmCO9Xbl1+524PQefG5ZHknEozcFthe/QcU853Mul0krz9N4AEzHxa2TeUlfCK+x
	 awVvho6HhPx+zZoZjTIcHr9kMw44DN6rIVWjVyRM15nNcS5mAY3Ace7hI+17RmofmO
	 WhO/DgMV/btvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB474082A;
	Thu, 22 Oct 2026 06:02:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA94371
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A334F811BD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPmb6vlPJsWm for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 06:02:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B37881182
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792648941;
 b=ADnXTJe2Qx/1JGCHaVwcMRMlb/Au3TcTNEMUyedRe9p9T++6SzelbaABH0YBTRfWiDJi
 7gHff9k3OpTuD4rd4Zt2WC03CF2K6DFnAkhD0cv/yTHZtQ3Yfy9+0hqGSq5ujyy0cyHCa
 c14Oxuj8rmOjiYj3JECt0X7gNN6E657o4Sk2ABgU9Aqwi9eGGGrL2XRmrBksWOftBC8oG
 2QIq8NDXqMOzYK6bXOEOHMTKKGxJduWyN/q8vYHpDm9D7H2nE+zwLY5MGLasUcnNqNyCO
 beK516DuGCRwOcwjbyJ1r/NxOIKAqr8UHz1gYjoNkQmLSwg3+raA17nVnE8vNRphKqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792648941;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=gDOMfAHnBIgEi1b9LiW0vGasJEOyDhtlf1cjSwDyRyo=;
 b=HjKxdMnAEfd5teUux2Qo61qp/7sFTAoCPmkEqMA+noDKXo6ofdPXfcvVaT+PrKv4HNYe
 w4fSk2N+NShhIydD0JVQ6xbskaEVzr9j4MDK8F11WXDq8tR9Z1f0FwZYf9LSMBmcAVUWC
 hMGVWgDZzh8UxN47b3qVbUQ7RqWZ51ex3WaP+Du/QEOZijZVq8Pd8rEszpPrkad6Kilc1
 DT2U37d98Wszi8xXOmw+yQTF1HzHacalS0RxPwvpNuB3YKdy0et7XftTmZMYY49noAzqn
 ripzlvqM6tlAxQz/tGDc4Z1GTMUKp1q/gub/mdd8ZQGsHuYESvI9+vXjiJ0e4JMtfAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HOXUWAfw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HOXUWAfw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B37881182
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792648939;
 bh=gDOMfAHnBIgEi1b9LiW0vGasJEOyDhtlf1cjSwDyRyo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HOXUWAfw2ZXQpDs3A8b1nW93HDDr9nXJIQkS4XMrqMSU7Blnp1g3PxKhmw0nEF99m
 dhN+PaEUElx2A/E+8QRQLA04RQLpFvHQ1fBes/LFeMqRzTPjokjuoA/els1BUAMFz+
 DwSvfSlhTmxWTELpwA0n920/Byv8oQeR1wwG89iryZTGptQaQKgExQL9bcYSP4kWlh
 NyOmCYFMeeexjyj2KDw65o5iZ7DFj3jiL0L13CkisGPdl2IeeH39DHcx2GUUuSa2Q9
 3arvZk5mQtwiNt5w65yvQvQZHVs2DL43bFTpfdJNqS5ZByqTZCvjKNG9HKMWs/HHux
 6KzuBGe9I2zyw==
X-KAS-Sym: v3:f51bdf72230551df:J217wBZ+cG8mkcKpGXI5ylQ57yT3Q7xAAEsD7Ceq/Q0kM
 b0dwkyit7CIVWZxKNHRz3Hn6k1t6LK+tQXZD7LCoEK0o+62XwU4S3I8BTyVK8iAgFb5oxd3dnGA
 OFthYITRNyhiAro8GOoA4zc9txsFBfaXWqjMShINjkr5F55y8BuxBtHMSi7pMCePjAy2NcF3fOQ
 TzdqUYwOqvDJ0RcL1jcJsW6PyFnd36TbbowIe8mEeeJy8qP9+WhdRO2QRvd1PZWfj4FNGAYRQcV
 5xp4aMf6z/m2+OKbXuNFqUFjJozrG5BF5Y30W+cf3NRfr28PC9E6bPs8JXakBX+4MlrtD+3g==:
 fZZV0wYSZgRbXDW0dcIIW2T18dDudFKVzR+uLJd2CaPYAMySdMy70UqZFdEuJX7WjbLqzgH0ZBF
 Huj4nGCHp9Te2Wf6c5tpuuD03BRPfFqsyw+WwXsVXsohASFaz+yL1uZ5SIhICU+7RryYvB5VkcC
 vEdFLFX6CFkfJTO5yxZ5lAA0WXbM8ldes9YjNzchpGjSpoUF9CkaEeBURZPu/BQt8mLg8lgDtml
 KWRcdNDHxZZlGgLXIzxBmPb+qT3eNb49zMcPNdoJ6+MonCOGaw9sJm6zIBHKztKM+4CyXFd83b3
 TU1/ftip8c4kVHztlEOJ+t90c359r0/U+0+Y7jGs8/3oa6OZ1GyiRZpMXQUHij0I2xo/lhmKtex
 MxA1N5CblHGspBBMz9bYBzrei7HSq0OsD2JThhB0WNawjrtdob/uflgzuGQ5aeolpk+ZsbS77xf
 SWkkhL6W76uGter4cfskt9T1s3ldB2VGxqaEaznCg0YWhYzIgnndklVafv3yTx2SKnHeUNHN12h
 qHzAYr8IpYkIGH/IVU8abEEjatukle++xuCokT42kDpLB562O7xR6eh84pD1ITKRGhBjYvSmaE6
 KUW5N7BC2t8sWePNaXgJHm9KA3N1uaGq/c48Yo4XaBFOUILEj8a3E6xqXS2aU5mAgFyThoh74Gf
 xct2Z1u+j53iVJbM=
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DD15A4C6470;
 Thu, 22 Oct 2026 08:02:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58388)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJlsY-000000004gi-1Euw;
 Thu, 22 Oct 2026 06:02:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Oct 2026 08:02:18 +0200
Message-ID: <20261022060218.752140-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022060218.752140-1-bernd@kuhls.net>
References: <20261022060218.752140-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/2] linux: bump latest version to 7.3
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

For an overview of changes in 7.3, see:
https://kernelnewbies.org/Linux_7.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e0a8bbb457..6a1eed3146 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -39,8 +39,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (7.2)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.3)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3 if BR2_KERNEL_HEADERS_AS_KERNEL
 	select BR2_LINUX_KERNEL_LATEST_SERIES
 
 config BR2_LINUX_KERNEL_LATEST_6_18
@@ -182,7 +182,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "6.18.58" if BR2_LINUX_KERNEL_LATEST_6_18
 	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_6_12
 	default "6.6.160" if BR2_LINUX_KERNEL_LATEST_6_6
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
