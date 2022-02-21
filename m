Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244E3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 23:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6D88408A0;
	Mon, 21 Feb 2022 23:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuIjl7wJZz1a; Mon, 21 Feb 2022 23:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F344A4020E;
	Mon, 21 Feb 2022 23:09:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2BC1BF368
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 23:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72A1D400E3
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 23:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CcObaBDcLZ3g for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 23:09:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CC36400D6
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 23:09:31 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso8468192otp.0
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 15:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zLHRrWzYrCw4LJGOXp67M5XTDw6vMj4KexecCJrzm64=;
 b=H844l9Z7RTeMhEwp5Z9tEYYkhrC/K2nmn3rospkJEwE7j70Sqw4ntMqhYLxDeHneCa
 Ejk/WGOyR/cvizl+7AfPEsISc8AjYnAjhv3DuxtuyxlVeKfkbj/mIqVxaquBtMH4UGmi
 FhKRLjMJjHLLwyUkGCrUkSrcgjtJhTkepzJroe2gK0EVLn1+fgnYl6MIZU3KdH0PQp1K
 KNzU/oKPed1Pk/DHxqSyn0xytNONKmy0BVemgwvghgI3ZvsiozUXBZpSHETGeRoIl4Z5
 Gz+N57UAmZUdshvbl3CJYJOrfKoHTc5Nt2zMc0ZG/6Bw12Vu5trJl8bt4vWpemW+E44K
 tSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zLHRrWzYrCw4LJGOXp67M5XTDw6vMj4KexecCJrzm64=;
 b=A6Jg6vYbaFOH4lzauAAGSG/fZIaiSF5BYYrz6PVqWoxOKKAH8TRgVOyInRWeCcBh4a
 a6BYtrVcYJLQGlZuOKbXP6MeZ9sCswuNLddtsoX1nXzyI63nkz99a8CXZqQ5dWnbTOna
 H/Srq8nK2wEmNFUSwsq+J49Yqpptyms61/YVVcHXRPxwyD6N2eIAB78kA8x7xnmBXRAf
 z35wHisZx9ZXmMZ6stU3VX0u+iLSyAxGDv/Pv4hvPUzC8kDqvf/m+1r3w4/cNL2EZtdV
 pFif20FhtvGSKK4JSuMMacHeeILVbiv6uTF4FchVscf3fSERsaRob+vxPvrtwleIcL6L
 hS5w==
X-Gm-Message-State: AOAM532zfEYucHQdtfDWVooG7FMbLy8PxIf9LPdZAOMlZI0t931d9yE0
 uzRujupu55Zf0hcjRnWuUuxdMvffGxvI869/co/fLYCuEr4=
X-Google-Smtp-Source: ABdhPJz4LoGw+tnUBRbGAwFbM/HuFywlRIKd6cxEwZ48MBd9+98hGok46MLfCoAy2sRjeUOGOnijd8mWRXUctFFjxrY=
X-Received: by 2002:a05:6830:2a05:b0:5af:1417:1218 with SMTP id
 y5-20020a0568302a0500b005af14171218mr3554501otu.237.1645484970107; Mon, 21
 Feb 2022 15:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20220218105557.705926-1-fontaine.fabrice@gmail.com>
 <87fsod9szu.fsf@dell.be.48ers.dk>
 <150ef1b3-4d5e-37b3-881c-9a15e95a456b@gmail.com>
In-Reply-To: <150ef1b3-4d5e-37b3-881c-9a15e95a456b@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 22 Feb 2022 00:09:23 +0100
Message-ID: <CAPi7W81s0yjLtWuPrjsbXp1vBCfgLb7V5HJLg6_9k25KPXMtCQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: security bump
 to version 22.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbHVuLiAyMSBmw6l2ci4gMjAyMiDDoCAyMzozOCwgUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBMZSAyMC8wMi8yMDIyIMOgIDIxOjM1LCBQZXRl
