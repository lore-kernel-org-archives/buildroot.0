Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE82C001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 14:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 019BB613A2;
	Sun, 22 Oct 2023 14:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 019BB613A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AU-5M5EPdGXy; Sun, 22 Oct 2023 14:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27805708FE;
	Sun, 22 Oct 2023 14:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27805708FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8BB61BF298
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A178C84F33
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A178C84F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08RTinqcaT5C for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 14:22:24 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84B3C84FC1
 for <buildroot@busybox.net>; Sun, 22 Oct 2023 14:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B3C84FC1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CC6D95FFB7;
 Sun, 22 Oct 2023 16:22:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 16:22:20 +0200
Date: Sun, 22 Oct 2023 16:22:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231022142220.GM2607@scaer>
References: <20231020161902.48876-1-francois.perrad@gadz.org>
 <20231022140802.GJ2607@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231022140802.GJ2607@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697984542;
 bh=+2Yw74lkBHxItt8jim8fKocP+Djv03FgFUWQQxYtetQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D1qljH+OgIpK5mywPwPWMfXKRAfzKHz/6rHuXxG8tuml4B/9dQWwuKuGx7feVCGCn
 QADB4BXEahLAUIRhcXkhi77Vqw/+13ph8uU3aOImphlaklQ84K6JMP/z3stpZqLe0R
 eC7Vqyz0/hDfhR1Sp8VCNJ3sO4TX0abSlUtYS6mtpUC00/+dOiP39lciAbg9E0p7pH
 qbqETUlTXc8GOoHIXsf7avGQhAkd0UUbc3nYQDzmrk9Ft1HIAj/IXgRQFDL31jODt3
 2Yx70KWn0lXjbUvd/lEJp1UAUl7pEaXEBku+4B/GQ4t+7030S2SjfwK4fxd01+fraH
 IcUwd1ytov4YQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D1qljH+O
