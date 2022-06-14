Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B4CC43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0520283386;
	Tue, 14 Jun 2022 16:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rs7QJ7kCenAr; Tue, 14 Jun 2022 16:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 389A683312;
	Tue, 14 Jun 2022 16:48:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5712E1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4629C60E81
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjT5qr-dFZj0 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:48:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36BBE60E4A
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:48:09 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m20so18283607ejj.10
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLgjZ/MYz/zUQ1JSSTDHCuxa2o7uons/EdmdoxEqmPo=;
 b=fs1WDycoZrAQSeTH4AGDgHZFjsF30o+kf6aS6ep6w/CAH+0LYJkydAROWTb/rjsqWt
 /IpOYFkkkE0BxH24+6vOxf9EsCIazSfvBsEFEe/1SDaRkxHrfftHVqiHgcGC5V+9qNcU
 8wbmEvf8X/mSMpp5Oe//urdmPXSMF33vxwzEkAcS8oEQOfo+hJEDyn4YYn4qEMnWeWRA
 UpH0TeJyRVZ5tnRsNLZB14JvO/6S1tQLHRvV6cPPTqy/us90CgCJSlp3W5PqKdd+4T9x
 P0dYveumyICtDPOjQHvgdknbgKak+WApwqel3RJMojhR+BAbhzyiMW+sWeogPI/f+kdW
 ZGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLgjZ/MYz/zUQ1JSSTDHCuxa2o7uons/EdmdoxEqmPo=;
 b=1CF8qQRvz1uvbb+ynHLJJPRSsBX/2wwL2uCOCf8MDuO72luDRJ5zoZllM+TSIGKwMI
 9UYOx6cgkIITmAwcOadaO/gBMnTLlmLTHTSVnee4GOD8+p1+5lkspgjTQ6LDcv3iu4u3
 BcPPH5RaKNH2kb1GtuTHcLP1gCX4YhIJqbbR96qt9aaYGj3G9DpznCph1a5SsEf7DgTb
 UsKTODvQbtmrMFM2l0C8sQysZ0sUXfFgHL0dYCKsuPHIIWSXL6IiMUSy3XBs/4cju7KZ
 rjoX0VUzT0MQ8NvMJg+gHKD6j6jWVubIQZJi0QXxJQJ1A0piLWlGjTJY1QPNEqFnOm3R
 EUhg==
X-Gm-Message-State: AJIora9wCNPifXL9o50f/DokRzg3Ma0QAP3xdq7mQdh+C+JIbZvETxJB
 ZczlDyjAZuo3CiHLBfBLWK16jRsxEacqb8u3
X-Google-Smtp-Source: AGRyM1sZ2a3BjOAqJpn6lvmW8zvOq+isLMLT1aoArXZLYFSL9PUcuqSQS3bSyxkypIvuKVQIXnUekg==
X-Received: by 2002:a17:906:7791:b0:712:1c42:777a with SMTP id
 s17-20020a170906779100b007121c42777amr5274710ejm.68.1655225288234; 
 Tue, 14 Jun 2022 09:48:08 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 o18-20020aa7c7d2000000b004335e08d6c9sm7372305eds.33.2022.06.14.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 09:48:07 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 18:47:54 +0200
