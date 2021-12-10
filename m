Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B402C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D9880C26;
	Fri, 10 Dec 2021 14:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkDG6LHbnwPa; Fri, 10 Dec 2021 14:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D283580C2F;
	Fri, 10 Dec 2021 14:13:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6917B1BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66D7D4241B
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exYMj9bybcDk for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:12:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E9D14253D
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:12:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i5so15165459wrb.2
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 06:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GdPkRvv8jjAKlTuxKM60bEeU1CoQFL9m+S206DLLTg=;
 b=16BnJPXAvZI2uK1nXvTkRNMJFTpLPCQ3anI2hGrHUoLWObr0rz1c+d8QzR7F8nsBDx
 7hL85vfUao8MHDNGUm6ELMAE0vfOl4N2CSDLZ/fD++ok8VgpUVFB3jYrZf+F2qPjL8Dd
 +FrAyPcQhYQvPxLxbTl6/G2sbl/O3tbNFOlvU6dgBQAVzD9JHp4g1p5VmlscwRgjyGsr
 LtdMgxFlQ4EUN9OSrydYu+FkhwN3pDGcm7Dxe5MXgz7G3guJVZ0NwGhC2ucDYFU+3mL2
 8yNTmnM6yAdYvgcNo3oTFwQPAA+4sHEcg2c6DmyVmFgRBbyZLoFKJIe5Y5xPxf+LRZQn
 pG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GdPkRvv8jjAKlTuxKM60bEeU1CoQFL9m+S206DLLTg=;
 b=muFPiiwQWYWBJwyaX4IQ7nRgO0ABBqk820R+q/PrAZryJ7UFQf076M5Eu2NlkO1fq9
 N9q+a7pmL0YskHpuniYJxW5vhCLOKyfq6YCXC+LD/fIDtPfQADJYtijOweBaRvglrvAv
 1RS3md00DffCfN8cuKhV9MrODMtkT7EEEW7N0vQg4qfYE1nwg4FoM0ONl+pQ7UNS/n60
 0Te4aLTA2cDdTrL0VSE+45Etk3brv/cp4kbqgCNGa864TxS1g+xiyBY8J2sXr5TOZwgH
 nTs48RXE66iQg4rVAgjPQeEYCl+KwxIDjYPC7cgn5jc8ywxEZF+8qM112nPq93k4ekwt
 vSgQ==
X-Gm-Message-State: AOAM530hiJmf9uii3HR6ddBRcdh4Sg2KS1U6pU329rnZ5waNDUPow2ab
 nGytGrfmUWNxg6RjdBzbh50lTm3OhyzDc9RqLUrXfQ==
X-Google-Smtp-Source: ABdhPJywIO1t2aE7QAM2rmC3pfdnPl9DPRoh3AUtMQY+iokmvprFcSUjyeLvpdyRIk/VPJ2BlTwNlQ==
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr14361487wrd.52.1639145543537; 
 Fri, 10 Dec 2021 06:12:23 -0800 (PST)
