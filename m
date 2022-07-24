Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F829C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F11F440BA3;
	Sun, 24 Jul 2022 10:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F11F440BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCDaMrsz8om6; Sun, 24 Jul 2022 10:33:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EE4C40BBD;
	Sun, 24 Jul 2022 10:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EE4C40BBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8CC1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 281798258A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281798258A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WF3cRPwVSuKk for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:33:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F3181B0A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04F3181B0A
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:33:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22A1820003;
 Sun, 24 Jul 2022 10:33:36 +0000 (UTC)
Date: Sun, 24 Jul 2022 12:33:35 +0200
To: Nicolas Carrier <nicolas.carrier@orolia.com>
Message-ID: <20220724123335.0f64d17c@windsurf>
In-Reply-To: <20220310124106.2916278-1-nicolas.carrier@orolia.com>
References: <20220310124106.2916278-1-nicolas.carrier@orolia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658658817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qa1Cgc6XsC24aMHx4OzxvtbMjVuvspxVP1YZwwW2YRY=;
 b=BJXTBgXSuvZY0KF0djiXGQN8qNKZVgHikm5Te7uytCbwE6v3FMXwSdHFfBmA2+RvBQU5px
 ZKVWwbJ4aCGfnqTfUtLFjf4MBtNNTbxdDfy1z6rNjPmX/a9S6fpdMdBJEyfUxOUdOuKQOw
 oSKzYfn0ZCfUJ5ZcIKZI0Hlrz5kcC+laD47asY6Je3bivugbfjnVLtJqTgecpiDgy0J+ck
 l37iKbQc8QCBIoFhhuRORxrbpVRK6Dou2GfEKCKny4xp3jGdXd6a+JKQHB97nf//h8Wxgr
 1QE6S83jbJ6KPSUsa/yT0Mq+V9Gvk9cy5eF+IeFpQfy4tNTaL6wyXs7WVY8XrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BJXTBgXS
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: fix compilation
 with linaro 7.3 / 7.5 toolchains
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxMCBNYXIgMjAyMiAxMzo0MTowNiArMDEwMApOaWNvbGFzIENhcnJpZXIgPG5pY29s
YXMuY2FycmllckBvcm9saWEuY29tPiB3cm90ZToKCj4gQW4gdW5pdGlhbGl6ZWQgZmllbGQgaW4g
YSBzdHJ1Y3R1cmUsIGNhdXNlcyB0aGUgZm9sbG93aW5nIGVycm9yOgo+ICAgICBwbGF0Zm9ybS9h
dWRpby9nc3RyZWFtZXIvQXVkaW9GaWxlUmVhZGVyR1N0cmVhbWVyLmNwcDoyMzQ6NTogZXJyb3I6
IGJyYWNlcyBhcm91bmQgc2NhbGFyIGluaXRpYWxpemVyIGZvciB0eXBlIOKAmGdib29sZWFuICgq
KShHc3RBcHBTaW5rKiwgZ3BvaW50ZXIpIHtha2EgaW50ICgqKShfR3N0QXBwU2luayosIHZvaWQq
KX3igJkKPiAKPiBUaGlzIGNvbW1pdCBhcHBsaWVzIGEgcGF0Y2ggdG8gcXQ1d2Via2l0IHRvIGZp
eCB0aGUgY29tcGlsYXRpb24gaXNzdWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBDYXJy
aWVyIDxuaWNvbGFzLmNhcnJpZXJAb3JvbGlhLmNvbT4KPiAtLS0KPiAgLi4ueC1BdWRpb0ZpbGVS
ZWFkZXJHU3RyZWFtZXItY29tcGlsYXRpb24ucGF0Y2ggfCAxNyArKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMDUtZml4LUF1ZGlvRmlsZVJlYWRlckdTdHJlYW1lci1j
b21waWxhdGlvbi5wYXRjaAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLiBJIGxvb2tlZCBpbnRvIHRo
aXMsIGFuZCB0aGUgcHJvYmxlbSBpcyBub3QKcmVsYXRlZCB0byBMaW5hcm8gdG9vbGNoYWlucywg
YnV0IGEgY29tcGF0aWJpbGl0eSBpc3N1ZSB3aXRoIEdTdHJlYW1lcgpuZXdlciB0aGFuIDEuMTku
eCwgd2hpY2ggY2hhbmdlZCB0aGlzIEdzdEFwcFNpbmtDYWxsYmFja3Mgc3RydWN0dXJlLiBJCmlk
ZW50aWZpZWQgdGhlIHVwc3RyZWFtIGZpeCBmb3IgdGhpcyBwcm9ibGVtLCBiYWNrcG9ydGVkIGl0
LCBhbmQgYWRkZWQKYW4gZXhwbGFuYXRpb24uCgpTZWUgdGhlIHJlc3VsdGluZyBjb21taXQgYXQ6
CgogIGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290L2NvbW1pdC8/aWQ9YmI1MGI4
MjE3MDI4NDFmZGM3NWJmODE1MTU1NWNkNDAxZjc2NGYwNwoKVGhhbmtzIGEgbG90IQoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
