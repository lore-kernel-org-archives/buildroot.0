Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BAAC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 14:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47482404DF;
	Fri,  7 Mar 2025 14:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDEHgy0PY1OP; Fri,  7 Mar 2025 14:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C18D403C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C18D403C3;
	Fri,  7 Mar 2025 14:09:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 079A5944
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFFF560667
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1x1kakjhnUy for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 14:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=luc.beaufils@savoirfairelinux.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9036605DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9036605DA
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9036605DA
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 3D0FF9C64A3;
 Fri,  7 Mar 2025 09:09:33 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id czGutJU8O_vL; Fri,  7 Mar 2025 09:09:32 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id B30749C89B7;
 Fri,  7 Mar 2025 09:09:32 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B30749C89B7
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id lDlnnGIZwVp7; Fri,  7 Mar 2025 09:09:32 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 8DC479C64A3;
 Fri,  7 Mar 2025 09:09:32 -0500 (EST)
Date: Fri, 7 Mar 2025 09:09:32 -0500 (EST)
From: Luc Beaufils <luc.beaufils@savoirfairelinux.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <2035865859.922489.1741356572539.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <87r039xdqa.fsf@tarshish>
References: <20250307095904.19075-1-luc.beaufils@savoirfairelinux.com>
 <20250307095904.19075-3-luc.beaufils@savoirfairelinux.com>
 <87r039xdqa.fsf@tarshish>
MIME-Version: 1.0
X-Mailer: Zimbra 10.1.1_GA_0424 (ZimbraWebClient - FF136
 (Linux)/10.1.1_GA_0424)
Thread-Topic: package/imx-cst: add new package
Thread-Index: ja8c2RY47tqrY9ivuDFrZnXfGTCFjw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1741356572; bh=CTz4yTKSmLfJPVX7m1MpZLP8cQCUESYaPJRJaOVLWFU=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=XzjtwFMqgoOcWAu6Y92joHmAv1aEoh9DbIsWSFDq1zuQ/2jdGvbreTIP+AvLDIWhN
 nkZg0VaAxe/C0h/LZQnlLttuGG0aQDd/iHUt2MzPnRLebRYuRm14Wjxz9uyVbO4SRq
 CuIQ7wxRNT3+Pnow9YhyF8o5K3+cPu8Hnkr5e6xJ7XP2EaOAPRA9WldZkanEIRcRWG
 UgmFbhQSgXoGa32tK+V3TDeb7Cm0vDN6Lw0cNQt51FPl0O/gGqmj5s1ytyyz5/AhR5
 gxqgmA24Rc1XuvF/D7KA1Rpx+mY1Sbc7owwy60ipoWSR23My8NIb51odIqt7JJLpec
 OXU6c9N3t+mlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=XzjtwFMq
