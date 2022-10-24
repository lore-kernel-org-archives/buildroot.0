Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EF4C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD8960B1D;
	Mon, 24 Oct 2022 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD8960B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4E2QkZ39VGTe; Mon, 24 Oct 2022 21:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FED60ABD;
	Mon, 24 Oct 2022 21:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35FED60ABD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65CA91BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40EE160ABD
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40EE160ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtIhjXHnoA0q for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:05:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0656A60597
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0656A60597
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:05:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CAEBE1BF204;
 Mon, 24 Oct 2022 21:05:35 +0000 (UTC)
Date: Mon, 24 Oct 2022 23:05:32 +0200
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20221024230532.438bb514@windsurf>
In-Reply-To: <20221024082719.6213-1-sebastien.szymanski@armadeus.com>
References: <20221024082719.6213-1-sebastien.szymanski@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666645536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pm36KVZXDPZzVtneO8F76QP/jspIJ9L6uXpGCVLsC60=;
 b=C/UDx0PCay2vfh5+OTybwgpzXqSAgN7TmTZN4mI1IoHSoJxXkvHeMuo8jOE9PtUQXdFYYF
 37QU008ajLs4fhF0NWdgIFMAnESVJRgpWxht401UtkHhvKgNjxT0kwLMIBDb2S6ACjkhuq
 nZDPnh2oSGxlEvvXstS0NYsSAhRyYhbVuFNWl6XBrOXHHhpShGG7Yqf8hHN/NHE9PTtQ2x
 oYOQfs1xvKLsgSeoN3tkDSHjhI2OLa9L2xoLnpYhnA9bacffn9Di2gLL/SrL4jXf5bu+iT
 JhPG1H4Gq1iPDEJAzQleaLAra5AdSmQzPbbIRxaL6JdC9Exayxd1rOLN4EAW7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C/UDx0PC
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-jsonrpc: bump to
 version 2.2.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyNCBPY3QgMjAyMiAxMDoyNzoxOSArMDIwMApTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5
OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+
Cj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvcHl0aG9uLWZsYXNrLWpzb25y
cGMuaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL3B5dGhvbi1mbGFzay1qc29ucnBjL3B5dGhvbi1m
bGFzay1qc29ucnBjLm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpUaGFua3MgZm9yIHRoZSBwYXRjaCwgYnV0IGRpZCB5b3Ug
dGVzdCBpdD8gVGhlCjAwMDEtTW92ZS1weXRlc3QtcnVubmVyLXRvLXRlc3RzX3JlcXVpcmUucGF0
Y2ggcGF0Y2ggbm8gbG9uZ2VyIGFwcGxpZXM6Cgo+Pj4gcHl0aG9uLWZsYXNrLWpzb25ycGMgMi4y
LjIgRXh0cmFjdGluZwpnemlwIC1kIC1jIC9ob21lL3Rob21hcy9kbC9weXRob24tZmxhc2stanNv
bnJwYy9GbGFzay1KU09OUlBDLTIuMi4yLnRhci5neiB8IHRhciAtLXN0cmlwLWNvbXBvbmVudHM9
MSAtQyAvaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3B5dGhvbi1m
bGFzay1qc29ucnBjLTIuMi4yICAgLXhmIC0KPj4+IHB5dGhvbi1mbGFzay1qc29ucnBjIDIuMi4y
IFBhdGNoaW5nCgpBcHBseWluZyAwMDAxLU1vdmUtcHl0ZXN0LXJ1bm5lci10by10ZXN0c19yZXF1
aXJlLnBhdGNoIHVzaW5nIHBhdGNoOiAKcGF0Y2hpbmcgZmlsZSBzZXR1cC5weQpIdW5rICMxIEZB
SUxFRCBhdCA0Mi4KMSBvdXQgb2YgMSBodW5rIEZBSUxFRCAtLSBzYXZpbmcgcmVqZWN0cyB0byBm
aWxlIHNldHVwLnB5LnJlagptYWtlOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MjUxOiAv
aG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3B5dGhvbi1mbGFzay1q
c29ucnBjLTIuMi4yLy5zdGFtcF9wYXRjaGVkXSBFcnJvciAxCgpDb3VsZCB5b3UgaGF2ZSBhIGxv
b2s/CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
