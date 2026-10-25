Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF6606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 19:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DwCCqGTM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=FqeZu0qr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F061E80D4F;
	Sun, 25 Oct 2026 19:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFG1EQuPZLsQ; Sun, 25 Oct 2026 19:49:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77E2C80D3F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792957798;
	b=CjcFMATtaLdp+mOX0o/m6SmI9lviS2+w23r+zn7J5afPDBHsyaz2MmYieMenweEHQQsb
	 JiTePf4iN1TDow8p8mhMotScfx+rK+bK/wlhQGlZzurONwZtU5BWYZZvO8B/h+sV9+uXM
	 cJp51fvKVMwpGjFicHONHktXa30Uo+00jWGCtZssIqrLh+2I0zeTsQSN/32hi/uC76Y17
	 x9tcV/OC+jeVEI5IoxqCgvYR7U/m/3AdvWSCULYEz97s4odLM5rQQeJyLHXUovBKW2sJW
	 JyGvYs8VJirymdCslkNwsAzWsQQFG+a01xsPW5Fp0eJBhujpZMTpJOqNXWh3Vje3NkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792957798;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xqIBVEc7kmr5cWMEhpMZfGHEXM9Gl6X6P3CokWgNLK8=;
	b=S2RjNKXDJoWcN2Mqfac/0Pjoaz2QYTNACyEUDzWPv0oIgWbne+PfTEBUWC82Gp9+OLz8
	 NQ3Xm87A3yE09ozLklURgdqCPDf/O1rBukP4E/TCt+fqhjogDVSlH1i66x9l/ZbhJ5d60
	 ehstyys9NbDezNYjiPFTLUoTgIqwmFVdeudlIVKVvHid8nwYotoWBNoiPgzk5sdlkJNwX
	 cw9O/Fzi3XmDgfTCraUmJfSwPPyXBgJikjUCsUib/9+OfurHXEE3kIWEweTJr0TLl+ANS
	 02cprxrDcbzmC2yvfB1QWq+iOAh3MUBuXoND0oXt4krbdDX0E7tFCREQZOBl6Vxua4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792957798;
	bh=xqIBVEc7kmr5cWMEhpMZfGHEXM9Gl6X6P3CokWgNLK8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DwCCqGTMsOYBQsFz1ADu7EntJOdmkC3GuY+4MRvMT5I5H8Uv2BYQAEhysnZMG/Zor
	 +cQyIfVjisKAIHmmSr3VGaoGxaH4UrTL9oxX10g5jFGvj1tVOaXtWMIFrD9j1qmuui
	 XLTTob4kI7Hx1SxBc+HYp00wdJrL+yc0/ctWa1Ug3lljEUMQVq56oloVxN2x9PubQc
	 f/4GXXtZkzfxaiXj1rQqHuioMN+eGvNiuqBceQGSTKnmU6X6fQoEVHjE17f0cQvfoB
	 w9tgHTOTBkToUnm22cGReYqIMd+bJrj8j+uW7C2hkPWnKGy7WMk7D3gxg72T78LUIR
	 skpdwrvnxeY6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E2C80D3F;
	Sun, 25 Oct 2026 19:49:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A814D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 19:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F20944008E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 19:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBLzrYVkOkvO for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 19:49:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7383A40057
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792957796;
 b=MSaw7el6ReJg664ra2XRNQs84cNC1+mdKg9LTSXlKfXr/H6aFGRlnqL9K+By7zLFARLz
 /lpFvhpEr6JO03Qh/bm03jxIXyZ++uSq3UVtEriiijwgZ9DO6OhPoEyUXE5JI0ariSRFc
 qVwA3gjhhDOKnSZ9nPJpTRKqEzXWTRxL6ZxUi0FSscRbwxdYojncjS/1XzyZiIH47ELw7
 al4qbDdF2OqfPZ2dHfrR+t3miqXG8yyr9N16nRjLKN30ASti06ZqMTAXKr1DsUd4+R7ba
 BeoGlSZF19v06Sa55WZrp5bxXu3owwB5qIybkag7i3Rsk3caCB9Gr6BmCbTefBRgJBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792957796;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dmiUarXFf/aL0lVBvvNbXp5rVnq3kXsYXHovPuy853g=;
 b=cvp1qtYVMub07RbMjpjphJBqDijMjiB59jfEq/ZMaaQPrnaFXUKKUfhFkXQ9c4onh0fz
 ZfRQDgY8PDxYU+XGIvfOwG4LxlTocm6v7jmIFI4IQ82f4znE0ad6wgY6Ry10M1n7GGVEj
 XtkVJI9ufqvkDuRW5/6NHirxAUbQZtkloDZbmce6QIbfTl83pX5yJ4UkjiLss+DQ1apJa
 jAg9VlByYQpkK764Dq4dRDeSxtjIlof2iqHoJ+Az7G0DPzptRVMfeM2CnSkgfk/pGJEqI
 HUbtSCcbJf2FIG5KqDyVm4hwCr2jPqfwY4VVRLfJg7QItSfodLxbzrHheCwwV3tObEw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FqeZu0qr; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FqeZu0qr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7383A40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 19:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792957792;
 bh=dmiUarXFf/aL0lVBvvNbXp5rVnq3kXsYXHovPuy853g=;
 h=From:To:Subject:Date:From;
 b=FqeZu0qrgiiX9xcTlTmBvLEltHqQ5mqIzx0TpPYalehOywVu3BNOCK04iR7UwaIB6
 aH0Q/QA6V4jCPmGdFz7IwaEFOEkiTGFG70z0LZzoTOSB8GDX+RISBl0KQ04Jtq7jL4
 mdkby9/ilC2zu/Fp7Cx736oaSHMNOSRd04XFSxp4b/n9GwS/eZ5GtcBqdPpQk6cZQr
 vy4mxtqhbOhb73cJHPoo8+rQpglRDjEjZQCBVwQd/zQpY1xl7AfwRpyBXEuL9MkZvG
 j9cvY9gBQw2ShiyY/EveY9PKeKKFwwoNA+zvL80YcmvPaZskmd/tISQI15TTibtpNp
 T7o8/exHz310A==