Subject: Re: [Buildroot] [PATCH 1/2] package/perl-net-ssh2: bump to version
 0.73
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTEwLTIyIDE2OjA4ICswMjAwLCBZYW5uIEUuIE1PUklO
IHNwYWtlIHRodXNseToKPiBPbiAyMDIzLTEwLTIwIDE4OjE5ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+ID4gZGlmZiBSRUFETUUucG9kOgo+ID4gc2VlIGh0dHBzOi8vbWV0
YWNwYW4ub3JnL3JlbGVhc2UvUktJVE9WRVIvTmV0LVNTSDItMC43My9kaWZmL1NBTFZBL05ldC1T
U0gyLTAuNzIjUkVBRE1FLnBvZAo+IFdlIHdhbnQgdG8gaGF2ZSBhIHN1bW1hcnkgb2YgdGhlIGNo
YW5nZXMgZGlyZWN0bHkgaW4gb3VyIGNvbW1pdCBsb2csCj4gYmVjYXVzZSBvdXIgY29tbWl0IGxv
ZyBpcyBhbGwgdGhhdCBpcyBndWFyYW50ZWRkIHRvIGJlIGF2YWlsYWJsZSBpbgo+IG91ciByZXBv
c2l0b3J5LiBBbnkgcmVmZXJlbmNlIHRvIGEgdGhvcmQtcGFydHkgbG9jYXRpb24gd2lsbCBub3Qg
aGF2ZQo+IHRoZSBzYW1lIGd1YXJhbnRlZSAoZS5nLiBldmVuIGlmIENQQU4gaGFzIGV4aXN0ZWQg
Zm9yIGFnZXMsIHRoZXkgbWF5Cj4gcmV3cml0ZSB0aGUgVVJMcyBpbiB0aGUgZnV0dXJlKS4KCkkg
c2hvdWxkIG1heWJlIGV4cGxhaW4gd2h5IHdlIG5lZWQgc3VjaCBhIHN1bW1hcnkgaW4gdGhlIGNv
bW1pdCBsb2c6ClJFQURNRS5wb2QgaXMgdXNlZCBhIGxpY2Vuc2UgZmlsZSwgc28gaXQgaXMgb3Vy
IHJlZmVyZW5jZSBhcyB0byB3aGF0IHRoZQpsaWNlbnNpbmcgdGVybXMgYXJlLgoKVXBkYXRpbmcg
dGhlIGhhc2ggb2YgdGhlIGxpY2Vuc2UgZmlsZXMgbWVhbnMgdGhlIGZpbGUgaGFzIGNoYW5nZWQs
IGFuZAp0aGF0J3MgbmljZSB0aGF0IHlvdSBub3RpY2VkIGFuZCB1cGRhdGVkLgoKQnV0IHdoYXQg
d2UgcmVhbGx5IG5lZWQgdG8ga25vdyBpZiB0aGUgcmVhc29uIGZvciB0aGUgdXBkYXRlLCBldmVu
IGlmIGl0CmlzIGp1c3QgInR5cG9lcyBhbmQgcmV3cmFwcGluZyIsIHNvIHRoYXQgaXQgaXMgKm9i
dmlvdXMqIHRoYXQgdGhlcmUgaXMKbm8gbGljZW5zaW5nIGNoYW5nZS4KCihwYXRjaCBtYXJrZWQg
YXMgImNoYW5nZXMgcmVxdWVzdGVkIiBpbiBwYXRjaHdvcmsuKQoKUmVnYXJkcywKWWFubiBFLiBN
T1JJTi4KCj4gSW5jaWRlbnRhbGx5LCB0aGUgJ2RpZmYnIGFib3ZlIGNvbmZ1c2VzIFBhdGNod29y
azoKPiAgICAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDIzMTAyMDE2MTkwMi40ODg3Ni0xLWZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZy8KPiAK
PiBBbHNvLCBpdCBzb3VsZCBiZSBuaWNlIHRvIGV4cGxhaW4gd2h5IHdlIGhhdmUgdG8gY2hhbmdl
IHRvIGFub3RoZXIKPiAiYXV0aG9yIiBhcyB0aGUgb3JpZ2luLgo+IAo+IFJlZ2FyZHMsCj4gWWFu
biBFLiBNT1JJTi4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9wZXJsLW5ldC1zc2gyL3Bl
cmwtbmV0LXNzaDIuaGFzaCB8IDggKysrKy0tLS0KPiA+ICBwYWNrYWdlL3BlcmwtbmV0LXNzaDIv
cGVybC1uZXQtc3NoMi5tayAgIHwgNCArKy0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Bl
cmwtbmV0LXNzaDIvcGVybC1uZXQtc3NoMi5oYXNoIGIvcGFja2FnZS9wZXJsLW5ldC1zc2gyL3Bl
cmwtbmV0LXNzaDIuaGFzaAo+ID4gaW5kZXggYjJlOGIyZDQ4Li45MWJiZGMyZTggMTAwNjQ0Cj4g
PiAtLS0gYS9wYWNrYWdlL3BlcmwtbmV0LXNzaDIvcGVybC1uZXQtc3NoMi5oYXNoCj4gPiArKysg
Yi9wYWNrYWdlL3BlcmwtbmV0LXNzaDIvcGVybC1uZXQtc3NoMi5oYXNoCj4gPiBAQCAtMSw2ICsx
LDYgQEAKPiA+IC0jIHJldHJpZXZlZCBieSBzY2FuY3BhbiBmcm9tIGh0dHA6Ly9jcGFuLm1ldGFj
cGFuLm9yZy8KPiA+IC1tZDUgIDU3YWEwZjZlMmJlNDAyMGY3NTg4OGE3MTk1YWQ1Y2JhICBOZXQt
U1NIMi0wLjcyLnRhci5nego+ID4gLXNoYTI1NiAgODY3ZDgzMDcwZmFjNjQzNmI5ZjA5NzE5MTgy
NDMwMDIwNzJmYmY4ZDI3MjRhODdjMjU0YjM0MjUwZGNlMDIyMiAgTmV0LVNTSDItMC43Mi50YXIu
Z3oKPiA+ICsjIHJldHJpZXZlZCBieSBzY2FuY3BhbiBmcm9tIGh0dHBzOi8vY3Bhbi5tZXRhY3Bh
bi5vcmcvCj4gPiArbWQ1ICAyMjI2MjVjOTFhZmZjY2ViNDNlODYxMDYzZDUyOTQzZiAgTmV0LVNT
SDItMC43My50YXIuZ3oKPiA+ICtzaGEyNTYgIGE1MWU0YzMxNjhmYzNkOGFiODlhNmI2NzNjODM2
MzIzMzAzZTk1YjE4ZGUxOTgxM2VjNDUyODgxMGVjMjM3ODUgIE5ldC1TU0gyLTAuNzMudGFyLmd6
Cj4gPiAgCj4gPiAgIyBjb21wdXRlZCBieSBzY2FuY3Bhbgo+ID4gLXNoYTI1NiAgMjY4YWZhZWU3
YWE4OGE0MTk1OWM5M2NkOTE4NTNlODEyNGJkYmU2NGE3NDQ4MGQzNmZmMTEzMGUwMWExYzBjYSAg
UkVBRE1FLnBvZAo+ID4gK3NoYTI1NiAgZTUxN2U4ZDM2OTBiYmViZjk3Zjc4YzVjZWQ0ZjBlY2Iy
NjEwNmVlZjM4MTY4N2RkNmZiMzg3OWFhNWEzZjAzMSAgUkVBRE1FLnBvZAo+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcGVybC1uZXQtc3NoMi9wZXJsLW5ldC1zc2gyLm1rIGIvcGFja2FnZS9wZXJs
LW5ldC1zc2gyL3BlcmwtbmV0LXNzaDIubWsKPiA+IGluZGV4IDIwZTQ1YjYyOC4uOTFjMDg0NThl
IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9wZXJsLW5ldC1zc2gyL3BlcmwtbmV0LXNzaDIubWsK
PiA+ICsrKyBiL3BhY2thZ2UvcGVybC1uZXQtc3NoMi9wZXJsLW5ldC1zc2gyLm1rCj4gPiBAQCAt
NCw5ICs0LDkgQEAKPiA+ICAjCj4gPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICAKPiA+
IC1QRVJMX05FVF9TU0gyX1ZFUlNJT04gPSAwLjcyCj4gPiArUEVSTF9ORVRfU1NIMl9WRVJTSU9O
ID0gMC43Mwo+ID4gIFBFUkxfTkVUX1NTSDJfU09VUkNFID0gTmV0LVNTSDItJChQRVJMX05FVF9T
U0gyX1ZFUlNJT04pLnRhci5nego+ID4gLVBFUkxfTkVUX1NTSDJfU0lURSA9ICQoQlIyX0NQQU5f
TUlSUk9SKS9hdXRob3JzL2lkL1MvU0EvU0FMVkEKPiA+ICtQRVJMX05FVF9TU0gyX1NJVEUgPSAk
KEJSMl9DUEFOX01JUlJPUikvYXV0aG9ycy9pZC9SL1JLL1JLSVRPVkVSCj4gPiAgUEVSTF9ORVRf
U1NIMl9MSUNFTlNFID0gQXJ0aXN0aWMgb3IgR1BMLTEuMCsKPiA+ICBQRVJMX05FVF9TU0gyX0xJ
Q0VOU0VfRklMRVMgPSBSRUFETUUucG9kCj4gPiAgUEVSTF9ORVRfU1NIMl9ERVBFTkRFTkNJRVMg
PSBsaWJzc2gyIHpsaWIKPiA+IC0tIAo+ID4gMi4zOS4yCj4gPiAKPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gLS0gCj4gLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdB
SU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
