Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647E0C77B7A
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 06:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00208417C5;
	Mon, 29 May 2023 06:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00208417C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLdkKpZDBTug; Mon, 29 May 2023 06:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32F45417BB;
	Mon, 29 May 2023 06:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F45417BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93AA81BF831
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 06:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DBD9812A9
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 06:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DBD9812A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9oRBvcWcwWu for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 06:58:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3447A8127F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3447A8127F
 for <buildroot@buildroot.org>; Mon, 29 May 2023 06:58:32 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BC0C1C0009;
 Mon, 29 May 2023 06:58:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q3Wpo-008YiH-CU; Mon, 29 May 2023 08:58:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230518102222.11946-1-ps.report@gmx.net>
Date: Mon, 29 May 2023 08:58:28 +0200
In-Reply-To: <20230518102222.11946-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 18 May 2023 12:22:22 +0200")
Message-ID: <87y1l7sjxn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/llvm: add upstream patch to fix
 host compile (missing include in Signals.h)
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyaXRl
czoKCiA+IEFkZCB1cHN0cmVhbSBwYXRjaCB0byBmaXggaG9zdCBjb21waWxlIGVycm9yIG9uIG9w
ZW5TVVNFIFR1bWJsZXdlZWQKID4gKGdjYy0xMy4wLjEpLgoKID4gRml4ZXM6CgogPiAgIC4uLi9i
dWlsZC9ob3N0LWxsdm0tMTEuMS4wL2luY2x1ZGUvbGx2bS9TdXBwb3J0L1NpZ25hbHMuaDoxMTc6
ODogZXJyb3I6IHZhcmlhYmxlIG9yIGZpZWxkIOKAmENsZWFudXBPblNpZ25hbOKAmSBkZWNsYXJl
ZCB2b2lkCiA+ICAgICAxMTcgfCAgIHZvaWQgQ2xlYW51cE9uU2lnbmFsKHVpbnRwdHJfdCBDb250
ZXh0KTsKID4gICAgICAgICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn4KID4gICAuLi4vYnVpbGQv
aG9zdC1sbHZtLTExLjEuMC9pbmNsdWRlL2xsdm0vU3VwcG9ydC9TaWduYWxzLmg6MTE3OjI0OiBl
cnJvcjog4oCYdWludHB0cl904oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZQogPiAg
ICAgMTE3IHwgICB2b2lkIENsZWFudXBPblNpZ25hbCh1aW50cHRyX3QgQ29udGV4dCk7CiA+ICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgogPiAgIC4uLi9idWlsZC9o
b3N0LWxsdm0tMTEuMS4wL2luY2x1ZGUvbGx2bS9TdXBwb3J0L1NpZ25hbHMuaDoxODoxOiBub3Rl
OiDigJh1aW50cHRyX3TigJkgaXMgZGVmaW5lZCBpbiBoZWFkZXIg4oCYPGNzdGRpbnQ+4oCZOyBk
aWQgeW91IGZvcmdldCB0byDigJgjaW5jbHVkZSA8Y3N0ZGludD7igJk/CiA+ICAgICAgMTcgfCAj
aW5jbHVkZSA8c3RyaW5nPgogPiAgICAgKysrIHwrI2luY2x1ZGUgPGNzdGRpbnQ+CiA+ICAgICAg
MTggfAoKID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0
PgoKQ29tbWl0dGVkIHRvIDIwMjMuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
