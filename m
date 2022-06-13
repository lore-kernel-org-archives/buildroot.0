Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7D7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 08:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7719F410D2;
	Mon, 13 Jun 2022 08:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLDDNth7EXwl; Mon, 13 Jun 2022 08:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57120410BE;
	Mon, 13 Jun 2022 08:15:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AFDD1BF983
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 08:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7976C60F16
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 08:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGfdgN5GZm0t for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 08:15:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 535D060BD8
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 08:15:53 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:28cb:1024:7c35:d24e] (unknown
 [IPv6:2a01:e0a:947:6e20:28cb:1024:7c35:d24e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id D694AC1DE5
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 10:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1655108149;
 bh=PHQmLaUYfFM/AYbZhcrPK/GmClP5oIe/rVaAikVgc+I=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=quO34YaCyto9SywLVb9aI6Ope3Q7wDNQVwFVSmNIa1N0GBhJRj+s9HNgoB3+azE+L
 cRfb/Z66up/+BvxENv3P/KZL5R64lC53WU6fSiZjEH+97QxWlZOsVoMHrHj5p6H9Sn
 Ip/13RkT3rDKr3aorqupPk36MJyWNLGqj2BIQzeEk9/y/DuiGYlbpYbdjmZqvXJoPM
 gZZG4LEz9/KBqOdWIJPGa4cHvBZObCzJMZeU7ieJc8JgdZKGIBmLN+qXD/KUGTty69
 kOL7rg/jUdB0FM4txhd8lKh8rrktxH8TdN2D/3P83T+KrOSUfwMeNF/fudaU94ZfGQ
 XSIaxJ9/kE2/w==
Message-ID: <acae6f60-f71c-76fe-b9fe-0779d758c1c0@grenoble.cnrs.fr>
Date: Mon, 13 Jun 2022 10:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <bug-14841-163@https.bugs.busybox.net/>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <bug-14841-163@https.bugs.busybox.net/>
Subject: Re: [Buildroot] [Bug 14841] New: support/download/git fails with
 "fatal: No such remote 'origin'" due to incorrect check for origin remote
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

SGVsbG8hCgpPbiAyMDIyLTA2LTExLCBibXVyZG9ja0BnbWFpbC5jb20gcmVwb3J0ZWQ6Cj4gW3N1
cHBvcnQvZG93bmxvYWQvZ2l0XSB1c2VzIHRoZSBjb21tYW5kICdnaXQgcmVtb3RlIHwgZ3JlcCAn
Xm9yaWdpbiQnJwo+IHRvIGNoZWNrIGlmIG9yaWdpbiBleGlzdHMuICBUaGlzIGNvbW1hbmQgYWx3
YXlzIHByaW50cyB0aGUgd29yZAo+IG9yaWdpbiwgZXZlbiBpZiB0aGUgb3JpZ2luIHJlbW90ZSBk
b2Vzbid0IGFjdHVhbGx5IGV4aXN0IGluIHRoZSByZXBvLgoKSSBjYW5ub3QgcmVwcm9kdWNlIHRo
aXMuIE15IGNvcHkgb2YgZ2l0IGRvZXMgbm90IHByaW50IOKAnG9yaWdpbuKAnSBpZiB0aGVyZQpp
cyBubyByZW1vdGUgbmFtZWQgc3VjaDoKCiAgICAkIGdpdCAtLXZlcnNpb24KICAgIGdpdCB2ZXJz
aW9uIDIuMjUuMQogICAgJCBnaXQgaW5pdCBmb28KICAgIEluaXRpYWxpemVkIGVtcHR5IEdpdCBy
ZXBvc2l0b3J5IGluIC9ob21lL2VkZ2FyL2Zvby8uZ2l0LwogICAgJCBjZCBmb28vCiAgICAkIGdp
dCByZW1vdGUgfCBncmVwICdeb3JpZ2luJCcKICAgICQgICAgICMgPC0gZW1wdHkgb3V0cHV0CgpJ
IGFsc28gdHJpZWQgd2l0aCBib3RoIGEgcXVpdGUgb2xkIGFuZCBhIGZhaXJseSByZWNlbnQgdmVy
c2lvbiBvZiBnaXQKKDIuMTEuMCBmcm9tIERlYmlhbiBTdHJldGNoIGFuZCAyLjM1LjEgZnJvbSBE
ZWJpYW4gVGVzdGluZykgd2l0aCB0aGUKc2FtZSByZXN1bHQuCgpSZWdhcmRzLAoKRWRnYXIuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
