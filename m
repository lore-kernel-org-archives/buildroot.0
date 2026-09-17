Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1DDC982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942D180EF9;
	Thu, 17 Sep 2026 09:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjCFknuqSIf6; Thu, 17 Sep 2026 09:00:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1DF6F80EF1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789635651;
	b=V2Chxriqs5ylC4dOYYDw6z1/hP9qJN16kpLxQH3iKGAPgNGz0lKL4VYgzbwpEOuilSHZ
	 Flm8joNi3i3vrGk3/1lTkSQIRRczF3eim3DsOYPGijSgkgLHmtg/fBZiyNSnQivl33l8F
	 syx/O5kJ90uh3tW4DM54r3EvRowNbrcM37OojuZJZz6ehtxDeo4EgpRg1kj8PQp94aVPw
	 1iBJaIxGhCwZGN6mQnj8yNUXhfVulEkbJLtasv6aGq2okz4iQMg2Yisu+fED54S+CmS7r
	 zq+9QS2yY631gRf/uLj7ey0Awzh0n9j0a/SSS1yeq2iYW3/MB+/sppzet3iBEEnvShQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789635651;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7DK1usQcJOXeb286NLAnnvsjWcpBOUv1e8SRYcwYvd4=;
	b=kaajdNhnH/Y813Y4cVsy4gFB43kT6RyF3rLqzzrpq3LwAVsCxEbuAXxsB5QlZryPTUhx
	 dKnXJOdzMGRHRqUhVnl+JcnaHhghvh/KEa3dSRGXIhG8lKXXkqV1qFi7j8yjuaYR279uL
	 wIB802kKuOPm41kLzjqZEg/EhXFZxJzES6sgkTTWwIBZ9zrg4iB1yYkAratMTM3MulPSJ
	 YD4jzTnz8lk2vWxhl9aCGtXGhizzwYNA0yJGm3hYkktjavwBvIT15+sueWVkZ5hMAaa6O
	 JIC2c/CGAA3kzPr2Y7GQXUrwwYVWeF35N66PPeoJCYFY8IBF3YuZJqFBq6ZaetQ7CsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789635651;
	bh=7DK1usQcJOXeb286NLAnnvsjWcpBOUv1e8SRYcwYvd4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Du9yfa0hNJ2yRTW+weg5ZvlVN/kQUqnYwv2355RF/y24dngiGuZAkKISwdiGwLI67
	 ZdvrKfStRMd92anfCPS6uu4z2H1ogDzYpZOVBYRNul8QFSpp2gs3pDrr1ofnoe1X2w
	 cSfm7+3RM4gg8Q2wzQfEYvUqtuDbVr9PePkxRkdlY4HDoEdy8UXZMGqXKCNSFgaZxC
	 ad9OZAX0iL7qIvxXnbs3hJGvVavawXx6OxDTRRH/o0thI6qaXwoWrO6ogO5OT8LZOZ
	 tI17AcrmSmHa+ioHNFj1IVeHqnpS4FpQ5lujvPL4AC5aUhUCMAA7yjXLwvjuAJIqaw
	 qwVvxqOXGEh1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF6F80EF1;
	Thu, 17 Sep 2026 09:00:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CDDE2EB
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6A66400F6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUJfoTYtQhVa for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:00:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A9609400F3
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789635649;
 b=nT9+t3PUcBVWIYik2cUPmllwb0zS8Xo5S9yZxh8HDmkNrXGetdthJQ6FALlybV7RMS0U
 KUdyX26qzrsekKu4LH7NljlLsaBI5Apw3R7QFaAl6sBO3oP47xedszoinrjbdsKOxpIkD
 TjI6S1E42W3AAwfnrsAE8qQexj8f7jq70nyGFGo6KPIv4/CsPGtMLxU/p/Wg6eZZ7BbiQ
 YLC1uYV1lTktkL+8dxxWN85KSWImS+FUIpkVMymwh729Rg52FvDqmXhyDDv8HyO/pCl8n
 1powuqCdt8wSAq78Rwyjn9VeT2Mluu3XS1VqFNaMihwsrLeL7PGRaj5tX2vpNWuAmCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789635649;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xanQOWWXQ4e2I9cVbcP0w89VSBn2LlKWcrVgDt794kY=;
 b=PSfI8QUCF5GQROfbwbVU7Q/Kg6+Ibr+Zgu3GjzVRYETxF9rzihqSrhdnZjiUMsgDCExw
 7ouKVCP2oQb42S+zBiDRZ1oPD+BQYpCZ7qME/NhjLjZUKe56qXOMq3yfNahWSNoS9Ewdz
 ayfLX1waVhy0BwkbeHwcoW+rPYmVgvATWfU/Y4S+Qhty/Jo73AfZnJcOO1Z6cAaToZ+q8
 rjIHzW6P9NSbKhm5w8PigJR/lvfTPdcdz2eweG3ZqOtnJ3zH5zOsPUIGoxsm7UcxjrDlD
 l2f3u9DbhdK9aajb/T3Ycoehu47kWn8Cg8AaXp/TUA3XbvFlcSjAUI35y2P61RIdZdw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="P/mSUD6t"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=P/mSUD6t
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9609400F3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789635642;
 bh=xanQOWWXQ4e2I9cVbcP0w89VSBn2LlKWcrVgDt794kY=;
 h=From:To:Cc:Subject:Date:From;
 b=P/mSUD6tXkOlafFSzIxvL+4d5o7EYVN4O2KBhNHhZeVaVF+HlHX1VoxLPFZ9mb4H/
 /qPuE4XgYAtSp7dbTIP2qKMazDimpA8d1JULNux1S3Au1BuW6hOOAgGtlcJ8s6a25D
 hcy1NVoKvSfmOT3/f7XDR1vFFQ88uTrjJh9lbvrqywxZjjZgRkU779fkYVoT7AVQAb
 5zgRIwQWWdouNIiPJmydHJ6tZS5/AOFjcxKVBAstHpmnBfn6s2wEbXutXTZ9YVlpAQ
 0EyH4wER6oJizC1Oyw1s0HpSl3C9OVEenNfEWsyiCuK47pkyhxDkxmm0axHFeWSSvv
 ap7FHUP18jCSQ==
