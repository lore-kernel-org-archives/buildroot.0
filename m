Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5174C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 20:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19A734031D;
	Fri, 11 Mar 2022 20:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0a6AhRLWQxH; Fri, 11 Mar 2022 20:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2D3A40179;
	Fri, 11 Mar 2022 20:43:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D71131C115D
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 20:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5DB982F80
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 20:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGDInrVms8NB for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 20:43:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A239C81A33
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 20:43:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD62F100006;
 Fri, 11 Mar 2022 20:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647031414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6xmMjlcQHMSV2ngqhemRuu7ACruiv8Ok7OM6rsX8i8=;
 b=MoQkN7ZqEvReYh2A5CZN4tCN6il8LGpCy9T/ITgI4CEj7g3FkpazclAlzDFWmMw9GOjtAI
 DpgmRMqrz0rB5cmx9zSbZOOpwi03ZmvQbp5kA4quJ0zKlp1KX5cIOrPbCwHNGA0aKx/xMB
 nBjLQUGzZLvfvWhIP/9yYuA4O32i8AhORDfgWUhC9XIERHEOiG+LSLl/uigzvosmjyFy6j
 wgUE7pDAnb2mlTZTwIDPpPB+GjGAjEAkB+BgO0WrWmZCqC3Oh7NXSDg5cytFJVNpl1Ru2D
 evIdT7nBuO6CLqO4MFB+kjLwa0DKnOJ3etnt/kcnIyb+JE5Pn4Q7/C7YDzAO+A==
Date: Fri, 11 Mar 2022 21:43:32 +0100
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220311214332.4405ad89@windsurf>
In-Reply-To: <20220311123636.13415-2-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
 <20220311123636.13415-2-clement.leger@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/7] package/python-cryptography: enable
 host package
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpPbiBGcmksIDExIE1hciAyMDIyIDEzOjM2OjMwICswMTAwCkNsw6lt
ZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4gd3JvdGU6Cgo+ICtIT1NUX1BZ
VEhPTl9DUllQVE9HUkFQSFlfREVQRU5ERU5DSUVTID0gXAo+ICsJaG9zdC1weXRob24tc2V0dXB0
b29scy1ydXN0IFwKPiArCWhvc3QtcHl0aG9uLWNmZmkgXAo+ICsJaG9zdC1ydXN0YyBcCj4gKwlv
cGVuc3NsCgpUaGlzIG9wZW5zc2wgZGVwZW5kZW5jeSBzZWVtcyBleHRyZW1lbHkgZHViaW91cy4g
V2h5IHdvdWxkIGEgaG9zdApwYWNrYWdlIGRlcGVuZCBvbiB0aGUgdGFyZ2V0IHZhcmlhbnQgb2Yg
b3BlbnNzbD8KCj4gIFBZVEhPTl9DUllQVE9HUkFQSFlfRU5WID0gXAo+ICAJJChQS0dfQ0FSR09f
RU5WKSBcCj4gIAlQWU8zX0NST1NTX0xJQl9ESVI9IiQoU1RBR0lOR19ESVIpL3Vzci9saWIvcHl0
aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpIgo+IEBAIC0yNyw0ICszMiw2IEBAIFBZVEhPTl9D
UllQVE9HUkFQSFlfRExfRU5WID0gXAo+ICAJJChQS0dfQ0FSR09fRU5WKSBcCj4gIAlCUl9DQVJH
T19NQU5JRkVTVF9QQVRIPXNyYy9ydXN0L0NhcmdvLnRvbWwKPiAgCj4gKwoKU3B1cmlvdXMgbmV3
bGluZSBhZGRlZC4KCj4gICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPiArJChldmFsICQoaG9z
dC1weXRob24tcGFja2FnZSkpCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
