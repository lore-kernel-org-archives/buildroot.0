Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE28C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 16:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A46A341C14;
	Thu, 24 Nov 2022 16:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A46A341C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vuo_clgQB4am; Thu, 24 Nov 2022 16:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0CD841BFB;
	Thu, 24 Nov 2022 16:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0CD841BFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F7091BF2AB
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 16:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AA684012D
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 16:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AA684012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeRfVCZxPYOk for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 16:52:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 159DE400D8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 159DE400D8
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 16:52:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71B8EC0007
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 16:52:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1oyFSb-000ldQ-F9
 for buildroot@buildroot.org; Thu, 24 Nov 2022 17:52:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 17:52:25 +0100
Message-ID: <87zgcgfg6u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.11-rc3 released
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

SGksCgpCdWlsZHJvb3QgMjAyMi4xMS1yYzMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMi4xMS1yYzMu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIy
LjExLXJjMy50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmdpdDovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdAoKQW5vdGhlciB3ZWVrLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRlLgoK
UGxlYXNlIGdpdmUgaXQgYSBzcGluIGFuZCByZXBvcnQgYW55IHByb2JsZW1zIHRvIHRoZSBtYWls
aW5nIGxpc3Qgb3IKYnVnIHRyYWNrZXIuIE1hbnkgdGhhbmtzIHRvIHRoZSBwZW9wbGUgY29udHJp
YnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMi4xMS1yYzIuLgoK
ICAgIDE2ICBQZXRlciBLb3JzZ2FhcmQKICAgICA1ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAgNCAg
VmluY2VudCBTdGVobMOpCiAgICAgMyAgR2l1bGlvIEJlbmV0dGkKICAgICAzICBNaWNoYWVsIEZp
c2NoZXIKICAgICAyICBUaG9tYXMgUGV0YXp6b25pCiAgICAgMiAgWWFubiBFLiBNT1JJTgogICAg
IDEgIEFsZXhhbmRlciBMdWtpY2hldgogICAgIDEgIEJlcm5kIEt1aGxzCiAgICAgMSAgQnJhbmRv
biBNYWllcgogICAgIDEgIEphbWVzIEhpbGxpYXJkCiAgICAgMSAgTWFyZWsgTWV0ZWxza2kKICAg
ICAxICBNaWNoYWVsIE5vc3Rob2ZmCiAgICAgMSAgTWlxdWVsIFJheW5hbAogICAgIDEgIFllZ29y
IFllZnJlbW92CgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHA6
Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIyLjExLXJj
MwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
