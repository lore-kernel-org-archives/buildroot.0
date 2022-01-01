Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6751AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 15:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCA196076C;
	Sat,  1 Jan 2022 15:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOiCGl8O0nKY; Sat,  1 Jan 2022 15:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AD6360706;
	Sat,  1 Jan 2022 15:50:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3021BF59B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 15:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AD438135A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 15:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkxdQGq8WZzR for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 15:50:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76FC481353
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 15:50:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c59:844e:fd99:5f73])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 69A2D2003A4;
 Sat,  1 Jan 2022 16:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641052228;
 bh=ytNYn64FZJg+iwgYRWQP35ZInv5wD8vFv5xA820OYsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8da7xVtVCM6a97XqC5bS/t2bfpBXp5aIQM3PHruwTWHesASG7dFeNlhkFDU7GzEq
 OlwZHfYkIObqALsZHP1ItwmVZkAcfc2Vm2G0YOVu/+0oxBM7D00aWx2OMBp/1UDmvF
 xnGyyCGVXiUeM96NaL7jY/UUwEkwvyxajA8qjeApIiVniE62bpfr6eTb4SntRdypcF
 9Rb5We6p0rNah4yo1TzjwgaASjGu1gG17aka+2NaAbXYuIXsJESBFpCACTvI+yh10J
 j2dQC2R/4uqcjQdu1LOvWIOexahXeZIcRMlVkydinOQjvR2+QxGO1yicOQ8fsnAGTz
 9cIKCLjaNoOXA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 16:50:22 +0100
Date: Sat, 1 Jan 2022 16:50:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20220101155022.GD2777@scaer>
References: <20211112131258.2671293-1-herve.codina@bootlin.com>
 <20211112131258.2671293-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112131258.2671293-2-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/5] package/alchemy: new host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVydsOpLCBBbGwsCgpPbiAyMDIxLTExLTEyIDE0OjEyICswMTAwLCBIZXJ2ZSBDb2RpbmEgc3Bh
