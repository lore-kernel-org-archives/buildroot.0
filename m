Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1102E81DFF
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 14:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C278174C;
	Fri,  6 Oct 2023 14:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62C278174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhxSoIiDIbEf; Fri,  6 Oct 2023 14:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AE181765;
	Fri,  6 Oct 2023 14:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0AE181765
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED41E1BF34F
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 14:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C36988174C
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 14:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C36988174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mTCtiCE40dS for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 14:05:35 +0000 (UTC)
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20B9E81570
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 14:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20B9E81570
ARC-Seal: i=1; a=rsa-sha256; t=1696601130; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iDvz6gvTrMjj1UULAtsAiIetNiZQcCKF6e4mX5Vs12WG4JXZRu4Omk1ZdiFFOnUWuvbkaw+1WOgWJ00chFQpQn3DRjHn+ygiDg8xwiZJn2C7k2myCCAXpqyB9N30lZbr6r+I8E3RyZ3mmnfhjM1eqE/by44zAOxZvpnXvZmq9Y8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696601130;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=DM9ixt3C6Efe5A95/IxxgCNTXLPzdkQGRRi4AEfClLc=; 
 b=RxUYlgxE5jE3gqttYtf7SRERPIJA2GD584+augJY3qPqdHzwJSMPyMcNHknai31cZr3vW0y1iH8YC6ALbOCZ2sXeUYfQPeJBHOVEzlmm5OgZ64+gjxxuyh1k+6zyxASzMg4zVZRccYBZt5OZVnjSKX4dTzDeWQsspVjpoXELUiA=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1696601127223253.36128356706377;
 Fri, 6 Oct 2023 07:05:27 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Message-ID: <20231006140511.3840643-1-enki@fsck.pl>
Date: Fri,  6 Oct 2023 16:05:08 +0200
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004131256.2113233-2-enki@fsck.pl>
References: <20231004131256.2113233-2-enki@fsck.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1696601130; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=DM9ixt3C6Efe5A95/IxxgCNTXLPzdkQGRRi4AEfClLc=;
 b=YGIVKTC27Yl8j47U1s2K1FsHi0ibAo9sb/M7yK6tNf6WSTw7F6QUU2cM7h7PplM2
 lq4X1/5USNk8GIQuVf9DV44xUUr0V5GPSX32gkFpADZ2IFgw+NtAKUP6DrmGvXSq7oq
 dM9RVese1r998UINdatYzlqpUGDT2t12/ZtW5mu4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=YGIVKTC2
Subject: [Buildroot] [PATCH v3 0/3] Support for D-Link DNS-320L
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
aWVzIHRvIHJlZmxlY3QgdGhhdAoKY2hhbmdlcyB2MiAtPiB2MzoKLSB1c2UgU0lHVEVSTSB0byBy
ZXN0YXJ0IGRuczMyMGwtZGFlbW9uIG5vdCB0byB0cmlnZ2VyIGEgZGV2aWNlIHBvd2Vyb2ZmIHdo
ZW4gdGhlIGRhZW1vbiBpcyByZXN0YXJ0ZWQKLSBhZGQgYSBzcGVjaWFsICdwb3dlcm9mZicgdmVy
YiB0byB0aGUgZG5zMzIwbC1kYWVtb24gaW5pdCBzY3JpcHQgdG8gdHJpZ2dlciBkZXZpY2UgcG93
ZXJvZmYKLSBwYXRjaCB0aGUgZGVmYXVsdCBkbnMzMjBsLWRhZW1vbiBjb25maWd1cmF0aW9uIHRv
IGxpc3RlbiBvbiBsb2NhbGhvc3Qgb25seSAKCk1hY2llaiBHcmVsYSAoMyk6CiAgcGFja2FnZS9p
bmlwYXJzZXI6IG5ldyBwYWNrYWdlCiAgcGFja2FnZS9kbnMzMjBsLWRhZW1vbjogbmV3IHBhY2th
Z2UKICBib2FyZC9kLWxpbmsvZG5zMzIwbDogbmV3IGJvYXJkCgogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIGJvYXJkL2QtbGluay9kbnMzMjBs
L2R0cy9raXJrd29vZC1kbnMzMjBsLmR0cyB8IDIxOCArKysrKysrKysrKysrKysrKysKIGNvbmZp
Z3MvZG5zMzIwbF9kZWZjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAxNiArKwogcGFja2Fn
ZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIC4uLi8wMDAx
LWxpc3Rlbi1vbi1sb2NhbGhvc3QucGF0Y2ggICAgICAgICAgICB8ICAyMSArKwogcGFja2FnZS9k
bnMzMjBsLWRhZW1vbi9Db25maWcuaW4gICAgICAgICAgICAgIHwgICA4ICsKIHBhY2thZ2UvZG5z
MzIwbC1kYWVtb24vUzUwZG5zMzIwbC1kYWVtb24gICAgICB8ICA0MiArKysrCiBwYWNrYWdlL2Ru
czMyMGwtZGFlbW9uL2RuczMyMGwtZGFlbW9uLmhhc2ggICAgfCAgIDEgKwogcGFja2FnZS9kbnMz
MjBsLWRhZW1vbi9kbnMzMjBsLWRhZW1vbi5tayAgICAgIHwgIDMyICsrKwogcGFja2FnZS9pbmlw
YXJzZXIvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIHBhY2thZ2UvaW5pcGFy
c2VyL2luaXBhcnNlci5oYXNoICAgICAgICAgICAgICB8ICAgMiArCiBwYWNrYWdlL2luaXBhcnNl
ci9pbmlwYXJzZXIubWsgICAgICAgICAgICAgICAgfCAgNTYgKysrKysKIDEyIGZpbGVzIGNoYW5n
ZWQsIDQxMCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvZC1saW5rL2Ru
czMyMGwvZHRzL2tpcmt3b29kLWRuczMyMGwuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmln
cy9kbnMzMjBsX2RlZmNvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZG5zMzIwbC1k
YWVtb24vMDAwMS1saXN0ZW4tb24tbG9jYWxob3N0LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9kbnMzMjBsLWRhZW1vbi9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2RuczMyMGwtZGFlbW9uL1M1MGRuczMyMGwtZGFlbW9uCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9kbnMzMjBsLWRhZW1vbi9kbnMzMjBsLWRhZW1vbi5oYXNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9kbnMzMjBsLWRhZW1vbi9kbnMzMjBsLWRhZW1vbi5tawogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvaW5pcGFyc2VyL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvaW5pcGFyc2VyL2luaXBhcnNlci5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9pbmlwYXJzZXIvaW5pcGFyc2VyLm1rCgotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
