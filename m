Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B9CC3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 09:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF2540711;
	Sun, 11 Aug 2024 09:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwRn5d6ixZD2; Sun, 11 Aug 2024 09:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 085124071C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085124071C;
	Sun, 11 Aug 2024 09:05:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA4231BF2AA
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 09:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D546C80E8A
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 09:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CihiDXXbRIqg for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 09:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE07680E56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE07680E56
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE07680E56
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 09:05:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4axq-1seiOp1kQA-003fyT; Sun, 11
 Aug 2024 11:04:53 +0200
Date: Sun, 11 Aug 2024 11:04:38 +0200
MIME-Version: 1.0
Message-Id: <20240811-microblaze-v1-1-2781ba343e75@gmx.net>
X-B4-Tracking: v=1; b=H4sIAKV+uGYC/x3MTQqAIBBA4avErBMciZKuEi2sxhrwJxQiku6et
 PwW7xXIlJgyjE2BRBdnjqEC2wbWw4SdBG/VoKTqpEYUntcUF2ceEtpabXqFQzcg1OBMZPn+ZxO
 4yyuY3/cDl4LOmWIAAAA=
To: lvm-devel@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723367092; l=2401;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=/jIoqjC9HzN9jLlhBHdisfW2C1WpRbO4792I/s/913g=;
 b=3Zs9la8ZPyPtID4e77odGCPmIitjOeoQRKnvgzCh+GYHSl1NO6PfHOlZc14IJUctSdFx5ryBT
 JfoK1xujQf7BRvqmI09W2XWSp+LZ9epalzwru0h+BCOtMI7kLRxzdja
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:WOrrRbzpFtEMi6+1crbbcGv0FhIPJkq1p9+4LxfFPYtoSA9Etpa
 tTiU7LaOYmadEx7uDoVmvJy5iOXUxCgKMe5ZreARuLtQSeNRhGMtmWYV3qRWRH/w+gJVVM3
 lBtl1q/1XCy3uptSiiNTmVYAtjS986oMGjmxGoaFMCb2RLjM+zfcrC6Yau22zmp9OkLXmB3
 EchULdjLJiHRDb6vth7Yw==
UI-OutboundReport: notjunk:1;M01:P0:H8rBUuTISr8=;IHCswTQfM4hlCWRaYt/Kdbx//Kp
 nv1uBpbPWEIrnTEAlmQ6eqiXZw33Qs1ug8oiwd7I053YHQ22JXVv11Rh1DT0Tu4Iqqt+Qjoig
 6tKnTuMy7bcCjakg4hRQc/0DqlDoPC8FZJE3oaHOV4tOpkOQ3ShTfB+n528Wcrd+GTsb3EaVf
 J91vkpVTTdntdwGF8JpX3bup8Dd0CYuM57I9AEKWHHXSNiTaSg+iJbrQMOm81WS3C3vohVRPx
 fQuOMVVhtmkicMWX/iM+ig9hvzM1ZzJ6IjCw55xSpPhijmkF1IDSSgV7kCsmSh3Et7A8NVLs7
 yNSWXMBBCGwj1V1pe1G1KhRJjyLKZE7fhhet8SZvo/k68ha0UkdajaHGohpEpHUXEoqb4LtbA
 jbz5cbwh3uUa6aRyU+UWfrr0Tk5bfVQM3IW6CH6phVIShGAeHEasUMpv513bKCwXV/whjYuK5
 DzafK2dN3o8wAJBKmRxm4XQ479C2Ll4QJYRTjqnxNa8dAnsBZ8gzXdCGS9/JZMsbD0uXBOe0M
 VinnHKxSDxwLnWrWnDGJOn1pxNp6VHSvzYOPfpFqQVY9Mb0i/KPFP8+VZRwWlntz496gri3fw
 EcsxpArJ5tPtsVsDkHUKHnNmrmGHP69Y1yH8VkcW8RzfoT9wsXOoOsW73YWH2W+m6ENQSRWWf
 icwsPxZK5Pt2QT94wbZG+rMWPJXr5o5RV1T9kynStAnCji3erwBX6NxQl21hWrU2jLNobun4B
 fYrCWanNWTBVPj6VkKm1JFDUtLO/JRbaLaskAXlo15NGIEiC69ce3LDBN+eLDAazJumMjK4Hy
 ngPYKzLEGPFoNs/OoNUx0fvg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1723367093; x=1723971893; i=j.neuschaefer@gmx.net;
 bh=PQoK75LGskjImgHPQvMqpAYAVpmyezFeIkSz//GmB+g=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ScCpvPN0vllp5kHLS68qLVRljJ/LwHaCbg/dThlyHLqomA/ssMA9qSoc29mOtYCp
 LFlbu5EYepNqHFu4vWG7aJPdpLTyGRAPwU/H4zXdO62Rs50NKws66X9cnPyw41m92
 NqTW43A+dWvqIxlO81o48r5AnjClOn6CwLkf/5bixVIiWOK2iZRP2M0BUsS2q7C/M
 QgCuh5ZFAZgR6DYIEgPw8DKK5+xc9YuZu6f64q+HmJXHb+danwN5NcZpFX17Lr/0N
 aPoIp3UQw3o+5oQldYEnvrR85rPkaR8LjJ8NWH/RneSCYOFToSZf28d2nG3j+aIU4
 +M8zoLnXhqoELPC2hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ScCpvPN0
