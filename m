Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D97CA0FE8
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 15:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6604407E7;
	Sun, 31 Aug 2025 15:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2wWMZYlmulW; Sun, 31 Aug 2025 15:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 309F3407E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 309F3407E8;
	Sun, 31 Aug 2025 15:00:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C2C5D2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19D944002D
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1LC7bxHaUjj for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 15:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF1B74002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF1B74002C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF1B74002C
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1276267327; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 31 Aug 2025 14:59:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1usjX8-00HN1D-0D;
 Sun, 31 Aug 2025 16:59:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Tzu-Jung Lee <roylee17@gmail.com>
References: <20250829080657.2627985-1-peter@korsgaard.com>
Date: Sun, 31 Aug 2025 16:59:54 +0200
In-Reply-To: <20250829080657.2627985-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 29 Aug 2025 10:06:57 +0200")
Message-ID: <87o6rvfset.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=MexYf1NpnYAQe5+KORtH56iQAsmyA6T4Es3QUQePTeLCpGu/AK+iRjMSbBtnFWvpdrxQqj7LUDhEy2EZpv3/VEiOR1jm8nSAFBtD++CnpG3SGA0i0yXh+Dq/UXe4gRJWRkxOOzrPctdYVr7OoXOVmnJaCiswb5Vv0RgopBRmzHjAYGZGOzPTs0nOyh8LIlU/hgMkjbkdmMLEfSESRVQFx/YSox7BTwFem+c8dtMRC6Cpc/agsl4K+3uE8KjO+60aWAkOT8e1mxXgHOAZ+D2tJxqlx18eeDEXAZhwEiCUgaBCuDxlPXOwD7xrFkPJzPip6fCJVMnK/E83WGOtoNMIDg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=15Ru06VkausHUO3naYMR7nQH7wt6Z1aKj8MO5moFrEk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=MexYf1Np
Subject: Re: [Buildroot] [PATCH] package/tstools: fix build w/ gcc-15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEdDQy0xNSBkZWZhdWx0cyB0byBDMjMsIHdoaWNoIGNoYW5nZXMgdGhlIG1lYW5p
bmcgb2YgYW4gZW1wdHkgcGFyYW1ldGVyCiA+IGxpc3Q6CgogPiBodHRwczovL2djYy5nbnUub3Jn
L2djYy0xNS9wb3J0aW5nX3RvLmh0bWwjYzIzLWZuLWRlY2xzLXdpdGhvdXQtcGFyYW1ldGVycwoK
ID4gTGVhZGluZyB0byBhIGJ1aWxkIGZhaWx1cmU6CgogPiB0c3NlcnZlLmM6IEluIGZ1bmN0aW9u
IOKAmHNldF9jaGlsZF9leGl0X2hhbmRsZXLigJk6CiA+IHRzc2VydmUuYzoyOTg4OjIxOiBlcnJv
cjogYXNzaWdubWVudCB0byDigJhfX3NpZ2hhbmRsZXJfdOKAmSB7YWthIOKAmHZvaWQKID4gKCop
KGludCnigJl9IGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSDigJh2b2lkICgqKSh2b2lk
KeKAmQogPiBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KID4gIDI5ODggfCAgIGFjdGlv
bi5zYV9oYW5kbGVyID0gb25fY2hpbGRfZXhpdDsKCiA+IEFkZCBhIHBhdGNoIGZyb20gYW4gdXBz
dHJlYW0gUFIgdG8gZml4IHRoYXQuCgogPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
