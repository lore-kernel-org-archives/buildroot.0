Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF73C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F7AC424A0;
	Tue,  7 Jun 2022 14:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yy-ELdSuUJ4K; Tue,  7 Jun 2022 14:22:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67B4D42490;
	Tue,  7 Jun 2022 14:22:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB6541BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D830660FAB
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dawncrow.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHfoeH_bPNuU for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:22:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F00D60FA6
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654611728;
 s=strato-dkim-0002; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=+JkYqVawh5CPxfZbqPfTE18vwp+lm2trGMAw2f87oFk=;
 b=iugDVbTir5yEV5K6XgMLk7tJ5u0mDf0fvJlz/nog4n1lrpZ3uuxmqPjOBP/kSKXQM6
 Gx960P/qYhtTMtlCatjqO8s1KUlXQqocYS6B0IWF/PaCLFEru0H5YmozmKf1lFgsWy34
 fa1KC958Fl3pIsis/zVXjP4NXi+U4EYItnzg8IfzDE9jN2Y8o8QHtm1j1gyGk2kXcsBp
 WBjB6059ifYU9qp6J/cAGGRklSiFhL/REBLS77+WL8QUf/3cHWCTk/mZWMXkU/dvevZ8
 vw09AdwdmSWircrsX7aUykSBmtattc/Gu8DTfFYhXO1EQ/8aO/BSvudILJ+msS5jDLLA
 5x2w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOK7nWzzuvt/yikxt/E0="
X-RZG-CLASS-ID: mo00
Received: from tesla.fritz.box by smtp.strato.de (RZmta 47.45.0 DYNA|AUTH)
 with ESMTPSA id Q06403y57EM8Dxv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Tue, 7 Jun 2022 16:22:08 +0200 (CEST)
