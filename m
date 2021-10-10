Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45EDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 12:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B0060555
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 12:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5B0060555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E91F82C8E;
	Sun, 10 Oct 2021 12:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wNRaDhu6PAm; Sun, 10 Oct 2021 12:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4B782AC6;
	Sun, 10 Oct 2021 12:00:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5911BF477
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 12:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EE9C60690
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 12:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYr7pq4Csibm for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 12:00:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DF3860621
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 12:00:35 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:d8e4:bceb:92e9:d128] (unknown
 [IPv6:2a01:e0a:947:6e20:d8e4:bceb:92e9:d128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 48CCFC069C
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 14:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1633867232;
 bh=DI1BCYz8VlmFnq2k8+Q4nzzr9TG1jHCMMVWkvUP2KDw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=jpxt7NIkzXcJYahKLxfkoVLDE1Qc6znICrFpHtdWyayP3TJ6piRArgUpGZiAtIcpp
 DqExVlFtgfzkp6VAZg+CY3nzuZRyYPJHNJHVrp08ATX4YZdnGDZjmgKRX2fzRp9aKV
 GCcYVnlozuWlZx/gRRLkOLJfTl+FFxwpLuEtQXLUNMnLT1rZKn/GarnaNQE8BmIXsj
 lIyQ6mQMMvWkMAYGK6Y9I6Pl5ljAXghXr3uGOP1/84Xfnq86yewGj/KXp4JdMaNOTN
 fL37LUeByKFffsafBwoFgRpE8PEe1H8XQ/ZhurZqi94UK54PDuvsKizPx+TKR5M/Lp
 Y1QIG2zq8qDeA==
To: buildroot@buildroot.org
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
Date: Sun, 10 Oct 2021 14:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] error when i build buidroot
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

SGVsbG8hCgpFc2HDr2UgTGVkb3V4IE5qb25nc3NpIEtvdWFtIHdyb3RlOgo+IGJ1aWxkIGZvciBx
ZW11X3g4Nl82NCBieSB0eXBpbmcgInFlbXVfeDg2XzY0X2RlZmNvbmZpZyIKCkkgZ3Vlc3MgeW91
IG1lYW4g4oCcbWFrZSBxZW11X3g4Nl82NF9kZWZjb25maWfigJ0uCgo+IHJzeW5jIFsuLi5dIHN5
c3RlbS9za2VsZXRvbi8gL3Jvb3QvYnVpbGRyb290L1suLi5dCgpZb3UgYXJlIGRvaW5nIHRoaXMg
YXMgcm9vdD8KCj4gcnN5bmM6IFtnZW5lcmF0b3JdIGZhaWxlZCB0byBzZXQgcGVybWlzc2lvbnMg
b24gIlsuLi5dIjoKPiBGdW5jdGlvbiBub3QgaW1wbGVtZW50ZWQgKDM4KQoKVGhpcyBzb3VuZHMg
bGlrZSB5b3UgYXJlIHVzaW5nIGEgZmlsZXN5c3RlbSB0aGF0IGRvZXNuJ3Qgc3VwcG9ydApVbml4
LXR5cGUgcGVybWlzc2lvbnMuWzFdIElzIHRoaXMgdGhlIGNhc2U/IFdoYXQga2luZCBvZiBGUyBp
cyB0aGlzPwpDb3VsZCB5b3UgdHJ5IG9uIGEgVW5peGlzaCBmaWxlc3lzdGVtPwoKUmVnYXJkcywK
CkVkZ2FyIEJvbmV0LgoKWzFdIGh0dHBzOi8vdW5peC5zdGFja2V4Y2hhbmdlLmNvbS9xdWVzdGlv
bnMvMTIyMDMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
