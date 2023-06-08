Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D2AC7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 09:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EF741F21;
	Thu,  8 Jun 2023 09:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20EF741F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPFd5JMoJ98K; Thu,  8 Jun 2023 09:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE585416B0;
	Thu,  8 Jun 2023 09:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE585416B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 991421BF407
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 09:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7232460B9E
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 09:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7232460B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cYtLpceQTKM for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 09:26:01 +0000 (UTC)
X-Greylist: delayed 00:22:15 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE98260AD6
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE98260AD6
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 09:26:00 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1q7BYT-0001Wy-Lv; Thu, 08 Jun 2023 11:03:41 +0200
Received: from [185.17.218.86] (helo=rap..)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1q7BYT-000T3L-DZ; Thu, 08 Jun 2023 11:03:41 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 11:03:21 +0200
Message-Id: <20230608090321.1213226-1-martin@geanix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26933/Thu Jun  8 09:26:06 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=R5WLWWfeLakpNDPZNbCwk456MMPYOiJhCxiKlUQFpMY=; b=jalvhD7jmjYh1rWbP3kEe26izN
 jtkZ/u9qachjn5VPQwUiK2eWh9RRRSa7mRy2J6vzRIapi/IupUrVSei4UxHr3nOH7ApmXsxjYUi/X
 9BHloSIoBj336Q+9LH//cy1O2z3TaXm1xaYwtW6OGF0Op5aYxh/mw4P1wgAsSXQgw0FcCsm8/Hksx
 s8vdAomS6ZaUkxi3gQzC318fDT3Jzlh0fjVlG+8Dt1byEO4DEnTqZDCz252huXD6LldX3x4A5GLQR
 8ii4Ew+u3hrU/x3TTr2dmxLm9uO3oOcwshGz4YD3BQkP3SCqpwaESUaEfo7ef84tpdfmZ1lLx3PTZ
 /xHZCh9w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=jalvhD7j
Subject: [Buildroot] [PATCH] package/python-flask-smorest: bump version to
 0.42.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPgotLS0K
IHBhY2thZ2UvcHl0aG9uLWZsYXNrLXNtb3Jlc3QvcHl0aG9uLWZsYXNrLXNtb3Jlc3QuaGFzaCB8
IDQgKystLQogcGFja2FnZS9weXRob24tZmxhc2stc21vcmVzdC9weXRob24tZmxhc2stc21vcmVz
dC5tayAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mbGFzay1zbW9yZXN0L3B5dGhv
bi1mbGFzay1zbW9yZXN0Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1zbW9yZXN0L3B5dGhv
bi1mbGFzay1zbW9yZXN0Lmhhc2gKaW5kZXggOTQxNTM1YzUwMy4uMmM5Y2YzYTUxYSAxMDA2NDQK
LS0tIGEvcGFja2FnZS9weXRob24tZmxhc2stc21vcmVzdC9weXRob24tZmxhc2stc21vcmVzdC5o
YXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLXNtb3Jlc3QvcHl0aG9uLWZsYXNrLXNtb3Jl
c3QuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGku
b3JnL3B5cGkvZmxhc2stc21vcmVzdC9qc29uCi1tZDUgIDFkYWQ1MmYyNmM1OWNhMmRjYWYwYzVk
MTA5ODc5NjA1ICBmbGFzay1zbW9yZXN0LTAuNDAuMC50YXIuZ3oKLXNoYTI1NiAgOWI0NmI0OTM3
Y2NmNzg3MDJkOTlmZWQ4Y2ZkMWNkNWMzNzYwOGRkZWZkNjVmZjE2YTg2ZDFhZDVjN2Y3ZDhjMCAg
Zmxhc2stc21vcmVzdC0wLjQwLjAudGFyLmd6CittZDUgIGQ3ZjhiNGY3YzljNmMyNjA3ZGZjNjhi
ZDViYmJkNTJkICBmbGFzay1zbW9yZXN0LTAuNDIuMC50YXIuZ3oKK3NoYTI1NiAgODY4NDIxYjI5
ZTA2MGE2MDJlMzczOWMyY2FmN2I5N2NmZTIxYzNhYzQ4OGY1MWEyYjVlOTVlMTY4ZGQzYmVjMiAg
Zmxhc2stc21vcmVzdC0wLjQyLjAudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNo
ZWNrc3Vtcwogc2hhMjU2ICA0MDk5OWVhMWQ5YzFiODIwMmZhNDRmOGU2ODQ5YTU1N2UyMmRmODky
NDgxZTA2N2FiZjk5OTg3OTA2NGI5NTIxICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5
dGhvbi1mbGFzay1zbW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lm1rIGIvcGFja2FnZS9weXRo
b24tZmxhc2stc21vcmVzdC9weXRob24tZmxhc2stc21vcmVzdC5tawppbmRleCAwNjlkOTI0NGRk
Li5hYzRmZjE4OGE1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1mbGFzay1zbW9yZXN0L3B5
dGhvbi1mbGFzay1zbW9yZXN0Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLXNtb3Jlc3Qv
cHl0aG9uLWZsYXNrLXNtb3Jlc3QubWsKQEAgLTQsOSArNCw5IEBACiAjCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwogCi1QWVRIT05fRkxBU0tfU01PUkVTVF9WRVJTSU9OID0gMC40MC4wCitQWVRI
T05fRkxBU0tfU01PUkVTVF9WRVJTSU9OID0gMC40Mi4wCiBQWVRIT05fRkxBU0tfU01PUkVTVF9T
T1VSQ0UgPSBmbGFzay1zbW9yZXN0LSQoUFlUSE9OX0ZMQVNLX1NNT1JFU1RfVkVSU0lPTikudGFy
Lmd6Ci1QWVRIT05fRkxBU0tfU01PUkVTVF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzL2U2L2I1LzFiODFlYTRmN2UzNzdjZjhhNjUzYWExMGMyNDk2NTZhMWM3
M2RlN2EzNjk1YjI1NDRkN2E3MTNlYTNjMgorUFlUSE9OX0ZMQVNLX1NNT1JFU1RfU0lURSA9IGh0
dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy80NS9lYy85Y2ViNTFhNGI4YTIw
YWU2NmJmYzdlODNhZDY3ODFmMDNhOWYzN2NkZTZhNDExMWE2NWFhNmNiNjY5YTIKIFBZVEhPTl9G
TEFTS19TTU9SRVNUX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCiBQWVRIT05fRkxBU0tfU01PUkVT
VF9MSUNFTlNFID0gTUlUCiBQWVRIT05fRkxBU0tfU01PUkVTVF9MSUNFTlNFX0ZJTEVTID0gTElD
RU5TRQotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
