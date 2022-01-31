Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA31C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 13:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6317F60EBF;
	Mon, 31 Jan 2022 13:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_VQ1We3OmUD; Mon, 31 Jan 2022 13:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A4460EB5;
	Mon, 31 Jan 2022 13:17:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B27AD1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 13:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D25833A0
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 13:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_GL2HpeEHSa for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 13:17:54 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0EBB83366
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 13:17:53 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id EWSFnxAfR4NL9EWSGnIMHS; Mon, 31 Jan 2022 14:10:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643634648; bh=FTmeP1xVb8iXFTRB4R4nMOT23GPnmXn55PpTUqHacvo=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=bbYhqyjoj/qgCTOYnW23AmHVi2rX2zTNAwqpu/5tMpPYVONbC8bqXWWrQasNnYYe8
 LdtrUqVF+0KNMwHBFeTJqWnTtcWXOn9NbjvvZNR32/HAsUNoZY0oE1ms4yANQJ59lg
 ZYfmoy7rKDkm78IuHaBtUvqqTzkXflR1VnkMw6seCJAFSWMr7Sbe2HPdpiB6Ouct/a
 uiPQ2iXxa8lS2DS2bxXKfZGrSEWkj5kTkU6WNSRn4Mz1OhZtUx6DR0GhTvUA1RJZlS
 CnJVs2WNEITg2gcnx8XAFuWkBVvZIRmqjuWfDBBovFyp0SlBNLTQAICePUKf7XrC/T
 0HvGsvytSlUug==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 31 Jan 2022 14:10:46 +0100
Message-Id: <FA90321D-A1E9-4958-8979-0E81E289024A@benettiengineering.com>
References: <YfffbzLZg+b6yOFY@curiosity>
In-Reply-To: <YfffbzLZg+b6yOFY@curiosity>
To: Sergey Matyukevich <geomatsi@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfOJv/Hy+GI/+HUjmS2tXmYglEx2fRjClaM3KCOhLwd4sr9jZcLU7XadeOGh4XR0BZiJVpbiCm54Xox1TEadXXTvuB5wNv2on0XNdvzy9ReWGfcnjqmBK
 4oNppKOcVWBjCGYp7ehwJaYwD9yQrW9PBP5Dt4tYDbPPbpfVD4xstkUdHsFrXLJ8rAPWqWe35HapPDMOdiYiKMQyBCZaTLbZTiB+7KsLx0vjNCEpTh4brzvT
 DAUa8kX2B9z5+KoLU7sySVqDijoYKcsiEkjLCdX7AT0jKDrbr9906ZDhtNx5QiU/nYFOlBSQoVZijlCi4n5UQQ==
Subject: Re: [Buildroot] [PATCH 0/5] synopsys: boards maintenance
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
Cc: Joao Pinto <jpinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDMxIGdlbiAyMDIyLCBhbGxlIG9yZSAxNDowOSwgU2VyZ2V5IE1hdHl1a2V2
aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgR2l1bGlvLAo+
IAo+PiBIaSBTZXJnZXksCj4+IAo+Pj4gT24gMzEvMDEvMjIgMDk6MTIsIFNlcmdleSBNYXR5dWtl
dmljaCB3cm90ZToKPj4+IEhpIGFsbCwKPj4+IAo+Pj4gVGhpcyBpcyBhIG1haW50ZW5hbmNlIHBh
dGNoIHNlcmllcyBmb3IgU3lub3BzeXMgYm9hcmRzLiBPdXRkYXRlZAo+Pj4gYW5kIHVudXNlZCBW
REsgY29uZmlndXJhdGlvbnMgYXJlIHJlbW92ZWQuIEFsbCB0aGUgb3RoZXIgYm9hcmRzCj4+PiBy
ZWNlaXZlIExpbnV4IGtlcm5lbCBhbmQgVS1Cb290IHVwZGF0ZXMuCj4+IAo+PiBIYXZlIHlvdSB0
ZXN0ZWQgb24gdGhlIHJlYWwgYm9hcmRzIG9yIG9ubHkgY2hlY2sgaWYgdGhleSBidWlsdCBzdWNj
ZXNzZnVsbHk/Cj4gCj4gSSBoYXZlIHRlc3RlZCBhbGwgdGhlIGltYWdlcyBvbiBoYXJkd2FyZS4K
ClBlcmZlY3QgOi0pCgpCZXN0IHJlZ2FyZHMKR2l1bGlvIEJlbmV0dGkKCj4gCj4gUmVnYXJkcywK
PiBTZXJnZXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