X-KAS-Sym: v3:f51bdf72230551df:XSG29cem6io+n3L7ADQM3pzk/GapZrJtV/08QtbBSYQ3d3F5HqvvOul2pLaiIPswLhmRGC+HaZLpDpuf/XhggvXyK6DG0KFtj628xO/FAERmZuEIaYISXfQiEglw+oXF4uVvC4gZB9q+X1CfCQKpR3C73z1kRmz411Bt91ot/O37HdZMO70BKYRiVnFOzQLIzA/go1ukxnhrjJOEMzl8zK0h9o1glktj++m/c7Lw7nuNkyfGYH1CfCujSDYOa4Zj4dgxSOBgq8qkMPcnnsDLZqn1mBeks+STEw6FUmNbgV9luk56GYENMMxNTcMQ83JW16WPgKqRT+qrp3TbFEfBbw==:Z8srybdlkuA6dzMOjWwjmuqPYuwQyGqnsM0OU84TWzm3dynyo1fsCtcmc6DhHPN0q2DVzgpMxRbnPEnWp5+0QVJme3e+SbCFSj1snZXJn5rgCxxDH5tHHK9Ez3ZNt8sBLvewcrtwQQtlDPHD6H7E3UfXm0Dh0wD6NelVTHOJKm2nl1x9bTMSYmnxPbs3cSDsS8OqystiU4HMmaEDJAOUHwIgTZztdghysLp5P7JcvTvnpwGQpdHj224OjSyEHynlGtJzCzldh0dcdKs4EZ+Y4J/IKU0usRAJGTb3S1bOiyD8WdqFNpWdtST+WAhqnbhD6O9jrhE4SCMEVCdlIrCTfW2+el7wy5tHfg5KB/6KlyjjhIK5rln/sPkXOgrkKYJPOFI2OfrEVlKa8SwDoEccfi2oj7K/sa1efLPO2cwqQpNw67isE5wcE2+k2JQlyLjS7SG5ImCwocNciAjOzn13Vni2UFFf0wSKtUCF69vQtF9YPCQOOcuKvV2oQZYPStPQGaKfkjyogG6WO6FqahO2bRx3i/bjaMBbGyt7ux6ImIVuIihkn3erFngC4cKulPR9K5TC3O/fRmFjDwKBvn2NDkvwf8y/AC+m87KMSzVKBBw46n
 6NKQR/g3s5j9BomklQl9dg
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62257A4C41D3;
 Thu, 17 Sep 2026 11:00:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43488)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x77yz-000000005Jq-1TaX;
 Thu, 17 Sep 2026 09:00:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>
