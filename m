Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24B8CCD19A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 08:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3790960F3D;
	Tue, 18 Nov 2025 08:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGwvbQMIS7JK; Tue, 18 Nov 2025 08:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8831560ED0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8831560ED0;
	Tue, 18 Nov 2025 08:27:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2248AD5
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 08:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1358460ED0
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 08:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrnfZ4FBy98d for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 08:27:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.245;
 helo=send150.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 436D460C20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 436D460C20
Received: from send150.i.mail.ru (send150.i.mail.ru [89.221.237.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 436D460C20
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 08:27:34 +0000 (UTC)
Received: by exim-smtp-88cf54d45-gsnvq with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vLH3i-00000000HxC-0kaV; Tue, 18 Nov 2025 11:27:31 +0300
Message-ID: <a93aa370-e834-4794-aeca-2617d2fd7b07@inbox.ru>
Date: Tue, 18 Nov 2025 11:27:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251117214234.1115937-1-bernd@kuhls.net>
 <20251117214234.1115937-2-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20251117214234.1115937-2-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9231027FDF5B453B6ADE574348A0B1155E9BE37A219EEDD49182A05F5380850401D3B314739FAAD3A3DE06ABAFEAF67057EAB6491FA2577C6D482F3FA1DE25EBF95CF0873FBAAF994
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78E88BD1CA827EF00C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7DBA72CFE7C57007CEA1F7E6F0F101C67CDEEF6D7F21E0D1D9295C2E9FA3191EE1B59CA4C82EFA658CC8E425EDAE55C9DBB22F9947019DC91B39BA1BEEF5BD78E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7E4DF6D1C10F22F599FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86DF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B7F48962964D238D0A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A550BCB205A990E1705002B1117B3ED6965B4FE8DB2EB1A5545B6221DB6D7A72AD823CB91A9FED034534781492E4B8EEADB05233B9BC4759D3
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF54E4A6BE8C70A03C5E1FF67CA340F995A20D4141F25344598CB36990F2C636D2A08A323FE4E4FE84DD6EA89E5C47541B9B24C0CD526E4ADB27745E85C28135A8B4D7F58B0BA12D9F42BF32D1DA1046D202C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVfFX+FmbwDW1yUNEY3UinrU=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD256AF64C5D129606CF38150BC292EC440F1062BA5BBE8FB1A90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=ad/bFTtzdTAq383lTZ4Y2M0GZW0rhIqL97zG0KChdd8=; t=1763454455; x=1763544455; 
 b=UZujrEBcL2/i6l7S7JRykD5sq5EpNGzXwhrKQRFA+A1qTbDPYjFRgQGsI+SYnyAK0lPTvBLLFl3
 o8Y4Wl0unCyWjrKm1PGRZQYOyke4AuRrKjXDW+u2nvz9oKnF6EscZB1fZ7/LFglZsmT8VzTpwsW37
 Ln9fR9Y+69H/lBkGMzRQ4/ZoUD2vm8JamxUQSs0rlNVoIrkgbzqWUPS1+0J1pCtDWKWxKJnIQbKrT
 1oK+qinMq7tSlFuf8gVzFtGpo0jzJeIyMmhGwRiPgtz/U9a7AUiWDdEr0RzfAwXC88hfuWx31bW+3
 2PooSLtiTB6arL4Vny0hj7g7uU8XyaqhZPDg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=UZujrEBc
X-Mailman-Original-Authentication-Results: exim-smtp-88cf54d45-gsnvq; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 2/2] package/postgresql: bump version to 18.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Nathaniel Roach <nroach44@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MTguMTEuMjAyNSAwMDo0MiwgQmVybmQgS3VobHMg0L/QuNGI0LXRgjoKPiBSZWxlYXNlIG5vdGVz
Ogo+IGh0dHBzOi8vd3d3LnBvc3RncmVzcWwub3JnL2RvY3MvcmVsZWFzZS8xOC4wLwo+IGh0dHBz
Oi8vd3d3LnBvc3RncmVzcWwub3JnL2RvY3MvcmVsZWFzZS8xOC4xLwo+IAo+IFBsZWFzZSBub3Rl
IHRoYXQgdXBncmFkaW5nIGEgUG9zdGdyZVNRTCBzZXJ2ZXIgdG8gYSBuZXdlciBtYWpvciB2ZXJz
aW9uCj4gcmVxdWlyZXMgYSBtYW51YWwgdXBncmFkZSBub3QgcHJvdmlkZWQgYnkgYnVpbGRyb290
Ogo+IGh0dHBzOi8vd3d3LnBvc3RncmVzcWwub3JnL2RvY3MvMTgvdXBncmFkaW5nLmh0bWwKPiAK
PiBSZW1vdmVkIGNvbmZpZ3VyZSBvcHRpb25zIGZvciBzcGlubG9ja3M6Cj4gaHR0cHM6Ly9naXQu
cG9zdGdyZXNxbC5vcmcvZ2l0d2ViLz9wPXBvc3RncmVzcWwuZ2l0O2E9Y29tbWl0O2g9ZTI1NjI2
Njc3ZjgwNzZlYjNjZTk0NTg2MTM2YzU0NjRlZTE1NDM4MQo+IAo+IFVwc3RyZWFtIHJlbW92ZWQg
c3VwcG9ydCBmb3IgdG9vbGNoYWlucyBub3QgcHJvdmlkaW5nIGF0b21pY3Mgc3VwcG9ydDoKPiBo
dHRwczovL2dpdC5wb3N0Z3Jlc3FsLm9yZy9naXR3ZWIvP3A9cG9zdGdyZXNxbC5naXQ7YT1jb21t
aXQ7aD04MTM4NTI2MTM2Mjk2MmRlYjk4NjFiMzliNTA5YWVmZmUyMTM3MjFkCgpkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fSEFTX0FUT01JQyA/Cgo+IAo+IEFkZGVkIGRlcGVuZGVuY3kgdG8gIUJS
Ml9zcGFyYyB0byBkaXNhYmxlIGJ1aWxkIHdpdGggZGVmY29uZmlnCj4gYm9vdGxpbi1zcGFyYy11
Y2xpYmMgdG8gZml4IGEgYnVpbGQgZXJyb3I6Cj4gCj4gLi4vc3JjL2luY2x1ZGUvcG9ydC9hdG9t
aWNzLmg6OTk6MjogZXJyb3I6Cj4gICAjZXJyb3IgImNvdWxkIG5vdCBmaW5kIGFuIGltcGxlbWVu
dGF0aW9uIG9mIHBnX2F0b21pY191aW50MzIiCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3Vo
bHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0KPiAgIHBhY2thZ2UvYmFuZHdpZHRoZC9Db25maWcu
aW4gICAgICAgfCAzICsrKwo+ICAgcGFja2FnZS9jb2xsZWN0ZC9Db25maWcuaW4gICAgICAgICB8
IDIgKysKPiAgIHBhY2thZ2UvbGlnaHR0cGQvQ29uZmlnLmluICAgICAgICAgfCAyICsrCj4gICBw
YWNrYWdlL3BocC9Db25maWcuZXh0ICAgICAgICAgICAgIHwgMiArKwo+ICAgcGFja2FnZS9wb2Nv
L0NvbmZpZy5pbiAgICAgICAgICAgICB8IDEgKwo+ICAgcGFja2FnZS9wb3N0Z3Jlc3FsL0NvbmZp
Zy5pbiAgICAgICB8IDIgKysKPiAgIHBhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLmhhc2gg
fCA0ICsrLS0KPiAgIHBhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLm1rICAgfCA4ICstLS0t
LS0tCj4gICBwYWNrYWdlL3B5dGhvbi1wc3ljb3BnMi9Db25maWcuaW4gIHwgMiArKwo+ICAgcGFj
a2FnZS9xdDUvcXQ1YmFzZS9Db25maWcuaW4gICAgICB8IDIgKysKPiAgIHBhY2thZ2UvcXQ2L3F0
NmJhc2UvQ29uZmlnLmluICAgICAgfCAyICsrCj4gICBwYWNrYWdlL3phYmJpeC9Db25maWcuaW4g
ICAgICAgICAgIHwgMSArCj4gICAxMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2JhbmR3aWR0aGQvQ29uZmln
LmluIGIvcGFja2FnZS9iYW5kd2lkdGhkL0NvbmZpZy5pbgo+IGluZGV4IGIwNDg1ZWY5NTcuLjVj
MmU1MDc3MzcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9iYW5kd2lkdGhkL0NvbmZpZy5pbgo+ICsr
KyBiL3BhY2thZ2UvYmFuZHdpZHRoZC9Db25maWcuaW4KPiBAQCAtMzUsNiArMzUsNyBAQCBpZiBC
UjJfUEFDS0FHRV9CQU5EV0lEVEhECj4gICBjb25maWcgQlIyX1BBQ0tBR0VfQkFORFdJRFRIRF9Q
T1NUR1JFU1FMCj4gICAJYm9vbCAiZW5hYmxlIHBvc3RncmVzcWwgbG9nIHRhcmdldCBzdXBwb3J0
Igo+ICAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBwb3N0Z3Jlc3FsCj4gKwlkZXBlbmRzIG9u
ICFCUjJfc3BhcmMgIyBwb3N0Z3Jlc3FsCm1heWJlIHVzZSBkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fSEFTX0FUT01JQyBpbnN0ZWFkPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
