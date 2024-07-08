Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46427C3DA47
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B8F4072C;
	Mon,  8 Jul 2024 22:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BB04GeOrXz_1; Mon,  8 Jul 2024 22:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 031A840732
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031A840732;
	Mon,  8 Jul 2024 22:46:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C77721BF3DE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE03340621
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hg_o05F22xur for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8B6640607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B6640607
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8B6640607
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1rxthV37F8-00kKBe; Tue, 09
 Jul 2024 00:45:39 +0200
Date: Tue, 09 Jul 2024 00:45:38 +0200
MIME-Version: 1.0
Message-Id: <20240709-tipidee-v2-7-a69a8668005e@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
In-Reply-To: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720478736; l=1284;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=zg1w2NvwB/6ASxEK2dPR3NneD7k0c/GIbGIi5bDzT4E=;
 b=552qrhtTIfPuhyDYvtJNQyKXnVaj3+BIWmkKY5DZ1mv+lr/geW+UdzwLl/cNCDwoVQ6QOrnUL
 fkioaST00i9D+IXreYZGo4JI55kc2pO9qsURBuGOjo5IrWuQGuWtJtR
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:nfYj8/3d0QSp8azgp0sJCXBrobpq1fTK31BFvNagOAmHi264EP3
 1d3FpvXZwQCWrVGUwYGl4gApMgi8TD+yOjwxFpbDrPuockTohrQvQf8eaQv3KTcohdCdUV7
 9jTevaW2Mwlu8dHUjp6UF/pIon+gXD79sh9VZZ7GJ/GPZWr3QK74R6wfk2T084kKbqas12Y
 qU8d2/WYC/yEU344WAm4g==
UI-OutboundReport: notjunk:1;M01:P0:TTv7DlQ20Zo=;q7bCtrSs9zXTrrGuofW6zHTJqr8
 0EdcKrkLhaYAfVc7i0A1HyWhV4NPwrSSF5/LCVafoiLwWvXh/yozYkzcsWVUc/1TN3fgu8z/y
 l6hoj1NwfoQmWxqSUlh01sWjKvgkXuThgfQFwP5DtIH8gEag/2BHoUolDXinhEDPM+4csxPrH
 uW0+VD4is2GM/mSkXzp++yFP+wcWN7b80CS0oZ5eJ419Zu+O7on8PGBeT1Zvav9jlkVOokvJO
 iteaYSZjn0z2RPdIsuPzA/v5eCOSMSPTbmaSP5r7wznmN2WdHmO1otBwlcAVVSn2ZTp16slGv
 zGuD78FAj4+ZwEWWl0zVshHzyvP96z3XKcxI0B4LM9oKM+fs1sPuAAihUPcTX/DJ7Q473gTo9
 nI4xai+xBG3PlZTfbB5264vNavhoYxthxhY7U7+eGLsBAtaM6/LfaTuMwUWNyY6/irrJIIVGU
 EMEAvxYhSxBtdgW2EFFGfW1yePzpD8//oblTqom2jVx7e4iDvut/aCiiUcO18cxSnWqBMHGfl
 LRxVZ1QamMHS9W8L3pxQDFrGkFw/5ivsurYSlnUSvt4Cejfe6sTWjpICL11O0GxpUc3T8lErC
 0K6X0lkIUCqYfKKHq7iTWQIV8h45VcGpxrZ8j52IsakVEqCZ2d2PDF5+mn7NAPaXat74JzK1X
 5WwtUwh5hU3EWso5s6IpSR1B7/AhcKTOs5+lCCk1tA+y5ODiy8bQiwobJIjWHS1iJ0t2lpMmO
 CLghoYxdRKeBXtzVkYEGB62ubSvg8paDafWN7SSExq3X79AdXiyzn8KIdPcgxrCus2hGguhwX
 ztTGkyaTihDCtE+ryNvLSYvVhV/WAk3g9yQGVqwn8fT+4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478739; x=1721083539; i=j.neuschaefer@gmx.net;
 bh=aUaR4X5cE/LoxySB9ljD2XfSOVb63wUc+7Gsz/vyf6k=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uR6AY7bKAKkwhAUDiXCf4cf45em+SpwXInRCeMSOlF496sc5ohrfEIbt7zIsO4zu
 QN6QHoyTWe4GuVxe90jwBuoobreF0VgWhwbsETuxw+J+CgqcOaQkkxMIN+B4Qh+MZ
 9uOpMEbEZRCpMq2/7o5hBwvq0+LE7z4a1M9Y9WK8J6DZdUpF5rBfr8Qb+Fnm+Amhw
 0U7JeW9e3RL85pCgRhw1yw9tlhpsUQWTCV2YZCJ2iZ0g0BzYIN77a2bic84O8aYRs
 1/bvkb32FbkEq4eM2Dxr2CCLtn8fvjEYC3y+VksoHY2JOHqUYe1Lb1yzxvouSHcWY
 ym2uJ9BsLwLctfBUqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=uR6AY7bK
