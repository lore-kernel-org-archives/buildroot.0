Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43264C433FE
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8EA741C12;
	Wed, 30 Mar 2022 07:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nurljsi4jpNR; Wed, 30 Mar 2022 07:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 747CD41C0A;
	Wed, 30 Mar 2022 07:52:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4A411BF3E8
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B00EF402F6
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PrCSDeB9qi2 for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:52:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B00BA4010D
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:52:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 131A31BF203;
 Wed, 30 Mar 2022 07:52:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZT89-00GTjW-TK; Wed, 30 Mar 2022 09:52:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220315173231.1943484-1-fontaine.fabrice@gmail.com>
 <87czi4a63p.fsf@dell.be.48ers.dk>
 <CAPi7W80X5dXac4HJ+8uafLWhqUKRW_j-+qT9KO69HJSRFzj2_w@mail.gmail.com>
Date: Wed, 30 Mar 2022 09:52:37 +0200
In-Reply-To: <CAPi7W80X5dXac4HJ+8uafLWhqUKRW_j-+qT9KO69HJSRFzj2_w@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 29 Mar 2022 23:22:30 +0200")
Message-ID: <875ynv98sa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: fix build with libexecinfo
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
Cc: Robert Rose <robertroyrose@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBMZSBtYXIuIDI5IG1hcnMgMjAyMiDDoCAyMTo1MywgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6CiA+PiAKID4+ID4+Pj4+
ICJGYWJyaWNlIiA9PSBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4gd3JpdGVzOgogPj4gCiA+PiA+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFp
c2VkIG9uIHVjbGliYyBhbmQgbXVzbCBzaW5jZSB0aGUKID4+ID4gcmVpbnRyb2R1Y3Rpb24gb2Yg
dGhlIHBhY2thZ2UgaW4gY29tbWl0CiA+PiA+IDE2ZmY5NDg0NDRjMzk3OGQ2M2Y0ODMzNDRhM2Q5
MmQ5OTRjNjQzMTI6CiA+PiAKID4+IEh1aD8gVGhpcyBpcyB0aGUgY29tbWl0IHdoZXJlIG9sYSB3
YXMgcmVpbnRyb2R1Y2VkLCBidXQgdGhpcyBpcyBhCiA+PiBmYWlsdXJlIGluIGdycGMgYW5kIHRo
ZSBjb25maWcgZG9lc24ndCBldmVuIGhhdmUgb2xhIGVuYWJsZWQ/CgogPiBJbmRlZWQsIEkgbWFk
ZSBhIGNvcHkgLyBwYXN0ZSBlcnJvciwgdGhlIGNvcnJlY3QgY29tbWl0IG1lc3NhZ2Ugc2hvdWxk
CiA+IGhhdmUgYmVlbjoKID4gIkZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2Vk
IG9uIHVjbGliYyBhbmQgbXVzbCBzaW5jZSB0aGUKID4gYWRkaXRpb24gb2YgbGliZXhlY2luZm8g
cGFja2FnZSBpbiBjb21taXQKID4gZWVhOGJhNDQ2YzEwNzAxYTI3MzQzMjU1MjEwOGQ4MGZiMjIy
NGVmNCIKCkFoaCwgc28gaXQgYWxzbyBhcHBsaWVzIHRvIHRoZSB2ZXJzaW9uIHdlIGhhdmUgaW4g
MjAyMi4wMi54ICgxLjQzLjApPwpTdHJhbmdlbHkgZW5vdWdoIHdlIG9ubHkgaGF2ZSBhdXRvYnVp
bGRlciBmYWlsdXJlcyBmb3IgMS40NC4wLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
