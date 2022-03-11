Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AECFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 06:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A66960B24;
	Fri, 11 Mar 2022 06:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3b5tOCgewhD; Fri, 11 Mar 2022 06:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2677260AFC;
	Fri, 11 Mar 2022 06:55:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DAD31BF3ED
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 06:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C14B60AFC
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 06:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MkZowsf3Rn3 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 06:55:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C996360AED
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646981712;
 bh=gaSkR3tjcAX0+zp8whUGdmzcOYqLBIAnXLU5WCfcP4k=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Zylg+Sz3uIR/MDJ1UbqualQEaaBKYVTR28CK+8JEr7S4nUY5CBMTcHGyTLhb/BtGC
 lLEQ+ZF46Rio+8hevnCWeqCe+EXOZFTXX5sTyMWo66K3Ar6zRJRyYar+8BsQy5H897
 UuhC0IjphRr5b8dD0mdbjMaJW64Z/AAq1m1hePEM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.204]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MUGi9-1nazEB1Pvv-00RFVH for <buildroot@buildroot.org>; Fri, 11 Mar 2022
 07:55:12 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 07:55:11 +0100
Message-Id: <20220311065511.14015-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:QKv/aORcWrKOxVYSmrCem31+7pglWRxSQaNyk++PMpj35rQ7BSP
 UJN1se9qD4Sh0OOEMuzGF4JV/cLpevke42LhMeT0GQlkUIOSTRxtokQlr5enRkRKrJ1dCYP
 Fhl+JZRXmV23EixF7mmOpoM0X7DG4iV629SytjkN6zYEr4IC7idQOa8Z/TVNeuQWBsrCI9u
 eU/Lv/pHn7uVRPTdGj+7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TXmFljByH40=:iPv0md61MRs2zgjVCt232M
 FRb478kh42s+BhxRwImDvhgb7JrmLk/w7iBHTuS6c4SDOXDwlhvRn36LUQtJrRZsTNlhqbLKq
 A/B6eYK40IoNRO5rraj8LlsnEJdeykNH34V8ErtrTXfE9Od+ByWUIlUeA3yR/46JWhFOifP/R
 BRf4YVUuy5b3Yla56ZiXf6EbMQY+86ypfsMP8ZbT5dBEF7IQ0ScxsT0LyXjzNqzTR4qzFewsk
 4LVes+Y1MxsLP2fRRQ5Y8SvtCk2u3Yum5mL5QuYqha2qmJDM66Sji/0fhayy+4dS7ydDPn/X0
 qECtverWLk+l1OTgHHS8DoIscPtxEOjntM85+uWjKT8s452uznmaFvq8Im3MIvte1Fgq05BiH
 w7ReouLNEetOpFvH32bI/EfKzRRYnUT+D4fCxjiPkMPDEHvwhOrfjZVPZ8La+pl9aDn2SBaY3
 GbNBLV4hoWyRepEffYiukwiwkX4Xq1a2sHW2M+jeL1zp7HjhZJcnifwk6TnJtjOKN5ehLC07D
 ilvJNfnqzL9ERYw5lEVlKrOkp5+MtxplfZrpgTgGLJDHtw6yCqxfxfTOyk27zpDrBTco8jU0z
 Ds/ArwXFMqHuU7GeU2z0p/I6Xecj+SBmp08QgS5IKERUmeBm8ITsEOAeICYhY9I6Oz/Pwnl5a
 y53/aigONLpOfDuvZQqPqM6X3nqQUpcsCQ5qg3X3XQnYRVS9Nx6H60YNPDlD9u6HssInHs3wF
 0tNkbImgV+9DL77zR+puzsyPglE8Gfwz5Ju1emkjaYisCCNTylOlH65GIXCXnaUWpCk5YJU7n
 eleTrOYwsKap/+uUjawUrT0iFwWTYoBMi/qcJntKLWtT2YjNedS5rzTgzNoVh5M7EEM/q4rS4
 9odUihfGaB2w66qfbadlM3nmpbwpcxPaUUekGUitPYtOl3KS4jOITt85VxxXkTwieiicuCp9X
 BnpgsEbw8o4aUlb5iHVFSN747+AuMu6dq8QoNsOOM2pOXuDqVHDlKB4A/SN2eAC2cL0hlyZMr
 EWK1BxgPZfPgQ7993VopgQWEXt3B0zgYbhKwKUsgEIaBKxskePhHyu9NuXyCqS6yXiu8r8MVF
 z4Z/TizxVRYrMs=
