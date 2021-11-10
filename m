Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D12C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 14:58:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF5761205
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 14:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EF5761205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0E3780B30;
	Wed, 10 Nov 2021 14:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3O-xaXVZxHQQ; Wed, 10 Nov 2021 14:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F20B80B26;
	Wed, 10 Nov 2021 14:58:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0463F1BF360
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 14:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E844060AC1
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 14:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KXn1kpSmOjN1 for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 14:58:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A37C260719
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 14:58:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 31C6D40007
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 14:58:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mkp3X-0003Qs-5Q
 for buildroot@buildroot.org; Wed, 10 Nov 2021 15:58:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 15:58:31 +0100
Message-ID: <87sfw4ys4o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.7 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjEuMDIuNyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjcudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjcudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wMi43IGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0ZXJt
CnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxhdGVk
IGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIxLjAyLjYgcmVsZWFzZS4KCi0gT3BlbkpE
SyAxNi54IG1vdmVkIHRvIDE3LnggYXMgMTYueCBpcyBFT0wuCgotIFNlY3VyaXR5IGZpeGVzIGZv
ciBhc3RlcmlzaywgYmluZCwgZG9ja2VyLWNsaSwgZG9ja2VyLWNvbnRhaW5lcmQsCiAgZG9ja2Vy
LWVuZ2luZSwgZXhpdjIsIGZyZWVyZHAsIGdvLCBoaXJlZGlzLCBscnppcCwgbm9kZWpzLCBvcGVu
amRrLAogIG9wZW5qZGstYmluLCBwaHAsIHNhbWJhNCwgc25vcnQsIHN0cm9uZ3N3YW4sIHN5c3Rl
bWQsIHZpbQoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNl
IGlzc3VlcyBpbiBhdWRpdCwKICBiaXRjb2luLCBjcnlwdHNldHVwLCBkYWhkaS1saW51eCwgZGJ1
cy1weXRob24sIGRmdS11dGlsLCBlYXJseW9vbSwKICBmZm1wZWcsIGdkYiwgZ2Vuc2lvLCBnbnVw
ZzIsIGdwc2QsIGdzdDEtcGx1Z2lucy1iYWQsCiAgZ3N0MS1wbHVnaW5zLXVnbHksIGdzdDEtdmFh
cGksIGxmdHAsIGxpZ2h0bmluZywgbmV0ZGF0YSwgb2xzciwgcGFuZ28sCiAgcWVtdSwgc2FtYmE0
LCBzdXJpY2F0YSwgd2lyZWd1YXJkLWxpbnV4LWNvbXBhdCwgeGVyY2VzCgpGb3IgbW9yZSBkZXRh
aWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVp
bGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMS4wMi43CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQg
cGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtz
IHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hv
cnRsb2cgLXNuIDIwMjEuMDIuNi4uCgogICAgMzggIEZhYnJpY2UgRm9udGFpbmUKICAgIDIxICBQ
ZXRlciBLb3JzZ2FhcmQKICAgIDEwICBUaG9tYXMgUGV0YXp6b25pCiAgICAgNSAgSmFtZXMgSGls
bGlhcmQKICAgICA0ICBCZXJuZCBLdWhscwogICAgIDQgIEdpdWxpbyBCZW5ldHRpCiAgICAgNCAg
UGV0ZXIgU2VpZGVyZXIKICAgICA0ICBSb21haW4gTmFvdXIKICAgICAyICBBZGFtIER1c2tldHQK
ICAgICAyICBBbGV4YW5kZXIgRGFobAogICAgIDIgIEZyYW5jb2lzIFBlcnJhZAogICAgIDIgIEpv
YWNoaW0gV2liZXJnCiAgICAgMiAgTWF0dGhldyBXZWJlcgogICAgIDEgIEFydGVtIFBhbmZpbG92
CiAgICAgMSAgSm9zw6kgUGVra2FyaW5lbgogICAgIDEgIE9saXZpZXIgRGF1dHJpY291cnQKICAg
ICAxICBSYXBoYcOrbCBNw6lsb3R0ZQogICAgIDEgIFNlcmdleSBNYXR5dWtldmljaAogICAgIDEg
IFlhbm4gRS4gTU9SSU4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
