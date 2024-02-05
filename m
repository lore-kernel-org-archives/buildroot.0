Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F6FC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62FDE60F15;
	Mon,  5 Feb 2024 15:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62FDE60F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTO6STIy0vb9; Mon,  5 Feb 2024 15:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B798160F06;
	Mon,  5 Feb 2024 15:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B798160F06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 504F81BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 290AF41764
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 290AF41764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tz5daQa2fMq0 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:42:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 140FA408FC
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 140FA408FC
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC140240002;
 Mon,  5 Feb 2024 15:42:06 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:42:05 +0100
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Message-ID: <20240205164205.33c28a05@windsurf>
In-Reply-To: <20240115180946.1646186-1-flavio.tapajos@newtesc.com.br>
References: <20240115180946.1646186-1-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707147727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xh/ztb7MN1EJ4qcR+aCXsAT0/Q/Aw3GyS9v/cfcvHJg=;
 b=R6NAxl1vsj+fxJOcZE4yQHDmtfGJw/yz31fNbldl03Po6Mo9Y0ffs676ittjEmUCXSMUAt
 Qa63Sv8sRBGMCLICVl7+WPetbik6JGLMd5EEz5brYB4gZd6QPP6+x8Jf7ci3ufnutHtFRX
 nfSGGuHYjkKUVqr6zafXFFqSxiR6XcLTR8TtvR1jhFXSyA/lG9lyok0Wa63woZRPxBaXN3
 bFzf0QzhYzd87yan14qW2vWEoIqTZJO/m+uVnH5bRvFNQh9gV+xUAsVPhpbfBgmCL7/Coy
 Ppz4mY6Gy6RCcNEPwsUrT45/UsSlyeQKw1AFSZeEkUbX4KKytYKNmgE6gYsheg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R6NAxl1v
Subject: Re: [Buildroot] [PATCH 1/1] configs/asus_tinker-s_rk3288: bump
 Linux to 6.1.72
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

T24gTW9uLCAxNSBKYW4gMjAyNCAxNTowOTo0NiAtMDMwMApGbMOhdmlvIFRhcGFqw7NzIDxmbGF2
aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+IC0tLQo+ICBjb25m
aWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
