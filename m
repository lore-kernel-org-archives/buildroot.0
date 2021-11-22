Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D941AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59CB640126;
	Mon, 22 Nov 2021 22:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0fgkShSN9-zr; Mon, 22 Nov 2021 22:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964E6400B1;
	Mon, 22 Nov 2021 22:27:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80AB41BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7873440306
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsCzu4KPcIzV for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:27:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4A2C400AA
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:27:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r8so35336313wra.7
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vmvxZ3rd1772SMBItnEh/KAE4AtDSYXFTVR0TkYl3t0=;
 b=j80HPCMscW9OhV7fMlgFS8dNmSCeGA4hhtssEtOy8pr/7pL9CT3v53e1J3qc0Dpfqh
 1/9dBdcvs1Wt+lzjGJ0gwiszfdrl1B2PBcVoQptodBjPwjibJsf+L9tKlaYbMHyQR/jH
 oqy6K3Ff5RCDDhNmFZgkDZhVmzmkzp6bnfqXk4lDrMR3NqyBZeLQhNed1HE5X4UjS8yF
 WtNowavi1fPq+J3jgvDlyW/FTPlJGai1WqSStXRRF8cI6nvYmLqPbtxB7TtCa6JPMnUr
 sVD68aPQXp2MqsIOi+XsTVlbVclzOTYy9066keJ1K8fr/8ZISL3NNR0dColrfV9u5OlI
 5dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vmvxZ3rd1772SMBItnEh/KAE4AtDSYXFTVR0TkYl3t0=;
 b=XhoUWL6rD/gQhELXUAFVJLLOO/lj9Yu7L5h8D62CWt7qh8JJKUuzynPxYvZqpYEB28
 BxhKzh+tE168i4np+vZrHcEUS0NllfZd40/n3S4ffQh41twLbsBV+DM8frf6DTOVjOf+
 IIcGclYYXbwVQoa969hBKUNlpJLLsId6FI5sUf74Er/6kHn2keFZkRBlXE3rlsBu9Vwp
 Tu/mnANUoAPF80sIIvkom9flwbpxLj0oAuB+wPBq4J6MVAT4MV3DOtOVpQk0wu7mOXSR
 Y8msl1Vyh/Yyk+uOPkJ7o9oZ1zmPS/tQ2uz8OylslZ4OAHz3PO4vuprZ6wtiUT7YyY7A
 MOXg==
X-Gm-Message-State: AOAM530NvuGQYcEHfuUgOTGixsP1/DulzPKGFI6T7kYwwt9AoLN1HhgH
 UDGOZMiDeQzQzNobBfLdg3WruQkEw/k=
X-Google-Smtp-Source: ABdhPJxMoYKjw4wl0kiWOS8AficqPxLiCUxnqN9pr3O5cbFTPrzJcOvSmdOgvb7WQPlBnt6sW5jkWA==
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr974166wry.424.1637620065588; 
 Mon, 22 Nov 2021 14:27:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h204sm11044880wmh.33.2021.11.22.14.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:27:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 23:25:19 +0100
