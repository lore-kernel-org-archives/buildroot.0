Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64126C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 08:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A0DB4014C;
	Fri, 29 Jul 2022 08:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A0DB4014C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfKFbFGhO5fO; Fri, 29 Jul 2022 08:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F185E400A6;
	Fri, 29 Jul 2022 08:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F185E400A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACA2B1BF308
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 944F583FEA
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944F583FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWv26VCyq-8b for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 08:45:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91FFF83FE8
Received: from m13134.mail.163.com (m13134.mail.163.com [220.181.13.134])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91FFF83FE8
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 08:45:17 +0000 (UTC)
Received: from andyshrk$163.com ( [112.96.231.35] ) by ajax-webmail-wmsvr134
 (Coremail) ; Fri, 29 Jul 2022 16:45:07 +0800 (CST)
X-Originating-IP: [112.96.231.35]
Date: Fri, 29 Jul 2022 16:45:07 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Arnout Vandecappelle" <arnout@mind.be>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <de698bb9-334a-b132-f417-7f7c3e39ea06@mind.be>
References: <5868454e.114f.18036cf775d.Coremail.andyshrk@163.com>
 <de698bb9-334a-b132-f417-7f7c3e39ea06@mind.be>
MIME-Version: 1.0
Message-ID: <3a1fd6ce.4164.18249217d7b.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hsGowABHvt0TnuNiYxApAA--.30991W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h1NXmEjcvy3DgACsr
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=PVETz
 vcg7XdT/2fRc7531gJglCgEwCSd9VLvyky3ntU=; b=Ttnkh5L4LcQts5ditMdKv
 JvK7EEXQ215Y2tDjfL5IgGTRV7Os9dY25qYfM+kJBcYomohhz1TCuEiajOH63onv
 1L5IUqWnLdx4Oi9L40BIwj0R3ZosgKVnSMo9f2FLo8iDpWLu0VKr5ov5BxSPeWjK
 NFw0Ab5m1cUL4Rdy6vsrCo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527
 header.b=Ttnkh5L4
Subject: Re: [Buildroot] Is there any plan for supporting Qt6
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
Cc: ps.report@gmx.net, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkhpIEFybm91dO+8mgoKQXQgMjAyMi0wNy0yNyAwNDoxMzoxOCwgIkFybm91dCBWYW5kZWNhcHBl
bGxlIiA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+Cj4KPk9uIDE3LzA0LzIwMjIgMTE6MTYsIEFu
ZHkgWWFuIHdyb3RlOgo+PiAKPj4gCj4+IEhlbGxvOgo+PiAgICAgICAgQnVpbGRyb290IGlzIGEg
Z3JlYXQgcHJvamVjdCwgaXQgZ2F2ZSBtZSBtYW55IGNvbnZpbmNlIGZvciBidWlsZGluZyBlbWJl
ZGRlZCByb290ZnMuCj4+ICAgICAgICBJIGZvdW5kIFBldGVyIGhhcyBzdWJtaXR0ZWQgUXQ2IHN1
cHBvcnQgYXQgdGhlIGVhcmx5IG9mIDIwMjFbMF0sIGJ1dCBpdCBzZWVtcyB0aGlzIHNlcmllcyBo
YXMKPj4gbm90IGJlZSBtZXJnZWQgeWV0LiBNYXkgaSBLbm93IGlmIHRoZXJlIGlzIGFueSBmdXJ0
aGVyIHBsYW4gZm9yIFF0NiBzdXBwb3J0IGluIGJ1aWxkcm9vdD8KPgo+ICBXZSBub3cgbWVyZ2Vk
IHRoZSB2ZXJ5IG1pbmltYWwgdmVyc2lvbiBvZiBxdDZiYXNlLiBUaGUgbmV4dCBzdGVwIGlzIGZv
ciAKPnNvbWVvbmUgdG8gc3RlcCB1cCBhbmQgYWRkIHRoZSBkaWZmZXJlbnQgcXQ2YmFzZSBmZWF0
dXJlcywgYW5kIHRoZSBvdGhlciBxdDYgCgo+bW9kdWxlcy4KCgpHcmVhdCB3b3Jr77yMIHRoYW5r
IHlvde+8gQoKPgo+ICBSZWdhcmRzLAo+ICBBcm5vdXQKPgo+PiAKPj4gWzBdaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9jb3Zlci8yMDIxMDIxMzE3NDAxMy4z
MjU4NC0xLXBzLnJlcG9ydEBnbXgubmV0Lwo+PiAKPj4gTWFueSB0aGFua3MuCj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
