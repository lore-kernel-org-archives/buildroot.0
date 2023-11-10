Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A12C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 12:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F14B0812DA;
	Fri, 10 Nov 2023 12:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F14B0812DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxdXJ3AwjmZ7; Fri, 10 Nov 2023 12:24:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43FBD811E4;
	Fri, 10 Nov 2023 12:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43FBD811E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9439E1BF852
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A40E80ED9
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A40E80ED9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvPx3AylU0HW for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 12:24:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 948AA80B13
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 948AA80B13
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F1A21C0005;
 Fri, 10 Nov 2023 12:24:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r1QZ3-003wY0-2X;
 Fri, 10 Nov 2023 13:24:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231105183719.3811015-1-peter@korsgaard.com>
Date: Fri, 10 Nov 2023 13:24:45 +0100
In-Reply-To: <20231105183719.3811015-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 5 Nov 2023 19:37:16 +0100")
Message-ID: <87ttptlrsi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/4] configs/stm32mp157a_dk1_defconfig:
 unbreak TF-A build with GCC >= 12
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IFdpdGggdGhlIG1vdmUgdG8gZGVmYXVsdCB0byBHQ0MgMTIgaW4gY29tbWl0IGUw
MDkxZTQyZWVmOSAocGFja2FnZS9nY2M6CiA+IHN3aXRjaCB0byBnY2MgMTIueCBhcyB0aGUgZGVm
YXVsdCksIFRGLUEgbm93IGZhaWxzIHRvIGJ1aWxkIGFzIGEgd2FybmluZyBpcwogPiBnZW5lcmF0
ZWQgYW5kIGl0IGJ1aWxkcyB3aXRoIC1XZXJyb3I6CgogPiAgIENDICAgICAgcGxhdC9zdC9zdG0z
Mm1wMS9ibDJfcGxhdF9zZXR1cC5jCiA+IGRyaXZlcnMvc3QvaW8vaW9fc3RtMzJpbWFnZS5jOiBJ
biBmdW5jdGlvbiDigJhzdG0zMmltYWdlX3BhcnRpdGlvbl9yZWFk4oCZOgogPiBkcml2ZXJzL3N0
L2lvL2lvX3N0bTMyaW1hZ2UuYzoyNDk6MTM6IGVycm9yOiDigJhyZXN1bHTigJkgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZCBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQogPiAgIDI0OSB8
ICAgICAgICAgaW50IHJlc3VsdDsKID4gICAgICAgfCAgICAgICAgICAgICBefn5+fn4KID4gY2Mx
OiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKCiA+IFRoaXMgaXMgZml4ZWQg
aW4gVEYtQSB2Mi42IHdpdGggY29tbWl0IGMxZDczMmQwZGIyNCAoZml4KGlvX3N0bTMyaW1hZ2Up
OgogPiB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHdhcm5pbmcpLCBidXQgSSBkbyBub3QgaGF2ZSB0
aGUgYm9hcmQgdG8gdmVyaWZ5IGlmCiA+IHYyLjYgd29ya3MsIHNvIGluc3RlYWQgZGlzYWJsZSAt
V2Vycm9yIGJ5IG1hc3NzaW5nIEU9MC4KCiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFy
ZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMu
MDgueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