Received: from woodpecker.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.gmail.com with ESMTPSA id r11sm2623459wrw.5.2021.12.10.06.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 06:12:23 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 16:12:09 +0200
Message-Id: <20211210141209.1812043-7-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/7] package/avocado-vt: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGRzIGEgYmFzaWMgcGFja2FnZSBmb3IgYXZvY2Fkby12dApwbHVnaW4uCgpT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNv
bT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2Fn
ZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvYXZvY2Fkby12dC9D
b25maWcuaW4gICAgICAgfCAxMyArKysrKysrKysrKysrCiBwYWNrYWdlL2F2b2NhZG8tdnQvYXZv
Y2Fkby12dC5oYXNoIHwgIDQgKysrKwogcGFja2FnZS9hdm9jYWRvLXZ0L2F2b2NhZG8tdnQubWsg
ICB8IDE0ICsrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2F2b2NhZG8tdnQvQ29uZmlnLmluCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9hdm9jYWRvLXZ0L2F2b2NhZG8tdnQuaGFzaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvYXZvY2Fkby12dC9hdm9jYWRvLXZ0Lm1rCgpkaWZmIC0tZ2l0IGEv
REVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggM2ZmNmFiYjJhZi4uZDI1OGI0NjExNyAxMDA2
NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xNDY3LDYgKzE0NjcsNyBA
QCBOOglKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KIEY6CXBh
Y2thZ2UvYWV4cGVjdC8KIEY6CXBhY2thZ2UvYWxmcmVkLwogRjoJcGFja2FnZS9hdm9jYWRvLwor
RjoJcGFja2FnZS9hdm9jYWRvLXZ0LwogRjoJcGFja2FnZS9ibXg3LwogRjoJcGFja2FnZS9taW5p
amFpbC8KIEY6CXBhY2thZ2Uvb3BlbnNjLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4g
Yi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBjNWQyNzBhN2ZkLi5jZGMwYjQzN2IzIDEwMDY0NAot
LS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTU2LDYg
KzE1Niw3IEBAIGVuZG1lbnUKIG1lbnUgIkRldmVsb3BtZW50IHRvb2xzIgogCXNvdXJjZSAicGFj
a2FnZS9hZXhwZWN0L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvYXZvY2Fkby9Db25maWcu
aW4iCisJc291cmNlICJwYWNrYWdlL2F2b2NhZG8tdnQvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9iYXRzLWNvcmUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9iaW51dGlscy9Db25m
aWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2JpdHdpc2UvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9hdm9jYWRvLXZ0L0NvbmZpZy5pbiBiL3BhY2thZ2UvYXZvY2Fkby12dC9Db25maWcu
aW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNWZiZmQyNzhjZAotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvYXZvY2Fkby12dC9Db25maWcuaW4KQEAgLTAsMCArMSwx
MyBAQAorY29uZmlnIEJSMl9QQUNLQUdFX0FWT0NBRE9fVlQKKwlib29sICJhdm9jYWRvLXZ0Igor
CWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGRsb3BlbigpCisJc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQkZGSQorCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT04zCisJaGVscAorCSAgQXZvY2Fk
byBWVCBpcyBhIHZpcnR1YWxpemF0aW9uIHRlc3QgcGx1Z2luIGZvciBhdm9jYWRvIHRlc3QKKwkg
IGZyYW1ld29yay4KKworCSAgaHR0cHM6Ly9hdm9jYWRvLXZ0LnJlYWR0aGVkb2NzLmlvLworCitj
b21tZW50ICJhdm9jYWRvLXZ0IG5lZWRzIGEgdG9vbGNoYWluIHdpdGggZHluYW1pYyBsaWJyYXJ5
IHN1cHBvcnQiCisJZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvYXZvY2Fkby12dC9hdm9jYWRvLXZ0Lmhhc2ggYi9wYWNrYWdlL2F2b2NhZG8tdnQvYXZvY2Fk
by12dC5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmY1YjhhMjJm
MDgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2F2b2NhZG8tdnQvYXZvY2Fkby12dC5oYXNo
CkBAIC0wLDAgKzEsNCBAQAorIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9hdm9jYWRvLWZyYW1l
d29yay9hdm9jYWRvLXZ0L2FyY2hpdmUvcmVmcy90YWdzCitzaGEyNTYgIDUwYjU3MzVhOWI0NDVj
ZWE2NGZmYTc5MjljYTk5MGI2M2E1NTk3NjQxMmE5NDU2ZTY1Y2IyZDM2NWUwMTc3ZmMgIDkzLjAu
dGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQKK3NoYTI1NiAgMTdiZTZiNWM0YTdlYzYzOWFlM2Nl
MWE1YzBhNWE2MWQ2MDIzNjVlM2M0YmIzNTY4NDkzOTQ4MzkyMDUzYjcwYyAgTElDRU5TRQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9hdm9jYWRvLXZ0L2F2b2NhZG8tdnQubWsgYi9wYWNrYWdlL2F2b2Nh
ZG8tdnQvYXZvY2Fkby12dC5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li5kNTRhMjA3ZGEwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9hdm9jYWRvLXZ0L2F2b2Nh
ZG8tdnQubWsKQEAgLTAsMCArMSwxNCBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMg
YXZvY2Fkby12dAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworQVZPQ0FET19WVF9WRVJT
SU9OID0gOTMuMAorQVZPQ0FET19WVF9TT1VSQ0UgPSAkKEFWT0NBRE9fVlRfVkVSU0lPTikudGFy
Lmd6CitBVk9DQURPX1ZUX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vYXZvY2Fkby1mcmFtZXdv
cmsvYXZvY2Fkby12dC9hcmNoaXZlL3JlZnMvdGFncworQVZPQ0FET19WVF9TRVRVUF9UWVBFID0g
c2V0dXB0b29scworQVZPQ0FET19WVF9MSUNFTlNFID0gQXBhY2hlLTIuMAorQVZPQ0FET19WVF9M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRQorCiskKGV2YWwgJChweXRob24tcGFja2FnZSkpCi0tIAoy
LjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
