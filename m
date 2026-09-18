Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5FCC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7968A60E48;
	Fri, 18 Sep 2026 18:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yToX0j6Z64I1; Fri, 18 Sep 2026 18:53:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9BD5860E52
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757585;
	b=fq3oIGBR3VounT770CFNekJLkvGDttNqws8oXzejxxYjvEJ/99ObT6SNQBoW1vn1Efl9
	 phaboNP6FAFd8GfafxsJe4iSHwSKIhJ9TB6moiOJyULkWVShn6TpZ0r4sL+y7IpCVNBCj
	 o2W5pBMEPB/bx7DPnx1dXfipzedQtt/kVKGLHayNOB3Tm1ALsYfaBlsboqoRM1X8XxOra
	 BsCBoRTpmxKRgZ2ZeuTwro/hYTbnaLwtIHymbllwKMjUid8VJc65K/f9uQslyY+HmrzQg
	 Z1bwCo5XtE0V4qDsCbDzmTZWwtVirUQnBAMDuZpuykU3xteDiQ2mBN9JEt0gmFKrTaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	b=O8gxSN+HhxZ+wRJ6/HDWD6SmUlxje9N7M53pF/39G2gb+boyyGCAo7FmrRQgUDWEMJs6
	 c69d4besQ2LHB6gMc+Lxxkb1NckQN8o9RZ141ifosd/fllIjR05PCIVQZ0jipYVw7cW+M
	 xJQ+PPIb/HvL2zIrd4gShi8/w52R+63cb+9mIdwlmY0vm3xW4Hfe5j+As5NCkNgv7qJYL
	 B4Lm5zevs4ioz187jjg+Ey4X1mMpP5qna/XfsEjIqJS7u5RJo3me6jCQDYAgukafeMrEG
	 NgSHlEv26rkdon6Dr+iAMvvTHYl8Q5yWkMBAooqaCYnqe5UIx+qgpvbrhbfV6MgbY/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757585;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A2fossFViiqCvWTRKCD4+yXj2Ksdos/E/Ivk7mNdpl87qwZYOSud25N3qkaRTPf7N
	 KdkOmqk8JI996ixjdUjq4qqB/ZnKy4R+Ey4RNruGFE7xIJ4NerOkm1JnzBWn4j2Cka
	 lVcoBoaLbQXKBK2+6eN9jNMB3X8cFLg0PFHL+bU0eb57do6YOe7oZL8VWMi8YwkJrQ
	 6f3PT8ArZ58Plo921OkEUQ4jp9GKxdDgHUqsK/r7EMsNBWEqxL7X5JsCJh3yr9tV5G
	 WC+Y+5gvs4Ml3ygirX14lZH3zvzyJsZWBsjSPI//pgC/dFo0SZOqK0QYc1BkoTYJpA
	 QeudCupLLzeRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD5860E52;
	Fri, 18 Sep 2026 18:53:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5705E13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54F51400CE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZ3qEGPdXU-a for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:53:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 614484006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757583;
 b=Fh/WIKXA+Xe/Sdi6Ap4FLwfV7L8ScVdzX6o5foDgUHZc3C/3V+rUCnG1KtVQ/IWuvhN5
 3dCCXBSNrqSMb/LBDfE+T+E9/u3sy1GStyQSWmNO1O4tM44D4JLfdfZACSdZM9NJUPQUg
 zykz6+7o+PbOIhRzNlKHbxCVEg9d4zZ2oucWBWJlFyd6VeUVx6QVikabCsOZvta4uluy9
 S3r69Y4kFg/X5WhdF7ztR/xcU+UdNWSqBJMYdiYezQYP0djEXUYhcF5xVGOyeEsdoAChf
 03HKxJUQYQvwvJAhN/Khobm64U14bKYs44keMEleQ6bU6PLjaaArdU6c6lGv6w50Q2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757583;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 b=ZjWv3LhYaN2Qw+C0Zn/dnLUMY78oZHHTwiqOqivl2oMNkpPZwTkVfkscgJgMXfzJ3B2W
 47z0dP4qnv/RsAN5QYLaHT7YQTfHc/r2jonYpxwdKdUFCzZFedN4F6GMIxn9OJCAuZjF9
 fs17BVFCT+XsM4fFSd50a3/YyrEVHWRfDG15wsFUa3mPnMko3uL5BGrzfGuPrrd0GfwVT
 IsvbNgXfFihyixOxbKkVpaVXkj3s+6p4kFB3XYwFiER3w6/r12rxgmYZkhbQr6hf7RxEY
 SxI/pyA49T+7aOC/wNy4gSC0wvdBos+/EkVnMZlfnFdLs6wDTGZjuzw1+CXF8Pf4Vgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=N5AZwRxL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N5AZwRxL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 614484006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756941;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N5AZwRxLAoZ6n3A79XA/clMW7UHyS0jPaRiGYk5fHI5KhBFafLlW2SIQyRD5+jr3j
 CNOp6G1nZO/eu4xkCojKWke6Cj/PKZqDJ5EFT4SpDpp2wazbENHHTpBa2lNlvASQ1R
 tBGeNDWo48rW7XuaO6CJ6+l0nnGvyJicqFpl3wbcR+UqO+YKiYOwRP4+hM+H/9mjzN
 rq6iLeWWgT0A5a/doxEbOnMDTflyFrkciDGvVTdry/FplcT335JuyXR6SK7Om8urmm
 +9loSDXJ3wD4LRxL+y7l3S5VQO8RUiP90mM9J/BJHmuJjFqZpLkHgdcVXEjsXLrDCV
 QqjyIY96Ewj4g==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:ZxVPcukYN7qQl9HpgPO/Hw0iBtk6//ocNY4GvYaYR1Le60frGNzQK6aKanhPp9dUIQnOchpy/DihPOgKPULUPYwedW96Q0d10JTDGUOrF6bRno5EIGxmXAj5Nq4dlRwByIlWbLc6DaEm7vtvSokmA+hIr6yWs3FtE5L91J+rqMppFtNvH4gobvjEnOR94yPYzRRkhaZBk0BgLL3mzYGc2PZB1TRcaswNnfw/gy2HOy94R7sPCSS/h8eJXnjqoxHSbM0WxCwrElp+Hs1eyQzLw8Wq3z6pXpH7dcLPRVxgPSChm0K1btg7fncmee3fF0BmqPuJEW4MY6mvgqTX0/S+o6ZMzCVmiGmqJs2bQQPW4xTn2B1+NhJQSsFa8TtbcAAt7FWa6wYbaEd+kCKUU8pFiP8tr3plI/8LTxbjQqrEKLYX8xhzRTO1xEQarAhRkYkg4aX9SWAAY8S4vBwb0uKYvqJShFuec9bQoqoDNa6i10Dgk/AYrTn/a1qMKUfxx9VUQahkRpVIv3z8natP8zjF1Ey1JtU5ycKOdlOth7MbGUGWVMBH14FZlEquRNQOFKF9oFlCvw1Ir7gf4nJuJK/rxKMMAL8XkhB21nuR5/KfPM5cA+
 hNm4/KSsj6SMdrWZhiHhzXey0VvGEqSUrYNu3od8x7pcfvNd0SHvP7jSo0QWcQ5Ac4u9ZbuEKTQp1ZUsRxMUkJTamgaj0avha8yooEKKW5N5mIM6vGgfo=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8ED8A4C473D;
 Fri, 18 Sep 2026 20:42:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWw-000000007cB-2OPA;
 Fri, 18 Sep 2026 18:41:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:07 +0200
Message-ID: <20260918184140.3631274-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 45/77] package/libesmtp: Fix build with OpenSSL
 4.0.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
