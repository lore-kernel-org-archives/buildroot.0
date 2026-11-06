Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC18606BFB8
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cZ4jSeDd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C63DA60A69;
	Fri,  6 Nov 2026 16:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxsJ26xoMzUd; Fri,  6 Nov 2026 16:09:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DBA3E60A57
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981385;
	b=M9gjE4sF/KdUU+1FH61AkIo4rKV0BQSTXUqYlmPryDCqUOkp8QJxozbAFmKod3Vu9cNG
	 gcSJXHPzg0PEFP81MmH8k7XUTAT2MHH3y23FNt2aMQ16k+Nto1eiwN9QnUklVW9vRZ8x7
	 Z1PMrKXAoKqSqA0n8Uovg9iJou9U4bYVKJZc31ep1whVemUIrOl5Y+vAWicPBoo/vAyNU
	 iVpdaSX4KtURNfnAGwKQY0O94PMnAdT6/mhKDl7FANBG+bdkQzBt5QLjza52APXqJZUw0
	 Sb0vIRqHi6/zv73gu60J8w4aVYqXkLXpBpFkis/PowRZP7r1TIx2Beq/C1UnzroMyYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981385;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ppLECujJJqgZgVCVMGiX3HN5+VVISUe35BIvbKdqdCQ=;
	b=VaPfVOrbjAM4VV2nCX4siwUYcI91KnXRiPhj3QgOk8DWwnBe4hp0kq3jzoLsq1pq6JRq
	 tgj1bruTVWNdGQBDF5ipg6CVYOB5lFRYOIaCXk2UW4HsgU21a4sqaUeWCvmvfLbnqfEH/
	 OP9yI/0iHw4lE5UYKnw7KkupkgFcipOgqoTIUL4r44KcEybW0QTUMb0vq7hj1BjwQXgaW
	 Wud91cI7yirD3ChlNFbHMc2m6E4b5WGWKucRpQHssEFeiS1Qre7/t1mjz2IZ7n9zsZUJS
	 DheYVSv6rCHGs68EbOahMH7CtJTdRBWBUtly4kwPo2m6mezM32TDJCP3L4jr437OFhQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981385;
	bh=ppLECujJJqgZgVCVMGiX3HN5+VVISUe35BIvbKdqdCQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cZ4jSeDdRERXIIi+jllAE9uoU7XhQ9mZPecpSEQ10C6W7DFZNQUr32CwHc0iYCIfy
	 EQrzmHbZGBVDidpJRsk4qWF7zp2oFf7NYeKQCam1xwcv4QrYDuUIKNgaZ2GvJ5n7gs
	 RTmX+s5TKIP2iuK5H4FTZZpj9jRxSggGnUpN3gBFj3pWcBGCJiO6pzfOKRhrbTnZpM
	 2L4O30B+vSMPJSugGIfRLK07nCdBwTZzhBuJYfkQG72gEsvq0cDruEbBkyKXOdLMEZ
	 KBQKaHgMhBGwvapJ6mI0X0jbNl54GpckC8vtt4OSed0egWG1MlskXUBQiJzhxKoLZ+
	 PqEHgcTbqKhlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA3E60A57;
	Fri,  6 Nov 2026 16:09:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BFD52E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E302403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_muRYI9Q0w7 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 499E3400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 499E3400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a2d6cf958bso4174845e9.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981350; x=1794586150;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tWL3cWSnkbGoU+Cf6uG7MSnbvQ0UCAtPG3vrVcsBH/U=;
 b=on6K8KT791QsqOMMD6qz1APAnhCk2tHfkXg8IoSYTb0u97DlZ/AfYq1fLCE4pUxrO3
 YpUyec+UB4inXQQgjGnupv6RbFImXlgiSrzCdPAhaMGlUhUp/udS4+vm/o2t1Xv/D3UX
 o/ivz0I9TedHwl8xgPGV501iAwYSh0GS0jBgtAmzGb2BKZ18ony2VWVOlqNt2xfxWkie
 74Z3VEgjZ8i3k85Bm0bXvmM/xoA9MEkHGn4i43D6uTWwJyZtzJkkgCX9QM8lZX89X1Eb
 8S5Du2tEOKwe1F9ROSCyjn2ST1z90KxysJujfRSzI7MxstwyFL27116vssiNkGmjjWK5
 LxSA==
X-Gm-Message-State: APuU4Z/1EeK8w2JbeBCXQPjrLYqd6lkS1vlszXm4moCRAuOAv6P8JhtZ
 Dv0rI8TZaIf4TgDzZTKCh2llYNl9jQVdQZabYHZZ55vYF26UdpJLug37ErmgQSKTl3duQnjg7H2
 OwRiGcOY=
