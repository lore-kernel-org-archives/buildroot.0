Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A18EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53DDC41583;
	Sun, 20 Aug 2023 21:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53DDC41583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dshgJlubJbom; Sun, 20 Aug 2023 21:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678BD415DF;
	Sun, 20 Aug 2023 21:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 678BD415DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1321BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D949660F14
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D949660F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUNcBx7DGhwr for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:51:18 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52B6D60EE5
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52B6D60EE5
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AD03ACB8D7
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:41:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9480F60003
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:41:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qXqAh-000EGN-L5
 for buildroot@buildroot.org; Sun, 20 Aug 2023 23:41:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:41:19 +0200
Message-ID: <87h6oto0hs.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.08-rc2 released
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgMjAyMy4wOC1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMy4wOC1yYzIu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIz
LjA4LXJjMi50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmdpdDovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdAoKQW5vdGhlciAyIHdlZWtzLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRl
LgoKUGxlYXNlIGdpdmUgaXQgYSBzcGluIGFuZCByZXBvcnQgYW55IHByb2JsZW1zIHRvIHRoZSBt
YWlsaW5nIGxpc3Qgb3IKYnVnIHRyYWNrZXIuIE1hbnkgdGhhbmtzIHRvIHRoZSBwZW9wbGUgY29u
dHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMy4wOC1yYzEu
LgoKICAgIDE2ICBCZXJuZCBLdWhscwogICAgMTYgIFdhbGRlbWFyIEJyb2Rrb3JiCiAgICAgNyAg
RGFuaWVsIExhbmcKICAgICA2ICBDbMOpbWVudCBSYW1pcmV6CiAgICAgNiAgVGhvbWFzIFBldGF6
em9uaQogICAgIDUgIEZhYnJpY2UgRm9udGFpbmUKICAgICA1ICBZYW5uIEUuIE1PUklOCiAgICAg
NCAgQW5kcmVhcyBaaWVnbGVyCiAgICAgNCAgQ2hyaXN0aWFuIFN0ZXdhcnQKICAgICAzICBHYXJ5
IEJpc3NvbgogICAgIDMgIEdpdWxpbyBCZW5ldHRpCiAgICAgMyAgSnVsaWVuIE9saXZhaW4KICAg
ICAzICBSb21haW4gTmFvdXIKICAgICAyICBCYXJ0b3N6IEJpbGFzCiAgICAgMiAgSmFtZXMgSGls
bGlhcmQKICAgICAyICBOZWFsIEZyYWdlcgogICAgIDIgIFBldGVyIEtvcnNnYWFyZAogICAgIDIg
IFBldGVyIFNlaWRlcmVyCiAgICAgMiAgVmluY2VudCBGYXppbwogICAgIDEgIEFsZXhhbmRlciBT
dmVyZGxpbgogICAgIDEgIEFsZXhleSBSb3NseWFrb3YKICAgICAxICBCYXJ1Y2ggU2lhY2gKICAg
ICAxICBDbGVtZW50IFJhbWlyZXoKICAgICAxICBLaWxpYW4gWmlubmVja2VyCiAgICAgMSAgTmlj
b2xhcyBCb2ljaGF0CiAgICAgMSAgTmljb2xhcyBDYXJyaWVyCiAgICAgMSAgVGhvbWFzIERldm9v
Z2R0CiAgICAgMSAgWXUgQ2hpZW4gUGV0ZXIgTGluCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
