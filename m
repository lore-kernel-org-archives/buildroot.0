Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E16AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF9586F497;
	Thu,  2 Dec 2021 17:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxphbQdS3ncU; Thu,  2 Dec 2021 17:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B9716065C;
	Thu,  2 Dec 2021 17:41:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A29AA1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A00EB83F46
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUACxpjJOrIb for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:41:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8114383F20
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:41:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9D86D200015;
 Thu,  2 Dec 2021 17:41:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1msq59-00076u-Vp; Thu, 02 Dec 2021 18:41:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211201070004.563142-1-fontaine.fabrice@gmail.com>
 <875ys7diyy.fsf@dell.be.48ers.dk>
 <CAPi7W83yET5Hu32DaboR8G3E2Eg-LkUMwhoxo4-5TU5Y1d758Q@mail.gmail.com>
Date: Thu, 02 Dec 2021 18:41:19 +0100
In-Reply-To: <CAPi7W83yET5Hu32DaboR8G3E2Eg-LkUMwhoxo4-5TU5Y1d758Q@mail.gmail.com>
 (Fabrice Fontaine's message of "Thu, 2 Dec 2021 18:29:08 +0100")
Message-ID: <87o85ydhvk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/diffutils: fix build with uclibc < 1.0.35
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBMZSBqZXUuIDIgZMOpYy4gMjAyMSDDoCAxODoxNywgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6CiA+PiA+ICsrIyBpZm5k
ZWYgX19HTElCQ19fCiA+PiA+ICsgIyAgaW5jbHVkZSA8c3RkZGVmLmg+CiA+PiAKID4+IEFyZSB5
b3Ugc3VyZSB0aGF0IHdvcmtzPyB1Q2xpYmMtbmcgZGVmaW5lcyBfX0dMSUJDX18uCiA+IEluZGVl
ZCwgYnV0IGFzIGZlYXR1cmVzLmggaXMgbm90IGluY2x1ZGVkIGJlZm9yZSB0aGlzIGlmbmRlZiwg
aXQgd29ya3MKID4gKEkgYnVpbGQgdGVzdGVkIGl0KS4KID4gSW4gbXkgaW5pdGlhbCBwcm9wb3Nh
bCwgSSBpbmNsdWRlZCBmZWF0dXJlcy5oIGFuZCBrZXB0IHRoZSBpZmRlZgogPiBfX1VDTElCQ19f
IDogaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9idWctZ251bGliLzIwMjEtMTEv
bXNnMDAwNDUuaHRtbAogPiBIb3dldmVyLCB1cHN0cmVhbSBwcmVmZXJyZWQgdGhpcyBzb2x1dGlv
bi4KID4gSSBkb24ndCByZWFsbHkga25vdyBpZiBmZWF0dXJlcy5oIGlzIGEgdWNsaWJjLWhlYWRl
ciBvciBub3QuCgpPayAtIENvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
