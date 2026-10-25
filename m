Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AE606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cPcbxH3T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=UMfmuJwp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42CA960626;
	Sun, 25 Oct 2026 21:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5KAZdxcHBUY; Sun, 25 Oct 2026 21:39:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EE68D6060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792964390;
	b=f1UisVl459nFL+0HpvMnidHGC7OhJWsRaerf0Kxx8TBYddNYU6BSUnx0p2oMMUG/pCaN
	 Rfc/3PocSRjaFzGuFdCMALpHsuLY43cRZca2LeRPrCjuKE9UJUIsaX46mw6hKqZxiHq50
	 u2aZ2yX/VirUU2zai1mGtIonflsgBhYE6iScuTb/XabJCfjEz9BWtHh6I7hl+LJZBBbJr
	 SgNj+Rfcy+a0ElFQMvN48p2chf7YrGmq/6jjcA5z1+Y8AOMaXnm0HYLjIP9kOVKhsTtYz
	 0KGwQpcCBou6RCNOI07EpLqAON3hg0s8AAwFTLnmHDNm5Qae0uBaPbLLJa0VQzQLJBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792964390;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NuKj415z8/XucOwSc3ePL7txVcJuYGq3V26nf86BEwg=;
	b=QrsgVOOXkTVqTlmAY8tEyHOFUQKghc4ZnM+aUc3gkNTrM0C0C/Djw8tnIW79xwpzwGvx
	 rItrDo7vDmxBbys29yLWq/jKCuzrHeeWxUE0war8CTTFXDpt9NTOFL4d+7we4XirjqslL
	 8kP4WRBXMJGs5CGBZygI8M1z3zMDJK07Ebdgj411WXFU72FDSGXw7U9x4OY/V0nwtJJAQ
	 117mc/CLvvDxz6RXzYZbxNZxlbevKmXC8GgtXnMs9Rl83dVWUl7UkiYt6/yhVa/LRtHIe
	 rkmXuDlj69thI6Rr9dnSupft+xOhMmXTIZ/tO3azfzBVCaR7BZBeR+13s6+2OYdlVAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792964390;
	bh=NuKj415z8/XucOwSc3ePL7txVcJuYGq3V26nf86BEwg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cPcbxH3TNkWluaeO3lPA4iglbMlEewCPm+LQvjXlBas6rUimDkRovahceylYcBna9
	 eJyMb/GGMGgquGONRfdMrT6La3JjYxuM+PkMd6Nb4U9HDDMUHTZHsf+PPkwgWwQRI8
	 qPiv14g9CfF/dYLngbRywq0lGjtFzf/M/SG9NT4C225vskNXBnpv4CBfEy34RaFShm
	 GLpRbqKaQUE4LvHE/7VE5clkaCo6yNpnZxHlgE1yoFTWvQUsD8oPy34WBSme8Zp26/
	 tu98B+OBXjM2VnI8WGi+t13nBCucbg5xCd5Vi05bK+OYlSfkEJoYP9lL78rmoYFW+O
	 YXfd/EXOsLJRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE68D6060E;
	Sun, 25 Oct 2026 21:39:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68C343D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 508AA40585
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThEbMas6FqHe for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:39:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 67228403FC
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::136"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792964384;
 b=e3UXEIV3OkA61aHNQR0uGJ1x7tMfvNWevwTpIHyMNw+TcLHEo4fzRcCtkTLzj7C4Jnhd
 PKQD/ZzqsPMLiq1/oibUMqFYASz/zvoqQXcSQA2qcTVGGJIg0dKVfBstFQNttiq4j45K9
 Tb6xZP63gPrcCn+IRsCdNje3pmVtGEGNzifiFiqbu8iOgbIGGPVKwzvZMEtmtmeGmk3/h
 Qn5EVvsBu87imJjc19ozsc8tjmj/iPfFO6N8woJ5lDrA0yVVWU6Y6HNzAGlF9L8D6ZYMm
 1gdFPLXAlFfwnqQfLWbfYAhYPc4PKFcQsXt4KJmRxeNqFSe4KGfcLAcC8jh3uDs1mpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792964384;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wuoPPoRKpdPIaFosi8bSHJpULi2JDGGu+rLlEOZJLj8=;
 b=monrPuWm2+hkkIgkzrQp9FR8J+J5kBVb/Aaybss66ypDTy5tLdZxwZS1TKccNs+xnKtd
 TOykgiJz2DgheYPdgYxhIxl5D14MIKkRcH1R6CUKv6Drq7bD43ZMvIv6fLNLmO6RMobFG
 gwcfOBMhTmOfoO19iB0qg8QfiKDnx3zKkVuxc0Vy1QGKL+sNegZnp9DdhgLafzllWqZIL
 fIyUGCTSf+gmLSCqn+G5kZEzveJ2k4hBlTXqI9/Gc3pk+b4sd+jNZl4cneyzbpLuhoutX
 PDQRKd4jmD9K+4lwtLK2ERRMQx7UbFis87Sc2csqflugS0/7kyFoFn75xArjlLs5tvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=j-ernberg.se;
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=UMfmuJwp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::136"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=UMfmuJwp
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67228403FC
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:39:41 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5ba3ec92031so3151182e87.2
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1792964379; x=1793569179;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wuoPPoRKpdPIaFosi8bSHJpULi2JDGGu+rLlEOZJLj8=;
 b=UMfmuJwpVhL8DAEChDrYodkmn2FNVLVOvRXT1XFVo4ujuNmuT1MKH1LHqQSVRYhJHh
 dJQ8DBaKuoE3nR8BjT9taa4wcEr23JbrZm+7v4EFOg03a/q1mnrLKC9e6VsKL3lLfJ7R
 /e7olDo7PD9mjDZXnt0y3+i0MF+e7XA7juXbCPmgoh3Finfkw2D92SAmPfzNYIVLkQDc
 B3V/FDlDS04oClTHUX1CKmYzQVXeEZM6FA0Dzm7+Ab5C8OJIa6vAmy7WcOhlPU/1qFox
 U5BiVDLplha7kxNalCn8n2NoP3VqR9KvI1zxhb8C5K3YDo9skb7JC9HYicsmz3X2otVb
 xswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792964379; x=1793569179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wuoPPoRKpdPIaFosi8bSHJpULi2JDGGu+rLlEOZJLj8=;
 b=hCMqevgEGQYaBlJQ4RAZqhs+S35Ofqbvq8EtTSwt55L3PNRNU9AF6ECts7vfpAorTg
 AQhXTgjR7xPyUXRLoct1CSxqIv0M+PjHxsH3Qn/r/YsOBVJkEjnEm567toYsIv4tT4n0
 P9WSFDPLvMrsPjdk2XitvSuQtWBjYc9x50jki54DtlGQFHmHYxngaBHyL848XUSOV8VJ
 rLAWzeCtBWiWCWyVEfE/V6KlA/LAOBj+vk9Atp7aqJqYfHKLdCY3P0g5fobtO43W2vis
 0CvdNDivuGysOngKStvd50l8iHAjvWr71j3bQVwuS2VyqI55qVcl7Y7foZLd4GpejgZO
 Z/Ew==