X-Gm-Gg: AYBFou2qBVS0rpXwQmMA9ydSnZWWA7iwjSqzmUVMWayKo4uZIcv4f1WLMJRM/RKY+ki
 3rrRzZ72g9phcS5YiVYsh6LE4/LBLpt/6ptUxZGNntowEYkpKv7qcWRlaRJ5CHNJ/aFHbPE5rBo
 NOe+iyEss4mZq7JfZTEJ0W4Cc9NvZUxr5ZZWzME/Pt3nQYnsSDSOFpgCth6PwX5ww01exJPxH0l
 vQ/j70PblmLSwVxKI9FP0si+ZkYDNmZ0bfpObGJFUfkKgzsR1zeW8cTxYJ0hwNlm7r52+i85P0A
 02fytqowTmpHQXzln4H0m+CDnfXGB6iUR4Rwy3FZ/et0uY7hJK8DgnCMXmlDTh5mlT08lamc4kK
 mCgigQuiRoa4uibYMqrrNeNcO9oJoV4Aho1zCn9xWN1dAF38LMZor+NFx1h/8PfGUl06Y1eL4E2
 lG2TOZfpWk6cB8mssG+fRm+lgC8mYmCpAyzBnDqYgVGKCPnfA0igKE1U3bX8rexpcWju+r4WIaO
 6tJBQ5KIP6EV9GOFGpjlqzf/vZQoOdg5ZYC1TJcjhm/FF8Et53oFDUMxjGVnG+nuVKW57Yfi+oG
 8jFZ4doD2162VionotMIJW8+d/supisF76LDthywDcb/uVhK13K6wQ==
X-Received: by 2002:a05:600d:82f2:b0:4a3:7344:13b4 with SMTP id
 5b1f17b1804b1-4b6df3fd27dmr61085835e9.14.1793981349913; 
 Fri, 06 Nov 2026 08:09:09 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cbd0846sm3931775e9.3.2026.11.06.08.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:09 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:06 +0100
