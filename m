Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5455C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 11:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B11F82134;
	Sun, 23 Apr 2023 11:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B11F82134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFLUwiCkICFC; Sun, 23 Apr 2023 11:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA1618212F;
	Sun, 23 Apr 2023 11:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA1618212F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF0D91BF859
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98CEA8212F
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98CEA8212F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5p8RdlQT6Zok for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 11:06:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91CC481275
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91CC481275
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 11:06:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C3BA0B00571;
 Sun, 23 Apr 2023 13:05:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 13:05:55 +0200
Date: Sun, 23 Apr 2023 13:05:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230423110555.GE2696@scaer>
References: <SN4P221MB06822B245A5155FE545F0362A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB06822B245A5155FE545F0362A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682247958;
 bh=7I2EkioiKZiOY+vpZXXGKLZiqbu6uXlcMDalS6yBhIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GlP8zM8bimshHarkhEiaYRsEEMny/Q//Vsx0yUf0aAyc3dfkbllGIs5pD1NyI6Juz
 Qzq71sZRMgko0t3k2nQVt9u9yyoiNDW4MYlq6P98rMw3xqAa9BrYgc5bym7ZH6CfoV
 qgsz0MZwhpmNpIbwGoIZt0BA3wqdw0Z8jjiPiwBGMAsh+TL7zA5j6pWMhUN4QqnMDN
 9p9LwkQ62YTRfiBaPuzcvbeTuEgTT+VHniy7nKATgegzI7kgu5NYiNkVOzPDdxTzg8
 Gb77e+iTk2ova/Xl3lYl7L2gAKm066EWDYNayX+fCd3YdUWg/rmdi+VrvgS8Q579lb
 gV4gbWP+YV/jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GlP8zM8b
