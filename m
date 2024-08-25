Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC3FC5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034C5600C9;
	Sun, 25 Aug 2024 13:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqAgPPHJtVkO; Sun, 25 Aug 2024 13:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F25EE600CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F25EE600CA;
	Sun, 25 Aug 2024 13:35:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27F641BF2CC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16E1F600C9
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPGU5IIfHXtc for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D14C7600CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D14C7600CA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D14C7600CA
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:35:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.48.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sHy-1sm2t61vgA-0048zf; Sun, 25
 Aug 2024 15:35:46 +0200
Date: Sun, 25 Aug 2024 15:35:06 +0200
Message-Id: <20240825-rgbmatrix-v1-0-9ad9e5aa03b9@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAozy2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNz3aL0pNzEkqLMCl2z1CRzQ8u0FHMLYwMloPqCotS0zAqwWdGxtbU
 ADpm2yFsAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724592945; l=1260;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=rLQFnbhHc9lycGRD77SpG489Z77L/Gr7lPdJ6C0i7Hw=;
 b=X+OZwtQ09oTBzA1AVQlDk86gyo94xwuFyc0fslm6j/2M9+GQ4hrIV2tOFQ9vNNdTbXLb6JjzY
 BTLtckokwaNDtXRCyNy94XZYicOsmxKjE2NR8i0Iz45kVfjm9u18i9I
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:hzf3KOOQoBWnW4w4vvhCpdKHvmbnRRGIb7Z29AhKi5EIUhvrtqS
 MnMmiJOcQ6OZ0ME/PCCAssMRYBHdKh5xUAUQ1elLQRuNrdwykXdHmJOH61s63sQgjrutwRo
 cUsIbPCNJb7nU66pQKtqCIblhlqkJ6cJqoM5uX5d5ObWEUEfMRmb0PDEpQ6RPmGFxV6RS0d
 gJIIYjC+QsJLG5YUMTY9w==
UI-OutboundReport: notjunk:1;M01:P0:IsZfouXw3Ec=;vL3NeCLkI9eko0fZJCJw2Eg0U7b
 uqUrWp+9WsZZmUqwJjruTHthL6aQyrKzP1Y993TdXc1Y10H48Z5pxfd8mTGKGLO3aSNvZidyQ
 22b350F7bx/7PDCC6SnVDrL4IMsRT+Dl2c38AWrVnPa2SbGIB6iFWffnT/yfGcI0CD9eYGVnM
 KNoLilRWZFgzrPwwBCHSgfz61cN8irOJ+4FS79tZGR8wHlZxJhuNhT+IXT2n4AkmhDEOVcxFO
 emzw8hhtal5GPH5aDsyxTJ9/8+vvQFpZYX2jyHprryJ0IHn+3ksRRYixO8dg3R2YIYotrEJIl
 al2JmMM5MwIQh7s0YGFx4poHJvZ93KL7gOvozWYcDEf5yufAxeg6mQN0k5/hj0RYq7l9K/81D
 papNlxeCtqoYID/PEAD6VktVJ3r8fu/48Bhb00//aKZ47zGqZZqQS73gBpJPBUYqozfP7aHJR
 a8f39ZRn+X2ty0Pzc0qNYU0EB7VL3agQn1aJqGbN/S4yihA64OmN3OkUtX1vvxsF8pLgnU8pP
 Z7928AS7zT7fZYRnqYApawsXsJs3fB3qCuS+i59QPq2lKaSFPdsqKxPsdkVykkGGTFFIyi8h5
 jg7+ZSgHGMMlxC5TIyXJUZCPM04EzLcR3dfNcYuWsrbO0CA4xMBsjhySTrXCMSGjJLe/ocPhg
 iA8MSem06lZuVK5in0uOKZUOKqQSHDMTYuUmaVdVSmgtxPMNO97Ea72UIqM34HpcYHvXit8B2
 miPg6uVaV0Jhsz5Qbs/J6armtHiPPyuOBW4e49tJJA6f/d10N1FC/jDf4nEPdh+tSXAn6gtMC
 EydwEOCCOAW0q2zZGtpH6q+g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724592946; x=1725197746; i=j.neuschaefer@gmx.net;
 bh=hpArA43RnhvnaBFl3lO9ErEN0r9U8iSdU8MIddfEHBw=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qViYuEmMVtHLeeqyArGrmtgrsujh6E5fn6POeBFa+F8Xca8HHxrrulWUeIvAZAvH
 LZGhK7MvF2y6/mn2IrkjaaL8U8Zjz4iEJTh1EF2nXEjG0pb2porEyZGnrXHhBQIwP
 jiz+auoDBDtkWfkksA5Gmcv9CqDs7uI+2lCyrTaldQOZQQpuGDe0C79LMD0GxWv27
 LckOfzCu3Zz++WGJS2EzF2I8sK1oatBiB+EqQfmh1houPr5fAW14l+br9oE2pjYVi
 8cWS6FFx114fPnWFljCReiCGJMq4SuxZI4y7LnczbpeD4hXEFiMBCaTL3nNNr2lPq
 ue+Qvb1ucOSnWaGKRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=qViYuEmM
