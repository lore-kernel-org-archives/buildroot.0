Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360B5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 19:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A45FE60BD8;
	Sun, 20 Feb 2022 19:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fpBYs5HIYHhm; Sun, 20 Feb 2022 19:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD11A60BB1;
	Sun, 20 Feb 2022 19:35:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBAFE1BF476
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C97F64031C
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNBtz7SGrNqP for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 19:35:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79BA240187
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 19:35:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E370B60007;
 Sun, 20 Feb 2022 19:35:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nLrzt-000xM6-2Q; Sun, 20 Feb 2022 20:35:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>, james.hilliard1@gmail.com
References: <20220220170222.06d88b45@windsurf>
 <842a7d9b-e991-149e-c6a6-9a36b29e9ff3@gmail.com>
Date: Sun, 20 Feb 2022 20:35:52 +0100
In-Reply-To: <842a7d9b-e991-149e-c6a6-9a36b29e9ff3@gmail.com> (Romain Naour's
 message of "Sun, 20 Feb 2022 17:25:04 +0100")
Message-ID: <87wnhp9vqf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Analysis of runtime test failures
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBIZWxsbyBUaG9tYXMsCiA+IExlIDIwLzAyLzIwMjIgw6AgMTc6MDIsIFRob21h
cyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgogPj4gSGVsbG8sCiA+PiAKID4+
IFNpeCBvZiBvdXIgcnVudGltZSB0ZXN0cyBhcmUgZmFpbGluZywgc28gSSB3ZW50IGFoZWFkIGFu
ZCBxdWlja2x5IGxvb2sKID4+IGF0IHRoZSBlcnJvciBtZXNzYWdlcy4gSGVyZSBpcyBteSBzdW1t
YXJ5OgogPj4gCiA+PiA9PT0gdGVzdHMucGFja2FnZS50ZXN0X2lweXRob24uVGVzdElQeXRob25Q
eTMgPT09CiA+PiAKID4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2pvYnMvMjA4ODY4NDA5MQogPj4gCiA+PiBFcnJvciBpczoKID4+IAogPj4gIyBpcHl0aG9u
IC1jICdpbXBvcnQgbWF0aDsgbWF0aC5mbG9vcigxMi4zKScKID4+IC1zaDogaXB5dGhvbjogbm90
IGZvdW5kCgogPiBpcHl0aG9uIHVzZSBhIHdyb25nIHNoZWJhbmcgb24gdGhlIHRhcmdldDoKCiA+
ICMgaGVhZCAtbiAxIC91c3IvYmluL2lweXRob24KID4gIyEvaG9tZS9rdWJ1L2J1aWxkcm9vdC90
ZXN0c3VpdGUtbWFzdGVyL1Rlc3RJUHl0aG9uUHkzL2hvc3QvYmluL3B5dGhvbgoKID4gVGhlIGlz
c3VlIGNvbWUgZnJvbSBweXRob24zLXNldHVwdG9vbHMgNjAuMC4wIHRoYXQgY2hhbmdlZAogPiBT
RVRVUFRPT0xTX1VTRV9ESVNUVVRJTFMgWzFdLiBUaGlzIGlzIGFjdHVhbGx5IGEgImJyZWFraW5n
IiBjaGFuZ2UgWzJdLgoKID4gV2UgaGF2ZSB0byBvdmVycmlkZSBTRVRVUFRPT0xTX1VTRV9ESVNU
VVRJTFMgdG8gdGhlIHByZXZpb3VzIHZhbHVlICJzdGRsaWIiIHRvCiA+IGZpeGVzIHRoZSBpc3N1
ZS4KCiA+IFsxXQogPiBodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL2NvbW1pdC9i
NmZjYmJkMDBjYjZkNTYwN2M5MjcyZGVjNDUyYTUwNDU3YmRiMjkyCiA+IFsyXSBodHRwczovL2dp
dGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL2Jsb2IvdjYwLjAuMC9DSEFOR0VTLnJzdCNicmVha2lu
Zy1jaGFuZ2VzCgpUaGlzIGlzIHRoZW4gcHJlc3VtYWJseSBzb21ldGhpbmcgd2Ugd2FudCB0byBk
byBnbG9iYWxseSB0aGVuPyBKYW1lcywKd2hhdCBkbyB5b3Ugc2F5PwoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
