Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D101C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AFFB81BC2;
	Sun, 19 Mar 2023 16:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AFFB81BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTesVOIMKHPB; Sun, 19 Mar 2023 16:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5305781A64;
	Sun, 19 Mar 2023 16:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5305781A64
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2EEC1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CF30402E4
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CF30402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9iCvGBPyY2H for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:22:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D4BA400A6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D4BA400A6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:22:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 11097240003;
 Sun, 19 Mar 2023 16:22:49 +0000 (UTC)
Date: Sun, 19 Mar 2023 17:22:49 +0100
To: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>
Message-ID: <20230319172249.30ef4733@windsurf>
In-Reply-To: <20230316123653.3648067-2-martin@geanix.com>
References: <20230316123653.3648067-1-martin@geanix.com>
 <20230316123653.3648067-2-martin@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679242970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5U+GuivlFkuKYtAgFsxEeJAZ0T1EbE1Zu055iUjwOMY=;
 b=A9boHvIIOeLiJ4CpSyOkBMQN8TIjGtVu3ZlMvCSObUpAuZf+4tdr6qLWtdO38c8RfDgtQ9
 PTcz4TXlWMngQPKW2OzforTq4Th7dslFiZ+WL8RsR6SwyRsvboxD1aGd+6xAOySN/mJH5H
 XYIGU3iIZG9/rsznn/8CsyWLecj+aVfn0spevaVQ3/K1AdwMyxPJ9VYjMaqamnCBmApDq0
 ixuNmdLSjsJ3eUtm3Bsm+1cfHqMxgUzMtawM/aTbJbJX33Nd5ef2wfvtJY5C8UfyemL5tc
 ylIHnv4t71d2tsuKcHgjywG3fCG8movUf7xCOySSpdS0rMR7j66zhsko4r1S+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A9boHvII
Subject: Re: [Buildroot] [PATCH 2/2] python-marshmallow-sqlalchemy: bump to
 version 0.29.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxNiBNYXIgMjAyMyAxMzozNjo1MyArMDEwMApNYXJ0aW4gSHVuZGViw7hsbCA8bWFy
dGluQGdlYW5peC5jb20+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hs
bCA8bWFydGluQGdlYW5peC5jb20+Cj4gLS0tCj4gIC4uLi9weXRob24tbWFyc2htYWxsb3ctc3Fs
YWxjaGVteS5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgLi4uL3B5dGhv
bi1tYXJzaG1hbGxvdy1zcWxhbGNoZW15Lm1rICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQg
KystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
