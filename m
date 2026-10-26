Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E44606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dW1RK5xy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Mg2+qJPi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF1C407A2;
	Mon, 26 Oct 2026 19:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eln8rSPQJanR; Mon, 26 Oct 2026 19:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E00CA40718
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793041809;
	b=aqLq5rF75ZF49wpYKl0BCohGjXYM7BrdxmcBpEex+ybwvIbSi5dsTkfcLPUnyZfdEE6v
	 Ew3/3OqJu/w1dW6J+JE6D5DffXREiu1Mr+PoRHPQD5Y2OeaIugxXwVPapI7QI/b0wL3vf
	 yIUNKtFEYWSGm9vPj9ccRyoR9j0Dc8jSdR6FGG1X4gSR92CmCB0YXKSVREXBvvo0tAmx8
	 G7t0R3MZzKN2RknBt2vFGlGYXgxx0ZKYmNhTBwEczB17VYzD/JBzLVwcUIaB/647WtZ+F
	 JzwLGk/oqGIe9TsY1teRnqiwhNJhalw0Txmb9te7YDRYbCa7oxyKCIktwNfNJxTL/uQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793041809;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=omW0Pk6KAZ1eaZGFmG1D3CAK/41sTx0ZA0O+uMnYJfA=;
	b=THSRHL4vUd2ahpRWNvCEln9Yy/Kv0QiahFyQxHm2oiw3csyJeckElqGpoqsjguyvsJYg
	 T1pGBh8EqOmuKfgR9FN44Kz0G8tWMEUDYNk4LgFp1WscpBlglRRV13pnc3HUQ4VhKszh1
	 EBDaBjZQwgv17mYNL6InnGSM/X6jb1OSxUWjiD81z5SQOZCvSpAB+L0qh/XjwUFhAxFqQ
	 B2TlLm4Z9WQ3KoVuqT9m4XL4J4f1aLVquZ2qk3egbqGiSmpLXYDA1P4BwaCp6H7+JhNB9
	 5MDtoMTZzw0rWRnaTwNsd9Jet/BQSWt81jC33rszqlQeWHRjRMhwbKAv4lnlXLeQ+wQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793041809;
	bh=omW0Pk6KAZ1eaZGFmG1D3CAK/41sTx0ZA0O+uMnYJfA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dW1RK5xyQwzRXdsWvaEa26ual6aKO+JOJlnQVXe8suIx6REq55dda8BNVnD5NsTmM
	 wt34Mv3X+IIsgOFDmeMFrXMeVlujpoiVlQTH+SkOK1APo/6bgsDzifScijTVFwo5o6
	 k4sQfsAtmIvXlKFC9JtG5D/tz2DSSRqhW3LoM/CRoH+xIRXk84GhVwhurwxParQF7W
	 cJSY/s6Xjs4iQ4byD5pnPWU0JlzYDTS+DG1nyjFvkYni5jC41A7Ozwhv9sudwkJeWr
	 ZKFM2ucACh8ylYoQ9YhbRv2JqBeyc4EuPV0LK9EbzD5iFts54D+26g6Z6fSd6A+9VZ
	 v1BcFU/YvU+ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E00CA40718;
	Mon, 26 Oct 2026 19:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31D672F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F3DC400D2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_-aOUU7K_Sj for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:10:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 803E940062
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793041807;
 b=AgSjwhFhPeJ9fkinyKF/a7LolwS/xHZpjVdoQ54zeGO84jICmcafQfdRgz5GwWgY30EJ
 v/26yFWaCK+TyygVSRKhExRDNEUqJeS07TEb1qEsKG4u/EgKoafkZE/j4X7BZ5h0RsU1/
 kfND32VsgcfGYgdyCzm5Hy/jGWC3vB6U+/LiQj4hC3Co7lLHewPmeB340BwdAndbwgQOb
 fPBDuYPHS0BGXwd/WlbPpWWIlsgBJC75aQg3fsP3Gr5yMvgdL4g9pcUAaYLoJAmjiuoFc
 CkS4TI88kZxIDHJjCSylRVIXiT9Q7tVeNpFy41QgZQhND53QOToeZcMt1nI3hr4szcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793041807;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eHfHfTAyURNgPtc6xR71aM1vMNaEvrbMvyw8pU1i658=;
 b=AHfb3wM1c+2B/srTOZ6TKTRh+qX7hUvfSY0J917K+NRt+GVc4Vxw8OJUHdHPZ/P/t+R6
 y1o7zhYiFEiTi/bx1oMVdRuZB5fKUxw9RP2X0XInAlha2YLY56LZDLkSFJaN7ILHxqnqh
 5W60Gdpu/tyS81KUxL8a0iFAvYA7wUwB4l4bV1O/bysJwI+zk+FjE/OfNFi8pKSm4VucQ
 XjKxIiuVHsqNa7a9Z40WjRRnPSB1odgHTkJek1rej2XcwLzQJH2w2sRBUBqWgKeq9iyla
 vb5IN/KyzBzPl7Dv80NvvQ4GoPlpJL3lUPR7kZHJ1p2U7lsZCwlsr8djRkAbGm390dQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Mg2+qJPi; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Mg2+qJPi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 803E940062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793041803;
 bh=eHfHfTAyURNgPtc6xR71aM1vMNaEvrbMvyw8pU1i658=;
 h=From:To:Cc:Subject:Date:From;
 b=Mg2+qJPiBmLSe3t6UtHemhHRRkHV9oFvFwM+gvvRIqpGXbEVaXYD9O+Ru1X2lMMvr
 oAhBk7IwHENfRANH33yYRKgEA1ePPfbeLHc5ABvzz1T4/E/ChvrkmseJX10KRo9jR9
 Go63vBHWmUW7HIXjYTwemVSPlLfgoZMSnsEfSD/OXYFGq2xEGSp5BBsraAwFrK0ooQ
 pnC5Oos9RA17nL/o/bFHu8EVldk/JImDBhFsAAkl9AbQ2sZRrsBrkm24RFGayMx+fC
 pz1Hnbi1cO/OdDU/7q+FZ0UdSbhQ0np1hjSmL0T2+kA45cgCRMK+mRJweNvwdCJOIY
 HNjocCBLTUFrQ==
