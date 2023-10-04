Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD67E7B614
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 13:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A696058D;
	Wed,  4 Oct 2023 13:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2A696058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfjNK4xR4GYy; Wed,  4 Oct 2023 13:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F19AB60AD0;
	Wed,  4 Oct 2023 13:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F19AB60AD0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1351BF2BC
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5077D820C7
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5077D820C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nX7y_P0reQi5 for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 13:13:14 +0000 (UTC)
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 932DF82033
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 13:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 932DF82033
ARC-Seal: i=1; a=rsa-sha256; t=1696425190; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VDLd++d8uVDTjHvXf9HZiz8DSLy8Q0EE3lEvpQtlbn8V+AAhCq4hZsi/PgxXP/DACToYa3OmHE60S3pzxaqLK+XZo0dvfTRpMWCG8ajHtdpSGmCHIkiq06FKpF6exQikqnxsUjIMxOM4ZttJc/s+bbWz3tkxqxjkZnyVTpU3eYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696425190;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MiYrv7zKSRSBpKVutXJ8mX303vUDVQ9En8514EW/3eI=; 
 b=LzyBE3ASubbI5PScSNYCyVYDuh//qxVGuqZDLyi5M7mO4RniTcGWbRpLBlBo7aLUi41z8Ns5jMtp0r3kc6ERAaSur52u/HcaV1Qa1u3TzjSBS0jz05Q83fOtWVrhOugIcS2B0n3XwrLlqy5onU83Xd43GIToo/NVUtmTvuJVrRA=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1696425188754527.0224870852974;
 Wed, 4 Oct 2023 06:13:08 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Message-ID: <20231004131256.2113233-1-enki@fsck.pl>
Date: Wed,  4 Oct 2023 15:12:52 +0200
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003094612.62025-2-enki@fsck.pl>
References: <20231003094612.62025-2-enki@fsck.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1696425190; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MiYrv7zKSRSBpKVutXJ8mX303vUDVQ9En8514EW/3eI=;
 b=dpq4XBzra4dCpHsdd3W+Eh/VaNRhUlxGkqyJUIK2CfHM8azt8X0R6rUx5ZbBNq/d
 LReXdL1pgRCnpGeZtU/EEcfhDeB+Dwx7szDDHmHopHtIXiTmDLy5sE1zHfF/IcPDCTc
 vbPTfYJgHGRjoZk6/hGNq1uAk2Zr8LKngNbJFDHU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=dpq4XBzr
