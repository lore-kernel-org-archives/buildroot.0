Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0931C606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R+Ygmb+9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B1C80E03;
	Sun,  1 Nov 2026 16:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TO3SqWOpwV-7; Sun,  1 Nov 2026 16:26:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DE7D280E08
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550364;
	b=GgWQYcWN0tClvCucKmlNnlXgWh3K1UGjbmShKL8buJge7Ygc0Ay++YPjA975KMOBeLY4
	 OVFFVnhTXvz3GW5Ts8Apv9BCjGdCWs2GqLUsgRVo5i9GO2HEUt1l7HDwBje+YMeD43NyU
	 5cqSB2G2QNyWo3oGUcDo92w2bxOn1tv5WXx9JG1Cb6Eqwv1on/8OcaEDBtzf6uthSsFdz
	 v++3EbZcrXSScqsXllpJFZmjKPcoVfX9N4kqnkr0k4o0efKE9psOxWWs40hrQSl2L41rb
	 DMmIJfhTQKZEoIR0bD3+GqVHhqKxISD9iULd369toZBWuFoH53vYcP5T9LK4ZSAHl2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550364;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D2qOcJGpITqBn1og2LrdoC6uJnt7rCf+Jz0jBXVbdvc=;
	b=WNPOiCTqTr75T60ucr8Blf4C/qyWqzzx1qa1Zo8VR+a3dFGdFr19xgpX9+y/UBgvauNB
	 rWDhg5iEQrqJLx6HVhVS69uTtwO8r5XWEQd56o1plGrvVX1LvvGoQ6D53QZ88OcBBFHyI
	 g7pJ7fVVN3JoOuiiXltYzpg91Cy1pPnkvQTlWUvUvkFQH754/MKM7kMpDIVDflykl4RzR
	 7TMJdhL9FSawfr26j9Mzr+J18MsqXo2BtwhAAynLGE4kVMqHcZB+HeXr2yZLKVK63MLeB
	 HUOjXjCmKgL+oeGXMXeXnEyuCyJRNMZLIRACkS7VPwSfFimhIJG2pKNlnVtsdZ5sogg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550364;
	bh=D2qOcJGpITqBn1og2LrdoC6uJnt7rCf+Jz0jBXVbdvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R+Ygmb+9iMWlU/XgCb8KCfuRyLkFaM1kaZ5YqX/b/VOWycqsl02T6VV5iLWh9iPsb
	 CcTHpm9o32j/bYTlK4cW/BwzNZhknjKbt9W3z29XJuK4ElXbD0cJ5mcGPnKNRHVntB
	 vEWqp41j48r8mHMzAirhojVLK6/kCS96ZtqA9/PtOQ5K/Wh96E2EjUR15JEzReENSA
	 sb8A7lWebv5Tz38bQdD7HyO3JdhbosJUxn6qFPq+Z4x+s6pQ1uD81XE0VCeXoWNMSE
	 AozMOgRKD136M53XmerXpD8MKoksUQa0fuQ86Uv0HCLN70IFfiPS8RRPPPnrk148Ro
	 Y8cvSpl6mg0RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE7D280E08;
	Sun,  1 Nov 2026 16:26:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 702B3323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6293F60619
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQqlaKl02UPJ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:26:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AF1AA60607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550361;
 b=XDWv+FCaLd0qxWFDTBdll2Oo72SowbE0VA0wYhfZRw5mJyoeZZgIlWnPppnb0EUrKVtf
 vvLSTuisupwlkbjQsx10LMjznatqY5eHkZExmZwjr6+aBcpGCW+ZpzjT58RkYZ2iyrjmL
 Hs1Nllrs9fsFJeBiKgWYuz+JJlwWeobHXIuDqVPuCRkSY9FO0gt8NThHA9c7LmwLguZM+
 Zf7WR5bFMzY6wS22pKgcIGKwaBi1BCpN6geQA/4obkzHPKVWJDf18lQWmYuhMMcrSobcj
 BEuwO+gIJ7qg2kTFyf8b5ij4E+aa7MyVS8rPgtOrIcSyoB0TxFw280Z6NIU5qDqEDyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550361;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9NSwKRNKZA1MBnr2/T4BWdSuccpgU1VWk4svV7Cyoq0=;
 b=VyuT+kyRC/9P/PTkpLfDWZ2IgbB5vQUKuSDE9cdWvLIhMnONV1r4cdcIdt9tMKmj3C8m
 KKrsWvOClfc6sa8fPAcr9ePJWHRs+TscaCQ8EtuPFF8VLbvFQHIsP5mdsuCLostY18huY
 w6IQEAtnqNsxAmEK192L8I/NvAqu68gPY4ca6phJXDVZY0PetJjEbI51q62D9EfoGUFIV
 aNlWLC1n3/ALQdih6yHe648O2M09Q5VuXaLzzUkXietuire4w+XsQFHGhX73m33TBoguL
 zzlme2/WpWv1NiWoGe2O4RhAah29/if4EKNf2LuKp3Z8yDbTZhE/8zgcyRchic1+i/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF1AA60607
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:26:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 548599D4C7; Sun,  1 Nov 2026 16:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:25:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3602e1ba7fd49c90a2e05f270ed2a57f472d0305
X-Git-Newrev: 626ce47f204c789aa13219c3a9fdf31afc8b41bb
X-Patchwork-Hint: ignore
Message-Id: <20261101162432.548599D4C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: drop stale C++
 dependency of compress option
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/626ce47f204c789aa13219c3a9fdf31afc8b41bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS depends on BR2_INSTALL_LIBSTDCPP
because python-snappy used to select snappy, a C++ library. Since
commit a8c315b62c0c ("package/python-snappy: bump version to 0.7.2"),
python-snappy uses python-cramjam instead and no longer needs C++, so
drop this dependency.

python-autobahn itself still needs C++ for python-ujson and Rust for
python-cryptography, which also covers the Rust dependency of
python-snappy -> python-cramjam.

Assisted-by: Claude:claude-opus-5-5
Fixes: a8c315b62c0c ("package/python-snappy: bump version to 0.7.2")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index b32463d1b1..440e18d2da 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -20,7 +20,6 @@ if BR2_PACKAGE_PYTHON_AUTOBAHN
 
 config BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
 	bool "Non-standard WebSocket compression support"
-	depends on BR2_INSTALL_LIBSTDCPP # python-snappy -> snappy
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_SNAPPY # runtime
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
