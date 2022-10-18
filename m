Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612A5C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 19:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F25D940B3A;
	Tue, 18 Oct 2022 19:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F25D940B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pb3uFZqFbd5T; Tue, 18 Oct 2022 19:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 081A1402C3;
	Tue, 18 Oct 2022 19:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 081A1402C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD6DA1BF95F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4FFD402C3
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4FFD402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Pm2HntxAeSl for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 19:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7751540111
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7751540111
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 19:43:16 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr21.francetelecom.fr (ESMTP service) with ESMTPS id 4MsPRQ4mL5z5vtj; 
 Tue, 18 Oct 2022 21:43:14 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 21:43:12 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 18 Oct 2022 21:43:05 +0200
Message-ID: <27491_1666122194_634F01D2_27491_495_1_cf89a104edc507c063e6f4716cc859891b489d27.1666122184.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666122184.git.yann.morin@orange.com>
References: <cover.1666122184.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666122194;
 bh=j/z9Kj0qKAHwtDz6LYw426triEzjbgilSVnpX3ts4+E=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=toEVklcPkq2mpRIasjKs14qVPY25cmA69Nm3W5qCmMFgYebestrsmRkFPSa3z3hsn
 turDz/fsh6hRzoHrXwQYA7ax8shxPPpr7YybrqU5AlYhTH2H2+p6ZDpVuw1JTizq7B
 nhTtVzMxB6Tsh04+WDsLTAe+y4v6SG75pwPHzSrmJL9OaUhRgcgq59PAfrA7Skj2vo
 F1TAY1CzVsPOGdIE1VD4D9UvlvUbXLJQwyyxdlXzjSTwDKpu/ZDcBG/HUemuQ5Cf1j
 GGbqCTK3L3WT5rxpZdxDjtXe1oesYThyg8cpP05gU3QKlsrs9KHuHITe+habgeUuE5
 BconVs/2JOidg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=toEVklcP
Subject: [Buildroot] [PATCH 2/6 v3] package/skeleton-systemd: systemd-ify
 mounting /var tmpfs with ro rootfs
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
Cc: Norbert Lange <nolange79@gmail.com>, yann.morin@orange.com,
 =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gbW91bnQgb3VyIC92YXIgdG1wZnMgd2hlbiB0aGUgcm9vdGZzIGlzIG1vdW50ZWQgcmVhZC1v