Subject: [Buildroot] [PATCH v2 7/8] s6-dns: bump to version 2.3.7.2
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
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIENPUFlJTkcgaGFzaCBjaGFuZ2VkIGJlY2F1c2UgdGhlIGNvcHlyaWdodCB5ZWFyIHdhcyB1
cGRhdGVkLgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214
Lm5ldD4KLS0tCiBwYWNrYWdlL3M2LWRucy9zNi1kbnMuaGFzaCB8IDQgKystLQogcGFja2FnZS9z
Ni1kbnMvczYtZG5zLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3M2LWRucy9zNi1kbnMuaGFz
aCBiL3BhY2thZ2UvczYtZG5zL3M2LWRucy5oYXNoCmluZGV4IDMzNGVhMTY2N2MuLmRkNmU2ZjM2
MzIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvczYtZG5zL3M2LWRucy5oYXNoCisrKyBiL3BhY2thZ2Uv
czYtZG5zL3M2LWRucy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGdlbmVyYXRlZAot
c2hhMjU2ICBjZjAyNTg1NzRlYzdkNjJiNjU0ZTBjMmFkNzhhZjRjN2Q2N2FjNGM5Y2IzN2Y3ODE0
ODBmNTk3ZTU0YjMwZjZkICBzNi1kbnMtMi4zLjcuMS50YXIuZ3oKLXNoYTI1NiAgYWFmYTRmNmEx
MmI1YjI0YWIyYWU4ZWFkNTE3NGUxZWMwM2FlY2I1ZWIwZTgyMDEyZDc0ZmQ0N2NjZmM1NzYwNyAg
Q09QWUlORworc2hhMjU2ICA2YWVlMzJiYjY4ZDAxZjUxMDlmNzFlMzFhMjgzMjEzYzY2OGNkM2Mw
ZTc5ZmI5ZTQ2OWU2Y2FiYjU4MDc5ZjJiICBzNi1kbnMtMi4zLjcuMi50YXIuZ3oKK3NoYTI1NiAg
ZmRjOTMxMjk1NTI1ZGQwMDA5Y2RmMzM5MTg5Y2JlY2QyMjhkNjVjZWZlMzM0MDJmMDM3ZjliMDQ2
ZjA3OTg5ZSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zNi1kbnMvczYtZG5zLm1rIGIv
cGFja2FnZS9zNi1kbnMvczYtZG5zLm1rCmluZGV4IGE4NDhmMmU2YzAuLjhlMTc1NDMxYTQgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvczYtZG5zL3M2LWRucy5taworKysgYi9wYWNrYWdlL3M2LWRucy9z
Ni1kbnMubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKLVM2
X0ROU19WRVJTSU9OID0gMi4zLjcuMQorUzZfRE5TX1ZFUlNJT04gPSAyLjMuNy4yCiBTNl9ETlNf
U0lURSA9IGh0dHBzOi8vc2thcm5ldC5vcmcvc29mdHdhcmUvczYtZG5zCiBTNl9ETlNfTElDRU5T
RSA9IElTQwogUzZfRE5TX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCgotLQoyLjQzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
