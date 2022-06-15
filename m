Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1494FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 17:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2D72410BD;
	Wed, 15 Jun 2022 17:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHge_ZAqQAih; Wed, 15 Jun 2022 17:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5511C40E47;
	Wed, 15 Jun 2022 17:12:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 520C81BF300
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 17:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 400C840E47
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 17:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdP57SKpr5tk for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 17:12:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3341240A02
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 17:12:29 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id y19so24536333ejq.6
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 10:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4JRbE8fpnr0FufyD3LF3uuRoLPhDmdkAxWiqPuqMVF4=;
 b=gT7iRr/Tm2JAqBm1QGu1r9gJsaH0t1kDpK3JVgpwyakz5os9ifkNtup6y6ttQjxCUD
 izPLf+oHNi8sr/lVkpJqXepbKJG7WgGBKK4Q2ZAbeyBFpmmc5aVaYlz6GGKQ8T1mK7CV
 BIL4ch6cHDcx5/g9dwfQ+KDXmzwxdU4Xxkd1ynycBhbJu8bX5Y1FquG0/SW49/n7Z7x0
 vfwPVJBennIj5W4QvLkHRtfS9s6f4if8Cv5lJQphr5nhfQJhUvc9aYEaA42FtxJBaVNK
 T+GOEsXiokHZn17UGmA2/UHAS+Vak95GTN1xpudslSIJ7/X1TlIWf8zaMtXieX9J29pY
 A/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4JRbE8fpnr0FufyD3LF3uuRoLPhDmdkAxWiqPuqMVF4=;
 b=p/g0jf0fYcq4QmIuatyztIhxtpopTWiAZNgwiZLl76Bz3I3/pK/UBG7blidaXxshl7
 ciNk3MyRyvUT+7iCdXQ5+jeVeUuM2rSXruNM21cxYvmpQaPV677IYKPKfr/5F6j6g7ph
 0q+hRHTfeZZhZK0uztU9p4uBPR9Lp1wjczJKA7YwAhTbpnJVtZ6ikKj1hlJocNL0SLX8
 QFS6igufYuWV1BmpvrQwcxrbUKwCw3Lc/go1rMwO/+PfmjgCk7keIFPPuWpdSUReQncv
 2BQ6NpYP4FYxw8TyxSfFPJ5euBd0NSFlIdyWoh+wk1CmorbCczk3OmqwazH3UQ0PVMqw
 b+Eg==
X-Gm-Message-State: AJIora9l8Xx3F9+o4Oabt/yD5I6iRCk9YqvAyW+RG58nrQs1L/VFfMbF
 wTYJ9o2mFpwm1mgejpTEAfandAblKM3fkw==
X-Google-Smtp-Source: AGRyM1sH1rAZ7hDXxF30qnM7WlcT+nIj9PV4ZGRB2dGlNiqyNrucV21OicTyZNL11NvLbR9Ubfo/0A==
X-Received: by 2002:a17:907:60d4:b0:708:850:bc91 with SMTP id
 hv20-20020a17090760d400b007080850bc91mr790519ejc.102.1655313147168; 
 Wed, 15 Jun 2022 10:12:27 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 s22-20020a1709064d9600b00705cd37fd5asm6502763eju.72.2022.06.15.10.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:12:26 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 19:12:15 +0200
