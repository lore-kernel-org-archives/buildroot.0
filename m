Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC917606A326
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nMtb0ukB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=QrjHnQiy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA8A34058C;
	Mon,  2 Nov 2026 20:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGmDbbQejbfc; Mon,  2 Nov 2026 20:13:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 843B740582
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793650390;
	b=Ast5FhoCY1mt84lntEx1yFXorQdDxsS33Coj41mjBlq4yXP6oqosX/nSUi0A32Q/z1fK
	 cmj1YCiSpHMrLrDrgclV7MWknkaX1jnDVpL59ufHiI/V8yUM/T6gs3HJ6psp53kkLi6LE
	 ALB7OP19ye3HGgAev+XvUfb0767hmuGq5KoVD/B4YlwZEu52QyPgAhSGoDUul7vmZd7eQ
	 jxPz1iONFirUJ8Lbr1VXl+Y63wuaKc7o7NMHL3xrDgFkcnx5YBfurfcJVRE1dLVbamxU6
	 2ahVtvW13wTo3jSs6eD33BDEOjfZyyIS/mjVWPbx4TETVLyDHpT0XjeRZEFt0Rth0kg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793650390;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F9K+nEfoZD+e3cmgHD1fu1l+1JrbhMFPz2ZpI8Xn+Ec=;
	b=AfWxQFO5YbZmv4cv864/WQLkF/OQIeQQwhJXIAaqZI1JiyZufIjIv2zQ2FV//8uLfCl8
	 7KUzAVW9XS2Qwa8ll++YcPBfwjuD/13UsKpmrPt1wItrbOUeQR7N6mkeDVDYk5ZqWHtfv
	 WAfwHAX8jv01b+Ab28s5+Y3JV+OsNnW44kRFS1SZidi7YVNQnLCTlDBGqBPvms2EOizqY
	 SZXheYyP+GcME0dI+L/iQ7k5pXPMj/iCeDuI0/7nq5O7Q7i6wDlHJWrXcybeai6qQ20jR
	 tu8iH6Kd3a1NGxED8RpbbkE/pEDa1FBL2JZMezPFxjQDCAIN5XziRRK3qr4zG8SUp5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793650390;
	bh=F9K+nEfoZD+e3cmgHD1fu1l+1JrbhMFPz2ZpI8Xn+Ec=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nMtb0ukB3pHvG916N4fdkhAA04OsEsCNSzNxm9hXODIWeWBxC467Y8kDGFeFAGqVY
	 ENFkKaL8SFZG0NVnQnbhIiYZXAinVNblwdT+FwOZZBy/V3bxZSrghu1zk8M3QKncqk
	 5+HVX4/GH6nNL1Y6mKShc3iajRjvtq9u71V4IZOesGd0eHmg2Rl0BuoqIfuG4fhePg
	 XEcOiP11TiGWgoow5MNHmM5aAKGJhtGagN6bKbK9cg8wdLmpTSCgtJOKiXqahzp2wx
	 56ZWM3F1/TMySATsAD5EEy0uxSMBl1kfh+04tdrCVIErfwQCx0jj4VrSpb2G/AOmBW
	 mXIYogwJhqNnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 843B740582;
	Mon,  2 Nov 2026 20:13:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81F48356
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73D6040218
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnN1nWVbUZZk for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 20:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1A21C401B9
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793650387;
 b=PjOiLF/5ynTX9cl6emydC+UvLvhdV/mY61A2n+yt+x1C4IRfERaTD++BQWm0wgE7uJn6
 WQtg4tKkxcxjy3Gdr8PwQAx4AFMDCpTWtxpoSBcQd+WcjPz5UjiFyimh0W9fAQUe0RAnc
 bk66dklLLQCQe1/piqla8zkYRiZ447Z1OBOtaKxfg4xadaRpnYvYtx0i59jrxnLVJwHkG
 M5mZt1smcCyrd2g5QtOHww4pADgInJDqSUzamzV0w8DA9aiVipx4QT+gsmnhrGdZcN9B+
 BedglGZ1Tt2QDJR9tCw44IBfbkwoMKUgrB/ZyYr39p/q53Lg9ZDcXrw7HMvcshnUcQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793650387;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qd+pqB/FN/IicGGIL1HEBPDCE3lp4PJWIpIK9ZkPe1E=;
 b=EAhLhTjII8DhBKbjietQnVGcIIel6Ej1g6dV25dNNef/Hlltu8+pZ0ztyG8mYUSu80vc
 hXh29Rvha2nK2Cp+5piCqEF5C7QOPwVv1bSPFG6z++C7jc2SR7CcWF1waxCTEE/s18m0p
 4acH4/DXO500iKq2KjkRJ6SB7G7OBBXk2HNk/tl+SVt9Qzatjs7b8u6FNHemmjnoWu0pf
 vM8V4WKeaiKzsychM3VQ78+pltOAdqCSjSqXKGbyX5bIZoxNB2qkOjaIZlXEn29WMigb4
 uphEWarddtS6pl2hjLF1sXGVVUNFgs7wajJSJWQOtui424QRPzVR4ydISjNi6nb3QBQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QrjHnQiy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QrjHnQiy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A21C401B9
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793650384;
 bh=qd+pqB/FN/IicGGIL1HEBPDCE3lp4PJWIpIK9ZkPe1E=;
 h=From:To:Subject:Date:From;
 b=QrjHnQiyMWNKROvoHw5xytxBs11I3meUZAt6TeX3Ifvc/a2mOQmtblNm4fdGxChqq
 5v8fvRFklz1qoidAHkDlACBHrAdasAquVsPtqCZ+wkcG1MGis6JxoIP5PYFW/eB+l5
 MdQIdgiYwP97N4id6T/QCD8U49d9hKuHKWJRPPx7+Y9EuZ95ZOUEpeC3OgOlzWwOte
 ywNEr8wwYcaXhEdwu5z1/D+fSasroSpQBRvPXwSRNKaNxtjKuf48dlF6Bo2L3BYiJq
 suzJi7umT6eUdsRhQe0PiZUtIpw8ZcMhmcPvn35c+tYY7QX4siFd0Ymc0pU18070dv
 T6bmxGeuSbOtQ==
