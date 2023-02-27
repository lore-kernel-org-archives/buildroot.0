Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346E4C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 15:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7A16104D;
	Mon, 27 Feb 2023 15:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC7A16104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blFAHU5BtX2b; Mon, 27 Feb 2023 15:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 003D560736;
	Mon, 27 Feb 2023 15:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003D560736
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B134C1BF31B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B3EB61047
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B3EB61047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpZtD4GWFfgK for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 15:38:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6FBA60736
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6FBA60736
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 15:38:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5E3FC0016;
 Mon, 27 Feb 2023 15:38:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pWfZl-009HXu-Vy; Mon, 27 Feb 2023 16:38:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20220718215158.C299083CCF@busybox.osuosl.org>
 <ab86d540-9c27-43fc-0d37-2d5b0bca072e@othermo.de>
Date: Mon, 27 Feb 2023 16:38:05 +0100
In-Reply-To: <ab86d540-9c27-43fc-0d37-2d5b0bca072e@othermo.de> (Marcus
 Hoffmann's message of "Mon, 27 Feb 2023 15:25:06 +0100")
Message-ID: <87356rm84i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/sudo: fix
 SUDO_ENABLE_SUDO_GROUP_RULE following version bump
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk1hcmN1cyIgPT0gTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJt
by5kZT4gd3JpdGVzOgoKID4gSGkgUGV0ZXIsCiA+IHRoZSBuZWVkcyB0byBiZSBiYWNrcG9ydGVk
IHRvIDIwMjIuMTEueCBhbmQgMjAyMi4wMi54CgpUaGlzIGlzIGEgY29tbWl0IGZyb20gSnVseSAy
MDIyLCBzbyBpdCBpcyBhbHJlYWR5IGluIDIwMjIuMTEueCAoYW5kCjIwMjIuMDgueCk6CgpnaXQg
YnJhbmNoIC0tY29udGFpbnMgMDc5ZmNjZGVlNWEyYTEwZmM4Mjc1MDk0NTEyYjg0MjM1NDhlYTE0
N3xncmVwICcyMDIyXC4nCiAgMjAyMi4wOC54CiAgMjAyMi4xMS54CgpCdXQgaXQgd2FzIGluZGVl
ZCBtaXNzZWQgZnJvbSAyMDIyLjAyLng6CgpnaXQgc2hvcnRsb2cgMjAyMi4wMi4uMjAyMi4wMi54
IC0tIHBhY2thZ2Uvc3VkbwpGYWJyaWNlIEZvbnRhaW5lICgyKToKICAgICAgcGFja2FnZS9zdWRv
OiBmaXggQ1ZFLTIwMjItNDM5OTUKICAgICAgcGFja2FnZS9zdWRvOiBidW1wIHRvIHZlcnNpb24g
MS45LjExcDIKCkZyYW5jb2lzIFBlcnJhZCAoMSk6CiAgICAgIHBhY2thZ2Uvc3VkbzogYnVtcCB0
byB2ZXJzaW9uIDEuOS4xMnAxCgpOdW5vIEdvbsOnYWx2ZXMgKDIpOgogICAgICBwYWNrYWdlcy9z
dWRvOiBleHBsaWNpdGx5IHNldCB3aXRoLXR6ZGlyCiAgICAgIHBhY2thZ2VzL3N1ZG86IGV4cGxp
Y2l0bHkgc2V0IGVuYWJsZS10bXBmaWxlcy5kCgpZYWlyIEJlbi1BdnJhaGFtICgxKToKICAgICAg
cGFja2FnZS9zdWRvOiBzZWN1cml0eSBidW1wIHRvIHZlcnNpb24gMS45LjEycDIKClNvIEkgaGF2
ZSBjaGVycnktcGlja2VkIGl0IG5vdywgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
