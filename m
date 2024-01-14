Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19988C47DA7
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACCA9418DE;
	Sun, 14 Jan 2024 12:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACCA9418DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZDuerVRTLA6; Sun, 14 Jan 2024 12:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 103A3418D2;
	Sun, 14 Jan 2024 12:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 103A3418D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DE4B1BF59E
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66AFB418D2
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66AFB418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 103N-ems43H6 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 12:40:46 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BC19418D0
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 12:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BC19418D0
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cd1232a2c7so94867621fa.0
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 04:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705236044; x=1705840844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBS0x3qz6pLyWDnfiYZXJKA65fC7C0tzt9mK5GoZyss=;
 b=J8+THRBvBwsvNVRpg4zye8Kbc12RKKrlYJPCG3Vb/nayxxQuV/bQLl3vNGlBKV85EA
 60mxoyTEOloawJ3WNoOIuw4SqyhJO726/Ez6rbHsD3+gMQaNZ0A1G6ruvHvu7xQGhoUV
 YzrWybszDWTBSuKVeKSpWAyS4U/4eH2DDPl2DrAqp9WJNGwcjjj1ojy5wpL4J45LJc7n
 UghJhfDDd/KyTfGkGvmOCun8LcujRrETKlxkpEOYbPLm8hIYLyb2p3yv83avtLUsBp4D
 LfwCh+aJa7AbvWEJ5AOJKK9LJ4ZJnTzwdKl8Ji07JBBVDBTLLk2F7NMU0UdXxB0xc97W
 79qQ==
X-Gm-Message-State: AOJu0Ywyu84Pa1HH3QUlalCGUxDuUxQdZz64OZwqpiJL58S2Q2GyU0dX
 sK4GIhJm8Aaad1Q8oQlu06jT81tc5H33O7KY84Eylv6O
X-Google-Smtp-Source: AGHT+IFJhzSXQaf3dzEeTx498QV4oV8+zPstxfJ80EhQIVOEXxCGE4CsYhNa0md5eMx05VdIYtfHV5S0DrOg5QdT0k8=
X-Received: by 2002:a2e:870d:0:b0:2cd:1c0c:99 with SMTP id
 m13-20020a2e870d000000b002cd1c0c0099mr1724880lji.74.1705236044030; 
 Sun, 14 Jan 2024 04:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20240106095524.0610E81D7B@busybox.osuosl.org>
 <87ply5wtzf.fsf@48ers.dk>
 <20240113184532.3d393158@windsurf> <877ckdt3bm.fsf@48ers.dk>
In-Reply-To: <877ckdt3bm.fsf@48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jan 2024 13:40:32 +0100
Message-ID: <CAPi7W82nTEgz_G4BB-=gm6-sFA+LPBWbz-2eCFCZ=Z0Yeb_TNQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705236044; x=1705840844; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBS0x3qz6pLyWDnfiYZXJKA65fC7C0tzt9mK5GoZyss=;
 b=mmrk8hR31S6kBL11hvgl+mRTCRc8+H9wv6LKjguo1v3yiADEryAjITGisbubXgKsod
 XL/TK7cFVnjdtK5cfouXBmJQfv+sBO4G4U7lwgYfFRGxzpLG23JbNPZ0BZaZpSY3ytNr
 cTqIiVysyPvPIrBvRkjGKkS0VP85Weshabo4zFNIEa/zX38Y7LSG81UOlwLVzrvvkQx7
 Gugp9NlWnLyHf3Akypf4y2Jf1VoYgIYBCgwauarrdZGrguMV5CGMmD4Ks/rPPPnDRxcq
 losA+yeC4iScTajjJoHr3cvDOQOwX9TszJReeUO0KZvoY3JqRJ3RFHW423LxVjr115z/
 C6oA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mmrk8hR3
Subject: Re: [Buildroot] [git commit] package/avahi: fix libavahi-client
 handling
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
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSBzYW0uIDEzIGphbnYuIDIwMjQgw6AgMjA6NTYsIFBldGVyIEtvcnNnYWFyZCA8
cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIlRob21hcyIgPT0gVGhv
bWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JpdGVzOgo+Cj4g
ID4gSGVsbG8gUGV0ZXIsCj4gID4gT24gU2F0LCAxMyBKYW4gMjAyNCAwODo1MjoyMCArMDEwMAo+
ICA+IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4KPiAgPj4g
RG9lcyB0aGlzIGNoYW5nZSByZWFsbHkgbWFrZSBzZW5zZSBpbiB0aGUgY29udGV4dCBvZiBCdWls
ZHJvb3Q/IExpYmF2YWhpCj4gID4+IGlzIGEgbGlicmFyeSB0byB0YWxrIHRvIHRoZSBhdmFoaSBk
YWVtb24sIHNvIG5vdCB2ZXJ5IHVzZWZ1bCB3aXRob3V0IHRoZQo+ICA+PiBkYWVtb24uCj4KPiAg
PiBUcnVlLiBUbyBiZSBob25lc3QsIEkgZGlkbid0IHB1dCB0b28gbXVjaCB0aGlua2luZyB3aGVu
IGFwcGx5aW5nCj4gID4gRmFicmljZSdzIHBhdGNoOiB0aGUgZGFlbW9uIHdhcyBub3Qgc3RyaWN0
bHkgbmVlZGVkIHdoZW4gYnVpbGRpbmcgdGhlCj4gID4gbGlicmFyeSwgZHJvcHBpbmcgdGhlIGRl
cGVuZGVuY3kgbWFkZSBzZW5zZSwgc28gSSBhcHBsaWVkLiBJZiB0aGVyZSBpcwo+ICA+IGEgcnVu
dGltZSBkZXBlbmRlbmN5IG9uIHRoZSBkYWVtb24sIHRoZW4gaW5kZWVkIG1heWJlIHdlIHNob3Vs
ZCBrZWVwCj4gID4gdGhlIGRlcGVuZGVuY3kuIE5vIHN0cm9uZyBmZWVsaW5nIGFib3V0IGl0LCBh
bmQgSSBjZXJ0YWlubHkgd291bGRuJ3QKPiAgPiBmZWVsIG9mZmVuZGVkIGlmIHRoZSBjb21taXQg
d2FzIHJldmVydGVkLgo+Cj4gSXQgaXMgYXQgbGVhc3QgbXkgdW5kZXJzdGFuZGluZyB0aGF0IGxp
YmF2YWhpIGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlCj4gd2l0aG91dCB0aGUgZGFlbW9uLCB1bmxl
c3MgSSBhbSBtaXNzaW5nIHNvbWV0aGluZy4gRmFicmljZT8KCk9uIGRlYmlhbiwgbGliYXZhaGkt
Y2xpZW50MyBkZXBlbmRzIG9uIGxpYmF2YWhpLWNvbW1vbjMgYW5kIGxpYmRidXMuClRoZXJlIGlz
IG5vIGRlcGVuZGVuY3kgb24gYXZhaGktZGFlbW9uLgpIb3dldmVyLCBpbiB0aGUgY29udGV4dCBv
ZiBidWlsZHJvb3QgcGVyaGFwcyB0aGlzIGRvZXNuJ3QgbWFrZSBhIGxvdCBvZiBzZW5zZS4KCj4K
PiAtLQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