Date: Thu, 17 Sep 2026 11:00:41 +0200
Message-ID: <20260917090041.2009425-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: add upstream
 patch to fix build error
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

Buildroot commit 8af3e34fd4a085ea7c25291e50d81fa1a69d9eaf bumped the
package from 3.2.8 to 3.2.10. This bump includes upstream commit
https://github.com/FreeRADIUS/freeradius-server/commit/d8b95979c710d4e2e3f1115245062fbfc8e9ccba
that breaks the build when OpenSSL was built with the option
BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK disabled:
https://github.com/FreeRADIUS/freeradius-server/pull/5874

To fix the problem we add an upstream commit.

Fixes:
https://autobuild.buildroot.net/results/bfd/bfdf51b3c28753a50b9cd63d75388ee6000b0444/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...hecks-when-not-supported.-Fixes-5874.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/freeradius-server/0009-skip-psk-checks-when-not-supported.-Fixes-5874.patch

diff --git a/package/freeradius-server/0009-skip-psk-checks-when-not-supported.-Fixes-5874.patch b/package/freeradius-server/0009-skip-psk-checks-when-not-supported.-Fixes-5874.patch
new file mode 100644
index 0000000000..3319118b94
--- /dev/null
+++ b/package/freeradius-server/0009-skip-psk-checks-when-not-supported.-Fixes-5874.patch
@@ -0,0 +1,37 @@
+From 7f2a41eaff5a58cb0014dc2fc95438b6a0a55ee1 Mon Sep 17 00:00:00 2001
+From: "Alan T. DeKok" <aland@freeradius.org>
+Date: Fri, 5 Jun 2026 09:55:00 -0400
+Subject: [PATCH] skip psk checks when not supported. Fixes #5874
+
+Upstream: https://github.com/FreeRADIUS/freeradius-server/commit/7f2a41eaff5a58cb0014dc2fc95438b6a0a55ee1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/main/tls.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index 3018f34cc0..4f4cd0c280 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -524,12 +524,17 @@ tls_session_t *tls_new_client_session(TALLOC_CTX *ctx, fr_tls_server_conf_t *con
+ 	 *	if we're doing certificate auth, and not PSK.
+ 	 */
+ 	verify_mode = SSL_VERIFY_PEER;
++#ifdef PSK_MAX_IDENTITY_LEN
+ 	if (!conf->psk_identity) {
++#endif
+ 		RDEBUG2("(TLS) Requiring Server certificate");
+ 		verify_mode |= SSL_VERIFY_FAIL_IF_NO_PEER_CERT;
++
++#ifdef PSK_MAX_IDENTITY_LEN
+ 	} else {
+ 		RDEBUG2("(TLS) PSK configured -- verifying Server certificate if presented");
+ 	}
++#endif
+ 	SSL_set_verify(ssn->ssl, verify_mode, cbtls_verify);
+ 
+ 	SSL_set_ex_data(ssn->ssl, FR_TLS_EX_INDEX_CONF, (void *)conf);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
