Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8300C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 536D060F01;
	Tue, 22 Feb 2022 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4AFACffd_n7; Tue, 22 Feb 2022 19:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69DFC60C2C;
	Tue, 22 Feb 2022 19:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44BB71BF20F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C9B081423
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id th7P7mkZhgd5 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 19:59:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0340481365
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 19:59:00 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E97CC2284;
 Tue, 22 Feb 2022 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1645559939; bh=j6F7RYb0772VqsgHMNviiJ3ALj3W4S3I5e7wNYgd9ME=;
 h=From:To:Cc:Subject:Date:From;
 b=lonmVoqhp4E0hkkIonVa/At1FvmVZh0wtGWlj8WRUvIBGZhyg1EvtljanFkl5GpHZ
 mi2bXBuXkWC7RK6nfe4jZaYbYfFkIxXfHvRRq1rwAQRC7fkXbGHWT+E8V7VXtKGdCA
 UfRwMQNe3SrF1Vo1BCl+8dWYlow8KsVjwD3JNwg1obn5OCHE13u/WBrNLbaZ9PAKAK
 XHf1ef82phhLdwUBJixdDWWbaVs1V2zNL1eN2HoYcYarr2aVvCOHlz99ws4TLTrJdD
 j/vohFFxy7obo+UmTIvr8HRwxk1KuEGf34z0GPEixn96l+ppofnaU2xquIVWe274ni
 FEs7aIVt1cGcQ==
Received: from abrodkin-5550.internal.synopsys.com (unknown [10.121.15.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 5E450A005D;
 Tue, 22 Feb 2022 19:58:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 22:58:54 +0300
Message-Id: <20220222195854.11842-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt5/qt5webkit: needs OpenSSL
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Peter Seiderer <ps.report@gmx.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vy9vIE9wZW5TU0wgUVQ1V2Via2l0IGZhaWxzIHRvIGJ1aWxkIHRoYXQgd2F5OgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLi4u
L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvV2ViQ29yZS9wbGF0Zm9ybS9u
ZXR3b3JrL3F0L1Jlc291cmNlUmVxdWVzdFF0LmNwcDogSW4gc3RhdGljIG1lbWJlciBmdW5jdGlv
biDigJhzdGF0aWMgYm9vbCBXZWJDb3JlOjpSZXNvdXJjZVJlcXVlc3Q6OmFscG5Jc1N1cHBvcnRl
ZCgp4oCZOgouLi4vYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9XZWJDb3Jl
L3BsYXRmb3JtL25ldHdvcmsvcXQvUmVzb3VyY2VSZXF1ZXN0UXQuY3BwOjY4OjEyOiBlcnJvcjog
4oCYUVNzbFNvY2tldOKAmSBoYXMgbm90IGJlZW4gZGVjbGFyZWQKICAgNjggfCAgICAgcmV0dXJu
IFFTc2xTb2NrZXQ6OnNzbExpYnJhcnlWZXJzaW9uTnVtYmVyKCkgPiAweDEwMDAyMDAwTCAmJgog
ICAgICB8ICAgICAgICAgICAgXn5+fn5+fn5+fgouLi4vYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAt
YWxwaGE0L1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL25ldHdvcmsvcXQvUmVzb3VyY2VSZXF1ZXN0
UXQuY3BwOjY5Ojk6IGVycm9yOiDigJhRU3NsU29ja2V04oCZIGhhcyBub3QgYmVlbiBkZWNsYXJl
ZAogICA2OSB8ICAgICAgICAgUVNzbFNvY2tldDo6c3NsTGlicmFyeVZlcnNpb25TdHJpbmcoKS5z
dGFydHNXaXRoKFFMYXRpbjFTdHJpbmcoIk9wZW5TU0wiKSk7CiAgICAgIHwgICAgICAgICBefn5+
fn5+fn5+Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPjgtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQoKU2lnbmVkLW9mZi1ieTogQWxleGV5IEJyb2RraW4gPGFicm9ka2luQHN5
bm9wc3lzLmNvbT4KQ2M6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tPgpDYzogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CkNjOiBQ
ZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CkNjOiBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4KLS0tCiBwYWNrYWdlL3F0NS9xdDV3ZWJraXQvQ29uZmlnLmlu
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3F0NS9xdDV3ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS9xdDUvcXQ1d2Via2l0L0NvbmZp
Zy5pbgppbmRleCBlZDg3ZWZjYTk1Li4yNmMzODk3ZDFkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3F0
NS9xdDV3ZWJraXQvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC9Db25maWcu
aW4KQEAgLTE1LDYgKzE1LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1FUNVdFQktJVAogCXNlbGVj
dCBCUjJfUEFDS0FHRV9KUEVHCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xFVkVMREIKIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfTElCUE5HCisJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wKIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfUVQ1QkFTRV9JQ1UKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUVQ1QkFTRV9HVUkK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfUVQ1QkFTRV9XSURHRVRTCi0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