Message-Id: <20220615171218.1032413-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/testing: use aarch64 for
 TestPythonPy3Botocore
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aCBuZXcgcHl0aG9uLWJvdG9jb3JlIHZlcnNpb25zLCB0aGUgc2l6ZSBvZiB0aGUgcGFja2Fn
ZSB3aWxsCmluY3JlYXNlIGFuZCB0aGUgMjU2TWlCIG1lbW9yeSBsaW1pdCBmcm9tIHRoZSBkZWZh
dWx0IHZlcnNhdGlsZXBiCm1hY2hpbmUgd2lsbCBubyBsb25nZXIgYmUgc3VmZmljaWVudCB0byBk
byBydW50aW1lIHRlc3RzLgoKU3dpdGNoIHRvIHVzaW5nIGFuIGFhcmNoNjQgbWFjaGluZSwgYW5k
IHVzZSA1MTJNaUIgbWVtb3J5LgoKVGhlIGNvbmZpZ3VyYXRpb24gYW5kIGxvZ2luIG1ldGhvZCBh
cmUgdGFrZW4gZnJvbSBUZXN0T3Blbkpkay4KCldoaWxlIGF0IGl0LCBhZGQgdGhlIHB5dGhvbi1i
b3RvY29yZSB0ZXN0IGZpbGVzIHRvIHRoZSBERVZFTE9QRVJTCmZpbGUuCgpTaWduZWQtb2ZmLWJ5
OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogREVWRUxP
UEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIC4uLi90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG9jb3JlLnB5ICAgICB8IDI0ICsrKysrKysrKysrKysr
KysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDg2NzU1YmZlMTguLmM1
YWQ1Y2UyOWIgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjQz
Miw3ICsyNDMyLDkgQEAgRjoJcGFja2FnZS9weXRob24tam1lc3BhdGgvCiBGOglwYWNrYWdlL3B5
dGhvbi1weW11cGRmLwogRjoJcGFja2FnZS9weXRob24tcnNhLwogRjoJcGFja2FnZS9weXRob24t
czN0cmFuc2Zlci8KK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRo
b25fYm90b2NvcmUucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9w
eXRob25fcnNhLnB5CitGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhv
bl9ib3RvY29yZS5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRo
b25fcnNhLnB5CiAKIE46CVJlZmlrIFR1emFrbGkgPHR1emFrbGkucmVmaWtAZ21haWwuY29tPgpk
aWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fYm90
b2NvcmUucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9ib3Rv
Y29yZS5weQppbmRleCA2MzM2YzU2NThmLi41MzVhZDU0OTZkIDEwMDY0NAotLS0gYS9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9ib3RvY29yZS5weQorKysgYi9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9ib3RvY29yZS5weQpAQCAtMSwx
MiArMSwzNCBAQAoraW1wb3J0IG9zCiBmcm9tIHRlc3RzLnBhY2thZ2UudGVzdF9weXRob24gaW1w
b3J0IFRlc3RQeXRob25QYWNrYWdlQmFzZQogCiAKIGNsYXNzIFRlc3RQeXRob25QeTNCb3RvY29y
ZShUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgogICAgIF9fdGVzdF9fID0gVHJ1ZQotICAgIGNvbmZp
ZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcgKyBcCisKKyAgICBjb25maWcgPSBcCiAg
ICAgICAgICIiIgorICAgICAgICBCUjJfYWFyY2g2ND15CisgICAgICAgIEJSMl9UT09MQ0hBSU5f
RVhURVJOQUw9eQorICAgICAgICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5QU1B
MCIKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTD15CisgICAgICAgIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT049eQorICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSI1LjEwLjM0IgorICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09O
RklHPXkKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09ORklHX0ZJTEU9ImJvYXJk
L3FlbXUvYWFyY2g2NC12aXJ0L2xpbnV4LmNvbmZpZyIKKyAgICAgICAgQlIyX1RBUkdFVF9ST09U
RlNfQ1BJTz15CisgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU9fR1pJUD15CiAgICAgICAg
IEJSMl9QQUNLQUdFX1BZVEhPTjM9eQogICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT05fQk9UT0NP
UkU9eQogICAgICAgICAiIiIKKwogICAgIHNhbXBsZV9zY3JpcHRzID0gWyJ0ZXN0cy9wYWNrYWdl
L3NhbXBsZV9weXRob25fYm90b2NvcmUucHkiXQogICAgIHRpbWVvdXQgPSAxMAorCisgICAgZGVm
IGxvZ2luKHNlbGYpOgorICAgICAgICBpbWcgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwg
ImltYWdlcyIsICJyb290ZnMuY3Bpby5neiIpCisgICAgICAgIGtlcm4gPSBvcy5wYXRoLmpvaW4o
c2VsZi5idWlsZGRpciwgImltYWdlcyIsICJJbWFnZSIpCisgICAgICAgIHNlbGYuZW11bGF0b3Iu
Ym9vdChhcmNoPSJhYXJjaDY0IiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbD1r
ZXJuLAorICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsX2NtZGxpbmU9WyJjb25zb2xl
PXR0eUFNQTAiXSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItTSIsICJ2
aXJ0IiwgIi1jcHUiLCAiY29ydGV4LWE1NyIsICItbSIsICI1MTJNIiwgIi1pbml0cmQiLCBpbWdd
KQorICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKLS0gCjIuMzUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