X-Gm-Message-State: AFq9FYJTE0c1ehBjPVyddJIVhZDh9WKpzjTlSvsOH+FfK+u6CaScfmHt
 gNHUATbaXDb+TkosrZzvuT3aJ+YUOupQ2w33MnilrGGtjVRKTgFsfliKGjv7ff6rpKuLzwvZDej
 i4wmgZUw=
X-Gm-Gg: AYBFou2hVe0wBeWJi9CYnG7DJR4s9VRT96vwgfalEcw4/Ey9abO47LjF6A3W7XMyvLH
 8EJhHXxbz6Et6yW9yGMbbf4F0riMFThU9XNV0fzck5n10op0yQsXH1/Rl+AgF6g9/+aOo805bbj
 8aAxGURI0P+8Qh7z9O64LmsOX22T/nntgn5BatYHF1qcnl/wSeIp7Iw2LqJ+HVuJxipnshhj4cd
 D0r18CqtJbr0257DpE2q7JOwSERlFHMQ3Z1XNZGZ/zjl+FA5opkcYWjh5m/ToTQTs2Tfgz/CedV
 PlG99TFhLl4qWsDIbBrJ4yigaZvQgAK/G3Va+ka92WnsmAJDwVv+beE4j1PECtj+9ZW+tPmzlep
 xZ3kIZyC54X5KqH6Tr5Q0lB2a+yQzqXesku/eel2wF27CA3dGsAoSH9wc+B38WtReNRO/n2ERua
 MHZ1CyEIJLpiWtxE5vejEq59i8DC9+Z4ptAPW2ix9to1D+sc7SXAz6XIWt+fdFBsDs7Ku+p1bFE
 zY/7uEYc5Sh/EwvLCSv6YmuA6yHoDpIh/KRwS6tbw2yJWQOeM6vImE8S5XllCpjp0fEGe3NT5TE
 6U7sILKSBnYm4yI8CLS0ySEhAv0v2zQxWSW0+8EJISlDH2FaHK8XjyocynpGfVkfaMjNjA==
X-Received: by 2002:ac2:4c52:0:b0:5b6:4ae:8c02 with SMTP id
 2adb3069b0e04-5bfb71b7f34mr1589330e87.29.1792964378934; 
 Sun, 25 Oct 2026 14:39:38 -0700 (PDT)
Received: from localhost (78-68-185-168-no2360.tbcn.telia.com. [78.68.185.168])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5bfb7a75a79sm1205267e87.39.2026.10.25.14.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Oct 2026 14:39:35 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <j@j-ernberg.se>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2026 22:39:32 +0100
Message-ID: <20261025213932.1697437-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libest: Drop the package
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
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream has not accepted any code since September 2022 [1]  and the
amount of local patches to keep it going is growing.

The Cisco hosted testing servers went offline in 2023 [2] with no
reaction from anyone at Cisco.

Without any indication that anyone is actually using it, and that until
recently Java support was broken (and only fixed out of courtesy rather
than need [3] [4]), drop the package.

Link: https://github.com/cisco/libest/commits/main/ [1]
Link: https://github.com/cisco/libest/issues/122 [2]
[3]: commit 7e34cd7c7e5094f99ee26b24493a9007b646c3f9
Link: https://lore.kernel.org/buildroot/pan$1f3ab$25c10f86$a1f8462e$f59a0295@ID-313208.user.individual.net/ [4]
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---
 Config.in.legacy                              |   7 +
 DEVELOPERS                                    |   3 -
 package/Config.in                             |   1 -
 ...ix-error-implicit-declaration-of-fun.patch |  64 ----
 ...libest-Add-OpenSSL-3.0-compatibility.patch | 225 -----------
 ...client.c-include-est-est_ossl_util.h.patch |  27 --
 ...ove-duplicate-invocation-of-AM_INIT_.patch |  36 --
 ...r-opaque-ASN1_STRING-OpenSSL-4-compa.patch |  60 ---
 ...stead-of-the-ENGINE-API-on-OpenSSL-4.patch |  64 ----
 ...-Port-ossl_srv.c-copies-to-OpenSSL-4.patch | 358 ------------------
 package/libest/Config.in                      |  32 --
 package/libest/libest.hash                    |   3 -
 package/libest/libest.mk                      |  67 ----
 package/libest/libest.pc                      |  10 -
 14 files changed, 7 insertions(+), 950 deletions(-)
 delete mode 100644 package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch
 delete mode 100644 package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch
 delete mode 100644 package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
 delete mode 100644 package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
 delete mode 100644 package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
 delete mode 100644 package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
 delete mode 100644 package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch
 delete mode 100644 package/libest/Config.in
 delete mode 100644 package/libest/libest.hash
 delete mode 100644 package/libest/libest.mk
 delete mode 100644 package/libest/libest.pc

diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..2e4e44d332 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_LIBEST
+	bool "libest has been removed"
+	select BR2_LEGACY
+	help
+	  libest was removed because the upstream project is no longer
+	  active (last commit in 2022).
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 352308b082..b34dcd9017 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -129,9 +129,6 @@ F:	package/minimodem/
 N:	Alexander Lukichev <alexander.lukichev@gmail.com>
 F:	package/openpgm/
 
-N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
-F:	package/libest/
-
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
diff --git a/package/Config.in b/package/Config.in
index d3bef2d5f0..2a5a4e1daf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2043,7 +2043,6 @@ menu "Networking"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
-	source "package/libest/Config.in"
 	source "package/libfcgi/Config.in"
 	source "package/libgsasl/Config.in"
 	source "package/libhtp/Config.in"