Subject: [Buildroot] [PATCH 0/3] Version bump and python bindings for
 rpi-rgb-led-matrix
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaHNldCB1cGRhdGVzIHRoZSBycGktcmdiLWxlZC1tYXRyaXggcGFja2FnZSBhbmQg
YWRkcyB0aGUgcHl0aG9uCmJpbmRpbmdzLCB3aGljaCBhcmUgYnVpbHQgZnJvbSB0aGUgc2FtZSBz
b3VyY2UgY29kZS4KCkknbSBub3QgZW50aXJlbHkgaGFwcHkgd2l0aCB0aGUgZHVwbGljYXRpb24g
YmV0d2VlbiB0aGUgdHdvIHBhY2thZ2VzLiBJZgp0aGVyZSdzIGEgd2F5IHRvIG1lcmdlIHRoZW0g
YW5kIHNwZWNpZnkgdGhlIHZlcnNpb24sIGhhc2hlcywgYW5kCmRlcGVuZGVuY2llcyBvbmx5IG9u
Y2UsIEknbGwgZ2xhZGx5IGRvIHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8
ai5uZXVzY2hhZWZlckBnbXgubmV0PgotLS0KSi4gTmV1c2Now6RmZXIgKDMpOgogICAgICBwYWNr
YWdlL3JwaS1yZ2ItbGVkLW1hdHJpeDogdXBkYXRlIHRvIGxhdGVzdCBjb21taXQKICAgICAgW1JG
Q10gcGFja2FnZS9weXRob24tcmdibWF0cml4OiBuZXcgcGFja2FnZQogICAgICBERVZFTE9QRVJT
OiBhZGQgSi4gTmV1c2Now6RmZXIgZm9yIHJwaS1yZ2ItbGVkLW1hdHJpeC9weXRob24tcmdibWF0
cml4CgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMiArKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvQ29uZmlnLmluICAgICAgICAgICAg
ICAgICB8ICA4ICsrKysrKysrCiBwYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJnYm1h
dHJpeC5oYXNoICAgICB8ICAzICsrKwogcGFja2FnZS9weXRob24tcmdibWF0cml4L3B5dGhvbi1y
Z2JtYXRyaXgubWsgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3Jw
aS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXguaGFzaCB8ICAyICstCiBwYWNrYWdl
L3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXgubWsgICB8ICAyICstCiA3IGZp
bGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNv
bW1pdDogOGJkMDBjMTZkOGFmMmI0YjYyMGEwYjJjMTM2ZTY4MzBiOWQ2YjNhMApjaGFuZ2UtaWQ6
IDIwMjQwNzI3LXJnYm1hdHJpeC02ZWI3MTlmZDc4MzAKCkJlc3QgcmVnYXJkcywKLS0KSi4gTmV1
c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
