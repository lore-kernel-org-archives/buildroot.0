Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A1EC43217
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 14:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E336417B7;
	Wed, 16 Nov 2022 14:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E336417B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4GmwnxA5lUb; Wed, 16 Nov 2022 14:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E502B416FF;
	Wed, 16 Nov 2022 14:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E502B416FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C80391BF2B7
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 14:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2CF4416FF
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 14:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2CF4416FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5PM8v2lWSd0 for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 14:33:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F25C416F4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F25C416F4
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 14:33:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DB9671BF20D
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 14:33:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1ovJU8-00AlHD-LS
 for buildroot@buildroot.org; Wed, 16 Nov 2022 15:33:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 15:33:52 +0100
Message-ID: <87zgcrc6jz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.11-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyMi4xMS1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMi4xMS1yYzIu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIy
LjExLXJjMi50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmdpdDovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdAoKTGF0ZXIgdGhhbiBob3BlZCwgYnV0IGhlcmUgaXMgYW5vdGhlciByZWxl
YXNlIGNhbmRpZGF0ZS4KClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0IGFueSBwcm9i
bGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRoYW5rcyB0byB0
aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNu
IDIwMjIuMTEtcmMxLi4KCiAgICAzNiAgRmFicmljZSBGb250YWluZQogICAgMzUgIFRob21hcyBQ
ZXRhenpvbmkKICAgICA2ICBZYW5uIEUuIE1PUklOCiAgICAgNCAgQmVybmQgS3VobHMKICAgICA0
ICBOdW5vIEdvbsOnYWx2ZXMKICAgICAzICBCYXJ1Y2ggU2lhY2gKICAgICAzICBIZWlrbyBUaGll
cnkKICAgICAyICBOZWFsIEZyYWdlcgogICAgIDIgIFBldGVyIEtvcnNnYWFyZAogICAgIDEgIEFu
ZHJlYXMgWmllZ2xlcgogICAgIDEgIEVyaWNvIE51bmVzCiAgICAgMSAgSmFtZXMgSGlsbGlhcmQK
ICAgICAxICBKdXN0aW4gV29vZAogICAgIDEgIE1hcmt1cyBNYXllcgogICAgIDEgIFRpbSBHb3Zl
cgogICAgIDEgIFZpbmNlbnQgRmF6aW8KICAgICAxICBWaW5jZW50IFN0ZWhsw6kKICAgICAxICBX
b2xmZ2FuZyBHcmFuZGVnZ2VyCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmls
ZToKCmh0dHA6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0y
MDIyLjExLXJjMgoKRXhwZWN0IHRoZSBmaW5hbCAyMDIyLjExIHJlbGVhc2UgYnkgdGhlIGVuZCBv
ZiB0aGUgbW9udGguCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
