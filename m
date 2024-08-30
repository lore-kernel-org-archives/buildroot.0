Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F15CA0FF6
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 14:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FFFC8149B;
	Fri, 30 Aug 2024 14:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0cLRe4em6Pl; Fri, 30 Aug 2024 14:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD3CF81EB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD3CF81EB0;
	Fri, 30 Aug 2024 14:02:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF29D1BF5B3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 14:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD049611A1
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 14:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVkxgnvDQW1R for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 14:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F25216061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F25216061D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F25216061D
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 14:02:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2397E000D;
 Fri, 30 Aug 2024 14:02:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sk2DB-008Y3h-21;
 Fri, 30 Aug 2024 16:02:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
References: <20240722093710.1903540-1-vincent.stehle@arm.com>
Date: Fri, 30 Aug 2024 16:02:49 +0200
In-Reply-To: <20240722093710.1903540-1-vincent.stehle@arm.com> ("Vincent
 =?utf-8?Q?Stehl=C3=A9=22's?= message of "Mon, 22 Jul 2024 11:37:10 +0200")
Message-ID: <87o75a152u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/qemu_arm_ebbr: linux needs
 host-openssl
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNv
bT4gd3JpdGVzOgoKID4gVGhlIGtlcm5lbCBidWlsZCBuZWVkcyBob3N0LW9wZW5zc2w7IGFkZCBp
dCB0byB0aGUgY29uZmlndXJhdGlvbi4KID4gSW4gcHJhY3RpY2UgdGhlIGRvY3VtZW50ZWQgYnVp
bGQgcmVjaXBlIHdvcmtzIGZpbmUgYW5kIHRoZSBidWlsZCBmYWlsdXJlcwogPiBjYW4gb25seSBi
ZSBzZWVuIHdpdGggaGlnaGx5IHBhcmFsbGVsIGJ1aWxkcyB1c2luZyBwZXItcGFja2FnZSBkaXJl
Y3Rvcmllcy4KCiA+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBjb21waWxhdGlvbiBlcnJvcjoK
CiA+ICAgY2VydHMvZXh0cmFjdC1jZXJ0LmM6MjE6MTA6IGZhdGFsIGVycm9yOiBvcGVuc3NsL2Jp
by5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CgogPiBGaXhlczogNzExNWFiMzkxODlhNmM2
NjA3NDUyNjdkOGJmMGJmNDFjZjhiM2RiNwoKQXJlIHlvdSBzdXJlPyBJc24ndCBpdCBmcm9tIHRo
ZSBidW1wIHRvIDYuNi4zMiBpbiBjb21taXQgZDAzN2Q5YzJkNjNlOWMKKGNvbmZpZ3MvcWVtdTog
VXBkYXRlIGRlZmNvbmZpZ3MgdG8gTGludXggNi42LjMyKT8KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
