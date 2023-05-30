Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC794C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 20:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3338860E6D;
	Tue, 30 May 2023 20:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3338860E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9B3dp-ZWM6TH; Tue, 30 May 2023 20:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F0B360E5E;
	Tue, 30 May 2023 20:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F0B360E5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A14281BF284
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 20:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 863B841800
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 20:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863B841800
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgxYpYylYy9a for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 20:07:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C374170E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5C374170E
 for <buildroot@buildroot.org>; Tue, 30 May 2023 20:07:49 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.2.119])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1500220058D;
 Tue, 30 May 2023 22:07:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 22:07:26 +0200
Message-Id: <20230530200728.12239-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1685477266;
 bh=vMpGrRsADZkLg/K8w58pgv8nk7pWKfPf+1uurC/K30g=;
 h=From:To:Cc:Subject:Date:From;
 b=qzcIIdFBwdszp13HMpTu/dQcJhIPpvXQ1NYsMy1iTfWgw3ldIRzv7quVpiNJzw6Ki
 J4gTv5H2k/2RYPvT9JnjuUWOLTyiNpRyeMIa/GHUauRX+bhXX0C7ajCmvOm7iwnUdA
 BPMABhm0tl2oF7+97Nh29PV3u7ZrBSFTnElWcfaoh1YZLson5ZQAVvmiwTx2SHGpcl
 P9SXe8jbim7B8xFjPPHzt46bAqWZE0veYQezSVSRAVw2SkJFhhKQd5YwZQn2SgmYZr
 2KWSKoOGwJp1cck41Nf+teOQzPXMJ6ZT29ALkyCGb5g5NISJ+O9z1xe8uCNOPCbCPY
 TuThXMWYejKWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qzcIIdFB
Subject: [Buildroot] [PATCH 1/3] boot/edk2: bump to version edk2-stable202305
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
Cc: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGNoYW5nZSBsb2cgc2luY2UgdmVyc2lvbiBlZGsyLXN0YWJsZTIwMjIwOCwgc2VlOgotIGh0
dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRrMi1zdGFibGUy
MDIyMTEKLSBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvcmVsZWFzZXMvdGFnL2Vk
azItc3RhYmxlMjAyMzAyCi0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVh
c2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwNQoKVGhlIG1haW4gbW90aXZhdGlvbiBvZiB0aGlzIGJ1
bXAgaXMgdGhlIFJJU0MtViBRRU1VIFZpcnQgc3VwcG9ydAppbnRyb2R1Y2VkIGluIGVkazItc3Rh
YmxlMjAyMzAyIChub3QgeWV0IHN1cHBvcnRlZCBpbiBCdWlsZHJvb3QpLgoKQ2M6IERpY2sgT2xz
c29uIDxoaUBzZW56aWxsYS5pbz4KQ2M6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVA
YXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KLS0t
ClBhdGNoIHNlcmllcyB0ZXN0ZWQgb24gYnJhbmNoIG1hc3RlciBhdCBjb21taXQgYzc2NWFjOSB3
aXRoIGNvbW1hbmRzOgoKICAgIHV0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCiAg
ICAuLi4KICAgIDAgd2FybmluZ3MgZ2VuZXJhdGVkCgogICAgc3VwcG9ydC90ZXN0aW5nL3J1bi10
ZXN0cyBcCiAgICAgICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCiAgICAgICAgdGVzdHMuYm9v
dC50ZXN0X2VkazIKICAgIC4uLgogICAgT0sKCiAgICBtYWtlIHFlbXVfYWFyY2g2NF9zYnNhX2Rl
ZmNvbmZpZwogICAgbWFrZQogICAgLi4uCiAgICBvdXRwdXQvaW1hZ2VzL3N0YXJ0LXFlbXUuc2gK
ICAgIC4uLgogICAgYnVpbGRyb290IGxvZ2luOgotLS0KIGJvb3QvZWRrMi9lZGsyLmhhc2ggfCAy
ICstCiBib290L2VkazIvZWRrMi5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIuaGFz
aCBiL2Jvb3QvZWRrMi9lZGsyLmhhc2gKaW5kZXggOTRlZTIyZGRjNC4uMzRkNGIxMGUyOSAxMDA2
NDQKLS0tIGEvYm9vdC9lZGsyL2VkazIuaGFzaAorKysgYi9ib290L2VkazIvZWRrMi5oYXNoCkBA
IC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgYzEwNTIwZjI2OTU1
N2Q1NjZlMzVmZTgxMDQxNDFhYTI4NjVmOTA4NWFkMmIzYTMwYWFlOGE3ZTc4YTNjYTVhYSAgZWRr
Mi1lZGsyLXN0YWJsZTIwMjIwOC1icjEudGFyLmd6CitzaGEyNTYgIGNhNTUzNTE5MTNlNjI1OGVi
ZDhjMDgxMDZmMzY5YWM3MTA3M2Q5Y2ZhYTgwNDI3ZmM1ZjEzMWIwNmQ4MDg5NDAgIGVkazItZWRr
Mi1zdGFibGUyMDIzMDUtYnIxLnRhci5negogc2hhMjU2ICA1MGNlMjBjOWNmZGIwZTE5ZWUzNGZl
MGE1MWZjMGFmZTk2MWY3NDM2OTdiMDY4MzU5YWIyZjg2MmI0OTRkZjgwICBMaWNlbnNlLnR4dApk
aWZmIC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIubWsgYi9ib290L2VkazIvZWRrMi5tawppbmRleCBm
YjZiOWEzMjgwLi4zOTliZDM0NmVmIDEwMDY0NAotLS0gYS9ib290L2VkazIvZWRrMi5taworKysg
Yi9ib290L2VkazIvZWRrMi5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLUVESzJfVkVSU0lPTiA9IGVkazItc3RhYmxlMjAyMjA4CitFREsyX1ZFUlNJT04g
PSBlZGsyLXN0YWJsZTIwMjMwNQogRURLMl9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5v
Y29yZS9lZGsyCiBFREsyX1NJVEVfTUVUSE9EID0gZ2l0CiBFREsyX0xJQ0VOU0UgPSBCU0QtMi1D
bGF1c2UtUGF0ZW50Ci0tIAoyLjQwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