X-KAS-Sym: v3:f51bdf72230551df:LbOyp7vIz73ICLQvXakUWHp8jaf5xNzuU7rhdt8La3XRr
 b9EiOMCXVHDqaYz0KIeI9XWqG+GYHVZaI1VshivfKZIkg+pFT55QpKd1wEnsZ3kMXS9/wytMRjy
 e1I7nnJuGjfHfqnkcbPrEZwCPbrcFaMNdgWIbgiiIzjKjS8Nw0r/HU8PkNQg00qvTfOZiMKAICS
 FfY2+DWbJpMUvr/BZxMUDe9Ib/O3l1Q85aLFlmy3mH+rLE+GnfEHviF9iycxHQrdEicpwKMLXFT
 RS2oRqEpzuUBzfTvAQDMI9JTI5Z0o4Jm00LxHXD8w5e4WoHiWXH0GzXddKlSNNBWMF7wxFhw==:
 NX1eiSDpjzZKbviMbiGwmLG3mySFDrl841/2vS8/XPYkC8qnhDimBG0/PLw+eGuvYpLcd3lcYM0
 2lb2wF5EIlM1cNq7uOOE4YcBqChOEVqYmX68HH+qUsXFDbb3jJCpkCy9A0dn2GwkyoQcsK68Nxl
 /G6Qu+lCjkshp3foGQjJbBI9hgZdYNLg+2eLwIZkK/HbJOODMJcBa3NlALH7YH647XaLtgT4xlu
 Z+1aLtWfa/1y5QQ3NLnvdY3VQOcxUn2m86QWkXJaT5fl8Au8kbDms1oK/aSrXlMQsUHvX94Vlcj
 FCiO19NvRfikLtFPa2yPFtJrgJvD7um3fEt0ORny8NYO34CsPC64wvF+8tlvMNXzICOMfl/+LXM
 B3L/dzPZCa1Q5Q8PuDgarcfwj9fa9tMJTvOxWkDrZlGsGHZO7HSBjrv3lmFc8osl5xxI3Eq2I2H
 O4xuuvJdsF2DkB0DGYblDtK0QTdaWavrrQjMzZWqc3JQnDDMZzsMIYM6nd2Di4n5/z01MD5uSS7
 Fg1VBqjKouke58IkexujUvmKal4n7OSDV45Tk7woZkvX3VIUrhlYkcgKtoiSeHYZ1jQ7ToUDT8G
 prgiOg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A31E1A4C67D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41098)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL4E4-000000002kX-2PCP
 for buildroot@buildroot.org; Sun, 25 Oct 2026 19:49:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 20:49:52 +0100
Message-ID: <20261025194952.3534770-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tools: Fix build with OpenSSL
 4.1
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7e4374fc0ca7f1bae9e902c3cbfd6397d3b6f5d3

 ...1-lib-object.h-include-openssl-err.h.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/tpm2-tools/0001-lib-object.h-include-openssl-err.h.patch

diff --git a/package/tpm2-tools/0001-lib-object.h-include-openssl-err.h.patch b/package/tpm2-tools/0001-lib-object.h-include-openssl-err.h.patch
new file mode 100644
index 0000000000..01d722ed67
--- /dev/null
+++ b/package/tpm2-tools/0001-lib-object.h-include-openssl-err.h.patch
@@ -0,0 +1,39 @@
+From 8ed8318d146598cb1c189f051ce7196daf1bb424 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 12 Sep 2026 13:22:13 +0200
+Subject: [PATCH] lib/object.h: include openssl/err.h
+
+Fixes build error with OpenSSL 4.1.0-alpha1:
+
+lib/object.c: In function 'PEM_read_bio_TSSPRIVKEY_OBJ':
+lib/object.c:28:1: error: implicit declaration of function 'ERR_raise' [-Wimplicit-function-declaration]
+   28 | IMPLEMENT_PEM_read_bio(TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ_PEM_STRING,
+
+lib/object.c:28:1: error: 'ERR_LIB_PEM' undeclared (first use in this function)
+   28 | IMPLEMENT_PEM_read_bio(TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ_PEM_STRING,
+
+lib/object.c:28:1: error: 'ERR_R_ASN1_LIB' undeclared (first use in this function)
+   28 | IMPLEMENT_PEM_read_bio(TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ_PEM_STRING,
+
+Upstream: https://github.com/tpm2-software/tpm2-tools/commit/c2b2c4e5cdc5bbc61779eb4271d5c317efb8c067
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/object.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/object.h b/lib/object.h
+index b48b55b3..2c4102fc 100644
+--- a/lib/object.h
++++ b/lib/object.h
+@@ -6,6 +6,7 @@
+ #include "tpm2_util.h"
+ 
+ #include <openssl/pem.h>
++#include <openssl/err.h>
+ #include <openssl/bio.h>
+ #include <openssl/asn1.h>
+ #include <openssl/asn1t.h>
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