bmx5IChyZWFsbHksCm5vdCByZW1vdW50ZWQgcmVxZC13cml0ZSksIHdlIHVzZSBhbiBlbnRyeSBp
biBmc3RhYi4KCkhvd2V2ZXIsIC9ldGMgY291bGQgYWxzbyBiZSBhIHRtcGZzIChmb3IgZnVsbCBz
dGF0ZS1sZXNzIHN5c3RlbXMsIG9yCmVhc3kgZmFjdG9yeS1yZXNldCwgc2VlIFswXSkuIEl0IGFs
c28gcHJldmVudHMgZWFzaWx5IG9yZGV0aW5nIG90aGVyCnN5c3RlbWQgdW5pdHMgdW50aWwgYWZ0
ZXIgL3ZhciBpcyBtb3VudGVkIDVub3QgaW1wb3NzaWJsZSwgYnV0IGxlc3MKZWFzeSkuCgpTbywg
d2UgcmVnaXN0ZXIgL3ZhciBhcyBhIHN5c3RlbWQgbW91bnQgdW5pdCwgc28gdGhhdCB3ZSBjYW4g
YWxzbyBoYXZlCnRoZSAvdmFyIGZhY3RvcnkgcG9wdWxhdGVkIGFuZCBmdW5jdGlvbmFsIGV2ZW4g
d2hlbiAvZXRjIGlzIGVtcHR5LiBUaGUKdmFyLm1vdW50IHVuaXQgaXMgaGVhdmlseSBtb2RlbGxl
ZCBhZnRlciBzeXN0ZW1kJ3Mgb3duIHRtcC5tb3VudCBvbmUsIHNvCndlIGNhcnJ5IHRoZSBzYW1l
IGxpY2Vuc2UgZm9yIHRoYXQgZmlsZSAoaW4gY2FzZSB0aGF0IG1heSBhcHBseSkuIFdlIGFkZAph
biBleHBsaWNpdCByZXZlcnNlIGRlcGVuZGVuY3kgdG8gc3lzdGVtZC10bXBmaWxlcy1zZXR1cC5z
ZXJ2aWNlLCB0bwplbnN1cmUgL3ZhciBpcyBtb3VudGVkIGJlZm9yZSB3ZSB0cnkgdG8gcG9wdWxh
dGUgaXQuCgpUaGlzIGhhcyB0d28gc2lkZSBlZmZlY3RzOgogIC0gYXMgaGludGVkIHByZXZpb3Vz
bHksIGl0IHNpbXBsaWZpZXMgd3JpdGluZyBvdGhlciBzeXN0ZW1kIHVuaXRzIHRvCiAgICBvcmRl
ciB0aGVtIGFmdGVyIC92YXIgaXMgbW91bnRlZAogIC0gcmVwbGFjZSBpdCB3aXRoIHRoZWlyIG93
biwgd2hpY2ggbW91bnRzIGFuIGFjdHVhbCBmaWxlc3lzdGVtCgpbMF0gaHR0cDovLzBwb2ludGVy
LmRlL2Jsb2cvcHJvamVjdHMvc3RhdGVsZXNzLmh0bWwKClNpZ25lZC1vZmYtYnk6IFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KQ2M6IE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3
OUBnbWFpbC5jb20+CkNjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KQ2M6
IEplzIFyZcyBbXkgUm9zZW4gPGplcmVteS5yb3NlbkBzbWlsZS5mcj4KW3lhbm4ubW9yaW4uMTk5
OEBmcmVlLmZyOgogIC0gc3BsaXQgb3JpZ2luYWwgcGF0Y2ggaW4gdHdvCiAgLSB0aGlzIG9uZSBv
bmx5IGhhbmRsZXMgY29udmVydGluZyAvdmFyIG1vdW50aW5nIGludG8gYSBzeXN0ZW1kIHVuaXQK
ICAtIGFkYXB0IGNvbW1pdCBsb2cgYWNjb3JkaW5nbHkKXQpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KLS0tCiAuLi4vc2tlbGV0b24taW5pdC1z
eXN0ZW1kLm1rICAgICAgICAgICAgICAgICAgIHwgIDMgKystCiBwYWNrYWdlL3NrZWxldG9uLWlu
aXQtc3lzdGVtZC92YXIubW91bnQgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC92YXIubW91bnQKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9za2VsZXRvbi1pbml0LXN5c3RlbWQu
bWsgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9za2VsZXRvbi1pbml0LXN5c3RlbWQu
bWsKaW5kZXggN2I2NjczMmVmNC4uOTcwOTUxZDU1MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9za2Vs
ZXRvbi1pbml0LXN5c3RlbWQvc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rCisrKyBiL3BhY2thZ2Uv
c2tlbGV0b24taW5pdC1zeXN0ZW1kL3NrZWxldG9uLWluaXQtc3lzdGVtZC5tawpAQCAtMzAsNyAr
MzAsNiBAQCBlbHNlCiAjIGJhY2sgdGhlcmUgYnkgdGhlIHRtcGZpbGVzLmQgbWVjaGFuaXNtLgog
ZGVmaW5lIFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9ST09UX1JPX09SX1JXCiAJZWNobyAiL2Rldi9y
b290IC8gYXV0byBybyAwIDEiID4kKFRBUkdFVF9ESVIpL2V0Yy9mc3RhYgotCWVjaG8gInRtcGZz
IC92YXIgdG1wZnMgbW9kZT0xNzc3IDAgMCIgPj4kKFRBUkdFVF9ESVIpL2V0Yy9mc3RhYgogZW5k
ZWYKIAogZGVmaW5lIFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9QUkVfUk9PVEZTX1ZBUgpAQCAtNTIs
NiArNTEsOCBAQCBkZWZpbmUgU0tFTEVUT05fSU5JVF9TWVNURU1EX1BSRV9ST09URlNfVkFSCiAJ
CQl8fCBleGl0IDE7IFwKIAkJZmk7IFwKIAlkb25lID4kKFRBUkdFVF9ESVIpL3Vzci9saWIvdG1w
ZmlsZXMuZC9idWlsZHJvb3QtZmFjdG9yeS5jb25mCisJJChJTlNUQUxMKSAtRCAtbSAwNjQ0ICQo
U0tFTEVUT05fSU5JVF9TWVNURU1EX1BLR0RJUikvdmFyLm1vdW50IFwKKwkJJChUQVJHRVRfRElS
KS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL3Zhci5tb3VudAogZW5kZWYKIFNLRUxFVE9OX0lOSVRf
U1lTVEVNRF9ST09URlNfUFJFX0NNRF9IT09LUyArPSBTS0VMRVRPTl9JTklUX1NZU1RFTURfUFJF
X1JPT1RGU19WQVIKIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQv
dmFyLm1vdW50IGIvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvdmFyLm1vdW50Cm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjZiMTY1ZGZmNmQKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC92YXIubW91bnQKQEAgLTAsMCAr
MSwxOCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTEdQTC0yLjEtb3ItbGF0ZXIKKyMg
TW9kZWxsZWQgYWZ0ZXIgc3lzdGVtZCdzIHRtcC5tb3VudAorCitbVW5pdF0KK0Rlc2NyaXB0aW9u
PUJ1aWxkcm9vdCAvdmFyIHRtcGZzCitEZWZhdWx0RGVwZW5kZW5jaWVzPW5vCitDb25mbGljdHM9
dW1vdW50LnRhcmdldAorQmVmb3JlPWJhc2ljLnRhcmdldCBsb2NhbC1mcy50YXJnZXQgdW1vdW50
LnRhcmdldCBzeXN0ZW1kLXRtcGZpbGVzLXNldHVwLnNlcnZpY2UKK0FmdGVyPXN3YXAudGFyZ2V0
CisKK1tNb3VudF0KK1doYXQ9dG1wZnMKK1doZXJlPS92YXIKK1R5cGU9dG1wZnMKK09wdGlvbnM9
bW9kZT0xNzc3LHN0cmljdGF0aW1lLG5vc3VpZCxub2RldixzaXplPTUwJSUsbnJfaW5vZGVzPTFt
CisKK1tJbnN0YWxsXQorV2FudGVkQnk9YmFzaWMudGFyZ2V0Ci0tIAoyLjI1LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CgpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBp
bmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50
IGRvbmMKcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRvcmlz
YXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxsZXog
bGUgc2lnbmFsZXIKYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBw
aWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGli
bGVzIGQnYWx0ZXJhdGlvbiwKT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kg
Y2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLgoKVGhp
cyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9y
IHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsKdGhl
eSBzaG91bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhv
cmlzYXRpb24uCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFj
aG1lbnRzLgpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZv
ciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQu
ClRoYW5rIHlvdS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