Message-Id: <20220614164755.716683-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614164755.716683-1-raphael.melotte@mind.be>
References: <20220614164755.716683-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-jmespath: bump to version
 1.0.0
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpbGUgYXQgaXQsIHJlbW92ZSB0aGUgbWQ1IGhhc2ggYXMgdGhlcmUgaXMgYWxyZWFkeSBhIHNo
YTI1NiBoYXNoLgoKQ2hhbmdlbG9nOiBodHRwczovL2dpdGh1Yi5jb20vam1lc3BhdGgvam1lc3Bh
dGgucHkvYmxvYi9kZXZlbG9wL0NIQU5HRUxPRy5yc3QKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wg
TcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvcHl0aG9uLWpt
ZXNwYXRoL3B5dGhvbi1qbWVzcGF0aC5oYXNoIHwgNSArKy0tLQogcGFja2FnZS9weXRob24tam1l
c3BhdGgvcHl0aG9uLWptZXNwYXRoLm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LWptZXNwYXRoL3B5dGhvbi1qbWVzcGF0aC5oYXNoIGIvcGFja2FnZS9weXRob24tam1lc3BhdGgv
cHl0aG9uLWptZXNwYXRoLmhhc2gKaW5kZXggOTg2ZGIyZTAwMi4uYTFjNjRhMTIxZSAxMDA2NDQK
LS0tIGEvcGFja2FnZS9weXRob24tam1lc3BhdGgvcHl0aG9uLWptZXNwYXRoLmhhc2gKKysrIGIv
cGFja2FnZS9weXRob24tam1lc3BhdGgvcHl0aG9uLWptZXNwYXRoLmhhc2gKQEAgLTEsNSArMSw0
IEBACi0jIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2ptZXNwYXRoL2pz
b24KLW1kNSAgNjViZGNiNWZhNWJjZjFjYzcxMGZmYTUwOGU3OGU0MDggIGptZXNwYXRoLTAuMTAu
MC50YXIuZ3oKLXNoYTI1NiAgYjg1ZDA1NjdiODY2NjE0OWE5MzE3MjcxMmU2ODkyMDczNDMzM2Mw
Y2U3ZTg5Yjc4YjNlOTg3ZjcxZTVlZDRmOSAgam1lc3BhdGgtMC4xMC4wLnRhci5negorIyBzaGEy
NTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvam1lc3BhdGgvanNvbgorc2hhMjU2ICBhNDkw
ZTI4MGVkZDFmNTdkNmRlODg2MzY5OTJkMDViNzFlOTdkNjlhMjZhMTlmMDU4ZWNmN2QzMDQ0NzRi
ZjVlICBqbWVzcGF0aC0xLjAuMC50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hl
Y2tzdW1zCiBzaGEyNTYgIDY2YjMxM2NjZTgwZWQwNjIzZmM3ZGIzZjI0ODYzYTBjODBmZDgzZWIz
NDFhNDZiNTc4NjQxNThhZTc0ZmFhNTYgIExJQ0VOU0UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1qbWVzcGF0aC9weXRob24tam1lc3BhdGgubWsgYi9wYWNrYWdlL3B5dGhvbi1qbWVz
cGF0aC9weXRob24tam1lc3BhdGgubWsKaW5kZXggY2YxMWRlZGI2MC4uNDhiMTllODQ5NCAxMDA2
NDQKLS0tIGEvcGFja2FnZS9weXRob24tam1lc3BhdGgvcHl0aG9uLWptZXNwYXRoLm1rCisrKyBi
L3BhY2thZ2UvcHl0aG9uLWptZXNwYXRoL3B5dGhvbi1qbWVzcGF0aC5tawpAQCAtNCw5ICs0LDkg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVBZVEhPTl9KTUVTUEFUSF9WRVJTSU9O
ID0gMC4xMC4wCitQWVRIT05fSk1FU1BBVEhfVkVSU0lPTiA9IDEuMC4wCiBQWVRIT05fSk1FU1BB
VEhfU09VUkNFID0gam1lc3BhdGgtJChQWVRIT05fSk1FU1BBVEhfVkVSU0lPTikudGFyLmd6Ci1Q
WVRIT05fSk1FU1BBVEhfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy8zYy81Ni8zZjMyNWIxZWVmOTc5MTc1OTc4NGFhNTA0NmE4ZjZhMWFmZjhmN2M4OThhMmUz
NDUwNjc3MWQzYjk5ZDgKK1BZVEhPTl9KTUVTUEFUSF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRo
b25ob3N0ZWQub3JnL3BhY2thZ2VzLzA2LzdlLzQ0Njg2Yjk4NmVmOWNhNjA2OWRiMjI0NjUxYmFh
YTgzMDBiOTNhZjJhMDg1YTViMTM1OTk3YmY2NTliMwogUFlUSE9OX0pNRVNQQVRIX1NFVFVQX1RZ
UEUgPSBzZXR1cHRvb2xzCiBQWVRIT05fSk1FU1BBVEhfTElDRU5TRSA9IE1JVAogUFlUSE9OX0pN
RVNQQVRIX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAotLSAKMi4zNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