Subject: [Buildroot] [PATCH v2] package/openssh: fix '-fzero-call-used-regs'
 option support detection
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

LSBhZGQgdXBzdHJlYW0gcGF0Y2ggKFsxXSkgdG8gZml4ICctZnplcm8tY2FsbC11c2VkLXJlZ3Mn
IGdjYyBjb21waWxlciBvcHRpb24KICBzdXBwb3J0IGRldGVjdGlvbgoKLSBhZGQgYXV0b3JlY29u
ZiBhcyB0aGUgcGF0Y2ggdG91Y2hlcyBtNC9vcGVuc3NoLm00CgpGaXhlczoKCiAgLSBodHRwczov
L2J1Z3MuYnVzeWJveC5uZXQvc2hvd19idWcuY2dpP2lkPTE0NjUxCgogIGJpdG1hcC5jOiBJbiBm
dW5jdGlvbiDigJhyZXNlcnZl4oCZOgogIGJpdG1hcC5jOjk4OjE6IHNvcnJ5LCB1bmltcGxlbWVu
dGVkOiDigJgtZnplcm8tY2FsbC11c2VkLXJlZ3PigJkgbm90IHN1cHBvcnRlZCBvbiB0aGlzIHRh
cmdldAogICAgIDk4IHwgfQogICAgICAgIHwgXgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
c3NoL29wZW5zc2gtcG9ydGFibGUvY29tbWl0L2YxMDc0NjcxNzk0MjhhMGUzZWE5ZTRhYTk3Mzhh
YzEyZmYwMjgyMmQucGF0Y2gKClNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBv
cnRAZ214Lm5ldD4KLS0tCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSByZWJhc2VkIGFuZCByZW51bWJl
cmVkIHBhdGNoIGZyb20gMDAwMS1JbXByb3ZlLWRldGVjdGlvbi1vZi1memVyby1jYWxsLXVzZWQt
cmVncy1hbGwtc3VwcG9yLnBhdGNoCiAgICB0byAwMDAyLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6
ZXJvLWNhbGwtdXNlZC1yZWdzLWFsbC1zdXBwb3IucGF0Y2gKLS0tCiAuLi5uLW9mLWZ6ZXJvLWNh
bGwtdXNlZC1yZWdzLWFsbC1zdXBwb3IucGF0Y2ggfCAzOCArKysrKysrKysrKysrKysrKysrCiBw
YWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tayAgICAgICAgICAgICAgICAgICAgfCAgNCArKwogMiBm
aWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9vcGVuc3NoLzAwMDItSW1wcm92ZS1kZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2VkLXJlZ3Mt
YWxsLXN1cHBvci5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNzaC8wMDAyLUltcHJv
dmUtZGV0ZWN0aW9uLW9mLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzLWFsbC1zdXBwb3IucGF0Y2ggYi9w
YWNrYWdlL29wZW5zc2gvMDAwMi1JbXByb3ZlLWRldGVjdGlvbi1vZi1memVyby1jYWxsLXVzZWQt
cmVncy1hbGwtc3VwcG9yLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmNlNWM1NTM5ZmYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL29wZW5zc2gvMDAwMi1J
bXByb3ZlLWRldGVjdGlvbi1vZi1memVyby1jYWxsLXVzZWQtcmVncy1hbGwtc3VwcG9yLnBhdGNo
CkBAIC0wLDAgKzEsMzggQEAKK0Zyb20gYjVmZWU1ZmU5OGY3MDhjMWRjNjFhMTU2NGRiMzVlYWNh
ZGJmZThiMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENvbGluIFdhdHNvbiA8Y2p3
YXRzb25AZGViaWFuLm9yZz4KK0RhdGU6IFRodSwgMjQgRmViIDIwMjIgMTY6MDQ6MTggKzAwMDAK
K1N1YmplY3Q6IFtQQVRDSF0gSW1wcm92ZSBkZXRlY3Rpb24gb2YgLWZ6ZXJvLWNhbGwtdXNlZC1y
ZWdzPWFsbCBzdXBwb3J0CisKK0dDQyBkb2Vzbid0IHRlbGwgdXMgd2hldGhlciB0aGlzIG9wdGlv
biBpcyBzdXBwb3J0ZWQgdW5sZXNzIGl0IHJ1bnMgaW50bwordGhlIHNpdHVhdGlvbiB3aGVyZSBp
dCB3b3VsZCBuZWVkIHRvIGVtaXQgY29ycmVzcG9uZGluZyBjb2RlLgorCitbVXBzdHJlYW06IGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NoL29wZW5zc2gtcG9ydGFibGUvY29tbWl0L2YxMDc0Njcx
Nzk0MjhhMGUzZWE5ZTRhYTk3MzhhYzEyZmYwMjgyMmQucGF0Y2hdCitTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CistLS0KKyBtNC9vcGVuc3NoLm00IHwg
MyArKysKKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9t
NC9vcGVuc3NoLm00IGIvbTQvb3BlbnNzaC5tNAoraW5kZXggNGY5YzM3OS4uOGMzM2M3MCAxMDA2
NDQKKy0tLSBhL200L29wZW5zc2gubTQKKysrKyBiL200L29wZW5zc2gubTQKK0BAIC0xNCw2ICsx
NCw4IEBAIEFDX0RFRlVOKFtPU1NIX0NIRUNLX0NGTEFHX0NPTVBJTEVdLCBbeworIAlBQ19DT01Q
SUxFX0lGRUxTRShbQUNfTEFOR19TT1VSQ0UoW1sKKyAjaW5jbHVkZSA8c3RkbGliLmg+CisgI2lu
Y2x1ZGUgPHN0ZGlvLmg+CisrLyogVHJpdmlhbCBmdW5jdGlvbiB0byBoZWxwIHRlc3QgZm9yIC1m
emVyby1jYWxsLXVzZWQtcmVncyAqLworK3ZvaWQgZihpbnQgbikge30KKyBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpIHsKKyAJKHZvaWQpYXJndjsKKyAJLyogU29tZSBtYXRoIHRvIGNh
dGNoIC1mdHJhcHYgcHJvYmxlbXMgaW4gdGhlIHRvb2xjaGFpbiAqLworQEAgLTIxLDYgKzIzLDcg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KSB7CisgCWZsb2F0IGwgPSBpICogMi4x
OworIAlkb3VibGUgbSA9IGwgLyAwLjU7CisgCWxvbmcgbG9uZyBpbnQgbiA9IGFyZ2MgKiAxMjM0
NUxMLCBvID0gMTIzNDVMTCAqIChsb25nIGxvbmcgaW50KWFyZ2M7CisrCWYoMCk7CisgCXByaW50
ZigiJWQgJWQgJWQgJWYgJWYgJWxsZCAlbGxkXG4iLCBpLCBqLCBrLCBsLCBtLCBuLCBvKTsKKyAJ
LyoKKyAJICogVGVzdCBmYWxsdGhyb3VnaCBiZWhhdmlvdXIuICBjbGFuZyAxMCdzIC1XaW1wbGlj
aXQtZmFsbHRocm91Z2ggZG9lcworLS0gCisyLjM1LjEKKwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9v
cGVuc3NoL29wZW5zc2gubWsgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawppbmRleCAwZTBk
NTllNmFiLi44NGFkZDk1NjNkIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5t
aworKysgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawpAQCAtMTIsNiArMTIsMTAgQEAgT1BF
TlNTSF9DUEVfSURfVVBEQVRFID0gJChPUEVOU1NIX1ZFUlNJT05fTUlOT1IpCiBPUEVOU1NIX1NJ
VEUgPSBodHRwOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUK
IE9QRU5TU0hfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSwgQlNELTItQ2xhdXNlLCBQdWJsaWMgRG9t
YWluCiBPUEVOU1NIX0xJQ0VOU0VfRklMRVMgPSBMSUNFTkNFCisKKyMgcGF0Y2ggdG91Y2hpbmcg
bTQvb3BlbnNzaC5tNAorT1BFTlNTSF9BVVRPUkVDT05GID0gWUVTCisKIE9QRU5TU0hfQ09ORl9F
TlYgPSBcCiAJTEQ9IiQoVEFSR0VUX0NDKSIgXAogCUxERkxBR1M9IiQoVEFSR0VUX0NGTEFHUyki
IFwKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
