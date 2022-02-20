Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAACC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 10:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 355FC40488;
	Sun, 20 Feb 2022 10:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTB_96D0skzb; Sun, 20 Feb 2022 10:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F141E40469;
	Sun, 20 Feb 2022 10:08:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 957741BF59D
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 834F76059B
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Li8Pqftz6seR for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 10:08:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F7516058F
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:08:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7478:162b:1cf3:1d5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A60BF5FF88;
 Sun, 20 Feb 2022 11:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645351729;
 bh=QSF/ThhsJiyK/OkbZ8dLsNcfsw/jlc4EGaCfRrmAv0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l5p94q3PJemxKtVk2DsTvVDBnJUUzCKwUyMOtGNWVGni4vcxcQ6sTlD+2q/1qmEzy
 xyDqjYyFxmfbiNL5b7Ddc0e4Br0t83e4tgMTL6QPZid9mvMwqvh9wi9eiPxRfxvtHG
 v50+G0raWNrx3rvxGL4bfQUCFpeJlpdoZ68WS+2iMyNThbvnjEdVvmAdpo3kFV4zZy
 LXxssU2QhAuGdQrdxlKixEl17CjwoOaIU3XgQnB8c4E8q9hG9QhoLciZmArwMBpuhM
 uPxvS6lsP8FoVtYD7tJwCWLPG/IokjUTgLUiR/pJ/xz2j67Ov/pCe1R3nCtUWHZ2PV
 h4M1ZKcK/nNCQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 11:08:46 +0100
