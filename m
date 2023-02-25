Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77471C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24E7840C90;
	Sat, 25 Feb 2023 09:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24E7840C90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiJuXYvQWTHY; Sat, 25 Feb 2023 09:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B36140BC4;
	Sat, 25 Feb 2023 09:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B36140BC4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EAAD1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37FEE81ED4
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FEE81ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xN-C4PyO-AcK for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:50:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27DE581EBC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27DE581EBC
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:50:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C8A4420004;
 Sat, 25 Feb 2023 09:50:03 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:50:03 +0100
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20230225105003.632fa577@windsurf>
In-Reply-To: <20230224105315.16171-1-sebastien.szymanski@armadeus.com>
References: <20230224105315.16171-1-sebastien.szymanski@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhWt74fIezRQSx36jwR96AGBPXxZm5SV92QnoRskFrQ=;
 b=m6g2sN/LQvgkrm/AFIsTiENJ0BU/Q0OU3U54WWzM3agIDu/L1Vq4fjKjly+teJVR9qs2+w
 hFxa32RyROqfjyr8DpQUuUyYtuuKC2gap2s4RpeQVgzUHg1Ci/GYqWhltPgxLt9lY5M3pI
 ZszH05Ofa5IthWpChBQjGtI9UdNvoRUFG0vD9H5LgQ+YiM4u8stDkB+Ivh9Bky9aNz2agr
 bo9LuFnrjrU12ZDftm72z2HVGzTq5I8t+6PVyi0VYsYMVW9NXSND0ziHSOhmN97zUlrL15
 pin0FGk0iB0KIPZ7hiWh6v7hFWu7KF9k7yoZvwMBEQVgjFFjc/eil3Htj/DdKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m6g2sN/L
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-g2d: drop
 BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyNCBGZWIgMjAyMyAxMTo1MzoxNSArMDEwMApTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgoKPiBBcm0gYW5kIGFhcmNo
NjQgcGFja2FnZXMgZG9uJ3QgY29udGFpbiBleGFtcGxlcyBhbnltb3JlIHNvIGRyb3AgdGhlCj4g
Y29uZmlnIG9wdGlvbiB0byBpbnN0YWxsIHRoZW0gdG8gcHJldmVudCBidWlsZCBmYWlsdXJlIHdo
ZW4gc2VsZWN0ZWQ6Cj4gCj4gPj4+IGlteC1ncHUtZzJkIDYuNC4zLnA0LjQtYXJtIEluc3RhbGxp
bmcgdG8gdGFyZ2V0ICAKPiBta2RpciAtcCAvaG9tZS9zc3p5L2JyLXRlc3QtcGtnL2Jvb3RsaW4t
YXJtdjctZ2xpYmMvdGFyZ2V0L3Vzci9zaGFyZS9leGFtcGxlcy8KPiBjcCAtYSAvaG9tZS9zc3p5
L2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjctZ2xpYmMvYnVpbGQvaW14LWdwdS1nMmQtNi40LjMu
cDQuNC1hcm0vZ3B1LWRlbW9zL29wdC8qIC9ob21lL3NzenkvYnItdGVzdC1wa2cvYm9vdGxpbi1h
cm12Ny1nbGliYy90YXJnZXQvdXNyL3NoYXJlL2V4YW1wbGVzLwo+IGNwOiBjYW5ub3Qgc3RhdCAn
L2hvbWUvc3N6eS9ici10ZXN0LXBrZy9ib290bGluLWFybXY3LWdsaWJjL2J1aWxkL2lteC1ncHUt
ZzJkLTYuNC4zLnA0LjQtYXJtL2dwdS1kZW1vcy9vcHQvKic6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKPiBtYWtlOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6Mzg0OiAvaG9tZS9zc3p5
L2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjctZ2xpYmMvYnVpbGQvaW14LWdwdS1nMmQtNi40LjMu
cDQuNC1hcm0vLnN0YW1wX3RhcmdldF9pbnN0YWxsZWRdIEVycm9yIDEKPiAKPiBGaXhlczogYjg0
NTU3YjU4OGIzICgicGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtZzJkOiBidW1wIHZlcnNp
b24gdG8gNi40LjMucDQuNCIpCj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kg
PHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+IC0tLQo+ICBDb25maWcuaW4ubGVn
YWN5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrKysrKwo+ICBwYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvQ29uZmlnLmluICAgICAgfCA5IC0tLS0tLS0tLQo+
ICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsgfCA4IC0t
LS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMo
LSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
