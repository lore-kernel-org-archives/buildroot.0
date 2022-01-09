Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15388C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 09:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD7B817A9;
	Sun,  9 Jan 2022 09:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCCMsfUnHBur; Sun,  9 Jan 2022 09:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1029817A7;
	Sun,  9 Jan 2022 09:37:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE6DA1BF577
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E16A9404CF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCPo0TeS5Rqi for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 09:37:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82EB440483
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 09:37:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 100F1240002;
 Sun,  9 Jan 2022 09:37:36 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1n6Uds-0001HB-0s; Sun, 09 Jan 2022 10:37:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 10:37:33 +0100
Message-Id: <20220109093735.4860-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/poppler: use HTTPS for upstream URL
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzE0NS8xNDU2Zjk1
MTIzNzFlY2I1YTBhMzc0OTQzMTc4ZTRiZDdiMDk2N2U4LwoKVGhlIEhUVFAgVVJMIHJldHVybnMg
YSAzMDggcmVkaXJlY3QgdG8gSFRUUFMsIHdoaWNoIGNvbmZ1c2VzIG9sZCB3Z2V0CnZlcnNpb25z
IChFLkcuICBzLmIubyk6Cgp3Z2V0IC1kIGh0dHA6Ly9wb3BwbGVyLmZyZWVkZXNrdG9wLm9yZy9w
b3BwbGVyLTIxLjEyLjAudGFyLnh6CkRFQlVHIG91dHB1dCBjcmVhdGVkIGJ5IFdnZXQgMS4xNCBv
biBsaW51eC1nbnUuCgpVUkkgZW5jb2RpbmcgPSDigJhVVEYtOOKAmQpDb252ZXJ0ZWQgZmlsZSBu
YW1lICdwb3BwbGVyLTIxLjEyLjAudGFyLnh6JyAoVVRGLTgpIC0+ICdwb3BwbGVyLTIxLjEyLjAu
dGFyLnh6JyAoVVRGLTgpCkNvbnZlcnRlZCBmaWxlIG5hbWUgJ3BvcHBsZXItMjEuMTIuMC50YXIu
eHonIChVVEYtOCkgLT4gJ3BvcHBsZXItMjEuMTIuMC50YXIueHonIChVVEYtOCkKLS0yMDIyLTAx
LTA5IDA5OjI4OjAyLS0gIGh0dHA6Ly9wb3BwbGVyLmZyZWVkZXNrdG9wLm9yZy9wb3BwbGVyLTIx
LjEyLjAudGFyLnh6ClJlc29sdmluZyBwb3BwbGVyLmZyZWVkZXNrdG9wLm9yZyAocG9wcGxlci5m
cmVlZGVza3RvcC5vcmcpLi4uIDE0Ny43NS4xOTguMTU2CkNhY2hpbmcgcG9wcGxlci5mcmVlZGVz
a3RvcC5vcmcgPT4gMTQ3Ljc1LjE5OC4xNTYKQ29ubmVjdGluZyB0byBwb3BwbGVyLmZyZWVkZXNr
dG9wLm9yZyAocG9wcGxlci5mcmVlZGVza3RvcC5vcmcpfDE0Ny43NS4xOTguMTU2fDo4MC4uLiBj
b25uZWN0ZWQuCkNyZWF0ZWQgc29ja2V0IDMuClJlbGVhc2luZyAweDAwMDAwMDAwMDFjZWRhODAg
KG5ldyByZWZjb3VudCAxKS4KCi0tLXJlcXVlc3QgYmVnaW4tLS0KR0VUIC9wb3BwbGVyLTIxLjEy
LjAudGFyLnh6IEhUVFAvMS4xClVzZXItQWdlbnQ6IFdnZXQvMS4xNCAobGludXgtZ251KQpBY2Nl
cHQ6ICovKgpIb3N0OiBwb3BwbGVyLmZyZWVkZXNrdG9wLm9yZwpDb25uZWN0aW9uOiBLZWVwLUFs
aXZlCgotLS1yZXF1ZXN0IGVuZC0tLQpIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9u
c2UuLi4KLS0tcmVzcG9uc2UgYmVnaW4tLS0KSFRUUC8xLjEgMzA4IFBlcm1hbmVudCBSZWRpcmVj
dApEYXRlOiBTdW4sIDA5IEphbiAyMDIyIDA5OjI4OjAyIEdNVApDb250ZW50LVR5cGU6IHRleHQv
aHRtbApDb250ZW50LUxlbmd0aDogMTY0CkNvbm5lY3Rpb246IGtlZXAtYWxpdmUKTG9jYXRpb246
IGh0dHBzOi8vcG9wcGxlci5mcmVlZGVza3RvcC5vcmcvcG9wcGxlci0yMS4xMi4wLnRhci54egoK
LS0tcmVzcG9uc2UgZW5kLS0tCjMwOCBQZXJtYW5lbnQgUmVkaXJlY3QKUmVnaXN0ZXJlZCBzb2Nr
ZXQgMyBmb3IgcGVyc2lzdGVudCByZXVzZS4KU2tpcHBpbmcgMTY0IGJ5dGVzIG9mIGJvZHk6IFs8
aHRtbD4KPGhlYWQ+PHRpdGxlPjMwOCBQZXJtYW5lbnQgUmVkaXJlY3Q8L3RpdGxlPjwvaGVhZD4K
PGJvZHk+CjxjZW50ZXI+PGgxPjMwOCBQZXJtYW5lbnQgUmVkaXJlY3Q8L2gxPjwvY2VudGVyPgo8
aHI+PGNlbnRlcj5uZ2lueDwvY2VudGVyPgo8L2JvZHk+CjwvaHRtbD4KXSBkb25lLgoyMDIyLTAx
LTA5IDA5OjI4OjAyIEVSUk9SIDMwODogUGVybWFuZW50IFJlZGlyZWN0LgoKU2lnbmVkLW9mZi1i
eTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgotLS0KIHBhY2thZ2UvcG9w
cGxlci9Db25maWcuaW4gIHwgMiArLQogcGFja2FnZS9wb3BwbGVyL3BvcHBsZXIubWsgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3BvcHBsZXIvQ29uZmlnLmluIGIvcGFja2FnZS9wb3BwbGVyL0NvbmZp
Zy5pbgppbmRleCBmNTkxMTU4MTNkLi4yMWM0ZDg2Y2Y2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3Bv
cHBsZXIvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvcG9wcGxlci9Db25maWcuaW4KQEAgLTEwLDcg
KzEwLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BPUFBMRVIKIAkgIFBvcHBsZXIgaXMgYSBQREYg
cmVuZGVyaW5nIGxpYnJhcnkgYmFzZWQgb24gdGhlIHhwZGYtMy4wCiAJICBjb2RlIGJhc2UuCiAK
LQkgIGh0dHA6Ly9wb3BwbGVyLmZyZWVkZXNrdG9wLm9yZy8KKwkgIGh0dHBzOi8vcG9wcGxlci5m
cmVlZGVza3RvcC5vcmcvCiAKIGlmIEJSMl9QQUNLQUdFX1BPUFBMRVIKIApkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wb3BwbGVyL3BvcHBsZXIubWsgYi9wYWNrYWdlL3BvcHBsZXIvcG9wcGxlci5tawpp
bmRleCAyM2YwNGY2ZTUxLi45ZTliZmM5Y2JhIDEwMDY0NAotLS0gYS9wYWNrYWdlL3BvcHBsZXIv
cG9wcGxlci5taworKysgYi9wYWNrYWdlL3BvcHBsZXIvcG9wcGxlci5tawpAQCAtNiw3ICs2LDcg
QEAKIAogUE9QUExFUl9WRVJTSU9OID0gMjEuMTIuMAogUE9QUExFUl9TT1VSQ0UgPSBwb3BwbGVy
LSQoUE9QUExFUl9WRVJTSU9OKS50YXIueHoKLVBPUFBMRVJfU0lURSA9IGh0dHA6Ly9wb3BwbGVy
LmZyZWVkZXNrdG9wLm9yZworUE9QUExFUl9TSVRFID0gaHR0cHM6Ly9wb3BwbGVyLmZyZWVkZXNr
dG9wLm9yZwogUE9QUExFUl9ERVBFTkRFTkNJRVMgPSBmb250Y29uZmlnIGhvc3QtcGtnY29uZgog
UE9QUExFUl9MSUNFTlNFID0gR1BMLTIuMCsKIFBPUFBMRVJfTElDRU5TRV9GSUxFUyA9IENPUFlJ
TkcKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