diff --git a/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch b/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch
deleted file mode 100644
index 6fd952170e..0000000000
--- a/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 28c65fd9dff2f30438b98f0b71f387468259a2c3 Mon Sep 17 00:00:00 2001
-From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
-Date: Fri, 12 Jul 2024 21:07:10 +0300
-Subject: [PATCH] =?UTF-8?q?package/libest:=20fix=20error:=20implicit?=
- =?UTF-8?q?=20declaration=20of=20function=20=E2=80=98ERR=5Ferror=5Fstring?=
- =?UTF-8?q?=E2=80=99?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Added necessary header includes to fix 'implicit declaration' errors which occur when
-using -Wimplicit-function-declaration flag.
-
-Upstream: https://github.com/cisco/libest/pull/132
-Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
----
- src/est/est.c             | 4 +++-
- src/est/est_client.c      | 1 +
- src/est/est_server_http.c | 2 ++
- 3 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/est/est.c b/src/est/est.c
-index 8a65f87..24474c0 100644
---- a/src/est/est.c
-+++ b/src/est/est.c
-@@ -42,7 +42,9 @@
- #include <DbgHelp.h>
- #endif  /* DISABLE_BACKTRACE*/
- #endif /* WIN32*/
--
-+#include <openssl/err.h>
-+#include <openssl/ssl.h>
-+#include <openssl/rand.h>
- #ifndef ENABLE_CLIENT_ONLY
- static char hex_chpw[] = {0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 
- 			  0xF7, 0x0D, 0x01, 0x09, 0x07};
-diff --git a/src/est/est_client.c b/src/est/est_client.c
-index 8dff9d9..5c25d4f 100644
---- a/src/est/est_client.c
-+++ b/src/est/est_client.c
-@@ -40,6 +40,7 @@
- #include <openssl/ssl.h>
- #include <openssl/cms.h>
- #include <openssl/rand.h>
-+#include <openssl/crypto.h>
- #include "est.h"
- #include "est_locl.h"
- #include "est_ossl_util.h"
-diff --git a/src/est/est_server_http.c b/src/est/est_server_http.c
-index 2bd08d5..ce1cece 100644
---- a/src/est/est_server_http.c
-+++ b/src/est/est_server_http.c
-@@ -42,6 +42,8 @@
- #include <openssl/err.h>
- #include <openssl/ssl.h>
- #include <openssl/x509v3.h>
-+#include <openssl/crypto.h>
-+#include <openssl/rand.h>
- #if defined(_WIN32)
- #define _CRT_SECURE_NO_WARNINGS // Disable deprecation warning in VS2005
- #else
--- 
-2.40.1
-
diff --git a/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch b/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch
deleted file mode 100644
index a4c74e424a..0000000000
--- a/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch
+++ /dev/null
@@ -1,225 +0,0 @@
-From ad5ce7ff1cae92c151dc6f350ef943106ddd852f Mon Sep 17 00:00:00 2001
-From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
-Date: Fri, 12 Jul 2024 21:07:36 +0300
-Subject: [PATCH] package/libest: Add OpenSSL 3.0 compatibility
-
-The functions `FIPS_mode` and `FIPS_mode_set` are deprecated in OpenSSL 3.0, replaced by
-`EVP_default_properties_is_fips_enabled` and `EVP_default_properties_enable_fips` respectively.
-
-This commit introduces wrappers for these new EVP APIs to maintain compatibility with OpenSSL 3.0,
-while ensuring continued support for older versions of OpenSSL.
-
-- Implemented `is_fips_enabled` wrapper around `EVP_default_properties_is_fips_enabled`
-- Implemented `enable_fips` wrapper around `EVP_default_properties_enable_fips`
-- Added conditional compilation to support both new and legacy OpenSSL versions
-
-Upstream: https://github.com/cisco/libest/pull/132
-Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
----
- example/client-brski/estclient-brski.c |  2 +-
- example/client/estclient.c             |  2 +-
- example/proxy/estproxy.c               |  2 +-
- example/server/estserver.c             |  2 +-
- java/jni/client.c                      |  2 +-
- src/est/est_client.c                   | 12 ++++++------
- src/est/est_ossl_util.c                | 18 ++++++++++++++++++
- src/est/est_ossl_util.h                |  2 ++
- src/est/est_server.c                   |  2 +-
- test/UT/US1864/us1864.c                |  4 ++--
- 10 files changed, 34 insertions(+), 14 deletions(-)
-
-diff --git a/example/client-brski/estclient-brski.c b/example/client-brski/estclient-brski.c
-index 9e63af5..6e03052 100644
---- a/example/client-brski/estclient-brski.c
-+++ b/example/client-brski/estclient-brski.c
-@@ -388,7 +388,7 @@ int main (int argc, char **argv)
-                 break;
-             case 'f':
-                 /* Turn FIPS on if requested and exit if failure */
--                set_fips_return = FIPS_mode_set(1);
-+                set_fips_return = est_enable_fips(1);
-                 if (!set_fips_return) {
-                     printf("\nERROR setting FIPS MODE ON ...\n");
-                     ERR_load_crypto_strings();
-diff --git a/example/client/estclient.c b/example/client/estclient.c
-index a8a2d6f..75b1272 100644
---- a/example/client/estclient.c
-+++ b/example/client/estclient.c
-@@ -1280,7 +1280,7 @@ int main (int argc, char **argv)
-                 break;
-             case 'f':
-                 /* Turn FIPS on if requested and exit if failure */
--                set_fips_return = FIPS_mode_set(1);
-+                set_fips_return = est_enable_fips(1);
-                 if (!set_fips_return) {
-                     printf("\nERROR setting FIPS MODE ON ...\n");
-                     ERR_load_crypto_strings();
-diff --git a/example/proxy/estproxy.c b/example/proxy/estproxy.c
-index 114bd65..6dbdbda 100644
---- a/example/proxy/estproxy.c
-+++ b/example/proxy/estproxy.c
-@@ -593,7 +593,7 @@ int main (int argc, char **argv)
-             /*
-              * Turn FIPS on if user requested it and exit if failure
-              */
--            set_fips_return = FIPS_mode_set(1);
-+            set_fips_return = est_enable_fips(1);
-             if (set_fips_return != 1) {
-                 set_fips_error = ERR_get_error();
-                 printf("\nERROR WHILE SETTING FIPS MODE ON exiting ....\n");
-diff --git a/example/server/estserver.c b/example/server/estserver.c
-index 3539dc4..90886cf 100644
---- a/example/server/estserver.c
-+++ b/example/server/estserver.c
-@@ -2285,7 +2285,7 @@ int main (int argc, char **argv)
-             /* turn FIPS on if user requested it
-              * and exit if failure.
-              */
--            set_fips_return = FIPS_mode_set(1);
-+            set_fips_return = est_enable_fips(1);
-             if (set_fips_return != 1) {
-                 set_fips_error = ERR_get_error();
-                 printf("\nERROR WHILE SETTING FIPS MODE ON exiting ....\n");
-diff --git a/java/jni/client.c b/java/jni/client.c
-index c5bc28e..f58d5c0 100644
---- a/java/jni/client.c
-+++ b/java/jni/client.c
-@@ -179,7 +179,7 @@ static int jni_est_client_X509_REQ_sign (X509_REQ *x, EVP_PKEY *pkey, const EVP_
-  */
- JNIEXPORT jint JNICALL Java_com_cisco_c3m_est_ESTClient_enable_1fips(
- 		JNIEnv *env, jclass obj) {
--	if (!FIPS_mode() && !FIPS_mode_set(1)) {
-+	if (!est_is_fips_enabled() && !est_enable_fips(1)) {
- 		ERR_print_errors_fp(stderr);
- 		return -1;
- 	} else {
-diff --git a/src/est/est_client.c b/src/est/est_client.c
-index 5c25d4f..63069af 100644
---- a/src/est/est_client.c
-+++ b/src/est/est_client.c
-@@ -3183,7 +3183,7 @@ EST_ERROR est_client_enroll_internal (EST_CTX *ctx, char *cn, int *pkcs7_len, in
-          * HTTPS digest mode requires the use of MD5.  Make sure we're not
-          * in FIPS mode and can use MD5
-          */
--        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
-+        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
-             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
-             rv = EST_ERR_BAD_MODE;
-             goto err;
-@@ -3594,7 +3594,7 @@ EST_ERROR est_client_reenroll (EST_CTX *ctx, X509 *cert, int *pkcs7_len, EVP_PKE
-          * HTTPS digest mode requires the use of MD5.  Make sure we're not
-          * in FIPS mode and can use MD5
-          */
--        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
-+        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
- 	    EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
- 	    rv = EST_ERR_BAD_MODE;
-             goto err;
-@@ -3680,7 +3680,7 @@ static EST_ERROR est_client_enroll_csr_internal (EST_CTX *ctx, X509_REQ *csr, in
-          * HTTPS digest mode requires the use of MD5.  Make sure we're not
-          * in FIPS mode and can use MD5
-          */
--        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
-+        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
-             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
-             rv = EST_ERR_BAD_MODE;
-             goto err;
-@@ -5872,7 +5872,7 @@ static EST_ERROR est_client_brski_send_get_voucher (EST_CTX *ctx, int *cacert_le
-          * HTTPS digest mode requires the use of MD5.  Make sure we're not
-          * in FIPS mode and can use MD5
-          */
--        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
-+        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
-             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
-             rv = EST_ERR_BAD_MODE;
-             goto err;
-@@ -6366,7 +6366,7 @@ EST_ERROR est_client_brski_send_voucher_status (EST_CTX *ctx, EST_BRSKI_STATUS_V
-          * HTTPS digest mode requires the use of MD5.  Make sure we're not
-          * in FIPS mode and can use MD5
-          */
--        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
-+        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
-             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
-             rv = EST_ERR_BAD_MODE;
-             goto err;
-@@ -6535,7 +6535,7 @@ EST_ERROR est_client_brski_send_enroll_status (EST_CTX *ctx, EST_BRSKI_STATUS_VA
-          * HTTPS digest mode requires the use of MD5.  Make sure we're not
-          * in FIPS mode and can use MD5
-          */
--        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
-+        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
-             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
-             rv = EST_ERR_BAD_MODE;
-             goto err;
-diff --git a/src/est/est_ossl_util.c b/src/est/est_ossl_util.c
-index daa54f2..0887daa 100644
---- a/src/est/est_ossl_util.c
-+++ b/src/est/est_ossl_util.c
-@@ -500,3 +500,21 @@ char *est_find_ser_num_in_subj(X509 *cert)
-     return(ser_num_str);
- }
- #endif
-+
-+int est_is_fips_enabled()
-+{
-+#if OPENSSL_VERSION_NUMBER >= 0x30000000L
-+    return EVP_default_properties_is_fips_enabled(NULL);
-+#else
-+    return FIPS_mode();
-+#endif
-+}
-+
-+int est_enable_fips(int enable)
-+{
-+#if OPENSSL_VERSION_NUMBER >= 0x30000000L
-+	return EVP_default_properties_enable_fips(NULL, enable);
-+#else
-+	return FIPS_mode_set(enable);
-+#endif
-+}
-diff --git a/src/est/est_ossl_util.h b/src/est/est_ossl_util.h
-index 68ad290..2389e45 100644
---- a/src/est/est_ossl_util.h
-+++ b/src/est/est_ossl_util.h
-@@ -44,4 +44,6 @@ LIBEST_TEST_API void ossl_dump_ssl_errors(void);
- EST_ERROR ossl_init_cert_store(X509_STORE *store,
-                                unsigned char *raw1, int size1);
- 
-+int est_is_fips_enabled();
-+int est_enable_fips(int);
- #endif
-diff --git a/src/est/est_server.c b/src/est/est_server.c
-index d047b48..979ae53 100644
---- a/src/est/est_server.c
-+++ b/src/est/est_server.c
-@@ -3355,7 +3355,7 @@ EST_ERROR est_server_set_auth_mode (EST_CTX *ctx, EST_HTTP_AUTH_MODE amode)
-         /*
-          * Since HTTP digest auth uses MD5, make sure we're not in FIPS mode.
-          */
--	if (FIPS_mode()) {
-+	if (est_is_fips_enabled()) {
- 	    EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
- 	    return (EST_ERR_BAD_MODE);
- 	}
-diff --git a/test/UT/US1864/us1864.c b/test/UT/US1864/us1864.c
-index 3e41cd7..1f57494 100644
---- a/test/UT/US1864/us1864.c
-+++ b/test/UT/US1864/us1864.c
-@@ -218,12 +218,12 @@ static void us1864_test1 (void)
-     /*
-      * Make sure we don't allow DIGEST mode when in FIPS mode
-      */
--    if (!FIPS_mode_set(1)) {
-+    if (!est_enable_fips(1)) {
-         printf("FIPS mode not supported, skipping test to prevent digest auth when in FIPS mode");
-     } else {
-         est_rv = est_server_set_auth_mode(ctx, AUTH_DIGEST);
-         CU_ASSERT(est_rv == EST_ERR_BAD_MODE);
--        FIPS_mode_set(0);
-+        est_enable_fips(0);
-     }
- 
-     X509_free(x);
--- 
-2.40.1
-
diff --git a/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
deleted file mode 100644
index d027d8012f..0000000000
--- a/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b49542dea03c4b895a860c393453ab8497dabfce Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Tue, 8 Sep 2026 12:52:02 +0200
-Subject: [PATCH] java/jni/client.c: include est/est_ossl_util.h
-
-Upstream: https://github.com/cisco/libest/pull/132#issuecomment-4749526125
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- java/jni/client.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/java/jni/client.c b/java/jni/client.c
-index c5bc28e..2c4663e 100644
---- a/java/jni/client.c
-+++ b/java/jni/client.c
-@@ -12,6 +12,7 @@
- #include <stdint.h>
- #include "jest.h"
- #include <est/est.h>
-+#include "est/est_ossl_util.h"
- #include <openssl/x509v3.h>
- #include <openssl/bio.h>
- #include "safe_mem_lib.h"
--- 
-2.47.3
-
diff --git a/package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch b/package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
deleted file mode 100644
index 1ee35ad7f9..0000000000
--- a/package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From bd4fad5e427f4d2828f2edbe8063f6d6c9276c7b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 8 Jan 2022 13:30:58 +0100
-Subject: [PATCH] configure.ac: remove duplicate invocation of AM_INIT_AUTOMAKE
-
-autoreconf fails with:
-
-configure.ac:9: error: AM_INIT_AUTOMAKE expanded multiple times
-/home/thomas/projets/buildroot/output/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-configure.ac:7: the top level
-/home/thomas/projets/buildroot/output/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-configure.ac:9: the top level
-
-Drop the duplicate invocation to AM_INIT_AUTOMAKE to solve this.
-
-Upstream: https://github.com/cisco/libest/pull/106
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0b930bf..66a91f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4,7 +4,6 @@ AC_CONFIG_AUX_DIR(config)
- AC_CONFIG_SRCDIR(src/est/est.c)
- AC_CONFIG_MACRO_DIR([m4])
- 
--AM_INIT_AUTOMAKE
- AM_MAINTAINER_MODE
- AM_INIT_AUTOMAKE([subdir-objects])
- 
--- 
-2.33.1
-
diff --git a/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch b/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
deleted file mode 100644
index 13511f0d27..0000000000
--- a/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 59695d938e0d23dda2eda124164bc8909ab2ddf5 Mon Sep 17 00:00:00 2001
-From: Karl Smeltzer <karl.smeltzer@canonical.com>
-Date: Fri, 24 Jul 2026 12:54:56 -0700
-Subject: [PATCH] Use accessors for opaque ASN1_STRING (OpenSSL 4
- compatibility)
-
-OpenSSL 4.0 makes ASN1_STRING (and its typedefs ASN1_OCTET_STRING /
-ASN1_BIT_STRING) opaque. This uses the ASN1_STRING_get0_data() and
-ASN1_STRING_length() accessors instead, while keeping the direct access
-under HAVE_OLD_OPENSSL.
-
-Upstream: https://github.com/cisco/libest/pull/136
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/est/est_client.c | 8 ++++++--
- src/est/est_server.c | 4 ++++
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/src/est/est_client.c b/src/est/est_client.c
-index 8dff9d9..06ca510 100644
---- a/src/est/est_client.c
-+++ b/src/est/est_client.c
-@@ -5313,11 +5313,15 @@ EST_ERROR verify_voucher (EST_CTX *ctx)
-         return (EST_ERR_CLIENT_BRSKI_VOUCHER_VERIFY_FAILED);
-     }
- 
-+#ifdef HAVE_OLD_OPENSSL
-     ctx->brski_retrieved_voucher = pkcs7->d.sign->contents->d.data->data;
--    ctx->brski_retrieved_voucher_len = pkcs7->d.sign->contents->d.data->length;
-+#else
-+    ctx->brski_retrieved_voucher = (unsigned char *)ASN1_STRING_get0_data(pkcs7->d.sign->contents->d.data);
-+#endif
-+    ctx->brski_retrieved_voucher_len = ASN1_STRING_length(pkcs7->d.sign->contents->d.data);
- 
-     EST_LOG_INFO("Voucher verify passed.  Voucher =\n %s",
--                 pkcs7->d.sign->contents->d.data->data);
-+                 ctx->brski_retrieved_voucher);
-     
-     return (EST_ERR_NONE);
- }
-diff --git a/src/est/est_server.c b/src/est/est_server.c
-index d047b48..4b4d617 100644
---- a/src/est/est_server.c
-+++ b/src/est/est_server.c
-@@ -1133,7 +1133,11 @@ int est_tls_uid_auth (EST_CTX *ctx, SSL *ssl, X509_REQ *req)
-          */
-         tls_uid = est_get_tls_uid(ssl, &uid_len, 0);
-         if (tls_uid) {
-+#ifdef HAVE_OLD_OPENSSL
- 	    i = memcmp_s(tls_uid, uid_len, bs->data, uid_len, &diff);
-+#else
-+	    i = memcmp_s(tls_uid, uid_len, ASN1_STRING_get0_data(bs), uid_len, &diff);
-+#endif
-             if (i == EOK && !diff) {
-                 EST_LOG_INFO("PoP is valid");
-                 rv = EST_ERR_NONE;
--- 
-2.47.3
-
diff --git a/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch b/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
deleted file mode 100644
index 3ef41c4db6..0000000000
--- a/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From fdf43891c4cffd5f9a7776a6195a636988c7aed1 Mon Sep 17 00:00:00 2001
-From: Karl Smeltzer <karl.smeltzer@canonical.com>
-Date: Fri, 24 Jul 2026 12:55:06 -0700
-Subject: [PATCH] Use providers instead of the ENGINE API on OpenSSL 4 (est.h)
-
-OpenSSL 4.0 removes the ENGINE API, so the est_apps_startup() /
-est_apps_shutdown() macros in est.h no longer link: they call
-ENGINE_load_builtin_engines() / ENGINE_cleanup() and friends.
-
-Add OpenSSL >= 4.0 variants of both macros that load the default
-provider instead, keeping the existing variants for older versions,
-matching the HAVE_OLD_OPENSSL pattern already used in this header.
-
-Upstream: https://github.com/cisco/libest/pull/136
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/est/est.h | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/src/est/est.h b/src/est/est.h
-index ffbe85f..716dd7e 100644
---- a/src/est/est.h
-+++ b/src/est/est.h
-@@ -25,6 +25,9 @@
- #include <openssl/engine.h>
- #include <openssl/conf.h>
- #include <openssl/srp.h>
-+#if OPENSSL_VERSION_NUMBER >= 0x40000000L
-+#include <openssl/provider.h>
-+#endif
- 
- #ifdef  __cplusplus
- extern "C" {
-@@ -829,6 +832,13 @@ LIBEST_API EST_ERROR est_disable_performance_timers(EST_CTX *ctx);
-          ENGINE_load_builtin_engines(); \
-          SSL_library_init(); \
-          SSL_load_error_strings(); } while (0)
-+#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
-+#define est_apps_startup()               \
-+    do { ERR_load_crypto_strings();      \
-+         OpenSSL_add_all_algorithms();   \
-+         OSSL_PROVIDER_load(NULL, "default"); \
-+         SSL_library_init();             \
-+         SSL_load_error_strings(); } while (0)
- #else
- #define est_apps_startup()               \
-     do { ERR_load_crypto_strings();      \
-@@ -854,6 +864,12 @@ LIBEST_API EST_ERROR est_disable_performance_timers(EST_CTX *ctx);
-          CRYPTO_cleanup_all_ex_data(); \
-          ERR_remove_thread_state(NULL); \
-          ERR_free_strings(); } while (0)
-+#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
-+#define est_apps_shutdown() \
-+    do { CONF_modules_unload(1); \
-+         OBJ_cleanup(); EVP_cleanup(); \
-+         CRYPTO_cleanup_all_ex_data(); \
-+         ERR_free_strings(); } while (0)
- #else
- #define est_apps_shutdown() \
-     do { CONF_modules_unload(1); \
--- 
-2.47.3
-
diff --git a/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch b/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch
deleted file mode 100644
index 0a62049fbc..0000000000
--- a/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch
+++ /dev/null
@@ -1,358 +0,0 @@
-From b2bcfd65b825a2adf8f9f3e8801211fae2332e17 Mon Sep 17 00:00:00 2001
-From: Karl Smeltzer <karl.smeltzer@canonical.com>
-Date: Fri, 24 Jul 2026 12:55:19 -0700
-Subject: [PATCH] Port ossl_srv.c copies to OpenSSL 4
-
-Both ossl_srv.c copies (example/server, test/util) fail to build
-against OpenSSL 4.0 due to relying on removed functionality.
-
-Fixes:
-- Add a shim mapping ASN1_STRING_get0_data() to ASN1_STRING_data() on
-  OpenSSL < 1.1.0, then use the ASN1_STRING_type/length/get0_data
-  accessors unconditionally. These files do not include config.h, so
-  HAVE_OLD_OPENSSL is never defined here; keying on
-  OPENSSL_VERSION_NUMBER is what actually keeps 1.0.x building.
-- Retag DN entries in the msie_hack path with
-  X509_NAME_ENTRY_set_data() instead of writing str->type, which has
-  no setter once the type is opaque.
-- Replace BN_pseudo_rand() with BN_rand(), available on all versions.
-- Ifdef out the FORMAT_ENGINE branch on OpenSSL >= 4.0.
-
-Upstream: https://github.com/cisco/libest/pull/136
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- example/server/ossl_srv.c | 69 +++++++++++++++++++++++----------------
- test/util/ossl_srv.c      | 67 ++++++++++++++++++++++---------------
- 2 files changed, 82 insertions(+), 54 deletions(-)
-
-diff --git a/example/server/ossl_srv.c b/example/server/ossl_srv.c
-index b87c2d1..3610e93 100644
---- a/example/server/ossl_srv.c
-+++ b/example/server/ossl_srv.c
-@@ -90,6 +90,10 @@
- #include <openssl/bio.h>
- #include "apps.h"  //taken from openssl/apps/apps.h
- 
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#define ASN1_STRING_get0_data ASN1_STRING_data
-+#endif
-+
- extern BIO *bio_err;
- BIO *cacerts = NULL;
- static int msie_hack = 0;
-@@ -317,6 +321,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
-         BIO_printf(err, "no keyfile specified\n");
-         goto end;
-     }
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L
-     if (format == FORMAT_ENGINE) {
-         if (!e)
-             BIO_printf(err, "no engine specified\n");
-@@ -330,6 +335,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
-         }
-         goto end;
-     }
-+#endif
-     key = BIO_new(BIO_s_file());
-     if (key == NULL) {
-         ERR_print_errors(err);
-@@ -883,7 +889,7 @@ int rand_serial(BIGNUM *b, ASN1_INTEGER *ai) {
-     if (!btmp)
-         return 0;
- 
--    if (!BN_pseudo_rand(btmp, SERIAL_RAND_BITS, 0, 0))
-+    if (!BN_rand(btmp, SERIAL_RAND_BITS, 0, 0))
-         goto error;
-     if (ai && !BN_to_ASN1_INTEGER(btmp, ai))
-         goto error;
-@@ -1304,14 +1310,14 @@ static int do_updatedb(CA_DB *db) {
- 
-     /* get actual time and make a string */
-     a_tm = X509_gmtime_adj(a_tm, 0);
--    a_tm_s = (char *) OPENSSL_malloc(a_tm->length+1);
-+    a_tm_s = (char *) OPENSSL_malloc(ASN1_STRING_length(a_tm)+1);
-     if (a_tm_s == NULL) {
-         cnt = -1;
-         goto err;
-     }
- 
--    memcpy(a_tm_s, a_tm->data, a_tm->length);
--    a_tm_s[a_tm->length] = '\0';
-+    memcpy(a_tm_s, ASN1_STRING_get0_data(a_tm), ASN1_STRING_length(a_tm));
-+    a_tm_s[ASN1_STRING_length(a_tm)] = '\0';
- 
-     if (strncmp(a_tm_s, "49", 2) <= 0)
-         a_y2k = 1;
-@@ -1367,19 +1373,19 @@ int old_entry_print(BIO *bp, ASN1_OBJECT *obj, ASN1_STRING *str) {
-     *(pbuf++) = '\0';
-     BIO_puts(bp, buf);
- 
--    if (str->type == V_ASN1_PRINTABLESTRING)
-+    if (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)
-         BIO_printf(bp, "PRINTABLE:'");
--    else if (str->type == V_ASN1_T61STRING)
-+    else if (ASN1_STRING_type(str) == V_ASN1_T61STRING)
-         BIO_printf(bp, "T61STRING:'");
--    else if (str->type == V_ASN1_IA5STRING)
-+    else if (ASN1_STRING_type(str) == V_ASN1_IA5STRING)
-         BIO_printf(bp, "IA5STRING:'");
--    else if (str->type == V_ASN1_UNIVERSALSTRING)
-+    else if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
-         BIO_printf(bp, "UNIVERSALSTRING:'");
-     else
--        BIO_printf(bp, "ASN.1 %2d:'", str->type);
-+        BIO_printf(bp, "ASN.1 %2d:'", ASN1_STRING_type(str));
- 
--    p = (char *) str->data;
--    for (j = str->length; j > 0; j--) {
-+    p = (char *) ASN1_STRING_get0_data(str);
-+    for (j = ASN1_STRING_length(str); j > 0; j--) {
-         if ((*p >= ' ') && (*p <= '~'))
-             BIO_printf(bp, "%c", *p);
-         else if (*p & 0x80)
-@@ -1505,16 +1511,22 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
-             nid = OBJ_obj2nid(X509_NAME_ENTRY_get_object(ne));
- #endif
-             
--            if (str->type == V_ASN1_UNIVERSALSTRING)
-+            if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
-                 ASN1_UNIVERSALSTRING_to_string(str);
- 
--            if ((str->type == V_ASN1_IA5STRING)
--                    && (nid != NID_pkcs9_emailAddress))
--                str->type = V_ASN1_T61STRING;
-+            if ((ASN1_STRING_type(str) == V_ASN1_IA5STRING)
-+                    && (nid != NID_pkcs9_emailAddress)) {
-+                X509_NAME_ENTRY_set_data(ne, V_ASN1_T61STRING,
-+                        ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
-+                str = X509_NAME_ENTRY_get_data(ne);
-+            }
- 
-             if ((nid == NID_pkcs9_emailAddress)
--                    && (str->type == V_ASN1_PRINTABLESTRING))
--                str->type = V_ASN1_IA5STRING;
-+                    && (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)) {
-+                X509_NAME_ENTRY_set_data(ne, V_ASN1_IA5STRING,
-+                        ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
-+                str = X509_NAME_ENTRY_get_data(ne);
-+            }
-         }
- 
-         /* If no EMAIL is wanted in the subject */
-@@ -1523,17 +1535,18 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
- 
-         /* check some things */
-         if ((OBJ_obj2nid(obj) == NID_pkcs9_emailAddress)
--                && (str->type != V_ASN1_IA5STRING)) {
-+                && (ASN1_STRING_type(str) != V_ASN1_IA5STRING)) {
-             BIO_printf(bio_err,
-                     "\nemailAddress type needs to be of type IA5STRING\n");
-             goto err;
-         }
--        if ((str->type != V_ASN1_BMPSTRING)
--                && (str->type != V_ASN1_UTF8STRING)) {
--            j = ASN1_PRINTABLE_type(str->data, str->length);
--            if (((j == V_ASN1_T61STRING) && (str->type != V_ASN1_T61STRING))
-+        if ((ASN1_STRING_type(str) != V_ASN1_BMPSTRING)
-+                && (ASN1_STRING_type(str) != V_ASN1_UTF8STRING)) {
-+            j = ASN1_PRINTABLE_type(ASN1_STRING_get0_data(str),
-+                    ASN1_STRING_length(str));
-+            if (((j == V_ASN1_T61STRING) && (ASN1_STRING_type(str) != V_ASN1_T61STRING))
-                     || ((j == V_ASN1_IA5STRING)
--                            && (str->type == V_ASN1_PRINTABLESTRING))) {
-+                            && (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING))) {
-                 BIO_printf(bio_err,
-                         "\nThe string contains characters that are illegal for the ASN.1 type\n");
-                 goto err;
-@@ -1631,8 +1644,8 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
-                     BIO_printf(bio_err,
-                             "The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",
-                             cv->name,
--                            ((str2 == NULL) ? "NULL" : (char *) str2->data),
--                            ((str == NULL) ? "NULL" : (char *) str->data));
-+                            ((str2 == NULL) ? "NULL" : (char *) ASN1_STRING_get0_data(str2)),
-+                            ((str == NULL) ? "NULL" : (char *) ASN1_STRING_get0_data(str)));
-                     goto err;
-                 }
-             } else {
-@@ -1935,9 +1948,9 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
-     row[DB_type] = (char *) OPENSSL_malloc(2);
- 
-     tm = X509_get_notAfter(ret);
--    row[DB_exp_date] = (char *) OPENSSL_malloc(tm->length+1);
--    memcpy(row[DB_exp_date], tm->data, tm->length);
--    row[DB_exp_date][tm->length] = '\0';
-+    row[DB_exp_date] = (char *) OPENSSL_malloc(ASN1_STRING_length(tm)+1);
-+    memcpy(row[DB_exp_date], ASN1_STRING_get0_data(tm), ASN1_STRING_length(tm));
-+    row[DB_exp_date][ASN1_STRING_length(tm)] = '\0';
- 
-     row[DB_rev_date] = NULL;
- 
-diff --git a/test/util/ossl_srv.c b/test/util/ossl_srv.c
-index 3efefa4..6ea539a 100644
---- a/test/util/ossl_srv.c
-+++ b/test/util/ossl_srv.c
-@@ -91,6 +91,10 @@
- #include <openssl/bio.h>
- #include "apps.h"  //taken from openssl/apps/apps.h
- 
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#define ASN1_STRING_get0_data ASN1_STRING_data
-+#endif
-+
- extern BIO *bio_err;
- BIO *cacerts = NULL;
- static int msie_hack=0;
-@@ -345,6 +349,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
- 		BIO_printf(err,"no keyfile specified\n");
- 		goto end;
- 		}
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L
- 	if (format == FORMAT_ENGINE)
- 		{
- 		if (!e)
-@@ -361,6 +366,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
- 			}
- 		goto end;
- 		}
-+#endif
- 	key=BIO_new(BIO_s_file());
- 	if (key == NULL)
- 		{
-@@ -971,7 +977,7 @@ int rand_serial(BIGNUM *b, ASN1_INTEGER *ai)
- 	if (!btmp)
- 		return 0;
- 
--	if (!BN_pseudo_rand(btmp, SERIAL_RAND_BITS, 0, 0))
-+	if (!BN_rand(btmp, SERIAL_RAND_BITS, 0, 0))
- 		goto error;
- 	if (ai && !BN_to_ASN1_INTEGER(btmp, ai))
- 		goto error;
-@@ -1434,15 +1440,15 @@ static int do_updatedb (CA_DB *db)
- 
- 	/* get actual time and make a string */
- 	a_tm = X509_gmtime_adj(a_tm, 0);
--	a_tm_s = (char *) OPENSSL_malloc(a_tm->length+1);
-+	a_tm_s = (char *) OPENSSL_malloc(ASN1_STRING_length(a_tm)+1);
- 	if (a_tm_s == NULL)
- 		{
- 		cnt = -1;
- 		goto err;
- 		}
- 
--	memcpy(a_tm_s, a_tm->data, a_tm->length);
--	a_tm_s[a_tm->length] = '\0';
-+	memcpy(a_tm_s, ASN1_STRING_get0_data(a_tm), ASN1_STRING_length(a_tm));
-+	a_tm_s[ASN1_STRING_length(a_tm)] = '\0';
- 
- 	if (strncmp(a_tm_s, "49", 2) <= 0)
- 		a_y2k = 1;
-@@ -1508,19 +1514,19 @@ int old_entry_print(BIO *bp, ASN1_OBJECT *obj, ASN1_STRING *str)
- 	*(pbuf++)='\0';
- 	BIO_puts(bp,buf);
- 
--	if (str->type == V_ASN1_PRINTABLESTRING)
-+	if (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)
- 		BIO_printf(bp,"PRINTABLE:'");
--	else if (str->type == V_ASN1_T61STRING)
-+	else if (ASN1_STRING_type(str) == V_ASN1_T61STRING)
- 		BIO_printf(bp,"T61STRING:'");
--	else if (str->type == V_ASN1_IA5STRING)
-+	else if (ASN1_STRING_type(str) == V_ASN1_IA5STRING)
- 		BIO_printf(bp,"IA5STRING:'");
--	else if (str->type == V_ASN1_UNIVERSALSTRING)
-+	else if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
- 		BIO_printf(bp,"UNIVERSALSTRING:'");
- 	else
--		BIO_printf(bp,"ASN.1 %2d:'",str->type);
--			
--	p=(char *)str->data;
--	for (j=str->length; j>0; j--)
-+		BIO_printf(bp,"ASN.1 %2d:'",ASN1_STRING_type(str));
-+
-+	p=(char *)ASN1_STRING_get0_data(str);
-+	for (j=ASN1_STRING_length(str); j>0; j--)
- 		{
- 		if ((*p >= ' ') && (*p <= '~'))
- 			BIO_printf(bp,"%c",*p);
-@@ -1658,16 +1664,24 @@ static int do_body(X509 **xret, EVP_PKEY *pkey, X509 *x509, const EVP_MD *dgst,
- #else            
-                             nid = OBJ_obj2nid(X509_NAME_ENTRY_get_object(ne));
- #endif
--			if (str->type == V_ASN1_UNIVERSALSTRING)
-+			if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
- 				ASN1_UNIVERSALSTRING_to_string(str);
- 
--			if ((str->type == V_ASN1_IA5STRING) &&
-+			if ((ASN1_STRING_type(str) == V_ASN1_IA5STRING) &&
- 				(nid != NID_pkcs9_emailAddress))
--				str->type=V_ASN1_T61STRING;
-+				{
-+				X509_NAME_ENTRY_set_data(ne, V_ASN1_T61STRING,
-+					ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
-+				str=X509_NAME_ENTRY_get_data(ne);
-+				}
- 
- 			if ((nid == NID_pkcs9_emailAddress) &&
--				(str->type == V_ASN1_PRINTABLESTRING))
--				str->type=V_ASN1_IA5STRING;
-+				(ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING))
-+				{
-+				X509_NAME_ENTRY_set_data(ne, V_ASN1_IA5STRING,
-+					ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
-+				str=X509_NAME_ENTRY_get_data(ne);
-+				}
- 			}
- 
- 		/* If no EMAIL is wanted in the subject */
-@@ -1676,18 +1690,18 @@ static int do_body(X509 **xret, EVP_PKEY *pkey, X509 *x509, const EVP_MD *dgst,
- 
- 		/* check some things */
- 		if ((OBJ_obj2nid(obj) == NID_pkcs9_emailAddress) &&
--			(str->type != V_ASN1_IA5STRING))
-+			(ASN1_STRING_type(str) != V_ASN1_IA5STRING))
- 			{
- 			BIO_printf(bio_err,"\nemailAddress type needs to be of type IA5STRING\n");
- 			goto err;
- 			}
--		if ((str->type != V_ASN1_BMPSTRING) && (str->type != V_ASN1_UTF8STRING))
-+		if ((ASN1_STRING_type(str) != V_ASN1_BMPSTRING) && (ASN1_STRING_type(str) != V_ASN1_UTF8STRING))
- 			{
--			j=ASN1_PRINTABLE_type(str->data,str->length);
-+			j=ASN1_PRINTABLE_type(ASN1_STRING_get0_data(str),ASN1_STRING_length(str));
- 			if (	((j == V_ASN1_T61STRING) &&
--				 (str->type != V_ASN1_T61STRING)) ||
-+				 (ASN1_STRING_type(str) != V_ASN1_T61STRING)) ||
- 				((j == V_ASN1_IA5STRING) &&
--				 (str->type == V_ASN1_PRINTABLESTRING)))
-+				 (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)))
- 				{
- 				BIO_printf(bio_err,"\nThe string contains characters that are illegal for the ASN.1 type\n");
- 				goto err;
-@@ -1791,7 +1805,8 @@ again2:
- 					}
- 				if (j < 0)
- 					{
--					BIO_printf(bio_err,"The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",cv->name,((str2 == NULL)?"NULL":(char *)str2->data),((str == NULL)?"NULL":(char *)str->data));
-+					BIO_printf(bio_err,"The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",cv->name,
-+						((str2 == NULL)?"NULL":(char *)ASN1_STRING_get0_data(str2)),((str == NULL)?"NULL":(char *)ASN1_STRING_get0_data(str)));
- 					goto err;
- 					}
- 				}
-@@ -2098,9 +2113,9 @@ again2:
- 	row[DB_type]=(char *)OPENSSL_malloc(2);
- 
- 	tm=X509_get_notAfter(ret);
--	row[DB_exp_date]=(char *)OPENSSL_malloc(tm->length+1);
--	memcpy(row[DB_exp_date],tm->data,tm->length);
--	row[DB_exp_date][tm->length]='\0';
-+	row[DB_exp_date]=(char *)OPENSSL_malloc(ASN1_STRING_length(tm)+1);
-+	memcpy(row[DB_exp_date],ASN1_STRING_get0_data(tm),ASN1_STRING_length(tm));
-+	row[DB_exp_date][ASN1_STRING_length(tm)]='\0';
- 
- 	row[DB_rev_date]=NULL;
- 
--- 
-2.47.3
-
diff --git a/package/libest/Config.in b/package/libest/Config.in
deleted file mode 100644
index bd5f40afae..0000000000
--- a/package/libest/Config.in
+++ /dev/null
@@ -1,32 +0,0 @@
-comment "libest needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
-config BR2_PACKAGE_LIBEST
-	bool "libest"
-	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
-	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
-	select BR2_PACKAGE_SAFECLIB
-	help
-	  libest is a C implementation of RFC 7030 (Enrollment over
-	  Secure Transport).
-
-	  It can be used to provision public key certificates from
-	  a certificate authority (CA) or registration authority (RA)
-	  to end-user devices and network infrastructure devices.
-
-	  https://github.com/cisco/libest
-
-if BR2_PACKAGE_LIBEST
-
-config BR2_PACKAGE_LIBEST_BRSKI
-	bool "BRSKI support"
-
-config BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY
-	bool "client-only mode"
-	# The client-only mode fails to build with OpenJDK/JNI
-	# bindings
-	depends on !BR2_PACKAGE_OPENJDK
-
-endif # BR2_PACKAGE_LIBEST
diff --git a/package/libest/libest.hash b/package/libest/libest.hash
deleted file mode 100644
index 2c2804a76f..0000000000
--- a/package/libest/libest.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Computed locally
-sha256  2e5c46610f6a3c12c1916c8a84de77421a88c9722e776e862a716f4a48220f2a  libest-r3.2.0-9-ga464ba8a66717419ba71d289ef82c7b2315b2006.tar.gz
-sha256  fbdb055f98babf8d86095d6f9b9e34d2ff21a8212e442b8f18bdcb403e44366c  LICENSE
diff --git a/package/libest/libest.mk b/package/libest/libest.mk
deleted file mode 100644
index 5f93b2ab32..0000000000
--- a/package/libest/libest.mk
+++ /dev/null
@@ -1,67 +0,0 @@
-################################################################################
-#
-# libest
-#
-################################################################################
-
-LIBEST_VERSION = r3.2.0-9-ga464ba8a66717419ba71d289ef82c7b2315b2006
-LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))
-# We don't build examples, so we're not affected by the OpenSSL
-# license
-LIBEST_LICENSE = BSD-3-Clause, MIT, W3C
-LIBEST_LICENSE_FILES = LICENSE
-LIBEST_INSTALL_STAGING = YES
-LIBEST_AUTORECONF = YES
-LIBEST_DEPENDENCIES = openssl host-pkgconf safeclib
-# libcoap support is explicitly disabled because it breaks the build
-# libsafec support is explicitly enabled because we want to avoid
-# possible hidden use of bundled copy of library.
-LIBEST_CONF_OPTS = \
-	--with-ssl-dir=$(STAGING_DIR)/usr \
-	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
-	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
-	--disable-examples \
-	--without-libcoap-dir \
-	--with-system-libsafec
-
-ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
-LIBEST_DEPENDENCIES += libexecinfo
-LIBEST_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY),y)
-LIBEST_CONF_OPTS += --enable-client-only
-else
-LIBEST_CONF_OPTS += --disable-client-only
-endif
-
-ifeq ($(BR2_PACKAGE_OPENJDK),y)
-LIBEST_MAKE_ENV += JAVA_HOME=$(HOST_DIR)/lib/jvm
-LIBEST_CONF_ENV += JAVA_HOME=$(HOST_DIR)/lib/jvm
-LIBEST_CONF_OPTS += --enable-jni
-LIBEST_DEPENDENCIES += openjdk
-else
-LIBEST_CONF_OPTS += --disable-jni
-endif
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-LIBEST_CONF_OPTS += --with-libcurl-dir=$(STAGING_DIR)/usr
-LIBEST_DEPENDENCIES += libcurl
-else
-LIBEST_CONF_OPTS += --without-libcurl-dir
-endif
-
-ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
-LIBEST_CONF_OPTS += --with-uriparser-dir=$(STAGING_DIR)/usr
-LIBEST_DEPENDENCIES += liburiparser
-else
-LIBEST_CONF_OPTS += --without-uriparser-dir
-endif
-
-define LIBEST_INSTALL_PC
-	$(INSTALL) -c -m 0644 $(LIBEST_PKGDIR)/libest.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/libest.pc
-endef
-LIBEST_POST_INSTALL_STAGING_HOOKS += LIBEST_INSTALL_PC
-
-$(eval $(autotools-package))
diff --git a/package/libest/libest.pc b/package/libest/libest.pc
deleted file mode 100644
index 166240f9d1..0000000000
--- a/package/libest/libest.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: libest
-Description: implementation of RFC 7030 (Enrollment over Secure Transport) 
-Version: 2.1.0
-Libs: -lest
-Cflags: -I${includedir}/est
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