Subject: Re: [Buildroot] [PATCH v2 2/2] package/imx-cst: add new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LS0tLS0gTGUgNyBNYXIgMjUsIMOgIDEyOjQ5LCBCYXJ1Y2ggU2lhY2ggYmFydWNoQHRrb3MuY28u
aWwgYSDDqWNyaXQgOgoKPiBIaSBMdWMsCj4gCj4gT24gRnJpLCBNYXIgMDcgMjAyNSwgTHVjIEJF
QVVGSUxTIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pbXgtY3N0L2lteC1jc3QubWsg
Yi9wYWNrYWdlL2lteC1jc3QvaW14LWNzdC5tawo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBp
bmRleCAwMDAwMDAwMDAwLi5hM2YxY2RmNmE0Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvcGFj
a2FnZS9pbXgtY3N0L2lteC1jc3QubWsKPj4gQEAgLTAsMCArMSw1MCBAQAo+PiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPj4gKyMKPj4gKyMgaW14LWNzdAo+PiArIwo+PiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPj4gKwo+PiArIyBkZWJpYW4vMy40LjAtZGZzZwo+PiArSU1YX0NTVF9WRVJT
SU9OID0gMy40LjArZGZzZwo+PiArSU1YX0NTVF9TT1VSQ0UgPSBpbXgtY29kZS1zaWduaW5nLXRv
b2xfJChJTVhfQ1NUX1ZFUlNJT04pLm9yaWcudGFyLnh6Cj4+ICtJTVhfQ1NUX1NJVEUgPSBodHRw
czovL2RlYi5kZWJpYW4ub3JnL2RlYmlhbi9wb29sL21haW4vaS9pbXgtY29kZS1zaWduaW5nLXRv
b2wKPiAKPiBEZWJpYW4gc291cmNlIHBhY2thZ2VzIGFyZSByZW1vdmVkIGZyb20gbWFpbiBvbmNl
IHRoZSByZWxlYXNlIHRoZXkKPiBiZWxvbmcgdG8gYXJlIHJldGlyZWQuIEJ1aWxkcm9vdCB1c3Vh
bGx5IHVzZXMgdGhlIERlYmlhbiBzbmFwc2hvdAo+IGFyY2hpdmUuIFNlZSBleGFtcGxlIGluIGFs
c2FtaXhlcmd1aSwgY2Rya2l0LCBjdnMsIGFuZCBhIGZldyBtb3JlCj4gcGFja2FnZXMuCj4gCj4g
YmFydWNoCj4KCkhpLApUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgpVbmZvcnR1bmF0ZWx5LCBJ
IGhhdmVuJ3QgYmVlbiBhYmxlIHRvIGZpbmQgdGhlIHNvdXJjZXMgb2YgdGhpcyBwYWNrYWdlIGlu
IHRoZSBEZWJpYW4gc25hcHNob3QuCgpBcyBhbiBhbHRlcm5hdGl2ZSwgSSBwcm9wb3NlIHVzaW5n
IHRoZSBBcGVydGlzIEdpdExhYiByZXBvc2l0b3J5OgoKLUlNWF9DU1RfVkVSU0lPTiA9IDMuNC4w
K2Rmc2cKLUlNWF9DU1RfU09VUkNFID0gaW14LWNvZGUtc2lnbmluZy10b29sXyQoSU1YX0NTVF9W
RVJTSU9OKS5vcmlnLnRhci54egotSU1YX0NTVF9TSVRFID0gaHR0cHM6Ly9kZWIuZGViaWFuLm9y
Zy9kZWJpYW4vcG9vbC9tYWluL2kvaW14LWNvZGUtc2lnbmluZy10b29sCitJTVhfQ1NUX1ZFUlNJ
T04gPSBkZWJpYW4vMy40LjArZGZzZy0yCitJTVhfQ1NUX1NJVEUgPSBodHRwczovL2dpdGxhYi5h
cGVydGlzLm9yZy9wa2cvaW14LWNvZGUtc2lnbmluZy10b29sCitJTVhfQ1NUX1NJVEVfTUVUSE9E
ID0gZ2l0CgpEb2VzIHRoaXMgc29sdXRpb24gd29yayBmb3IgeW91PwoKTHVjCgo+PiArSU1YX0NT
VF9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4+ICtJTVhfQ1NUX0xJQ0VOU0VfRklMRVMgPSBMSUNF
TlNFLmJzZDMKPj4gKwo+PiArSE9TVF9JTVhfQ1NUX0RFUEVOREVOQ0lFUyA9IGhvc3QtYnlhY2Mg
aG9zdC1mbGV4IGhvc3Qtb3BlbnNzbAo+PiArCj4+ICtpZm5lcSAoJChmaWx0ZXIgJTY0LCQoSE9T
VEFSQ0gpKSwpCj4+ICtIT1NUX0lNWF9DU1RfT1NUWVBFID0gbGludXg2NAo+PiArZWxzZQo+PiAr
SE9TVF9JTVhfQ1NUX09TVFlQRSA9IGxpbnV4MzIKPj4gK2VuZGlmCj4+ICsKPj4gK0hPU1RfQ0ZM
QUdTICs9IC1Xbm8tZXJyb3I9dW51c2VkLXJlc3VsdAo+PiArCj4+ICsjIFdlIGRvbid0IHVzZSBI
T1NUX0NPTkZJR1VSRV9PUFRTIHdoZW4gYnVpbGRpbmcgY3N0LCBiZWNhdXNlIHdlIG5lZWQKPj4g
KyMgdG8gcHJlc2VydmUgdGhlIENGTEFHUy9MREZMQUdTIHVzZWQgYnkgdGhlaXIgTWFrZWZpbGUu
Cj4+ICtkZWZpbmUgSE9TVF9JTVhfQ1NUX0JVSUxEX0NNRFMKPj4gKwkkKEhPU1RfTUFLRV9FTlYp
ICQoTUFLRSkgXAo+PiArCQlPU1RZUEU9JChIT1NUX0lNWF9DU1RfT1NUWVBFKSBcCj4+ICsJCU9Q
RU5TU0xfUEFUSD0kKEhPU1RfRElSKS9pbmNsdWRlL29wZW5zc2wgXAo+PiArCQlFTkNSWVBUSU9O
PXllcyBcCj4+ICsJCUFSPSIkKEhPU1RBUikiIFwKPj4gKwkJQ0M9IiQoSE9TVENDKSIgXAo+PiAr
CQlMRD0iJChIT1NUQ0MpIiBcCj4+ICsJCU9CSkNPUFk9IiQoSE9TVE9CSkNPUFkpIiBcCj4+ICsJ
CVJBTkxJQj0iJChIT1NUUkFOTElCKSIgXAo+PiArCQlFWFRSQUNGTEFHUz0iJChIT1NUX0NGTEFH
UykgJChIT1NUX0NQUEZMQUdTKSIgXAo+PiArCQlFWFRSQUxERkxBR1M9IiQoSE9TVF9MREZMQUdT
KSIgXAo+PiArCQktQyAkKEBEKQo+PiArCSQoSE9TVF9NQUtFX0VOVikgJChNQUtFKSAkKEhPU1Rf
Q09ORklHVVJFX09QVFMpIFwKPj4gKwkJQ09QVFM9IiQoSE9TVF9DRkxBR1MpICQoSE9TVF9DUFBG
TEFHUykgJChIT1NUX0xERkxBR1MpIiBcCj4+ICsJCS1DICQoQEQpL2FkZC1vbnMvaGFiX2NzZl9w
YXJzZXIKPj4gK2VuZGVmCj4+ICsKPj4gK2RlZmluZSBIT1NUX0lNWF9DU1RfSU5TVEFMTF9DTURT
Cj4+ICsJJChJTlNUQUxMKSAtRCAtbSA3NTUgJChARCkvY29kZS9vYmouJChIT1NUX0lNWF9DU1Rf
T1NUWVBFKS9jc3QKPj4gJChIT1NUX0RJUikvYmluL2NzdAo+PiArCSQoSU5TVEFMTCkgLUQgLW0g
NzU1ICQoQEQpL2NvZGUvb2JqLiQoSE9TVF9JTVhfQ1NUX09TVFlQRSkvc3JrdG9vbAo+PiAkKEhP
U1RfRElSKS9iaW4vc3JrdG9vbAo+PiArCSQoSU5TVEFMTCkgLUQgLW0gNzU1ICQoQEQpL2FkZC1v
bnMvaGFiX2NzZl9wYXJzZXIvY3NmX3BhcnNlcgo+PiAkKEhPU1RfRElSKS9iaW4vY3NmX3BhcnNl
cgo+PiArZW5kZWYKPj4gKwo+PiArJChldmFsICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQo+IAo+
IC0tCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj4gPX0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9Cj4gICAtIGJhcnVj
aEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28u
aWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
