Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F373CC79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 23:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AD1A80A96;
	Sun,  6 Sep 2026 23:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mG-yD8jTo07M; Sun,  6 Sep 2026 23:31:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8910380ABD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788737482;
	b=EWuYvgXaENhlJfawCXnySsn1fiIahkxOCaIt78s/iBvXYIvI2UG6VJ4QnVK8KdgdW5Yq
	 NCyXIME1bjvlRTpz74jTPBYvS8QRivexGJSVdCSGYoYsTdtmu4WXBjsd3YNIlsgArF/54
	 rEDpZ1+hq+6KM5LKVYrETaYaorgfDJc5S0CiDV/lBxpiHfJnbbGBeiCv2IvdMX6kMxuSb
	 /jgwk0ZS/45x1k5JKpsB9BhyEvhA0E0wZbsFattTBkqj8w93K/iXqdqXBBimdznDhRtnX
	 bb8+IAcbDiFuvsI6skMkKAVKU3kUDZXb68m/I55ACssPrTwacRBgPaZhGsuTVM0P6GQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788737482;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HsSejY82GVq06jBL1b5W6IvzCxXLMjTXWwWKCBj5DTo=;
	b=RnMjWn7Gj3E3HdS93wbp1O3x+CuqBe1ldmZ6ZPVgnnWS2Nf42VYlcxU234Wi/BBjSj5g
	 fQs4enk2P/CR3sXDJ16xCYXvC1BTTvy12kst39k9e1YyLJtAhMqjySPrVS4m8j4sOmXjj
	 UPX0yIsVBYLG0VQ6NzJyrsx1+MQWIv0OSkgvZYhavqtHO0hKkcBvB30y9XKiXH10ie07H
	 2rS0iE1eVFrJpoePQSyZGKTykUfgtXLSY2nuJ42CVZF7k7R4L+qR3xou2t88KO3z9+uhC
	 30zJGZKwZWKfOo0J+BqVKa2VVMzaqRYocT8/SobDBtqukrnjHy9eF9s35+IRGxPsRrw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788737482;
	bh=HsSejY82GVq06jBL1b5W6IvzCxXLMjTXWwWKCBj5DTo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5y6OuVHweya+R36BZTM5FktMXOdE2hRA3gwRf8B1DSvSDgtFdkJa+4XVoXoQnxxT
	 uL9EGoxErqBcFlaN2P57AC+f+JcodAoVT+e7MSxZ3/Y8svsVuPzqBFUKCXBKeFGFF/
	 kWDNY2xU56DqE3iU0hz/+n9xwJe/HNqp6U9562YaNxJIcJD6dm2udeixYGHSdLlQey
	 6K9xhIiGaa7RFyCMjisBmG5td/vhjntySZssC6AGbfUIXA3eb0LrjN8hdD4E3A/8Lz
	 OCvIDNYkGwEE4lXALHlHk80eMxX8zVXQiqfAxqwH7WfkYQqGVlR8ibCAhIZOcwqDhj
	 07jZSTV89yJcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8910380ABD;
	Sun,  6 Sep 2026 23:31:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 409B9970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 326DC6063E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAFIrKNJXYhY for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 23:31:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1656C605DA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788737480;
 b=U7np8ZKlYSQGhrVGoCrx2TpyNuCQv2uYqyYejkmzXB/NnMsLoyncY0iY7ufWC2HwGUEQ
 7V1HT9nR5mUgSFIlgKMz+ti3eLOjpLrh5qydpLis2qe8Yp7BMX0n8bvw2k2suuJIcURnO
 EkhDArCHafdX7n5gnGNvOYqiaMFU3GkvHhTQAFaM4jum2xzLf6iw8zdf1oORVk1N607/a
 1FZgCxFQAxsX6xUrRoOne8DUgcE58nkT/ei5J4xEyo+LGqQeHhU/Zi4F5dGhJd1CtXqgB
 PQ0pM+HPxegc7H1eAcgGierxizUnNEdhZzsbfNckj/dgKRAAhg0d9KbfF38i0CEwYjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788737480;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=He0VsQoSuppq5zTnS5Ey4VMRc98dILxP84dK1PLnZiY=;
 b=YjisK5DwKU7TppveMbj4TTY5vyo6UcjYYK3oK5g3QdDONv9RrTlgaiC+3byl1umBPTI4
 jkHQHC7s1tvjyb/V+XmD9c7eyw2RC9t8nLW3jGJrm6wSOk1yVN61jZBe3ziR7iUwu91CZ
 /9Sa7xgvEkKSvS438NjmnmnvKSuni01olLftndxQ3YJdjLOsKsSSnPp/nt7aavx5omqpt
 iQ+cVf8EueXX2oWXc7e2s3B5MacERI8J9TjqRsSHFq3XznX1hkqXvsheeEr0XIogxALEa
 lGXLDNGvQy1n6WL5urqjY9IwAVYuu5kEldJcPd5THfq7z6d7kcKyG6FMHmGcWIJbkUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=W6pbFVpe; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=W6pbFVpe
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1656C605DA
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788737449;
 bh=He0VsQoSuppq5zTnS5Ey4VMRc98dILxP84dK1PLnZiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W6pbFVpe37DbIensqBhhOQ4XnvFH+/7xGHVjDOAqRXLyy7fYvTgdgVpbyRqzGgBqX
 +gjgmKMLP3s2SSpfftIkV0KuvJsLdwl60WJDI7RynHjTbVifxv6CdMnLIlfMkPjLvt
 gb1pbaMn7ONiDwvn8E3G7c48k09MQJg/oMdGmZ705qzxe0doMa+DQ+9ke1xqDp1X9/
 jVVljZMnnwfjyG9MY6keHEpDypOoFnqK9v42BofetNVPzCvSYTKRK3e79wQSYjad6N
 COA4S3bOIQqcAZWbma3G1w+653bsfKNnBv4SYmbcfy5pvI9yemHHyjtmeHzdgOqcqR
 zrYFYzBppKb2g==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4010DA4C341A;
 Mon,  7 Sep 2026 01:30:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44132)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3MK1-000000007cf-04Ji;
 Sun, 06 Sep 2026 23:30:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Sep 2026 01:30:45 +0200
Message-ID: <20260906233048.692559-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906233048.692559-1-bernd@kuhls.net>
References: <20260906233048.692559-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 3/6] package/mesa3d: crocus Gallium driver needs
 precomp-compiler
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 59ed1137e9bb8c0157be3dc91a1cc462211dd3c7 bumped the
package to 26.0.0 which added upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b72d347d1c3b9e829971fbdabf993b68776083c1
requiring the precomp-compiler for the crocus driver.

Add the necessary dependencies to fix a configure error:

../output-1/build/mesa3d-26.1.8/meson.build:945:3: ERROR:
 Feature llvm cannot be disabled: CLC requires LLVM

caused by
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L945

which checks the value in the variable with_clc.

When the precomp-compiler is not provided by host-mesa3d the meson
configure option mesa-clc does not contain 'system' causing
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939
the variable with_clc to be filled, among others, with the content of with_driver_using_cl:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939

which contains 'true' when the crocus driver is enabled:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L925

So we need to provide the precomp-compiler also for the crocus driver.

Fixes:
https://autobuild.buildroot.org/results/baa718e140264a9aa64c3a8f4114ca1b05f740e3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index feed6b68fe..e18d25eb8e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -110,10 +110,18 @@ comment "Gallium drivers"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 	bool "Gallium crocus driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for gen4-7 Intel GPUs.
 
+comment "crocus driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