X-KAS-Sym: v3:f51bdf72230551df:Xp0McvTuVdI6xYIdn/GKl0xgZgA8qMiClKkPsmgM2nlEd
 mNlzTNzUwPMGiQJM3Amt1M7jy9O4UxyeuTrCmaENZ2RuXHEqk3UlRPpaHqVjOvvDio62Wv+6baJ
 /zOy+IzLLpBhVH9QFGAQ/5soQATJQ66i1SlM/Ow8xPk1KfeM/xaQaxQYj1RQ4upr7W16c1TzUZ1
 S7l1mR0v0ABdXjCR3ayIp1oM6wYeyXZXgBBIC0kt5bI6/x/ZIBP+eVo6Tp3qLZAiyUpy15SeQsZ
 ZKYVSV9FEU0f8iymgrD1P/3+92olV5syCYrQUhimgnV8GjdIQsiW6DK1IOl5wq/SRV4wP0XQ==:
 4oFxYuSTD053D2SZ6CE8HQaW6/spOVqRMdgQLKU2RWJa1Tf866FrDYEzQbCP9tCYVspmqUNciW+
 S9O5wf8dsybbIJlTrASk9erGfq03D/Lb8qo6T+SxFCt8biHm+orojV4y+yI7MteKbanCL85xYQ8
 0vaLLITGkNHT+5j+IA8I0f411cZSdU2iHGyGRs0Nu8Tk/HnklTpqPnWhf2XLK9oOEe1mt4iOZ0I
 aKdBOyLnroBfRiYT6Rz2/UyBOvyVTNpwkmw8a0DRyUPD+dKZ64abtGtZtDj8yGsPbgXXe33w+/E
 2ON3RZtIX76E5vsPzYwubPq/26Hqs/l2otHeGm/Nhpf/LUgYb4Hbsqe5ZDm9grwA7NKYYm7WHIb
 cxl5t53H7OAtq9AjTpQItJJYY8IMKeAQGUUt2yz+01+qPDIt/n2CzlfZSXqJhdsHAm2SlhbyEHz
 iRnUJPFXBWvc4xfaIaJt+1iMLCXXzsNncStTAXzJxMNxM1gdTmpDmm+DGZ1ACL8L5n03kEC+E69
 Jjt5F98NjvQ53MDrhavwzibAHhm0pvfXdvUOlSe/RftQmejKS4O2k1F8IJYCxE6Np2XUEvujGwT
 QtM=
Received: from fli4l.lan.fli4l (p5b3a07a5.dip0.t-ipconnect.de [91.58.7.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 800DDA4C0C91
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:13:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38502)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNyOu-000000007Gc-2Dz5
 for buildroot@buildroot.org; Mon, 02 Nov 2026 20:13:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 21:13:04 +0100
Message-ID: <20261102201304.11851-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x series
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

Update the latest kernel releases to:
 - 7.2.14 -> 7.2.15

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.2.14 => 7.2.15}                 | 0
 linux/from-6.17/linux.hash               | 2 +-
 package/linux-headers/{7.2.14 => 7.2.15} | 0
 package/linux-headers/Config.in.host     | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename linux/{7.2.14 => 7.2.15} (100%)
 rename package/linux-headers/{7.2.14 => 7.2.15} (100%)

diff --git a/linux/7.2.14 b/linux/7.2.15
similarity index 100%
rename from linux/7.2.14
rename to linux/7.2.15
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index b39e09f55c..3eabe22c9c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
-sha256  bb1b871ef95a8de10b3f7b7baf0e0d754abbf620f804b6caf860f226aa97647d  linux-7.2.14.tar.xz
+sha256  d0f6b1d7324c937ccaeb5c4ca7084bfcf71db2edb3e2d3a31f0ad83a681809ab  linux-7.2.15.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
diff --git a/package/linux-headers/7.2.14 b/package/linux-headers/7.2.15
similarity index 100%
rename from package/linux-headers/7.2.14
rename to package/linux-headers/7.2.15
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0856a2a211..2080c909cf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -488,7 +488,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.14"	if BR2_KERNEL_HEADERS_7_2
+	default "7.2.15"	if BR2_KERNEL_HEADERS_7_2
 	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
