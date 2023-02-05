Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EC3C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA06607A4;
	Sun,  5 Feb 2023 12:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA06607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPiIptmOmiep; Sun,  5 Feb 2023 12:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89BEA60737;
	Sun,  5 Feb 2023 12:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89BEA60737
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF2541BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98A28410D8
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A28410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1rq1_jF5Od1 for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:21:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461B84098D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 461B84098D
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:21:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63F081BF204;
 Sun,  5 Feb 2023 12:20:59 +0000 (UTC)
Date: Sun, 5 Feb 2023 13:20:58 +0100
To: =?UTF-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <20230205132058.0411cb56@windsurf>
In-Reply-To: <20230201192711.1632095-1-nerv@dawncrow.de>
References: <20230201192711.1632095-1-nerv@dawncrow.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675599659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0IQ1BomAxxZN8vUiA4tDz2S3J83bPzL+o2Znx3W4sgM=;
 b=m/XQMiAcgAvnFHahl8BFtiLWj9fGXKbJbF1kZkpp0jgzMvZzFMy+/B56/qlsYQXPEY1tWR
 2e0utSB4H5zuyPOzNfUqgWxCL40KOussXyThDn7/GrrzOMhD2W0osWzmchCc+nFy6UpP8a
 /5VUod1rZeovs5ew2vi9azmWQYwYjDZJ36qy/f9Q12v0BKGsi9T95gtmx+qen1ikAHvn9u
 cQHnQI30vWONHQULLbbC7wNgWIm7mQwmXvKPGcsdFd15wB75kIcXZL8QD4gStvezyf48Lk
 XURikrmUWvvPz/42FlRs7UwY0xaFSYfF+KPbEkfa5q3b9rF3lZwEyXTpNEfWiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m/XQMiAc
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: Remove openal from my list
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgMSBGZWIgMjAyMyAyMDoyNzoxMSArMDEwMApBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+Cj4gLS0tCj4gIERFVkVMT1BFUlMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21h
cyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
