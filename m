Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A47C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 19:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53924819F5;
	Sun, 16 Jan 2022 19:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFBCrJfukOir; Sun, 16 Jan 2022 19:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E512819D2;
	Sun, 16 Jan 2022 19:34:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14B821BF408
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 19:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE675403B7
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 19:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mITCzwP4_ywC for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 19:33:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id 733B84033F
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 19:33:58 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id 9BHnn3C35gdXd9BHonRvzm; Sun, 16 Jan 2022 20:33:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642361636; bh=FYrA+TLhZRlEfkEBYKbYvYZEvmikfPFGHwy7OZtpkfE=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=HmvyAeJPtVQDQuALTMEjVYYDUBv4CFz0TNb3cMNFnYsGSTqlcPseqHnwW56ofYZSa
 n8qpXTCiCJ+CnEtaRuB6CqnKgMp74jdm6djbQ3ZKyvnXRQuRxZ64s09nlt3gdQdjer
 gpHnxU1Oxfde+V5pkm93Oi+Z78Wla65ZzmMb/a/rZE1kl0SGpEYMreGkUS3wef/G5l
 i7M6nF3H1cTj8qVTXcvkdqcFnAJeVKixenV5NyyX8cp95tGEMmypnynUu6AjJs4b75
 jJf7sbE6rhzCWdvwiFOCUlcUTPMoIo/amR6Sqnot3NXqt7j5Zz33WL+sKsJ8rcxoC4
 qVSt0uhHOPkKQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 16 Jan 2022 20:33:55 +0100
Message-Id: <7398CECE-A994-4692-BCA7-FD6ACB33395F@benettiengineering.com>
References: <78e0fe75-0ecc-51ce-6270-d6f228cfdbaf@gmail.com>
In-Reply-To: <78e0fe75-0ecc-51ce-6270-d6f228cfdbaf@gmail.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfLdSUVP6SQGTk8QcA8ccKs3jfMWAuCFsOF0vi/PeXjPbBPEaGfldYr4FDD5o/RoJP9NSYmzvs/7Xnmg1F9ZT8oIFXjRqjQ+fgLqx8fuNNSOacBe5tiHa
 D8sQIFd5AHDbg5OAvXRHSb8G0SzPdpQVew5ttOVka1AYNMhNn4WzVSTXVToQoUAKkx/rQppBprNbx9eEYHQMXHi4vGRWEN1yWnk1c6bFvZC/nkjxP0nj62D2
 yntmI5Omep90+323cDgBoA==
Subject: Re: [Buildroot] [PATCH] board/orangepi/orangepi-zero:extlinux,
 refactoring
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU2VyZ2V5LAoKK0NjIGJ1aWxkcm9vdCBNTCwKCj4gSWwgZ2lvcm5vIDE2IGdlbiAyMDIyLCBh
bGxlIG9yZSAxOToxOSwgU2VyZ2V5IEt1em1pbm92IDxrdXptaW5vdi5zZXJnZXk4MUBnbWFpbC5j
b20+IGhhIHNjcml0dG86Cj4gCj4g77u/MTYuMDEuMjAyMiAxODoyOSwgR2l1bGlvIEJlbmV0dGk6
Cj4+IEhpIFNlcmdleSwgUGV0ZXIsIEFsbCwKPj4gCj4+ICsjIEFyY2hpdGVjdHVyZQo+PiBCUjJf
YXJtPXkKPj4gQlIyX2NvcnRleF9hNz15Cj4+IEJSMl9BUk1fRlBVX1ZGUFY0PXkKPj4g4oCmSGVy
ZSBeXl4geW91IGNhbiBlbmFibGUgVkZQK05FT04uIEl04oCZcyB3b3JraW5nIG9uIGFsbCBPbGlt
ZXggYm9hcmRzIHdpdGggc3VueGkgQTcgYW5kIGNhbiBzcGVlZCB0aGluZ3MgdXAuCj4+IAo+IEhp
LCBHaXVsaW8uIEkgd2lsbCB0ZXN0LCB0aGFua3MuCgorMQoKPiAKPiAKPj4+ICsjIFdpcmVsZXNz
IGRyaXZlciBhbmQgZmlybXdhcmUKPj4+ICsjIFsxNi4wMS4yMDIyXSBEb2Vzbid0IGNvbXBpbGUg
d2l0aCBuZXdlciBrZXJuZWxzID4gNS4xMi54Cj4+PiBCUjJfUEFDS0FHRV9YUjgxOV9YUkFESU89
eQo+Pj4gQlIyX1BBQ0tBR0VfQVJNQklBTl9GSVJNV0FSRT15Cj4+PiBCUjJfUEFDS0FHRV9BUk1C
SUFOX0ZJUk1XQVJFX1hSODE5PXkKPj4gQ2FuIHlvdSBwb2ludCBhIHRlc3QgY2FzZT8gVGhpcyB3
YXkgSSBjb3VsZCB0cnkgdG8gZml4IGJ1aWxkaW5nIGFuZCB5b3UgY291bGQgdGVzdCBpZiBpdCB3
b3Jrcy4KPj4gCj4+IFRoYW5rIHlvdQo+PiBCZXN0IHJlZ2FyZHMKPj4g4oCULQo+PiBHaXVsaW8g
QmVuZXR0aQo+PiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwo+PiAKPiBUbyBjaGVjaywgc2V0IHRo
ZSBwYXJhbWV0ZXJzIGluIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgQnVpbGRyb290Cj4gQlIyX1BB
Q0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE1PXkKPiBCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjE1Igo+IGluIHRoZSBjb25maWdzL29yYW5nZXBp
X3plcm9fZGVmY29uZmlnIGZpbGUKCk9rLCB0aGFuayB5b3UuCgpCZXN0IHJlZ2FyZHMKR2l1bGlv
Cgo+IAo+IG1ha2Ugb3JhbmdlcGlfemVyb19kZWZjb25maWcKPiBtYWtlCj4gCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
