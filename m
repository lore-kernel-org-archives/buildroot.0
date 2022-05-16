Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AA0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 08:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E45CF81A27;
	Mon, 16 May 2022 08:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYqUpmO7hv5z; Mon, 16 May 2022 08:16:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17FF780DB3;
	Mon, 16 May 2022 08:16:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6A091BF3D6
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 08:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B477B41722
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 08:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMxLsYdMCAck for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 08:16:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A2264171A
 for <buildroot@buildroot.org>; Mon, 16 May 2022 08:16:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 44005C98F7
 for <buildroot@buildroot.org>; Mon, 16 May 2022 08:14:12 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4692A1BF20F;
 Mon, 16 May 2022 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652688846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lps96orDqxWQO6EXNd7anTAN4fcfzs33XuyiltxJo7E=;
 b=DqYaSRLJWjFhlCz/BF4vA/RMmo9HmbqhWMLDX58DnAYlFh1cmMHKQsubk9Rlna5uWVHOxa
 /BhvAS+gcQy9z+2bSbBjgIQhwmcE7xg1q0R8FGpcttRpQmfW7+S67pk31X/9NyJ9C7SSPK
 itRq34NaqurVRxmy8jLxaCYK+cMC9VU2IsGLhHXmKKlE6BgExn5cvKHA8o5HOVlj/Yp5Aj
 ZQKVgg+JTUov5n9DA4pGm8ruPb17g2HQjMRGdQfjBNbyATFnJe8CcmC09vuynGAACxWF+o
 +lbjIQVuIIHIXI6Tdxm4LLEs966X3iHnPyU2Y2uOLoLr26HsIeB+M9Gv/OKrYg==
Date: Mon, 16 May 2022 10:14:03 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220516101403.5faff0e2@bootlin.com>
In-Reply-To: <16915492-655d-8a28-1eb3-a0dfdf119713@gmail.com>
References: <20220513202855.752024-1-fontaine.fabrice@gmail.com>
 <16915492-655d-8a28-1eb3-a0dfdf119713@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/alchemy: add host-pkgconf
 dependency
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAxNCBNYXkgMjAyMiAxNzoxNzoxMiArMDIwMApSb21haW4gTmFvdXIgPHJvbWFpbi5u
YW91ckBnbWFpbC5jb20+IHdyb3RlOgoKPiBIZWxsbyBGYWJyaWNlLAo+IAo+IExlIDEzLzA1LzIw
MjIgw6AgMjI6MjgsIEZhYnJpY2UgRm9udGFpbmUgYSDDqWNyaXTCoDoKPiA+IGhvc3QtcGtnY29u
ZiBpcyBhIG1hbmRhdG9yeSBkZXBlbmRlbmN5IHNpbmNlIHRoZSBhZGRpdGlvbiBvZiB0aGUgcGFj
a2FnZQo+ID4gaW4gY29tbWl0IDdmMWYzZjg3ODY4ZmEzMzM4MzNkYmJhOWY0ZjA3YWRjMzM4YjM0
ZWQgcmVzdWx0aW5nIGluIHRoZQo+ID4gZm9sbG93aW5nIHVsb2cgYnVpbGQgZmFpbHVyZToKPiA+
IAo+ID4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9ydW4vaW5zdGFuY2UtMC9vdXRwdXQtMS9w
ZXItcGFja2FnZS91bG9nL2hvc3Qvb3B0L2FsY2hlbXkvY2hlY2subWs6MzY6ICoqKiAncGtnLWNv
bmZpZycgaXMgcmVxdWlyZWQuICBTdG9wLgo+ID4gCj4gPiBBbiBvdGhlciBvcHRpb24gd291bGQg
YmUgdG8gc2V0IFRBUkdFVF9PUyB0byBiYXJlbWV0YWwgYnV0IGl0IGNvdWxkIGhhdmUKPiA+IHVu
ZXhwZWN0ZWQgc2lkZS1lZmZlY3RzIHN1Y2ggYXMgcmVtb3ZpbmcgLWZQSUMgZm9yIGFybSB0YXJn
ZXRzCj4gPiAKPiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvYzczMWZlMGU5YmRiZmNlMDgyM2Y5YzQ4NjQxZjFlZDcxMGZhNjEyNSAgCj4gCj4g
QWxzbyBmaXhlczoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzI0MjkwMTM1NTUKPiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+ICAKPiAKPiBSZXZpZXdlZC1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IAo+IEJlc3QgcmVnYXJkcywKPiBS
b21haW4KClJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNv
bT4KClRoYW5rcywKSGVydsOpCgotLSAKSGVydsOpIENvZGluYSwgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