ciBLb3JzZ2FhcmQgYSDDqWNyaXQgOgo+ID4+Pj4+PiAiRmFicmljZSIgPT0gRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyaXRlczoKPiA+Cj4gPiAgPiBGaXgg
Q1ZFLTIwMjItMjE3MTI6IHR3aXN0ZWQgaXMgYW4gZXZlbnQtZHJpdmVuIG5ldHdvcmtpbmcgZW5n
aW5lIHdyaXR0ZW4KPiA+ICA+IGluIFB5dGhvbi4gSW4gYWZmZWN0ZWQgdmVyc2lvbnMgdHdpc3Rl
ZCBleHBvc2VzIGNvb2tpZXMgYW5kCj4gPiAgPiBhdXRob3JpemF0aW9uIGhlYWRlcnMgd2hlbiBm
b2xsb3dpbmcgY3Jvc3Mtb3JpZ2luIHJlZGlyZWN0cy4gVGhpcyBpc3N1ZQo+ID4gID4gaXMgcHJl
c2VudCBpbiB0aGUgYHR3aXRlZC53ZWIuUmVkaXJlY3RBZ2VudGAgYW5kIGB0d2lzdGVkLndlYi4K
PiA+ICA+IEJyb3dzZXJMaWtlUmVkaXJlY3RBZ2VudGAgZnVuY3Rpb25zLiBVc2VycyBhcmUgYWR2
aXNlZCB0byB1cGdyYWRlLiBUaGVyZQo+ID4gID4gYXJlIG5vIGtub3duIHdvcmthcm91bmRzLgo+
ID4KPiA+ICA+IFVwZGF0ZSBoYXNoIG9mIGxpY2Vuc2UgZmlsZSAoYXV0aG9yIGFkZGVkIGFuZCB1
cGRhdGUgaW4geWVhcjoKPiA+ICA+IGh0dHBzOi8vZ2l0aHViLmNvbS90d2lzdGVkL3R3aXN0ZWQv
Y29tbWl0LzEzYWE1OTc0NmE3Mzc2OWIwNWE1MWMyMTk4YjI4ZjU2MDJkZDM4MmYKPiA+ICA+IGh0
dHBzOi8vZ2l0aHViLmNvbS90d2lzdGVkL3R3aXN0ZWQvY29tbWl0L2FkZmRmMjM0NzdhYmZjZDA5
YTg2NzM0Nzk5M2ZjMWQyMDdjZmI0ZGQKPiA+ICA+IGh0dHBzOi8vZ2l0aHViLmNvbS90d2lzdGVk
L3R3aXN0ZWQvY29tbWl0LzdlNjVmYmVlZDNkNzRhNGViMWM0MGQ3YTZkZjU2NTE3ODJiZWNiYzgp
Cj4gPgo+ID4gID4gaHR0cHM6Ly9naXRodWIuY29tL3R3aXN0ZWQvdHdpc3RlZC9zZWN1cml0eS9h
ZHZpc29yaWVzL0dIU0EtOTJ4Mi1qdzd3LXh2dngKPiA+ICA+IGh0dHBzOi8vZ2l0aHViLmNvbS90
d2lzdGVkL3R3aXN0ZWQvcmVsZWFzZXMvdGFnL3R3aXN0ZWQtMjIuMS4wCj4gPgo+ID4gID4gU2ln
bmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+
Cj4gPgo+ID4gQ29tbWl0dGVkLCB0aGFua3MuCj4gPgo+Cj4gSSdtIG5vdCBmYW1pbGlhciB3aXRo
IHB5dGhvbi10d2lzdGVkIGJ1dCBpdCBzZWVtcyB0aGF0IHB5dGhvbi10d2lzdGVkIGFuZAo+IHB5
dGhvbi10cmVxIG11c3QgdXNlIHRoZSBzYW1lIHZlcnNpb24gYmVjYXVzZSBpdHMgdGhlIHNhbWUg
cHJvamVjdDoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90d2lzdGVkL3R3aXN0ZWQKPiBodHRwczov
L2dpdGh1Yi5jb20vdHdpc3RlZC90cmVxCj4KPiBXZSBoYXZlIHRvIHVwZGF0ZSBweXRob24tdHJl
cSB0byB2ZXJzaW9uIDIyLjIuMCBbMV0gb3RoZXJ3aXNlIHdlIGhhdmUgYSBydW50aW1lCj4gaXNz
dWU6Cj4KPiAjIHB5dGhvbiBzYW1wbGVfcHl0aG9uX3RyZXEucHkKPiBUcmFjZWJhY2sgKG1vc3Qg
cmVjZW50IGNhbGwgbGFzdCk6Cj4gICBGaWxlICIvcm9vdC9zYW1wbGVfcHl0aG9uX3RyZXEucHki
LCBsaW5lIDIsIGluIDxtb2R1bGU+Cj4gICAgIGltcG9ydCB0cmVxCj4gICBGaWxlICIvdXNyL2xp
Yi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvdHJlcS9fX2luaXRfXy5weSIsIGxpbmUgNSwgaW4g
PG1vZHVsZT4KPiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTAvc2l0ZS1wYWNrYWdlcy90cmVx
L2FwaS5weSIsIGxpbmUgNSwgaW4gPG1vZHVsZT4KPiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMu
MTAvc2l0ZS1wYWNrYWdlcy90cmVxL2NsaWVudC5weSIsIGxpbmUgMTEsIGluIDxtb2R1bGU+Cj4g
SW1wb3J0RXJyb3I6IGNhbm5vdCBpbXBvcnQgbmFtZSAnX1BZMycgZnJvbSAndHdpc3RlZC5weXRo
b24uY29tcGF0JyAodW5rbm93bgo+IGxvY2F0aW9uKQo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL3R3
aXN0ZWQvdHJlcS9yZWxlYXNlcy90YWcvcmVsZWFzZS0yMi4yLjAKClRoYW5rcyBmb3Igc3BvdHRp
bmcgdGhpcyBpc3N1ZSwgSSBzZW50IGEgcGF0Y2ggc2VyaWUuCgo+Cj4gQmVzdCByZWdhcmRzLAo+
IFJvbWFpbgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