X-KAS-Sym: v3:f51bdf72230551df:bTvv1UnAsUK8VvkhNyoOBclq1Qy9jAmuiwWg+e33pxMKl
 D7faGvsHWFfLuj8EleeQSOnuoeIBc25menaEzkpQSYNWxVRysEM8cBw/WiWjNtCtcObYcqGE5zX
 EulKMDAaKbXp0b1C4B1pyrV6mH5f3MQCruy+xh8r6jmJDRxFRJCoYRmoWEXQS3Q7+OxlTwW1dFl
 c9aFlV9+SDNPZwO5W+0YEPoo2FZmCT+vSh6ilyMMb2ik7uQe3DELhHWbfr1rbc1KWxwwhV0+Nsp
 2eMov8us+HAzNt28SOVvWTaPIVvRultF3DlfqDk5XGKQ6fuJrmLYP2Kq5BCbHTZz4ajJrR3A==:
 8son+y0HlgLTPYKjWoch+U5Vmwv9W2gUrBtwUVCz7iacwtDCR2tRFLZA/T+17tuIZCdYAV6yuHl
 WazLOx7APn0y/+W1wdPyfx5vtciACIzh82BlTXLVBNa38ciXWMe2Ou1naUb/c9B9zTnm4s+xVtZ
 mNWG+bxQpioi5Wyf5HQSq/A2b5OC8SrufM/XkYJZLXbXmDCZwj1ntfvbfpZJ8gojrAcug9nmLZk
 qec/YiSqo/E3XC44bKOVt6k9Gz6d5X9MEI6vk35IgxQAKgWbqVKUiRo8G1bkfwav7s/hpcemRUf
 J6j528YeOQnDqQa6bBOOCnUH4WTOpLI9NBiVsVAdpI1XiMMIHxt3EtQVOdufuyGiLQRt8d3TEJz
 KSQldnL4D2L/4kPWdXm3kDwVPFuinXOYiBavdYQ7zSxgrrDhvnMoivnhKfy5x7ZkFUteDKoUrpQ
 fRREFR/LdA/IKHvYARArVkW4L4L29pkfIgQbF30IwcDXaPnN5h6cM7K1WvHftjtTsgZZrtATEHb
 egDj+dw4DGOCv2hrjddNYIpHDZtdK9Nf1AGT/g+BHVJ+r6mLA8b6n2bdIQ5o1wu07kI7VTi32oA
 /PnBoEY8l9uEbWmthljVRKNOmsrkA4MCfgDRKe7u63cgrEJmBNzrL17Fiazp
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7815DA4C6C1C;
 Mon, 26 Oct 2026 20:10:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41474)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLQ55-000000005TX-1W3l;
 Mon, 26 Oct 2026 19:10:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Mon, 26 Oct 2026 20:10:03 +0100
Message-ID: <20261026191003.2809788-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/piglit: bump version to git commit
 37b7926902
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

Added patch 0001 to fix build errors introduced by the bump of python3
to version 3.14.9 caused buildroot commit
1af96e786ef1d420bdb66c285a77d18df97db689 which is not part of any LTS
branches. No autobuilder errors were recorded.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-reproducible_mtime-should-be-an-int.patch | 33 +++++++++++++++++++
 package/piglit/piglit.hash                    |  2 +-
 package/piglit/piglit.mk                      |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch

diff --git a/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch b/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
new file mode 100644
index 0000000000..0a30d8bfe3
--- /dev/null
+++ b/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
@@ -0,0 +1,33 @@
+From 4c98e386fd91fa7306ba88d609748d21902c7eea Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 22 Oct 2026 14:09:08 +0100
+Subject: [PATCH] tests/serializer: reproducible_mtime should be an int
+
+The mtime argument is an integer not a string, so parse it with int().
+
+Passing a string breaks piglit with Python 3.14.9, which does integer
+bound checks on the specified mtime.
+
+Upstream: https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1269
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ tests/serializer.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/serializer.py b/tests/serializer.py
+index 5ee9a1578..f7fdadf43 100644
+--- a/tests/serializer.py
++++ b/tests/serializer.py
+@@ -140,7 +140,7 @@ def serializer(name, profile, outfile):
+     tree = et.ElementTree(root)
+     reproducible_mtime = None
+     if 'SOURCE_DATE_EPOCH' in os.environ:
+-        reproducible_mtime=os.environ['SOURCE_DATE_EPOCH']
++        reproducible_mtime=int(os.environ['SOURCE_DATE_EPOCH'])
+     with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
+         tree.write(f, encoding='utf-8', xml_declaration=True)
+ 
+-- 
+2.47.3
+
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 83c4c1fa3f..eec163e17a 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b7892506de63d4f5b62c6e5dbb0c7e0d14497cc4617f8784e4e446bfe81941ec  piglit-ec0fc2fef0755b1595c3799ab25129174a4b2007-git4.tar.gz
+sha256  9b9e1ca74351e32627c74a95ae3e18c47feb953b5b32c5c65aa2b275a5bbee4a  piglit-37b792690245fb543d9e9a84a6484d6d8cc99ec8-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index c4c004c824..24119ac10c 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = ec0fc2fef0755b1595c3799ab25129174a4b2007
+PIGLIT_VERSION = 37b792690245fb543d9e9a84a6484d6d8cc99ec8
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