Date: Sun, 20 Feb 2022 11:08:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220220100846.GU522310@scaer>
References: <20220219142104.3753374-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220219142104.3753374-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/apr-util: drop
 APR_UTIL_FIX_{LIBTOOL, RULES_MK}
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMi0wMi0xOSAxNToyMSArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gRHJvcCBBUFJfVVRJTF9GSVhfe0xJQlRPT0wsUlVMRVNfTUt9IHdo
aWNoIHdlcmUgYWRkZWQgYnkgY29tbWl0Cj4gODRiNGMxOWU1NTEyODg5MTFhMjMwYzJiNzNlOTZi
YzZlMmVkMTJmOSBidXQgaXMgbm90IG5lZWRlZCBzaW5jZSB0aGUKPiBhZGRpdGlvbiBvZiBQUERf
RklYVVBfUEFUSFMgaW4gY29tbWl0Cj4gYjA2Mjk0ZTk4OTdlOTA4NjI2NTY0MTZlOGI2N2ZkYWNl
MTU0ODhkNwo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZh
YnJpY2VAZ21haWwuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRoZXJlIGlzIHN0
aWxsIG9uZSBvY2N1cmVuY2Ugb2YgYSBzaW1pbGFyIGNvbnN0cnVjdCBpbiBxdDU6CgogICAxNCAj
IFRoZSBmaWxlICJxdC5jb25mIiBjYW4gYmUgdXNlZCB0byBvdmVycmlkZSB0aGUgaGFyZC1jb2Rl
ZCBwYXRocyB0aGF0IGFyZQogICAxNSAjIGNvbXBpbGVkIGludG8gdGhlIFF0IGxpYnJhcnkuIFdl
IG5lZWQgaXQgdG8gbWFrZSAicW1ha2UiIHJlbG9jYXRhYmxlIGFuZAogICAxNiAjIHR3ZWFrIHRo
ZSBwZXItcGFja2FnZSBpbnN0YWxsIHBhdGhlcwogICAxNyBkZWZpbmUgUVQ1X0lOU1RBTExfUVRf
Q09ORgogICAxOCDCuyAgIHJtIC1mICQoSE9TVF9ESVIpL2Jpbi9xdC5jb25mCiAgIDE5IMK7ICAg
c2VkIC1lICJzfEBASE9TVF9ESVJAQHwkKEhPU1RfRElSKXwiIC1lICJzfEBAU1RBR0lOR19ESVJA
QHwkKFNUQUdJTkdfRElSKXwiIFwKICAgMjAgwrsgICDCuyAgICQoUVQ1QkFTRV9QS0dESVIpL3F0
LmNvbmYuaW4gPiAkKEhPU1RfRElSKS9iaW4vcXQuY29uZgogICAyMSBlbmRlZgogICAyMgogICAy
MyBpZmVxICgkKEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUykseSkKICAgMjQgZGVmaW5lIFFU
NV9RVF9DT05GX0ZJWFVQCiAgIDI1IMK7ICAgJChRVDVfSU5TVEFMTF9RVF9DT05GKQogICAyNiBl
bmRlZgogICAyNyBlbmRpZgoKVGhlIGdlbmVyaWMgZml4dXAgc2NhbnMgJChIT1NUX0RJUiksIHNv
IGl0IHNob3VsZCBoaXQgdGhpcyBmaWxlIHRvbywgbm8/CgpRVDVfUVRfQ09ORl9GSVhVUCBpcyB1
c2VkIGluIHR3byBsb2NhdGlvbnM6CgogIC0gcGtnLXFtYWtlLm1rIC0+IGFzIGEgcG9zdC1wcmVh
cGFyZSBob29rLCB3aGljaCBpcyBleGFjdGx5IHdoZXJlIHRoZQogICAgZ2VuZXJpYyBmaXh1cCBy
dW5zIHRvbywgc28gUVQ1X1FUX0NPTkZfRklYVVAgc2hvdWxkIGJlIGEgbm8tb3AKICAgICh3ZWxs
LCBpdCBkb2VzIHJ1biBiZWZvcmUgdGhlIGdlbmVyaWMgb25lKS4KCiAgLSBweXRob24tcHlxdDUu
bWsgLT4gYXMgYSBwcmUtY29uZmlndXJlIGhvb2ssIHdoaWNoIGlzIGluY29ycmVjdAogICAgYmVj
YXVzZWQgaXQgd2lsbCBhc3NpZ24gdGhhdCBmaWxlIHRvIHRoYXQgcGFja2FnZSwgYW5kIGFueXdh
eSB0aGUKICAgIGdlbmVyaWMgZml4dXAgaG9vayBoYXMgYWxyZWFkeSBiZWVuIHJ1biBhbnl3YXks
IHNvIHRoaXMgc2hvdWxkIGJlIGEKICAgIG5vLW9wLgoKQ2FyZSB0cCBoYXZlIGEgbG9vaywgcGxl
YXNlPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvYXByLXV0aWwv
YXByLXV0aWwubWsgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXByLXV0aWwvYXByLXV0aWwubWsg
Yi9wYWNrYWdlL2Fwci11dGlsL2Fwci11dGlsLm1rCj4gaW5kZXggZjZjZTdhYzA2NC4uY2Y4NDA3
Y2VkMCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Fwci11dGlsL2Fwci11dGlsLm1rCj4gKysrIGIv
cGFja2FnZS9hcHItdXRpbC9hcHItdXRpbC5tawo+IEBAIC0xNywyMCArMTcsNiBAQCBBUFJfVVRJ
TF9DT05GX09QVFMgPSBcCj4gIAktLXdpdGgtYXByPSQoU1RBR0lOR19ESVIpL3Vzci9iaW4vYXBy
LTEtY29uZmlnCj4gIEFQUl9VVElMX0NPTkZJR19TQ1JJUFRTID0gYXB1LTEtY29uZmlnCj4gIAo+
IC1pZmVxICgkKEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUykseSkKPiAtZGVmaW5lIEFQUl9V
VElMX0ZJWF9MSUJUT09MCj4gLQkkKFNFRCkgJ3MsJChQRVJfUEFDS0FHRV9ESVIpL2Fwci8sJChQ
RVJfUEFDS0FHRV9ESVIpL2Fwci11dGlsLyxnJyBcCj4gLQkJJChTVEFHSU5HX0RJUikvdXNyL2J1
aWxkLTEvbGlidG9vbAo+IC1lbmRlZgo+IC1BUFJfVVRJTF9QT1NUX1BSRVBBUkVfSE9PS1MgKz0g
QVBSX1VUSUxfRklYX0xJQlRPT0wKPiAtCj4gLWRlZmluZSBBUFJfVVRJTF9GSVhfUlVMRVNfTUsK
PiAtCSQoU0VEKSAncywkKFBFUl9QQUNLQUdFX0RJUikvYXByLywkKFBFUl9QQUNLQUdFX0RJUikv
YXByLXV0aWwvLGcnIFwKPiAtCQkkKEBEKS9idWlsZC9ydWxlcy5tawo+IC1lbmRlZgo+IC1BUFJf
VVRJTF9QT1NUX0NPTkZJR1VSRV9IT09LUyArPSBBUFJfVVRJTF9GSVhfUlVMRVNfTUsKPiAtZW5k
aWYKPiAtCj4gICMgV2hlbiBpY29udiBpcyBhdmFpbGFibGUsIHRoZW4gdXNlIGl0IHRvIHByb3Zp
ZGUgY2hhcnNldCBjb252ZXJzaW9uCj4gICMgZmVhdHVyZXMuCj4gIEFQUl9VVElMX0RFUEVOREVO
Q0lFUyArPSAkKGlmICQoQlIyX1BBQ0tBR0VfTElCSUNPTlYpLGxpYmljb252KQo+IC0tIAo+IDIu
MzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
