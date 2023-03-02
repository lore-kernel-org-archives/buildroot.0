Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248F3C678D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 10:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C208A40620;
	Thu,  2 Mar 2023 10:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C208A40620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfKh6I6U8D-B; Thu,  2 Mar 2023 10:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ADF04023B;
	Thu,  2 Mar 2023 10:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ADF04023B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 291FA1BF2F8
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 10:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C18C4023B
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 10:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C18C4023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3wfbnx2TSK0 for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 10:45:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E27040025
Received: from mail.light-speed.de (mail.light-speed.de
 [IPv6:2a01:238:43f2:8900:dd04:e3a0:ee11:a73d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E27040025
 for <buildroot@uclibc.org>; Thu,  2 Mar 2023 10:45:56 +0000 (UTC)
Received: from smtpclient.apple (unknown
 [IPv6:2a02:810a:8280:47aa:7902:e054:f7f0:8a38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id 421DD3D423DD;
 Thu,  2 Mar 2023 11:45:50 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
In-Reply-To: <pan$15c33$6e8d1e3a$c7eb20b6$63ca0c72@ID-313208.user.individual.net>
Date: Thu, 2 Mar 2023 11:45:39 +0100
Message-Id: <3888AE88-BFA3-4341-B5E5-F114D01547F1@jens-maus.de>
References: <20230220205242.72DA9828C8@busybox.osuosl.org>
 <F0F23143-1728-473C-8242-E88E2980B115__8554.50415271974$1677599803$gmane$org@jens-maus.de>
 <pan$15c33$6e8d1e3a$c7eb20b6$63ca0c72@ID-313208.user.individual.net>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1677753950;
 bh=UVYorT3v6uZfrcA1S8aWq8UaqV4QRTaOu85Ci643OS4=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=w1PC8O703+AuTjpn9/CqYX36OVC2Dp+vkCfwalBF8/RCrRUkQQzVh0Ls+VXXziRz0
 A1Q/G5prf9bc/3BWWN6bf0ez56+oA+xB8yRwXSa3BcxaKDDuLfvEv4khzPxOnvIbDG
 S50M2Vvmrq3N8T1WFa8moHd20ByCl777hUp/3Awk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=w1PC8O70
Subject: Re: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 22.3.4
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gQW0gMjguMDIuMjAyMyB1bSAyMjoyMiBzY2hyaWViIEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhs
c0B0LW9ubGluZS5kZT46Cj4gCj4gQW0gVHVlLCAyOCBGZWIgMjAyMyAxNjo0ODo1MSArMDEwMCBz
Y2hyaWViIEplbnMgTWF1cyB2aWEgYnVpbGRyb290Ogo+IAo+PiBTb3JyeSBpZiByZXBseWluZyB0
byB0aGlzIG1haWwgZG9lcyBub3Qgc2VlbSB0byBiZSBhcHByb3ByaWF0ZSwgYnV0IEkKPj4ganVz
dCB0ZXN0ZWQgdGhlIGxhdGVzdCBCdWlsZHJvb3QgMjAyMy4wMi1yYzIgdmVyc2lvbiBhbmQgbm90
aWNlZCB0aGF0Cj4+IHRoZSBidWlsZHMgb2YgdGhlIG1lc2EzZCBwYWNrYWdlIGltbWVkaWF0ZWx5
IHN0b3BwZWQgd29ya2luZyBiZWNhdXNlIGluCj4+IDIyLjMueCB2ZXJzaW9uIG9mIG1lc2EzZCB0
aGUg4oCeZ2xzbGFuZ1ZhbGlkYXRvcuKAnCB0b29sIHNlZW0gdG8gYmUgYSBuZXcKPj4gZGVwZW5k
ZW5jeSBvZiBtZXNhM2QgYW5kIHRoZSBCdWlsZHJvb3QgcGFja2FnZSBkb2VzIG5vdCBpbnN0YWxs
IHRoaXMKPj4gaG9zdCB0b29sIGl0c2VsZiAobm8gZ2FzbGFuZy10b29scyBwYWNrYWdlKSwgdGh1
cyB0aGUgYnVpbGQgZmFpbHMgaWYgdGhlCj4+IGJ1aWxkIGhvc3QgaXRzZWxmIGRvZXMgbm90IGhh
dmUgdGhpcyBidWlsZCB0b29sIGluc3RhbGxlZC4KPiAKPiBIaSBKZW5zLAo+IAo+IGRvIHRoZXNl
IHBhdGNoZXMgZml4IHRoZSBwcm9ibGVtPwo+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzMzNTg1CgpZZXMsIHRoZXNlIHBhdGNoZXMg
Zml4IHRoZSBpc3N1ZXMgd2l0aCBuZXdlciBtZXNhM2QgdmVyc2lvbnMgYW5kIHRoZSBtaXNzaW5n
IOKAnmdsc2xhbmdWYWxpZGF0b3LigJwuIFRoYW5rcy4KCkhvcGUgdG8gc2VlIHRoZXNlIHBhdGNo
ZXMgYWxyZWFkeSBiZWluZyBpbnRlZ3JhdGVkIGludG8gdGhlIHVwY29taW5nIDIwMjMuMDIgcmVs
ZWFzZS4KCnJlZ2FyZHMsCgpqZW5zCi0tIApKZW5zIE1hdXMsIERyZXNkZW4vR2VybWFueQpodHRw
Oi8vamVucy1tYXVzLmRlLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