a2UgdGh1c2x5Ogo+IEFsY2hlbXkgaXMgYSBidWlsZCBzeXN0ZW0gZGV2ZWxvcGVkIGJ5IFBhcnJv
dC4KPiAKPiBJdCBpcyBhIG5ldyBidWlsZCBzeXN0ZW0gYmFzZWQgb24gdGhlIG9uZSB1c2VkIGlu
IEFuZHJvaWQuCj4gQSBjZW50cmFsIG1ha2VmaWxlIGluc3RhbmNlIHNjYW5zIGEgd29ya3NwYWNl
IHRvIGZpbmQgdXNlcgo+IG1ha2VmaWxlcywgaW5jbHVkZXMgdGhlbSBhbmQgcmVnaXN0ZXIgbW9k
dWxlcyB0byBiZSBidWlsdC4KPiAKPiBodHRwczovL2dpdGh1Yi5jb20vUGFycm90LURldmVsb3Bl
cnMvYWxjaGVteQo+IAo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5h
QGJvb3RsaW4uY29tPgoKSSB3YXMgYWJvdXQgdG8gcHVzaCB0aGlzLCB3aXRoIGEgZmV3IGNoYW5n
ZXMsIGJ1dCBJIGhhdmUgc29tZSBxdWVzdGlvbnMKYWJvdXQgdGhlIHBhY2thZ2VzLCBzbyBoZXJl
J3MgdGhlIHBhdGNoIG9mIHRoZSBjaGFuZ2VzIEkgZGlkOgoKICAgIFt5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcjoKICAgICAgLSB1c2UgQUxDSEVNWV9IT01FIGV2ZXJ5d2hlcmUgcmF0aGVyIHRoYW4g
cmVwZWF0aW5nIHRoZSBsb2NhdGlvbiBpbgogICAgICAgIHRoZSBpbnN0YWxsIG1hY3JvCiAgICAg
IC0gZG9uJ3QgcmVtb3ZlIGluc3RhbGwgZGlyIGJlZm9yZSBpbnN0YWxsaW5nCiAgICAgIC0gdXNl
IGEgdGVtcGxhdGUgZm9yIGF0b20ubWssIG5vdCBpbi1saW5lIGluIGFsY2hlbXkubWsKICAgIF0K
CiAgICBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hbGNoZW15L2FsY2hlbXkubWsgYi9wYWNrYWdlL2Fs
Y2hlbXkvYWxjaGVteS5tawogICAgaW5kZXggNjNkNWE5NDFjNS4uZjgwMmM2MjQyNSAxMDA2NDQK
ICAgIC0tLSBhL3BhY2thZ2UvYWxjaGVteS9hbGNoZW15Lm1rCiAgICArKysgYi9wYWNrYWdlL2Fs
Y2hlbXkvYWxjaGVteS5tawogICAgQEAgLTEwLDE5ICsxMCwxOSBAQCBBTENIRU1ZX0xJQ0VOU0Ug
PSBCU0QtMy1DbGF1c2UgKEFsY2hlbXkpLCBHUEwtMi4wIChrY29uZmlnKQogICAgIEFMQ0hFTVlf
TElDRU5TRV9GSUxFUyA9IENPUFlJTkcgUkVBRE1FCiAgICAgSE9TVF9BTENIRU1ZX0RFUEVOREVO
Q0lFUyA9IGhvc3QtcHl0aG9uMwogICAgIAogICAgK0FMQ0hFTVlfSE9NRSA9ICQoSE9TVF9ESVIp
L29wdC9hbGNoZW15CiAgICAgQUxDSEVNWV9TREtfQkFTRURJUiA9ICQoU1RBR0lOR19ESVIpL3Vz
ci9saWIvYWxjaGVteS9zZGsKICAgICAKICAgICBkZWZpbmUgSE9TVF9BTENIRU1ZX0lOU1RBTExf
Q01EUwogICAgLQlybSAtcmYgJChIT1NUX0RJUikvb3B0L2FsY2hlbXkKICAgIC0JbWtkaXIgLXAg
JChIT1NUX0RJUikvb3B0L2FsY2hlbXkKICAgIC0JY3AgLXJmICQoQEQpLyogJChIT1NUX0RJUikv
b3B0L2FsY2hlbXkvCiAgICArCW1rZGlyIC1wICQoQUxDSEVNWV9IT01FKQogICAgKwljcCAtcmYg
JChARCkvKiAkKEFMQ0hFTVlfSE9NRSkKICAgICsJY3AgJChBTENIRU1ZX1BLR0RJUikvYXRvbS5t
ay5pbiAkKEFMQ0hFTVlfSE9NCUUpL2F0b20ubWsuaW4KICAgICBlbmRlZgogICAgIAogICAgICQo
ZXZhbCAkKGhvc3QtZ2VuZXJpYy1wYWNrYWdlKSkKICAgICAKICAgICAjIFZhcmlhYmxlcyB1c2Vk
IGJ5IG90aGVyIHBhY2thZ2VzCiAgICAgCiAgICAtQUxDSEVNWV9IT01FID0gJChIT1NUX0RJUikv
b3B0L2FsY2hlbXkKICAgICBBTENIRU1ZX01BS0UgPSAkKEFMQ0hFTVlfSE9NRSkvc2NyaXB0cy9h
bGNoZW1ha2UKICAgICAKICAgICAjIFRBUkdFVF9BUkNIIGlzIHNldCB0byAneHh4JyB0byBhdm9p
ZCBBbGNoZW15IG1hbmFnaW5nIHRoZSBhcmNoaXRlY3R1cmUuCiAgICBAQCAtNTksMTQgKzU5LDEx
IEBAIGVuZGlmCiAgICAgIyAkMjogQWxjaGVteSBtb2R1bGUgbmFtZQogICAgICMgJDM6IEFsY2hl
bXkgbW9kdWxlIGZpbGUgbmFtZQogICAgIGRlZmluZSBBTENIRU1ZX0lOU1RBTExfTElCX1NES19G
SUxFCiAgICAtCW1rZGlyIC1wICQoQUxDSEVNWV9TREtfQkFTRURJUikvJChzdHJpcCAkKDEpKQog
ICAgLQkoIFwKICAgIC0JCWVjaG8gJ0xPQ0FMX1BBVEggOj0gJCQoY2FsbCBteS1kaXIpJzsgXAog
ICAgLQkJZWNobyAnaW5jbHVkZSAkJChDTEVBUl9WQVJTKSc7IFwKICAgIC0JCWVjaG8gJ0xPQ0FM
X01PRFVMRSA6PSAkKHN0cmlwICQoMikpJzsgXAogICAgLQkJZWNobyAnTE9DQUxfU0RLIDo9ICQo
U1RBR0lOR19ESVIpJzsgXAogICAgLQkJZWNobyAnTE9DQUxfREVTVERJUiA6PSB1c3IvbGliJzsg
XAogICAgLQkJZWNobyAnTE9DQUxfTU9EVUxFX0ZJTEVOQU1FIDo9ICQoc3RyaXAgJCgzKSknOyBc
CiAgICAtCQllY2hvICdpbmNsdWRlICQkKEJVSUxEX0xJQlJBUlkpJzsgXAogICAgLQkpID4gJChB
TENIRU1ZX1NES19CQVNFRElSKS8kKHN0cmlwICQoMSkpL2F0b20ubWsKICAgICsJJChJTlNUQUxM
KSAtbSAwNjQ0IC1EIFwKICAgICsJCSQoQUxDSEVNWV9IT01FKS9hdG9tLm1rLmluIFwKICAgICsJ
CSQoQUxDSEVNWV9TREtfQkFTRURJUikvJChzdHJpcCAkKDEpKS9hdG9tLm1rCiAgICArCSQoU0VE
KSAncyNAU1RBR0lOR19ESVJAIyQoU1RBR0lOR19ESVIpIycgXAogICAgKwkJLWUgJ3MjQE1PRFVM
RUAjJChzdHJpcCAkKDIpKSMnIFwKICAgICsJCS1lICdzI0BNT0RVTEVfRklMRU5BTUVAIyQoc3Ry
aXAgJCgzKSkjJyBcCiAgICArCQkkKEFMQ0hFTVlfU0RLX0JBU0VESVIpLyQoc3RyaXAgJCgxKSkv
YXRvbS5tawogICAgIGVuZGVmCiAgICBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hbGNoZW15L2F0b20u
bWsuaW4gYi9wYWNrYWdlL2FsY2hlbXkvYXRvbS5tay5pbgogICAgbmV3IGZpbGUgbW9kZSAxMDA2
NDQKICAgIGluZGV4IDAwMDAwMDAwMDAuLjMwZWI2ZDVlMjMKICAgIC0tLSAvZGV2L251bGwKICAg
ICsrKyBiL3BhY2thZ2UvYWxjaGVteS9hdG9tLm1rLmluCiAgICBAQCAtMCwwICsxLDcgQEAKICAg
ICtMT0NBTF9QQVRIIDo9ICQoY2FsbCBteS1kaXIpCiAgICAraW5jbHVkZSAkKENMRUFSX1ZBUlMp
CiAgICArTE9DQUxfTU9EVUxFIDo9IEBNT0RVTEVACiAgICArTE9DQUxfU0RLIDo9IEBTVEFHSU5H
X0RJUkAKICAgICtMT0NBTF9ERVNURElSIDo9IHVzci9saWIKICAgICtMT0NBTF9NT0RVTEVfRklM
RU5BTUUgOj0gQE1PRFVMRV9GSUxFTkFNRUAKICAgICtpbmNsdWRlICQoQlVJTERfTElCUkFSWSkK
ClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