Subject: [Buildroot] [PATCH lvm2] acinclude.m4: Link when trying CCFLAGS
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
Cc: musl@lists.openwall.com,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhyb3VnaCBhIGJ1aWxkIGZhaWx1cmUgb2YgTFZNMiBvbiBtdXNsLWxpYmMgMS4yLjUgaW4gdGhl
IEJ1aWxkcm9vdAphdXRvYnVpbGQgc2VydmljZVsxXSwgSSBub3RpY2VkIHRoYXQgbXVzbC1saWJj
J3MgU2NydDEgZm9yIG1pY3JvYmxhemUKcHJvZHVjZXMgYSByZWxvY2F0aW9uIHRhcmdldGluZyB0
aGUgLnRleHQgc2VjdGlvbiwgd2hpY2ggc3Vic2VxdWVudGx5CmxlYWRzIHRvIGEgY3Jhc2ggYXQg
cnVuLXRpbWUgYmVjYXVzZSBtdXNsLWxpYmMgZG9lcyBub3Qgc3VwcG9ydAp0ZXh0cmVsc1syXS4g
QnVpbGRyb290IHVzZXMgdGhlICIteiB0ZXh0IiBsaW5rZXIgb3B0aW9uIHRvIGNhdGNoCnRleHRy
ZWxzIGVhcmx5LCBvbiBtdXNsLWxpYmMuCgpUaGUgZXJyb3IgY2FuIGJlIHJlZHVjZWQgdG8gdGhl
IGZvbGxvd2luZyB0ZXN0IGNhc2U6CgogICQgY2F0IGhlbGxvLmMKICAjaW5jbHVkZSA8c3RkaW8u
aD4KICBpbnQgbWFpbih2b2lkKSB7IHB1dHMoIkhlbGxvIHdvcmxkISIpOyByZXR1cm4gMDsgfQog
ICQgaG9zdC9iaW4vbWljcm9ibGF6ZS1idWlsZHJvb3QtbGludXgtbXVzbC1nY2MgaGVsbG8uYyAt
eiB0ZXh0IC1waWUgLWZQSUMKICBtaWNyb2JsYXplLWJ1aWxkcm9vdC1saW51eC1tdXNsL2Jpbi9s
ZDogbWljcm9ibGF6ZS1idWlsZHJvb3QtbGludXgtbXVzbC9zeXNyb290L2xpYi9TY3J0MS5vOgog
ICAgd2FybmluZzogcmVsb2NhdGlvbiBhZ2FpbnN0IGBfc3RhcnRfYycgaW4gcmVhZC1vbmx5IHNl
Y3Rpb24gYC50ZXh0JwogIG1pY3JvYmxhemUtYnVpbGRyb290LWxpbnV4LW11c2wvYmluL2xkOiBy
ZWFkLW9ubHkgc2VnbWVudCBoYXMgZHluYW1pYyByZWxvY2F0aW9ucwogIGNvbGxlY3QyOiBlcnJv
cjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwoKTFZNMiB1c2VzIC1waWUgb25seSBhZnRlciB0
aGUgQUNfVFJZX0NDRkxBRyBtYWNybyBoYXMgZGV0ZXJtaW5lZCB0aGF0IGl0CmNhbiBiZSB1c2Vk
LiBUaGlzIGlzIHdoZXJlIHRoZSBwcm9ibGVtIGJlZ2luczogQUNfVFJZX0NDRkxBRyBvbmx5IHRy
aWVzCmNvbXBpbGluZywgaXQgZG9lcyBub3QgdHJ5IGxpbmtpbmcgdGhlIHJlc3VsdGluZyBvYmpl
Y3QgZmlsZS4KClRvIGNhdGNoIHByb2JsZW1zIGxpa2UgdGhpcywgdGhpcyBwYXRjaCBjaGFuZ2Vz
IEFDX1RSWV9DQ0ZMQUcgdG8gbGluayBpbgphZGRpdGlvbiB0byBjb21waWxpbmcuIEJ5IGRldGVj
dGluZyBjb3JyZWN0bHkgdGhhdCAtcGllIGRvZXMgbm90IHdvcmsgb24KbXVzbC1saWJjL21pY3Jv
YmxhemUgd2l0aCAtenRleHQsIHRoZSBidWlsZCBmYWlsdXJlIGluIEJ1aWxkcm9vdCBpcyBmaXhl
ZC4KClsxXTogaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZGM0L2RjNGZj
MzNlYWVhZmU1ZDY3MDdkMjZhMzczNTYwNDAyNTMzOTU0ZjYvYnVpbGQtZW5kLmxvZwpbMl06IGh0
dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0cy9tdXNsLzIwMjAvMDkvMjUvNAoKU2lnbmVkLW9m
Zi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0tCkhpLCBJJ20g
Y3Jvc3MtcG9zdGluZyB0aGlzIHRvIHRoZSBMVk0yLCBCdWlsZHJvb3QsIGFuZCBtdXNsIG1haWxp
bmcKbGlzdHMgdG8gZ2V0IHBvdGVudGlhbCBmZWVkYmFjayBlYXJseSBvbi4KLS0tCiBhY2luY2x1
ZGUubTQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9hY2luY2x1ZGUubTQgYi9hY2luY2x1ZGUubTQKaW5kZXggNDdmZGQ1
OWMzLi45YjFkM2E2MDUgMTAwNjQ0Ci0tLSBhL2FjaW5jbHVkZS5tNAorKysgYi9hY2luY2x1ZGUu
bTQKQEAgLTI1LDcgKzI1LDcgQEAgQUNfREVGVU4oW0FDX1RSWV9DQ0ZMQUddLAogICAgIGFjX3Nh
dmVfQ0ZMQUdTPSRDRkxBR1MKICAgICBDRkxBR1M9JDEKICAgICBBQ19DQUNIRV9DSEVDSyhbd2hl
dGhlciAkQ0MgYWNjZXB0cyAkMSBmbGFnXSwgW2FjX2N2X2ZsYWdfJDJdLAotCVtBQ19DT01QSUxF
X0lGRUxTRShbQUNfTEFOR19QUk9HUkFNKCldLAorCVtBQ19MSU5LX0lGRUxTRShbQUNfTEFOR19Q
Uk9HUkFNKCldLAogCQkJICAgW0FTX1ZBUl9TRVQoW2FjX2N2X2ZsYWdfJDJdLCBbeWVzXSldLAog
CQkJICAgW0FTX1ZBUl9TRVQoW2FjX2N2X2ZsYWdfJDJdLCBbbm9dKV0pXSkKICAgICBDRkxBR1M9
JGFjX3NhdmVfQ0ZMQUdTCgotLS0KYmFzZS1jb21taXQ6IDkwYTg0NWE3MDg3NDc4YTdjZGM3YTYw
ZDg5ZDJlN2VlMTM2NjE2MGUKY2hhbmdlLWlkOiAyMDI0MDgxMS1taWNyb2JsYXplLThmZjhhNjIx
NzQ3MQoKQmVzdCByZWdhcmRzLAotLQpKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgu
bmV0PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