Message-Id: <20211122222519.3539534-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/clamav: drop first patch
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rmlyc3QgcGF0Y2ggaXMgbm90IG5lZWRlZCBzaW5jZSBidW1wIHRvIHZlcnNpb24gMC45OS4xIGlu
IGNvbW1pdAoyYzhlNWRkNjlmNGYyODFiMmI0OTdhZTdlYzllYzk1YzQ3ZTdjODBjIGFuZApodHRw
czovL2dpdGh1Yi5jb20vQ2lzY28tVGFsb3MvY2xhbWF2L2NvbW1pdC82ODkwMDUzMTc2ODA4NTQ2
MjdiNzljNzZmZmE2ZTQyYTgxNjBiMGUxCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5l
IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAuLi5jLWZpeC1idWlsZC1lcnJvci1k
dWUtdG8tbWlzc2luZy1zb2MucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5hY2t0
cmFjZS1pZi11c2luZy11Q2xpYmMtd2l0aG91dC1iYS5wYXRjaH0gfCAgMAogMiBmaWxlcyBjaGFu
Z2VkLCAzNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2NsYW1hdi8w
MDAxLWNsYW1kc2Nhbi1wcm90by5jLWZpeC1idWlsZC1lcnJvci1kdWUtdG8tbWlzc2luZy1zb2Mu
cGF0Y2gKIHJlbmFtZSBwYWNrYWdlL2NsYW1hdi97MDAwMi1tYm94LWRvLW5vdC11c2UtYmFja3Ry
YWNlLWlmLXVzaW5nLXVDbGliYy13aXRob3V0LWJhLnBhdGNoID0+IDAwMDEtbWJveC1kby1ub3Qt
dXNlLWJhY2t0cmFjZS1pZi11c2luZy11Q2xpYmMtd2l0aG91dC1iYS5wYXRjaH0gKDEwMCUpCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9jbGFtYXYvMDAwMS1jbGFtZHNjYW4tcHJvdG8uYy1maXgtYnVp
bGQtZXJyb3ItZHVlLXRvLW1pc3Npbmctc29jLnBhdGNoIGIvcGFja2FnZS9jbGFtYXYvMDAwMS1j
bGFtZHNjYW4tcHJvdG8uYy1maXgtYnVpbGQtZXJyb3ItZHVlLXRvLW1pc3Npbmctc29jLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBkYWFjNjc3ZWFhLi4wMDAwMDAwMDAwCi0t
LSBhL3BhY2thZ2UvY2xhbWF2LzAwMDEtY2xhbWRzY2FuLXByb3RvLmMtZml4LWJ1aWxkLWVycm9y
LWR1ZS10by1taXNzaW5nLXNvYy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM0ICswLDAgQEAK
LUZyb20gNTJmZGE2ZTY2ODllMjI4NjZhMzllYzQyNzM3MTNmYjYwMzVjMzhiMiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206IEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5k
ZT4KLURhdGU6IE1vbiwgNyBNYXkgMjAxOCAyMzoxNDo0NiArMDIwMAotU3ViamVjdDogW1BBVENI
XSBjbGFtZHNjYW4vcHJvdG8uYzogZml4IGJ1aWxkIGVycm9yIGR1ZSB0byBtaXNzaW5nIHNvY2th
ZGRyX3VuCi0gZGVmaW5pdGlvbgotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAot
Ci1wcm90by5jOiBJbiBmdW5jdGlvbiDigJhkY29ubmVjdOKAmToKLXByb3RvLmM6ODY6Njc6IGVy
cm9yOiBpbnZhbGlkIGFwcGxpY2F0aW9uIG9mIOKAmHNpemVvZuKAmSB0byBpbmNvbXBsZXRlIHR5
cGUg4oCYc3RydWN0IHNvY2thZGRyX3Vu4oCZCi0gICAgICAgICAgICAgaWYgKGNvbm5lY3Qoc29j
a2QsIChzdHJ1Y3Qgc29ja2FkZHIgKikmbml4c29jaywgc2l6ZW9mKG5peHNvY2spKSA9PSAwKQot
Ci1TaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+Ci1V
cHN0cmVhbS1zdGF0dXM6IGh0dHA6Ly9sdXJrZXIuY2xhbWF2Lm5ldC9tZXNzYWdlLzIwMTQwOTI4
LjEzMDgyOS41NDk0ZmQ2OC5lbi5odG1sCi0tLS0KLSBjbGFtZHNjYW4vcHJvdG8uYyB8IDEgKwot
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEvY2xhbWRzY2Fu
L3Byb3RvLmMgYi9jbGFtZHNjYW4vcHJvdG8uYwotaW5kZXggMDIwNWY2ZGEwLi5kMzM5NjczMmYg
MTAwNjQ0Ci0tLS0gYS9jbGFtZHNjYW4vcHJvdG8uYwotKysrIGIvY2xhbWRzY2FuL3Byb3RvLmMK
LUBAIC00Miw2ICs0Miw3IEBACi0gI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Ci0gI2luY2x1ZGUgPGZj
bnRsLmg+Ci0gI2luY2x1ZGUgPHN5cy90eXBlcy5oPgotKyNpbmNsdWRlIDxzeXMvdW4uaD4KLSAj
aWZkZWYgSEFWRV9TWVNfU0VMRUNUX0gKLSAjaW5jbHVkZSA8c3lzL3NlbGVjdC5oPgotICNlbmRp
ZgotLS0gCi0yLjE0LjMKLQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jbGFtYXYvMDAwMi1tYm94LWRv
LW5vdC11c2UtYmFja3RyYWNlLWlmLXVzaW5nLXVDbGliYy13aXRob3V0LWJhLnBhdGNoIGIvcGFj
a2FnZS9jbGFtYXYvMDAwMS1tYm94LWRvLW5vdC11c2UtYmFja3RyYWNlLWlmLXVzaW5nLXVDbGli
Yy13aXRob3V0LWJhLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBwYWNr
YWdlL2NsYW1hdi8wMDAyLW1ib3gtZG8tbm90LXVzZS1iYWNrdHJhY2UtaWYtdXNpbmctdUNsaWJj
LXdpdGhvdXQtYmEucGF0Y2gKcmVuYW1lIHRvIHBhY2thZ2UvY2xhbWF2LzAwMDEtbWJveC1kby1u
b3QtdXNlLWJhY2t0cmFjZS1pZi11c2luZy11Q2xpYmMtd2l0aG91dC1iYS5wYXRjaAotLSAKMi4z
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