Message-ID: <20261106160908.607013-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020081557.2965981-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/iperf3: fix build with LibreSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gaXBlcmYzIDMuMjIgYWRkZWQgYSBuZXcgImdvdG8gZXJycmV0dXJuIiB0
byBkZWNyeXB0X3JzYV9tZXNzYWdlKCksIG9uCj4gYSBjb2RlIHBhdGggdGhhdCBpcyBjb21tb24g
dG8gYWxsIE9wZW5TU0wgdmVyc2lvbnMsIGJ1dCB0aGUKPiBlcnJyZXR1cm4gbGFiZWwgaXMgb25s
eSBkZWZpbmVkIHdoZW4gT1BFTlNTTF9WRVJTSU9OX01BSk9SID49IDMuCj4gTGlicmVTU0wgZG9l
cyBub3QgZGVmaW5lIE9QRU5TU0xfVkVSU0lPTl9NQUpPUiwgc28gdGhlIGJ1aWxkIGZhaWxzCj4g
d2l0aDoKPiAKPiBpcGVyZl9hdXRoLmM6IEluIGZ1bmN0aW9uICdkZWNyeXB0X3JzYV9tZXNzYWdl
JzoKPiBpcGVyZl9hdXRoLmM6MzQzOjk6IGVycm9yOiBsYWJlbCAnZXJycmV0dXJuJyB1c2VkIGJ1
dCBub3QgZGVmaW5lZAo+ICAgMzQzIHwgICAgICAgICBnb3RvIGVycnJldHVybjsgICAvKiBvcjog
cmV0dXJuIDA7IOKAlCBuZXZlciByZWFkIG1vcmUgdGhhbiBvdXRwdXRfYnVmZmVyX2xlbiBieXRl
cyAqLwo+ICAgICAgIHwgICAgICAgICBefn5+Cj4gCj4gQmFja3BvcnQgdGhlIHVwc3RyZWFtIGNv
bW1pdCB0aGF0IGRlZmluZXMgdGhlIGxhYmVsIHVuY29uZGl0aW9uYWxseS4KPiAKPiBUaGlzIGlz
c3VlIGhhcyBiZWVuIHByZXNlbnQgc2luY2UgY29tbWl0IGNiMTI5YTY0MWI0MCAoInBhY2thZ2Uv
aXBlcmYzOgo+IHNlY3VyaXR5IGJ1bXAgdmVyc2lvbiB0byAzLjIyIiksIGFzIHRoZSBicm9rZW4g
Y29kZSBmaXJzdCBhcHBlYXJlZCBpbgo+IGlwZXJmIDMuMjIuIFRoYXQgY29tbWl0IGlzIG5vdCBw
YXJ0IG9mIGFueSByZWxlYXNlIG5vciBvZiBhbnkKPiBtYWludGVuYW5jZSBicmFuY2ggeWV0LCBz
byBvbmx5IG1hc3RlciBpcyBhZmZlY3RlZCwgYnV0IHRoaXMgZml4Cj4gc2hvdWxkIGdvIGFsb25n
IHdpdGggdGhlIDMuMjIgYnVtcCBpZiBpdCBnZXRzIGJhY2twb3J0ZWQuCj4gCj4gRml4ZXM6Cj4g
aHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzZlZDhmNjBmNTZmN2ZjZDEx
ZWFhMWJhMTYwODM3Mjc1YjgxMTNlMWEKPiAKPiBGaXhlczogY2IxMjlhNjQxYjQwM2NmYzRjMWIy
ZWE5MjgwYjk2NmUxOTgzN2I2MiAoInBhY2thZ2UvaXBlcmYzOiBzZWN1cml0eSBidW1wIHZlcnNp
b24gdG8gMy4yMiIpCj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy01LTUKPiBTaWdu
ZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+CgpB
cHBsaWVkIHRvIDIwMjUuMDIueCwgMjAyNi4wOC54LiBUaGFua3MKCj4gLS0tCj4gIC4uLnBlblNT
TC12ZXJzaW9uLWNoZWNrLWluLWlwZXJmX2F1dGguYy5wYXRjaCB8IDI5ICsrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvaXBlcmYzLzAwMDEtUmVtb3ZlLU9wZW5TU0wtdmVyc2lvbi1jaGVjay1p
bi1pcGVyZl9hdXRoLmMucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pcGVyZjMvMDAw
MS1SZW1vdmUtT3BlblNTTC12ZXJzaW9uLWNoZWNrLWluLWlwZXJmX2F1dGguYy5wYXRjaCBiL3Bh
Y2thZ2UvaXBlcmYzLzAwMDEtUmVtb3ZlLU9wZW5TU0wtdmVyc2lvbi1jaGVjay1pbi1pcGVyZl9h
dXRoLmMucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQ1
YjU4MWU1YTcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9pcGVyZjMvMDAwMS1SZW1v
dmUtT3BlblNTTC12ZXJzaW9uLWNoZWNrLWluLWlwZXJmX2F1dGguYy5wYXRjaAo+IEBAIC0wLDAg
KzEsMjkgQEAKPiArRnJvbSA5NjIwOGYyZTQxM2Q3ZmRkYzE5ZTY4ODhiZTVmYmQyYWNkYjA0NjA2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBQZXRlciBHIDw1NTc4NjAwMCtXYXRj
aGVyT2ZUaGVTa2llc0B1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+Cj4gK0RhdGU6IFdlZCwgMzAg
U2VwIDIwMjYgMTI6Mjc6NDMgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBSZW1vdmUgT3BlblNT
TCB2ZXJzaW9uIGNoZWNrIGluIGlwZXJmX2F1dGguYwo+ICsKPiArUmVtb3ZlZCBjb25kaXRpb25h
bCBjb21waWxhdGlvbiBmb3IgT3BlblNTTCB2ZXJzaW9uIGNoZWNrLgo+ICsKPiArVXBzdHJlYW06
IGh0dHBzOi8vZ2l0aHViLmNvbS9lc25ldC9pcGVyZi9jb21taXQvOTYyMDhmMmU0MTNkN2ZkZGMx
OWU2ODg4YmU1ZmJkMmFjZGIwNDYwNgo+ICtTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8
eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gKy0tLQo+ICsgc3JjL2lwZXJmX2F1dGguYyB8
IDIgLS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdp
dCBhL3NyYy9pcGVyZl9hdXRoLmMgYi9zcmMvaXBlcmZfYXV0aC5jCj4gK2luZGV4IDUxZDFhMWI2
ZS4uY2YwYmQ3NDQ5IDEwMDY0NAo+ICstLS0gYS9zcmMvaXBlcmZfYXV0aC5jCj4gKysrKyBiL3Ny
Yy9pcGVyZl9hdXRoLmMKPiArQEAgLTM4MCwxMSArMzgwLDkgQEAgaW50IGRlY3J5cHRfcnNhX21l
c3NhZ2UoY29uc3QgdW5zaWduZWQgY2hhciAqZW5jcnlwdGVkdGV4dCwgY29uc3QgaW50IGVuY3J5
cHRlZHQKPiArIAo+ICsgICAgIHJldHVybiBwbGFpbnRleHRfbGVuOwo+ICsgCj4gKy0jaWYgT1BF
TlNTTF9WRVJTSU9OX01BSk9SID49IDMKPiArICAgZXJycmV0dXJuOgo+ICsgICAgIGZwcmludGYo
c3RkZXJyLCAiJXNcbiIsIEVSUl9lcnJvcl9zdHJpbmcoRVJSX2dldF9lcnJvcigpLCBOVUxMKSk7
Cj4gKyAgICAgcmV0dXJuIDA7Cj4gKy0jZW5kaWYKPiArIH0KPiArIAo+ICsgaW50IGVuY29kZV9h
dXRoX3NldHRpbmcoY29uc3QgY2hhciAqdXNlcm5hbWUsIGNvbnN0IGNoYXIgKnBhc3N3b3JkLCBF
VlBfUEtFWSAqcHVibGljX2tleSwgY2hhciAqKmF1dGh0b2tlbiwgaW50IHVzZV9wa2NzMV9wYWRk
aW5nKXsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
