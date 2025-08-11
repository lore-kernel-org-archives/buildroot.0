Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE0CA0EC1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 09:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF65E6125E;
	Mon, 11 Aug 2025 09:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00sxas_sKWrF; Mon, 11 Aug 2025 09:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDA1861288
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDA1861288;
	Mon, 11 Aug 2025 09:28:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D457138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE5BC4124F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGXpDNsUYuuz for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 09:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0F8D4124B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0F8D4124B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0F8D4124B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:28:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 738322885; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Aug 2025 09:28:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulOp5-00836J-06;
 Mon, 11 Aug 2025 11:28:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  linux-amarula@amarulasolutions.com,  Julien
 Olivain <ju.o@free.fr>
References: <20250810204742.20942-1-dario.binacchi@amarulasolutions.com>
Date: Mon, 11 Aug 2025 11:28:06 +0200
In-Reply-To: <20250810204742.20942-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sun, 10 Aug 2025 22:47:42 +0200")
Message-ID: <87bjomnr6h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Bjzj+F4/VEeRHu0vgysaa39zAQvP9sN7VeKdqdJOYLkdyt/v1EvilBlgcRiQbCtWd8a1exUNtteJ5Ws3D+crMuhXv9XwqJ0EZy+QVWcycFlXdjy04QHuCQJRYMMmlh6WT8QSMzl2EhcIywMazZsnZVnKhOUesdifCcCtnPEzfPMAbDY5rXsyqQxJdAmx1mhJC7l/ItaMa3AdxzOcfmAjwBOQ0ql6akRuwm2EE60ShTGivD4tI56KKbToe89/HF0wF9ADviijWCYM+wOVsLRUozxl5A1K4TvzpoZX0BjCPgLj2F4WVOxg7wQayYclVsL1vr0MpWg1L0Q0NvpLMMNB7Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=gggfzCdhkzwYD6nBPa1WHah1Ng2pX0e3mNeuznScUaw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Bjzj+F4/
Subject: Re: [Buildroot] [PATCH v2] package/ufs-utils: fix hash file
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkRhcmlvIiA9PSBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+IHdyaXRlczoKCiA+IEZpeCB0aGUgZm9sbG93aW5nIGVycm9yOgogPiB3Z2V0
IC1uZCAtdCAzIC0tY29ubmVjdC10aW1lb3V0PTEwIC1PCiA+ICcvaG9tZS9kYXJpby9wcm9qZWN0
cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy51ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3ouNjhKMVdK
L291dHB1dCcKID4gJ2h0dHBzOi8vZ2l0aHViLmNvbS9TYW5EaXNrLU9wZW4tU291cmNlL3Vmcy11
dGlscy9hcmNoaXZlL3Y3LjE0LjEyL3Vmcy11dGlscy03LjE0LjEyLnRhci5neicKID4gLS0yMDI1
LTA4LTA3IDExOjA3OjMyLS0gIGh0dHBzOi8vZ2l0aHViLmNvbS9TYW5EaXNrLU9wZW4tU291cmNl
L3Vmcy11dGlscy9hcmNoaXZlL3Y3LjE0LjEyL3Vmcy11dGlscy03LjE0LjEyLnRhci5negogPiBS
ZXNvbHZpbmcgZ2l0aHViLmNvbSAoZ2l0aHViLmNvbSkuLi4gMTQwLjgyLjEyMS40CiA+IENvbm5l
Y3RpbmcgdG8gZ2l0aHViLmNvbSAoZ2l0aHViLmNvbSl8MTQwLjgyLjEyMS40fDo0NDMuLi4gY29u
bmVjdGVkLgogPiBIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMzAyIEZv
dW5kCiA+IExvY2F0aW9uOiBodHRwczovL2NvZGVsb2FkLmdpdGh1Yi5jb20vU2FuRGlzay1PcGVu
LVNvdXJjZS91ZnMtdXRpbHMvdGFyLmd6L3JlZnMvdGFncy92Ny4xNC4xMiBbZm9sbG93aW5nXQog
PiAtLTIwMjUtMDgtMDcgMTE6MDc6MzItLSAgaHR0cHM6Ly9jb2RlbG9hZC5naXRodWIuY29tL1Nh
bkRpc2stT3Blbi1Tb3VyY2UvdWZzLXV0aWxzL3Rhci5nei9yZWZzL3RhZ3MvdjcuMTQuMTIKID4g
UmVzb2x2aW5nIGNvZGVsb2FkLmdpdGh1Yi5jb20gKGNvZGVsb2FkLmdpdGh1Yi5jb20pLi4uIDE0
MC44Mi4xMjEuMTAKID4gQ29ubmVjdGluZyB0byBjb2RlbG9hZC5naXRodWIuY29tIChjb2RlbG9h
ZC5naXRodWIuY29tKXwxNDAuODIuMTIxLjEwfDo0NDMuLi4gY29ubmVjdGVkLgogPiBIVFRQIHJl
cXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9LCiA+IExlbmd0aDogdW5zcGVj
aWZpZWQgW2FwcGxpY2F0aW9uL3gtZ3ppcF0KID4gU2F2aW5nIHRvOiDigJgvaG9tZS9kYXJpby9w
cm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy51ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3ou
NjhKMVdKL291dHB1dOKAmQoKID4gL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1
dC9iIFsgPD0+IF0gNzcuNzZLIC0tLi1LQi9zIGluCiA+IDAuMDZzCgogPiAyMDI1LTA4LTA3IDEx
OjA3OjMyICgxLjMyIE1CL3MpIC0KID4g4oCYL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290
L291dHB1dC9idWlsZC8udWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6LjY4SjFXSi9vdXRwdXTigJkK
ID4gc2F2ZWQgWzc5NjIzXQoKID4gRVJST1I6IHdoaWxlIGNoZWNraW5nIGhhc2hlcyBmcm9tIHBh
Y2thZ2UvdWZzLXV0aWxzL3Vmcy11dGlscy5oYXNoCiA+IEVSUk9SOiB1ZnMtdXRpbHMtNy4xNC4x
Mi50YXIuZ3ogaGFzIHdyb25nIHNoYTI1NiBoYXNoOgogPiBFUlJPUjogZXhwZWN0ZWQ6IDk2Y2Q1
Nzg3MjI4MzBiYzdkOGE0MThkNTI4YTMwNjdjMGI4MGFkNDM3ZjY2YzMzMzNlYmMyMzhmZTUyNDM2
YTIKID4gRVJST1I6IGdvdCAgICAgOiA5NmQxNWNlNGIwOTkwMDQ5ZDgxMmQyNGFmYzJhNjIyNDBj
MWE0YWE1MzRlYTZhZWJiNWFlYmQzNGRjY2IyZGFjCiA+IEVSUk9SOiBJbmNvbXBsZXRlIGRvd25s
b2FkLCBvciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNrCiA+IHdnZXQgLW5kIC10IDMg
LS1jb25uZWN0LXRpbWVvdXQ9MTAgLU8KID4gJy9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5nei5IWXBxS20vb3V0cHV0Jwog
PiAnaHR0cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQvdWZzLXV0aWxzL3Vmcy11dGlscy03LjE0
LjEyLnRhci5neicKID4gLS0yMDI1LTA4LTA3IDExOjA3OjMyLS0gIGh0dHBzOi8vc291cmNlcy5i
dWlsZHJvb3QubmV0L3Vmcy11dGlscy91ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3oKID4gUmVzb2x2
aW5nIHNvdXJjZXMuYnVpbGRyb290Lm5ldCAoc291cmNlcy5idWlsZHJvb3QubmV0KS4uLgogPiAy
NjA2OjQ3MDA6MjA6OjY4MWE6MjUsIDI2MDY6NDcwMDoyMDo6YWM0Mzo0ODM4LAogPiAyNjA2OjQ3
MDA6MjA6OjY4MWE6MTI1LCAuLi4KID4gQ29ubmVjdGluZyB0byBzb3VyY2VzLmJ1aWxkcm9vdC5u
ZXQgKHNvdXJjZXMuYnVpbGRyb290Lm5ldCl8MjYwNjo0NzAwOjIwOjo2ODFhOjI1fDo0NDMuLi4g
Y29ubmVjdGVkLgogPiBIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAw
IE9LCiA+IExlbmd0aDogNzk2MTkgKDc4SykgW2FwcGxpY2F0aW9uL3gtZ3Rhci1jb21wcmVzc2Vk
XQogPiBTYXZpbmcgdG86IOKAmC9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9vdC9vdXRwdXQv
YnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5nei5IWXBxS20vb3V0cHV04oCZCgogPiAvaG9t
ZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2IKID4gMTAwJVs9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT5dCiA+IDc3Ljc1SyAtLS4tS0IvcyBpbiAwLjAycwoKID4gMjAyNS0wOC0w
NyAxMTowNzozMyAoNC45NiBNQi9zKSAtCiA+IOKAmC9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5nei5IWXBxS20vb3V0cHV0
4oCZCiA+IHNhdmVkIFs3OTYxOS83OTYxOV0KCiA+IHVmcy11dGlscy03LjE0LjEyLnRhci5nejog
T0sgKHNoYTI1NjogOTZjZDU3ODcyMjgzMGJjN2Q4YTQxOGQ1MjhhMzA2N2MwYjgwYWQ0MzdmNjZj
MzMzM2ViYzIzOGZlNTI0MzZhMikKCiA+IExvb2tpbmcgYXQ6CgogPiBodHRwczovL3NvdXJjZXMu
YnVpbGRyb290Lm5ldC91ZnMtdXRpbHMvdWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6CgogPiB3aXRo
IGhhc2g6CgogPiBzaGEyNTYgIDk2Y2Q1Nzg3MjI4MzBiYzdkOGE0MThkNTI4YTMwNjdjMGI4MGFk
NDM3ZjY2YzMzMzNlYmMyMzhmZTUyNDM2YTIgdWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6CgogPiBh
bmQ6CgogPiBodHRwczovL2dpdGh1Yi5jb20vU2FuRGlzay1PcGVuLVNvdXJjZS91ZnMtdXRpbHMv
YXJjaGl2ZS92Ny4xNC4xMi91ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3oKCiA+IHdpdGggaGFzaDoK
CiA+IHNoYTI1NiAgOTZkMTVjZTRiMDk5MDA0OWQ4MTJkMjRhZmMyYTYyMjQwYzFhNGFhNTM0ZWE2
YWViYjVhZWJkMzRkY2NiMmRhYyB1ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3oKCiA+IGFuZCBydW5u
aW5nIGRpZmZvc2NvcGUgdXRpbGl0eSBvbiB0aG9zZSB0d28gYXJjaGl2ZXMsIGl0IHBvaW50cyB0
byB0aGUgdXBzdHJlYW0gY29tbWl0OgoKID4gaHR0cHM6Ly9naXRodWIuY29tL1NhbkRpc2stT3Bl
bi1Tb3VyY2UvdWZzLXV0aWxzL2NvbW1pdC85ODlkY2QyOTcyMjNkNjg5NmM1ODkyNTMyZDE0OTg0
MzI2ZmEwOTNkCgogPiBUaGUgZmlsZSBkYXRlcyBhcmUgYWxzbyBkaWZmZXJlbnQgaW5zaWRlIHRo
ZSB0YXIgZmlsZS4KCiA+IE9uIEp1bGllbuKAmXMgc3VnZ2VzdGlvbiwgSSBvcGVuZWQgYSB0aWNr
ZXQgWzFdIHRvIGhpZ2hsaWdodCB0aGUgaXNzdWUgYW5kCiA+IGluZm9ybSB0aGUgdWZzLXV0aWxz
IG1haW50YWluZXJzIGFib3V0IHRoZSBwcm9ibGVtLgoKID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS9TYW5EaXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy9pc3N1ZXMvNzYKCiA+IEZpeGVzOgogPiBo
dHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYjY5L2I2OTQ3MmQyZWFmMjdk
ZmNjOTdjMzAwYjk2ODY4Y2FiNTIwNjhjZTkKID4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzQyOS80MjlhMjg2NjlkOThjNmY0MjRmMzNhMjExZWIwZWJiNDhjNmY0NTUz
CiA+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8wMWIvMDFiOTBiZDdk
NzhhMzRhZTczMjE5MWI3NTBlZmM2OWYxOTVjNzhlYwogPiBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvYTA5L2EwOTdlNDgzMTRiZTJmNTIyMjM4ODgwZTlhYjQ1MjljZWJl
ZmY0N2IKCiA+IENvLURldmVsb3BlZC1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4K
ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgoKID4gLS0tCgogPiBDaGFuZ2VzIHYxIC0+IHYyOgogPiAgLSBSZS13b3Jr
IHRoZSBjb21taXQgbWVzc2FnZSBmb2xsb3dpbmcgSnVsaWVuIHN1Z2dlc3Rpb25zCgoKQ29tbWl0
dGVkLCB0aGFua3MuIEkgd2lsbCB1cGRhdGUgdGhlIHRhcmJhbGwgb24gcy5iLm8gbm93LgoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
