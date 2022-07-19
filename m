Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1862C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51DAB40C83;
	Tue, 19 Jul 2022 15:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51DAB40C83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12kqctO1Ptbq; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AE3640C74;
	Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AE3640C74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4E3B1BF951
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDF77813E4
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF77813E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErufpquVVx6E for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:12:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3ED4826BB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3ED4826BB
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:12:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E0F321BF211;
 Tue, 19 Jul 2022 15:12:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oDotu-002qTo-Q9; Tue, 19 Jul 2022 17:12:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
References: <20220617141202.2260-1-nicolas.cavallari@green-communications.fr>
Date: Tue, 19 Jul 2022 17:12:42 +0200
In-Reply-To: <20220617141202.2260-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Fri, 17 Jun 2022 16:12:02 +0200")
Message-ID: <878rop3zmd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: fix GNUism in
 S05avahi-setup.sh
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

Pj4+Pj4gIk5pY29sYXMiID09IE5pY29sYXMgQ2F2YWxsYXJpIDxuaWNvbGFzLmNhdmFsbGFyaUBn
cmVlbi1jb21tdW5pY2F0aW9ucy5mcj4gd3JpdGVzOgoKID4gVGhpcyBzY3JpcHQgdXNlcyAiY2hv
d24gdXNlci5ncm91cCIgaW5zdGVhZCBvZiB0aGUgUE9TSVggImNob3duCiA+IHVzZXI6Z3JvdXAi
LiAgVGhlIGZpcnN0IHN5bnRheCBpcyBhIGRlcHJlY2F0ZWQgR05VIGV4dGVuc2lvbi4KID4gU2lu
Y2UgY29yZXV0aWxzIDkuMSwgY2hvd24gc3RhcnRlZCBpc3N1aW5nIGEgd2FybmluZyB3aGVuIHRo
aXMgc3ludGF4IGlzCiA+IHVzZWTCuS4KCiA+IFRoZSByZXN1bHQgaXMgdGhhdCBpZiBib3RoIGF2
YWhpIGFuZCBjb3JldXRpbHMgYXJlIGVuYWJsZWQsIHRoaXMgbWVzc2FnZQogPiBhcHBlYXJzIGR1
cmluZyBib290OgoKID4gY2hvd246IHdhcm5pbmc6ICcuJyBzaG91bGQgYmUgJzonOiAnYXZhaGku
YXZhaGknCgogPiBbMV0KID4gaHR0cHM6Ly9naXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L2dudWxp
Yi5naXQvY29tbWl0L2xpYi91c2Vyc3BlYy5jP2lkPTIzY2NhODI2OGQyMWY1ZDU4ZWQwMjA5MDAy
ZDU2NzNkMDUxOGM0MjYKCiA+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMgQ2F2YWxsYXJpIDxuaWNv
bGFzLmNhdmFsbGFyaUBncmVlbi1jb21tdW5pY2F0aW9ucy5mcj4KCkNvbW1pdHRlZCB0byAyMDIy
LjA1LnggYW5kIDIwMjIuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
