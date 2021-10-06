Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE3C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:40:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 428F161154
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 428F161154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AEE483E2C;
	Wed,  6 Oct 2021 15:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVikfxaR3JL0; Wed,  6 Oct 2021 15:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7843F83E1B;
	Wed,  6 Oct 2021 15:40:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEC9E1BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD9B44011C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-bNp4epBhp3 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:40:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6792A400C1
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:40:02 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0FED92000D;
 Wed,  6 Oct 2021 15:39:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mY91S-0002lc-BO; Wed, 06 Oct 2021 17:39:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
References: <20210907120933.31647-1-raphael.melotte@mind.be>
 <20210927110354.1193430-1-raphael.melotte@mind.be>
Date: Wed, 06 Oct 2021 17:39:58 +0200
In-Reply-To: <20210927110354.1193430-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte=22's?= message of "Mon, 27 Sep
 2021 13:03:53 +0200")
Message-ID: <87lf3640xd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/mupdf: fix building with mips
 toolchains
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+IHdyaXRlczoKCiA+IFdpdGggc29tZSB0b29sY2hhaW5zIChlLmcuIG1pcHM2NGVsKSwg
cGFydGlhbCBsaW5raW5nIGZhaWxzIGluIHRoZQogPiBmb2xsb3dpbmcgd2F5OgogPiAvdG1wL2lu
c3RhbmNlLTEvb3V0cHV0LTEvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy9t
aXBzNjRlbC1idWlsZHJvb3QtbGludXgtdWNsaWJjLzguNC4wLy4uLy4uLy4uLy4uL21pcHM2NGVs
LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOiBidWlsZC9yZWxlYXNlL2xpYm11cGRmLmEo
RGluZ2JhdHMuY2ZmLm8pOiBBQkkgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhhdCBvZiB0aGUgc2Vs
ZWN0ZWQgZW11bGF0aW9uCiA+IC90bXAvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29wdC9leHQt
dG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMv
OC40LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQ6
IGZhaWxlZCB0byBtZXJnZSB0YXJnZXQgc3BlY2lmaWMgZGF0YSBvZiBmaWxlIGJ1aWxkL3JlbGVh
c2UvbGlibXVwZGYuYShEaW5nYmF0cy5jZmYubykKCiA+IFRha2luZyBpbnNwaXJhdGlvbiBmcm9t
IGNvbW1pdAogPiA5ZWNhNGI5Zjg0ZmUyNTM1ZDhjYWVlNmVlYjA2MmNlMzM3MzNiZGYxLCBmaXgg
aXQgYnkgdXNpbmcgR0NDIGluc3RlYWQKID4gb2YgTEQgZm9yIHBhcnRpYWwgbGlua2luZy4KCiA+
IE5vdGUgdGhhdCBvbiBtaXBzIHRoZSBidWlsZCB3aWxsIG5vdyBwcm9kdWNlIHdhcm5pbmdzIHNp
bWlsYXIgdG8gdGhpcwogPiBvbmU6CiA+IGJ1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL21p
cHM2NGVsLWJ1aWxkcm9vdC1saW51eC1nbnUvMTAuMy4wLy4uLy4uLy4uLy4uL21pcHM2NGVsLWJ1
aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOiBidWlsZC9yZWxlYXNlL2xpYm11cGRmLmEoTm90b1Nh
bnNUYWlUaGFtLVJlZ3VsYXIudHRmLm8pOiB3YXJuaW5nOiBsaW5raW5nIGFiaWNhbGxzIGZpbGVz
IHdpdGggbm9uLWFiaWNhbGxzIGZpbGVzCgogPiBEdXJpbmcgYSBydW50aW1lIHRlc3Qgb24gbWlw
czY0ZWwgdW5kZXIgcWVtdSwgbXVwZGYteDExIHdhcwogPiBub25ldGhlbGVzcyBhYmxlIHRvIGRp
c3BsYXkgYSBzYW1wbGUgUERGIGZpbGUgY29ycmVjdGx5LgoKID4gRml4ZXM6CiA+IC0gaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMTU2ZmU5ZWU1ZjZkY2NkYzk4OTkwZjZj
NWRlNTU2MjM4M2JjMmI3NC8KCiA+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxy
YXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCkNvbW1pdHRlZCB0byAyMDIxLjA4LngsIHRoYW5rcy4K
Ci0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