Subject: Re: [Buildroot] [PATCH 1/4] package/libglib2: bump version to 2.76.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMDQtMjEgMTA6MTIgLTA0MDAsIEphbWVzIEtuaWdodCBzcGFr
ZSB0aHVzbHk6Cj4gLSBnbGliMiBoYXMgbW92ZWQgZnJvbSBQQ1JFIHRvIFBDUkUyIFsxXS4KPiAt
IERyb3AgYGZhbWAgb3B0aW9uIHNpbmNlIGl0IG5vIGxvbmdlciBhdmFpbGFibGUgWzJdLgo+IC0g
RHJvcCAiMDAwMS1maXgtY29tcGlsZS10aW1lLWF0b21pYy1kZXRlY3Rpb24ucGF0Y2giIHNpbmNl
IHVwc3RyZWFtCj4gICAgcGF0Y2ggd2FzIGRyb3BwZWQgYW5kIG5ldyBhdG9taWMgZGV0ZWN0aW9u
IGltcGxlbWVudGF0aW9uIGhhcyBiZWVuCj4gICAgYXBwbGllZCBpbiB0aGlzIHZlcnNpb24uCj4g
LSBEcm9wICIwMDAyLXJlbW92ZS1jcHAtcmVxdWlyZW1lbnQucGF0Y2giIHNpbmNlIHVwc3RyZWFt
IGhhcyBtb2RpZmllZAo+ICAgIGl0cyBNZXNvbiBzY3JpcHRzIHRvIGhhdmUgYW55IEMrKyB1c2Fn
ZSBhcyBvcHRpb25hbC4KPiAtIERyb3AgIjAwMDMtQWRkLVduby1mb3JtYXQtbm9ubGl0ZXJhbC10
by1jb21waWxlci1hcmd1bWVudHMucGF0Y2giCj4gICAgc2luY2UgY2hhbmdlIGlzIGF2YWlsYWJs
ZSBpbiB0aGlzIHZlcnNpb24uCj4gLSBBZGQgbmV3IHBhdGNoIHRvIGFkZHJlc3MgbmV3IFdlcnJv
ciBjb21waWxhdGlvbiBlcnJvcnMgWzNdLgo+IC0gUmVuYW1lZCAiMDAwNC0qLnBhdGNoIiAtPiAi
MDAwMS0qLnBhdGNoIiBzaW5jZSBpdCBzaG91bGQgc3RpbGwgYmUKPiAgICBhcHBsaWNhYmxlIGZv
ciBpdHMgbWVudGlvbmVkIGJ1aWxkIGNhc2UuCj4gCj4gWzFdOiBodHRwczovL2J1Z3ppbGxhLnJl
ZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE5Mzg5NzQKPiBbMl06IGh0dHBzOi8vZ2l0bGFiLmdu
b21lLm9yZy9HTk9NRS9nbGliLy0vbWVyZ2VfcmVxdWVzdHMvMjU3MAo+IFszXTogaHR0cHM6Ly9n
aXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9tZXJnZV9yZXF1ZXN0cy8zMzkwCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFtZXMgS25pZ2h0IDxqYW1lcy5kLmtuaWdodEBsaXZlLmNvbT4KPiAtLS0K
Wy0tU05JUC0tXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdsaWIyLzAwMDItRml4LWVycm9y
LWZvcm1hdC1pbi1naW8tZ3VuaXhjb25uZWN0aW9uLmMtcGFydC0yLnBhdGNoIGIvcGFja2FnZS9s
aWJnbGliMi8wMDAyLUZpeC1lcnJvci1mb3JtYXQtaW4tZ2lvLWd1bml4Y29ubmVjdGlvbi5jLXBh
cnQtMi5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMDQ3ZWVkY2ZhNWFhMmUyYWNkN2QyOGJlZTY5YzJj
NzhhNzJlZWNkOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xpYmdsaWIyLzAwMDIt
Rml4LWVycm9yLWZvcm1hdC1pbi1naW8tZ3VuaXhjb25uZWN0aW9uLmMtcGFydC0yLnBhdGNoCj4g
QEAgLTAsMCArMSw5MyBAQAo+ICtGcm9tIDRhZTg2MDZiNmY4MGY5NzY0ZTFmMGE4MmNlYTdlMjNj
OGFmNDg3YWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEphbWVzIEtuaWdodCA8
amFtZXMuZC5rbmlnaHRAbGl2ZS5jb20+Cj4gK0RhdGU6IFRodSwgMjAgQXByIDIwMjMgMjM6NDE6
MzIgLTA0MDAKPiArU3ViamVjdDogW1BBVENIXSBGaXggZXJyb3IgZm9ybWF0IGluIGdpby9ndW5p
eGNvbm5lY3Rpb24uYyAocGFydCAyKQo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGlu
ZzogOGJpdAo+ICsKPiArVXBkYXRlIGEgc2VyaWVzIG9mIGVycm9yIG1lc3NhZ2VzIHRvIHVzZSBg
Z19zZXRfZXJyb3JfbGl0ZXJhbGAgaW5zdGVhZAo+ICtvZiBgZ19zZXRfZXJyb3JgLiBUaGlzIHNo
b3VsZCBwcmV2ZW50IGBmb3JtYXQtbm9ubGl0ZXJhbGAgY29tcGlsZXIKPiAraXNzdWVzIHdoZW4g
YC1XZXJyb3JgIGlzIGNvbmZpZ3VyZWQ6Cj4gKwo+ICsgICAgLi4vZ2lvL2d1bml4Y29ubmVjdGlv
bi5jOiBJbiBmdW5jdGlvbiDigJhnX3VuaXhfY29ubmVjdGlvbl9yZWNlaXZlX2Zk4oCZOgo+ICsg
ICAgLi4vZ2lvL2d1bml4Y29ubmVjdGlvbi5jOjE4Mzo5OiBlcnJvcjogZm9ybWF0IG5vdCBhIHN0
cmluZyBsaXRlcmFsLCBhcmd1bWVudCB0eXBlcyBub3QgY2hlY2tlZCBbLVdlcnJvcj1mb3JtYXQt
bm9ubGl0ZXJhbF0KPiArICAgICAgMTgzIHwgICAgICAgICBuc2NtKTsKPiArICAgICAgICAgIHwg
ICAgICAgICBefn5+Cj4gKyAgICAuLi9naW8vZ3VuaXhjb25uZWN0aW9uLmM6MjE3OjIwOiBlcnJv
cjogZm9ybWF0IG5vdCBhIHN0cmluZyBsaXRlcmFsLCBhcmd1bWVudCB0eXBlcyBub3QgY2hlY2tl
ZCBbLVdlcnJvcj1mb3JtYXQtbm9ubGl0ZXJhbF0KPiArICAgICAgMjE3IHwgICAgICAgICAgICAg
ICAgICAgIG5mZCk7Cj4gKyAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICBefn4KPiArICAg
IC4uL2dpby9ndW5peGNvbm5lY3Rpb24uYzogSW4gZnVuY3Rpb24g4oCYZ191bml4X2Nvbm5lY3Rp
b25fcmVjZWl2ZV9jcmVkZW50aWFsc+KAmToKPiArICAgIC4uL2dpby9ndW5peGNvbm5lY3Rpb24u
Yzo2MDE6MjQ6IGVycm9yOiBmb3JtYXQgbm90IGEgc3RyaW5nIGxpdGVyYWwsIGFyZ3VtZW50IHR5
cGVzIG5vdCBjaGVja2VkIFstV2Vycm9yPWZvcm1hdC1ub25saXRlcmFsXQo+ICsgICAgICA2MDEg
fCAgICAgICAgICAgICAgICAgICAgICAgIG5zY20pOwo+ICsgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn4KPiArCj4gK1RoaXMgaXMgc2ltaWxhciB0byBhIHByZXZpb3VzIGNo
YW5nZSBbMV0gbWFkZSB0byBgZ3VuaXhjb25uZWN0aW9uLmNgLgo+ICsKPiArWzFdOiA0NGIzZDVk
ODA0NDUyMzQwNDFmNmM1OWZlYjg5NjQ1ZjcxMDJjM2E0Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBK
YW1lcyBLbmlnaHQgPGphbWVzLmQua25pZ2h0QGxpdmUuY29tPgo+ICtVcHN0cmVhbTogaHR0cHM6
Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9tZXJnZV9yZXF1ZXN0cy8zMzkwCgpUaGlz
IGhhcyBub3cgYmVlbiBhY2NlcHRlZCwgc28gSSB1cGRhdGVkIHRvIHRoZSBhY3R1YWwgY29tbWl0
IFVSTC4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklO
LgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