Subject: [Buildroot] [PATCH v2 0/3] Support for D-Link DNS-320L
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
Cc: Maciej Grela <enki@fsck.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIGlzIGEgc2hvcnQgcGF0Y2hzZXQgdG8gc3VwcG9ydCBhIEQtTGluayBETlMt
MzIwTCBOQVMuClRoZXJlIGFyZSB0d28gZGV2aWNlLXNwZWNpZmljIHBhY2thZ2VzIHdoaWNoIGFy
ZSByZXF1aXJlZCBmb3IgcHJvcGVyCnN5c3RlbSBtYW5hZ2VtZW50IG9uIHRoZSBkZXZpY2UgYXMg
d2VsbCBhcyBhIG91dC1vZi10cmVlIERUUy4KSSBhbSBnb2luZyB0byBzZW5kIGl0IHVwc3RyZWFt
IHdoZW4gSSBsZWFybiBtb3JlIGFib3V0IGRldmljZSB0cmVlcy4KSSBoYXZlIGFkZGVkIG15c2Vs
ZiBhcyBhIG1haW50YWluZXIgdG8gdGhlIERFVkVMT1BFUlMgZmlsZSBmb3IgYWxsCnJlbGV2YW50
IHBhcnRzLgoKVGhlIHBhY2thZ2VzIGhhdmUgYmVlbiBjaGVja2VkIHdpdGggbm8gaXNzdWVzIGRl
dGVjdGVkOgoK4p6cICBidWlsZHJvb3QgZ2l0OihtYXN0ZXIpIOKclyB1dGlscy9kb2NrZXItcnVu
IG1ha2UgY2hlY2stcGFja2FnZQozODkyNzEgbGluZXMgcHJvY2Vzc2VkCjAgd2FybmluZ3MgZ2Vu
ZXJhdGVkCgpBbiBleGFtcGxlIGJvb3QgbG9nIGlzIHByZXNlbnRlZCBiZWxvdzoKaHR0cHM6Ly9n
aXN0LmdpdGh1Yi5jb20vZW5raXVzei80ODJmYWI2OGVmN2E2MzBjOGNmYWFkNmYxM2Y2MzkxOQoK
VGhlIHBhY2thZ2VzIGJ1aWxkIHN1Y2Nlc3NmdWxseSB1c2luZyB0ZXN0LXBrZzoKCuKenCAgYnVp
bGRyb290IGdpdDoobWFzdGVyKSDinJcgY2F0IGluaXBhcnNlci5jb25maWcKQlIyX1BBQ0tBR0Vf
SU5JUEFSU0VSPXkK4p6cICBidWlsZHJvb3QgZ2l0OihtYXN0ZXIpIOKclyB1dGlscy90ZXN0LXBr
ZyAtLWNvbmZpZyBpbmlwYXJzZXIuY29uZmlnIC1wIGluaXBhcnNlcgogICAgICAgICAgICAgICAg
ICAgIGJvb3RsaW4tYXJtdjUtdWNsaWJjIFsxLzZdOiBPSwogICAgICAgICAgICAgICAgICAgICBi
b290bGluLWFybXY3LWdsaWJjIFsyLzZdOiBPSwogICAgICAgICAgICAgICAgICAgYm9vdGxpbi1h
cm12N20tdWNsaWJjIFszLzZdOiBPSwogICAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02
NC1tdXNsIFs0LzZdOiBPSwogICAgICAgICAgICAgICAgICAgICAgYnItYXJtLWZ1bGwtc3RhdGlj
IFs1LzZdOiBPSwogICAgICAgICAgICAgICAgICAgICAgICAgICAgc291cmNlcnktYXJtIFs2LzZd
OiBPSwo2IGJ1aWxkcywgMCBza2lwcGVkLCAwIGJ1aWxkIGZhaWxlZCwgMCBsZWdhbC1pbmZvIGZh
aWxlZCwgMCBzaG93LWluZm8gZmFpbGVkCuKenCAgYnVpbGRyb290IGdpdDoobWFzdGVyKSDinJcK
CuKenCAgYnVpbGRyb290IGdpdDoobWFzdGVyKSDinJcgY2F0IGRuczMyMGwtZGFlbW9uLmNvbmZp
ZwpCUjJfUEFDS0FHRV9ETlMzMjBMX0RBRU1PTj15CuKenCAgYnVpbGRyb290IGdpdDoobWFzdGVy
KSDinJcgdXRpbHMvdGVzdC1wa2cgLS1jb25maWcgZG5zMzIwbC1kYWVtb24uY29uZmlnIC1wIGRu
czMyMGwtZGFlbW9uCiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12NS11Y2xpYmMgWzEv
Nl06IE9LCiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIvNl06IE9L
CiAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06IFNLSVBQRUQK
ICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYtNjQtbXVzbCBbNC82XTogT0sKICAgICAg
ICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbNS82XTogT0sKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNvdXJjZXJ5LWFybSBbNi82XTogT0sKNiBidWlsZHMsIDEgc2tpcHBl
ZCwgMCBidWlsZCBmYWlsZWQsIDAgbGVnYWwtaW5mbyBmYWlsZWQsIDAgc2hvdy1pbmZvIGZhaWxl
ZArinpwgIGJ1aWxkcm9vdCBnaXQ6KG1hc3Rlcikg4pyXCgotLS0KY2hhbmdlcyB2MSAtPiB2MjoK
LSBkb24ndCBidWlsZCBpbmlwYXJzZXIgb24gdGhlIGhvc3QKLSBwcm9wZXJseSBoYW5kbGUgYnVp
bGRpbmcgc3RhdGljIGFuZCBzaGFyZWQgaW5pcGFyc2VyIGluIGFsbCBjb21ib3MKLSBkaXNhYmxl
IGRuczMyMGwtZGFlbW9uIG9uIHBsYXRmb3JtcyB3aXRob3V0IGZvcmsoKQotIEROUy0zMjBMIGlz
IG1hbnVmYWN0dXJlZCBieSBELUxpbmsgbm90IE5ldGdlYXIsIGNoYW5nZSBjb21taXQgc3VtbWFy
aWVzIHRvIHJlZmxlY3QgdGhhdAoKTWFjaWVqIEdyZWxhICgzKToKICBwYWNrYWdlL2luaXBhcnNl
cjogbmV3IHBhY2thZ2UKICBwYWNrYWdlL2RuczMyMGwtZGFlbW9uOiBuZXcgcGFja2FnZQogIGJv
YXJkL2QtbGluay9kbnMzMjBsOiBuZXcgYm9hcmQKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogYm9hcmQvZC1saW5rL2RuczMyMGwvZHRzL2tp
cmt3b29kLWRuczMyMGwuZHRzIHwgMjE4ICsrKysrKysrKysrKysrKysrKwogY29uZmlncy9kbnMz
MjBsX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgIDE2ICsrCiBwYWNrYWdlL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogcGFja2FnZS9kbnMzMjBs
LWRhZW1vbi9Db25maWcuaW4gICAgICAgICAgICAgIHwgICA4ICsKIHBhY2thZ2UvZG5zMzIwbC1k
YWVtb24vUzUwZG5zMzIwbC1kYWVtb24gICAgICB8ICAzNyArKysKIHBhY2thZ2UvZG5zMzIwbC1k
YWVtb24vZG5zMzIwbC1kYWVtb24uaGFzaCAgICB8ICAgMSArCiBwYWNrYWdlL2RuczMyMGwtZGFl
bW9uL2RuczMyMGwtZGFlbW9uLm1rICAgICAgfCAgMzEgKysrCiBwYWNrYWdlL2luaXBhcnNlci9D
b25maWcuaW4gICAgICAgICAgICAgICAgICAgfCAgIDYgKwogcGFja2FnZS9pbmlwYXJzZXIvaW5p
cGFyc2VyLmhhc2ggICAgICAgICAgICAgIHwgICAyICsKIHBhY2thZ2UvaW5pcGFyc2VyL2luaXBh
cnNlci5tayAgICAgICAgICAgICAgICB8ICA1NiArKysrKwogMTEgZmlsZXMgY2hhbmdlZCwgMzgz
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9kLWxpbmsvZG5zMzIwbC9k
dHMva2lya3dvb2QtZG5zMzIwbC5kdHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2RuczMy
MGxfZGVmY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9kbnMzMjBsLWRhZW1vbi9D
b25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2RuczMyMGwtZGFlbW9uL1M1MGRu
czMyMGwtZGFlbW9uCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9kbnMzMjBsLWRhZW1vbi9k
bnMzMjBsLWRhZW1vbi5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9kbnMzMjBsLWRh
ZW1vbi9kbnMzMjBsLWRhZW1vbi5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaW5pcGFy
c2VyL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaW5pcGFyc2VyL2luaXBh
cnNlci5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9pbmlwYXJzZXIvaW5pcGFyc2Vy
Lm1rCgotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
