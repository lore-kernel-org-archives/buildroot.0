Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91441C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 16:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38811402C4;
	Fri, 31 May 2024 16:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShY3B4wl4EDk; Fri, 31 May 2024 16:53:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1608140237
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1608140237;
	Fri, 31 May 2024 16:53:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9704D1D54F9
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 16:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 829364021B
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 16:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q77fqGytwOaY for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 16:53:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 150F5401F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 150F5401F9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 150F5401F9
 for <buildroot@buildroot.org>; Fri, 31 May 2024 16:53:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF55040006;
 Fri, 31 May 2024 16:53:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sD5VQ-00FDIa-2E;
 Fri, 31 May 2024 18:53:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot <buildroot@buildroot.org>
References: <20240418085858.126825-1-alexis.lothore@bootlin.com>
Date: Fri, 31 May 2024 18:53:28 +0200
In-Reply-To: <20240418085858.126825-1-alexis.lothore@bootlin.com> ("Alexis
 =?utf-8?Q?Lothor=C3=A9?= via buildroot"'s message of "Thu, 18 Apr 2024
 10:58:58 +0200")
Message-ID: <877cf9ncs7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pppd: bump package to fix
 startup issue
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFsZXhpcyIgPT0gQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBwcHBkIGZhaWxzIHRvIHN0YXJ0IG9uIGEgc3lz
dGVtcyB3aXRoIGJ1aWxkcm9vdCAyMDI0LjAyLnggYmVjYXVzZSBvZgogPiBtaXNzaW5nIHBwcGQg
ZGlyZWN0b3J5IGluIC92YXIvcnVuLiBUaGVyZSBhcmUgc29tZSBsb2dzIGhpbnRpbmcgYXQgdGhp
cwogPiBpc3N1ZToKID4gV2FybmluZzogY291bGRuJ3Qgb3BlbiBwcHAgZGF0YWJhc2UgL3Zhci9y
dW4vcHBwZC9wcHBkMi50ZGIKID4gQ2FuJ3QgY3JlYXRlIGxvY2sgZmlsZSAvdmFyL3J1bi9wcHBk
L2xvY2svTENLLi5wcHAtdHR5LWZpZm8xOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiA+IENh
bid0IGNyZWF0ZSBsb2NrIGZpbGUgL3Zhci9ydW4vcHBwZC9sb2NrL0xDSy4ucHBwLXR0eS1maWZv
MTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogPiBDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92
YXIvcnVuL3BwcGQvbG9jay9MQ0suLnBwcC10dHktZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKID4gQ2FuJ3QgY3JlYXRlIGxvY2sgZmlsZSAvdmFyL3J1bi9wcHBkL2xvY2svTENLLi5w
cHAtdHR5LWZpZm8xOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiA+IENhbid0IGNyZWF0ZSBs
b2NrIGZpbGUgL3Zhci9ydW4vcHBwZC9sb2NrL0xDSy4ucHBwLXR0eS1maWZvMTogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQogPiBDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92YXIvcnVuL3BwcGQv
bG9jay9MQ0suLnBwcC10dHktZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKID4gQ2Fu
J3QgY3JlYXRlIGxvY2sgZmlsZSAvdmFyL3J1bi9wcHBkL2xvY2svTENLLi5wcHAtdHR5LWZpZm8x
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CgogPiBUaGUgaXNzdWUgaGFzIGFscmVhZHkgYmVl
biBkZXRlY3RlZCBhbmQgZml4ZWQgdXBzdHJlYW0gKHNlZSBbMV0pIGFuZCBpcwogPiBleHBlY3Rl
ZCB0byBiZSByZWxlYXNlZCBvbiBhIHYyLjUuMSwgYnV0IHRoaXMgcmVsZWFzZSBzZWVtcyB0byBi
ZSBzdGFsbGVkCiA+IGZvciBub3cgKHNlZSBbMl0pLiBCdW1wIG9uIGN1cnJlbnQgbWFzdGVyLCB3
aGljaCBjdXJyZW50bHkgcmVmbGVjdHMgd2hhdAogPiB3aWxsIGxpa2VseSBiZSB0aGUgMi41LjEu
CgogPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3BwcC1wcm9qZWN0L3BwcC9pc3N1ZXMvNDE5CiA+
IFsyXSBodHRwczovL2dpdGh1Yi5jb20vcHBwLXByb2plY3QvcHBwL2lzc3Vlcy80NjAKCiA+IFNp
Z25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
CiA+IC0tLQogPiBDaGFuZ2VzIGluIHYzOgogPiAtIGJ1bXAgcGFja2FnZSBpbnN0ZWFkIG9mIGJh
Y2twb3J0aW5nIHBhdGNoZXMsIGJhc2VkIG9uIEJlcm5kIEt1aGxzJwogPiAgIHN1Z2dlc3Rpb24K
ID4gLSByZW1vdmUgcGF0Y2hlcyB0aGF0IGFyZSBub3cgaW50ZWdyYXRlZCBpbiBuZXcgdmVyc2lv
bgoKQ29tbWl0dGVkIHRvIDIwMjQuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