From: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 16:22:05 +0200
Message-Id: <20220607142205.248102-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libkrb5: bump to 1.20
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgotLS0KIC4uLi1k
ZXJlZi1vbi1UR1MtaW5uZXItYm9keS1udWxsLXNlcnZlci5wYXRjaCB8IDQ3IC0tLS0tLS0tLS0t
LS0tLS0tLS0KIHBhY2thZ2UvbGlia3JiNS9saWJrcmI1Lmhhc2ggICAgICAgICAgICAgICAgICB8
ICA0ICstCiBwYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5tayAgICAgICAgICAgICAgICAgICAgfCAg
OCArLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJrcmI1LzAwMDEtRml4LUtEQy1udWxsLWRl
cmVmLW9uLVRHUy1pbm5lci1ib2R5LW51bGwtc2VydmVyLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJrcmI1LzAwMDEtRml4LUtEQy1udWxsLWRlcmVmLW9uLVRHUy1pbm5lci1ib2R5LW51
bGwtc2VydmVyLnBhdGNoIGIvcGFja2FnZS9saWJrcmI1LzAwMDEtRml4LUtEQy1udWxsLWRlcmVm
LW9uLVRHUy1pbm5lci1ib2R5LW51bGwtc2VydmVyLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCBlYzZmNjIzMzgwLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvbGlia3JiNS8w
MDAxLUZpeC1LREMtbnVsbC1kZXJlZi1vbi1UR1MtaW5uZXItYm9keS1udWxsLXNlcnZlci5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDQ3ICswLDAgQEAKLUZyb20gZDc3NWM5NWFmNzYwNmE1MWJm
Nzk1NDdhOTRmYTUyZGRkMWNiN2Y0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEdy
ZWcgSHVkc29uIDxnaHVkc29uQG1pdC5lZHU+Ci1EYXRlOiBUdWUsIDMgQXVnIDIwMjEgMDE6MTU6
MjcgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4IEtEQyBudWxsIGRlcmVmIG9uIFRHUyBpbm5l
ciBib2R5IG51bGwgc2VydmVyCi0KLUFmdGVyIHRoZSBLREMgZGVjb2RlcyBhIEZBU1QgaW5uZXIg
Ym9keSwgaXQgZG9lcyBub3QgY2hlY2sgZm9yIGEgbnVsbAotc2VydmVyLiAgUHJpb3IgdG8gY29t
bWl0IDM5NTQ4YTViMTdiYmRhOWVlYjYzNjI1YTIwMWNmZDE5YjlkZTFjNWIgdGhpcwotd291bGQg
dHlwaWNhbGx5IHJlc3VsdCBpbiBhbiBlcnJvciBmcm9tIGtyYjVfdW5wYXJzZV9uYW1lKCksIGJ1
dCB3aXRoCi10aGUgYWRkaXRpb24gb2YgZ2V0X2xvY2FsX3RndCgpIGl0IHJlc3VsdHMgaW4gYSBu
dWxsIGRlcmVmZXJlbmNlLiAgQWRkCi1hIG51bGwgY2hlY2suCi0KLVJlcG9ydGVkIGJ5IEpvc2Vw
aCBTdXR0b24gb2YgQ2F0YWx5c3QuCi0KLUNWRS0yMDIxLTM3NzUwOgotCi1JbiBNSVQga3JiNSBy
ZWxlYXNlcyAxLjE0IGFuZCBsYXRlciwgYW4gYXV0aGVudGljYXRlZCBhdHRhY2tlciBjYW4KLWNh
dXNlIGEgbnVsbCBkZXJlZmVyZW5jZSBpbiB0aGUgS0RDIGJ5IHNlbmRpbmcgYSBGQVNUIFRHUyBy
ZXF1ZXN0IHdpdGgKLW5vIHNlcnZlciBmaWVsZC4KLQotdGlja2V0OiA5MDA4IChuZXcpCi10YWdz
OiBwdWxsdXAKLXRhcmdldF92ZXJzaW9uOiAxLjE5LW5leHQKLXRhcmdldF92ZXJzaW9uOiAxLjE4
LW5leHQKLQotW1JldHJpZXZlZCBmcm9tOgotaHR0cHM6Ly9naXRodWIuY29tL2tyYjUva3JiNS9j
b21taXQvZDc3NWM5NWFmNzYwNmE1MWJmNzk1NDdhOTRmYTUyZGRkMWNiN2Y0OV0KLVNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotLS0t
Ci0gc3JjL2tkYy9kb190Z3NfcmVxLmMgfCA1ICsrKysrCi0gMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2tkYy9kb190Z3NfcmVxLmMgYi9zcmMva2Rj
L2RvX3Rnc19yZXEuYwotaW5kZXggNTgyZTQ5N2NjOS4uMzJkYzY1ZmE4ZSAxMDA2NDQKLS0tLSBh
L3NyYy9rZGMvZG9fdGdzX3JlcS5jCi0rKysgYi9zcmMva2RjL2RvX3Rnc19yZXEuYwotQEAgLTIw
NCw2ICsyMDQsMTEgQEAgcHJvY2Vzc190Z3NfcmVxKGtyYjVfa2RjX3JlcSAqcmVxdWVzdCwga3Ji
NV9kYXRhICpwa3QsCi0gICAgICAgICBzdGF0dXMgPSAiRklORF9GQVNUIjsKLSAgICAgICAgIGdv
dG8gY2xlYW51cDsKLSAgICAgfQotKyAgICBpZiAoc3ByaW5jID09IE5VTEwpIHsKLSsgICAgICAg
IHN0YXR1cyA9ICJOVUxMX1NFUlZFUiI7Ci0rICAgICAgICBlcnJjb2RlID0gS1JCNUtEQ19FUlJf
U19QUklOQ0lQQUxfVU5LTk9XTjsKLSsgICAgICAgIGdvdG8gY2xlYW51cDsKLSsgICAgfQotIAot
ICAgICBlcnJjb2RlID0gZ2V0X2xvY2FsX3RndChrZGNfY29udGV4dCwgJnNwcmluYy0+cmVhbG0s
IGhlYWRlcl9zZXJ2ZXIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICZsb2NhbF90Z3Qs
ICZsb2NhbF90Z3Rfc3RvcmFnZSwgJmxvY2FsX3RndF9rZXkpOwpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJrcmI1L2xpYmtyYjUuaGFzaCBiL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lmhhc2gKaW5k
ZXggODYwZjgyODc5My4uMmZjZTI0YjQ1YiAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJrcmI1L2xp
YmtyYjUuaGFzaAorKysgYi9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5oYXNoCkBAIC0xLDUgKzEs
NSBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgcGdwIHNpZ25hdHVyZQot
c2hhMjU2ICA2NjA4NWUyZjU5NDc1MWU3N2U4MmUwZGJmN2JiYzM0NDMyMGZiNDhhOWRmMmE2MzNj
ZmRkOGY3ZDZkYTk5ZmM4ICBrcmI1LTEuMTguNC50YXIuZ3oKK3NoYTI1NiAgN2UwMjJiZGQzYzg1
MTgzMDE3M2Y5ZmFhYTAwNmEyMzBhMGUwZmRhZDRjOTUzZTg1YmZmNGJmMGRhMDM2ZTEyZiAga3Ji
NS0xLjIwLnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZToKLXNoYTI1NiAgN2ZiYThi
MDc2YmRjMmNmZWYxZDA4MTNjNWQ0MDY3ZDc2ZDViZTYwYzMyZDg0ZGUyMmQ1ZDFjZjQ1MTc0NGZl
YiAgTk9USUNFCitzaGEyNTYgIGNmYWRjZjdiMmVhZDJmM2FmNzkzYzI1YzAwNjM4Yzk5MDhhYzAw
MjNiMTAxNjk1ZjQwY2I5YTAzYjE2ODExZGMgIE5PVElDRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aWJrcmI1L2xpYmtyYjUubWsgYi9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5tawppbmRleCBiZDc1
MWQ5Yzc3Li5jMGQzMjY5OTYwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5t
aworKysgYi9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5tawpAQCAtNCw5ICs0LDggQEAKICMKICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQktSQjVfVkVSU0lPTl9NQUpPUiA9IDEuMTgKLUxJ
QktSQjVfVkVSU0lPTiA9ICQoTElCS1JCNV9WRVJTSU9OX01BSk9SKS40Ci1MSUJLUkI1X1NJVEUg
PSBodHRwczovL3dlYi5taXQuZWR1L2tlcmJlcm9zL2Rpc3Qva3JiNS8kKExJQktSQjVfVkVSU0lP
Tl9NQUpPUikKK0xJQktSQjVfVkVSU0lPTiA9IDEuMjAKK0xJQktSQjVfU0lURSA9IGh0dHBzOi8v
d2ViLm1pdC5lZHUva2VyYmVyb3MvZGlzdC9rcmI1LyQoTElCS1JCNV9WRVJTSU9OKQogTElCS1JC
NV9TT1VSQ0UgPSBrcmI1LSQoTElCS1JCNV9WRVJTSU9OKS50YXIuZ3oKIExJQktSQjVfU1VCRElS
ID0gc3JjCiBMSUJLUkI1X0xJQ0VOU0UgPSBNSVQKQEAgLTE2LDkgKzE1LDYgQEAgTElCS1JCNV9D
UEVfSURfUFJPRFVDVCA9IGtlcmJlcm9zXzUKIExJQktSQjVfREVQRU5ERU5DSUVTID0gaG9zdC1i
aXNvbiAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQogTElCS1JCNV9JTlNUQUxMX1NUQUdJTkcg
PSBZRVMKIAotIyAwMDAxLUZpeC1LREMtbnVsbC1kZXJlZi1vbi1UR1MtaW5uZXItYm9keS1udWxs
LXNlcnZlci5wYXRjaAotTElCS1JCNV9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyMS0zNzc1MAotCiAj
IFRoZSBjb25maWd1cmUgc2NyaXB0IHVzZXMgQUNfVFJZX1JVTiB0ZXN0cyB0byBjaGVjayBmb3Ig
dGhvc2UgdmFsdWVzLAogIyB3aGljaCBkb2Vzbid0IHdvcmsgaW4gYSBjcm9zcy1jb21waWxhdGlv
biBzY2VuYXJpby4gVGhlcmVmb3JlLAogIyB3ZSBmZWVkIHRoZSBjb25maWd1cmUgc2NyaXB0IHdp
dGggdGhlIGNvcnJlY3QgYW5zd2VyIGZvciB0aG9zZSB0ZXN0cwotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
