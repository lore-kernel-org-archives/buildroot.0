Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA92C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 15:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E90E41888;
	Tue,  7 Feb 2023 15:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E90E41888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCkOlTEP-ipU; Tue,  7 Feb 2023 15:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6351C41891;
	Tue,  7 Feb 2023 15:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6351C41891
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B86081BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91A3E81304
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A3E81304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKPYongS1Ots for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 15:49:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E078812DB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E078812DB
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 15:49:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7E66B13F87F;
 Tue,  7 Feb 2023 16:49:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 16:49:15 +0100
Date: Tue, 7 Feb 2023 16:49:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20230207154915.GH4124@scaer>
References: <20230207-host-python-libuuid-v1-1-de34da87efd8@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207-host-python-libuuid-v1-1-de34da87efd8@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675784961;
 bh=sStWJk2u4FsIxlTiy13eieH5kgCL/w62pjQhXCjnqFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PAzUddICckuKsurhlATTyzTttXCsueX5dllh1ZmTvL6sUv8lZrh0wxVMbDej3gEbI
 GJbvOAArrv9wGwkTiapKcowoOfKKF29fzcpXVCX9Sm/rM0BQNJL9zNyqrwpEeAqNcK
 un3fMol5RdO85sMCz9t/KlhosB/q4gyFbOa0anFu5eizivQBTER01a2BqC+rzZCTun
 GjZNh3LyedOowqeXqm747fzrOYn2zkqWQbAHxlJv4ukYDjErdXgOOnwJNDbHS8+v78
 ksAUqEp+QMxt6SFk1EkbYH+MOxXXfkxk7Wi0wEgc+uGRtIdkdAmyQOyEReSN1lVO+2
 wpAMh/woFXlRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PAzUddIC
Subject: Re: [Buildroot] [PATCH] package/python3: use pure python UUID
 backend for host variant
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UXVlbnRpbiwgQWxsLAoKT24gMjAyMy0wMi0wNyAxNjozNiArMDEwMCwgUXVlbnRpbiBTY2h1bHog
c3Bha2UgdGh1c2x5Ogo+IEZyb206IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekB0aGVv
YnJvbWEtc3lzdGVtcy5jb20+Cj4gCj4gaG9zdC1weXRob24zIGN1cnJlbnRseSBkb2VzIG5vdCBi
dWlsZCBpZiB1dGlsLWxpbnV4LXV1aWQgb3B0aW9uIGlzIG5vdAo+IGVuYWJsZWQsIGZhaWxpbmcg
d2l0aCB0aGUgZm9sbG93aW5nIGVycm9yIG1lc3NhZ2VzOgo+ICIiIgo+IC91c3IvbGliNjQvY2Nh
Y2hlL2djYyAtZlBJQyAtV3NpZ24tY29tcGFyZSAtRE5ERUJVRyAtZyAtZndyYXB2IC1PMyAtV2Fs
bCAtTzIgLUkvaG9tZS9xc2NodWx6L3dvcmsvdXBzdHJlYW0vYnVpbGRyb290L291dHB1dC9ob3N0
L2luY2x1ZGUgLXN0ZD1jMTEgLVdleHRyYSAtV25vLXVudXNlZC1wYXJhbWV0ZXIgLVduby1taXNz
aW5nLWZpZWxkLWluaXRpYWxpemVycyAtV3N0cmljdC1wcm90b3R5cGVzIC1XZXJyb3I9aW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb24gLWZ2aXNpYmlsaXR5PWhpZGRlbiAtSS4vSW5jbHVkZS9p
bnRlcm5hbCAtSS4vSW5jbHVkZSAtSS4gLUkvaG9tZS9xc2NodWx6L3dvcmsvdXBzdHJlYW0vYnVp
bGRyb290L291dHB1dC9ob3N0L2luY2x1ZGUgLUkvdXNyL2xvY2FsL2luY2x1ZGUgLUkvaG9tZS9x
c2NodWx6L3dvcmsvdXBzdHJlYW0vYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LXB5dGhvbjMt
My4xMS4xL0luY2x1ZGUgLUkvaG9tZS9xc2NodWx6L3dvcmsvdXBzdHJlYW0vYnVpbGRyb290L291
dHB1dC9idWlsZC9ob3N0LXB5dGhvbjMtMy4xMS4xIC1jIC9ob21lL3FzY2h1bHovd29yay91cHN0
cmVhbS9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtcHl0aG9uMy0zLjExLjEvTW9kdWxlcy9f
dXVpZG1vZHVsZS5jIC1vIGJ1aWxkL3RlbXAubGludXgteDg2XzY0LTMuMTEvaG9tZS9xc2NodWx6
L3dvcmsvdXBzdHJlYW0vYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LXB5dGhvbjMtMy4xMS4x
L01vZHVsZXMvX3V1aWRtb2R1bGUubwo+IC9ob21lL3FzY2h1bHovd29yay91cHN0cmVhbS9idWls
ZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtcHl0aG9uMy0zLjExLjEvTW9kdWxlcy9fdXVpZG1vZHVs
ZS5jOiBJbiBmdW5jdGlvbiDigJhweV91dWlkX2dlbmVyYXRlX3RpbWVfc2FmZeKAmToKPiAvaG9t
ZS9xc2NodWx6L3dvcmsvdXBzdHJlYW0vYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LXB5dGhv
bjMtMy4xMS4xL01vZHVsZXMvX3V1aWRtb2R1bGUuYzoyNzoxMjogZXJyb3I6IHN0b3JhZ2Ugc2l6
ZSBvZiDigJh1dWkg4oCZIGlzbuKAmXQga25vd24KPiAgICAyNyB8ICAgICB1dWlkX3QgdXVpZDsK
PiAgICAgICB8ICAgICAgICAgICAgXn5+fgo+IC9ob21lL3FzY2h1bHovd29yay91cHN0cmVhbS9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtcHl0aG9uMy0zLjExLjEvTW9kdWxlcy9fdXVpZG1v
ZHVsZS5jOjMxOjExOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCY
dXVpZF9nZW5lcmF0ZV90aW1lX3NhZmXigJk7IGRpZCB5b3UgbWVhbiDigJhweV91dWlkX2dlbmVy
YXRlX3RpbWVfc2FmZeKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
Cj4gICAgMzEgfCAgICAgcmVzID0gdXVpZF9nZW5lcmF0ZV90aW1lX3NhZmUodXVpZCk7Cj4gICAg
ICAgfCAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICB8ICAgICAgICAg
ICBweV91dWlkX2dlbmVyYXRlX3RpbWVfc2FmZQo+IC9ob21lL3FzY2h1bHovd29yay91cHN0cmVh
bS9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtcHl0aG9uMy0zLjExLjEvTW9kdWxlcy9fdXVp
ZG1vZHVsZS5jOjI3OjEyOiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYdXVpZOKAmSBbLVd1
bnVzZWQtdmFyaWFibGVdCj4gICAgMjcgfCAgICAgdXVpZF90IHV1aWQ7Cj4gICAgICAgfCAgICAg
ICAgICAgIF5+fn4KPiAvaG9tZS9xc2NodWx6L3dvcmsvdXBzdHJlYW0vYnVpbGRyb290L291dHB1
dC9idWlsZC9ob3N0LXB5dGhvbjMtMy4xMS4xL01vZHVsZXMvX3V1aWRtb2R1bGUuYzo0NzoxOiB3
YXJuaW5nOiBjb250cm9sIHJlYWNoZXMgZW5kIG9mIG5vbi12b2lkIGZ1bmN0aW9uIFstV3JldHVy
bi10eXBlXQo+ICAgIDQ3IHwgfQo+ICAgICAgIHwgXgo+IGNjMTogc29tZSB3YXJuaW5ncyBiZWlu
ZyB0cmVhdGVkIGFzIGVycm9ycwo+IAo+IFRoZSBuZWNlc3NhcnkgYml0cyB0byBidWlsZCB0aGVz
ZSBvcHRpb25hbCBtb2R1bGVzIHdlcmUgbm90IGZvdW5kOgo+IF9kYm0gICAgICAgICAgICAgICAg
IF9nZGJtICAgICAgICAgICAgICAgIF90a2ludGVyCj4gbmlzICAgICAgICAgICAgICAgICAgcmVh
ZGxpbmUKPiBUbyBmaW5kIHRoZSBuZWNlc3NhcnkgYml0cywgbG9vayBpbiBzZXR1cC5weSBpbiBk
ZXRlY3RfbW9kdWxlcygpIGZvciB0aGUgbW9kdWxlJ3MgbmFtZS4KPiAKPiBUaGUgZm9sbG93aW5n
IG1vZHVsZXMgZm91bmQgYnkgZGV0ZWN0X21vZHVsZXMoKSBpbiBzZXR1cC5weSBoYXZlIG5vdAo+
IGJlZW4gYnVpbHQsIHRoZXkgYXJlICpkaXNhYmxlZCogYnkgY29uZmlndXJlOgo+IF9jdHlwZXNf
dGVzdCAgICAgICAgIF9zcWxpdGUzICAgICAgICAgICAgIF90ZXN0YnVmZmVyCj4gX3Rlc3RjYXBp
ICAgICAgICAgICAgX3Rlc3RpbXBvcnRtdWx0aXBsZSAgIF90ZXN0aW50ZXJuYWxjYXBpCj4gX3Rl
c3RtdWx0aXBoYXNlICAgICAgX3h4dGVzdGZ1enoKPiAKPiBGYWlsZWQgdG8gYnVpbGQgdGhlc2Ug
bW9kdWxlczoKPiBfdXVpZAo+ICIiIgo+IAo+IFRoZXJlZm9yZSwgbGV0J3MgZGlzYWJsZSBidWls
ZGluZyB0aGUgX3V1aWQgZXh0ZW5zaW9uIHRoZSBzYW1lIHdheSBpdCdzCj4gZG9uZSBmb3IgdGhl
IHRhcmdldCBwYWNrYWdlIHNpbmNlIGNvbW1pdCAwYjY4NzEzYWFlMjggKCJweXRob24zOiB1c2UK
PiBwdXJlIHB5dGhvbiBVVUlEIGJhY2tlbmQiKS4KPiAKPiBDYzogUXVlbnRpbiBTY2h1bHogPGZv
c3MrYnVpbGRyb290QDBsZWlsLm5ldD4KPiBTaWduZWQtb2ZmLWJ5OiBRdWVudGluIFNjaHVseiA8
cXVlbnRpbi5zY2h1bHpAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+IE9ubHkgYnVpbGQgdGVz
dGVkIHdpdGggbWFrZSBob3N0LXB5dGhvbjMgd2l0aCByYXNwYmVycnlwaTRfZGVmY29uZmlnIGNv
bmZpZ3VyYXRpb24uCj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rIHwgMSArCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbjMvcHl0aG9uMy5tayBiL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rCj4gaW5kZXgg
MjE5ZDEzNWIzZi4uZmI2ZGJmMmU2NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbjMvcHl0
aG9uMy5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rCj4gQEAgLTMxLDYgKzMx
LDcgQEAgSE9TVF9QWVRIT04zX0NPTkZfT1BUUyArPSBcCj4gIAktLWVuYWJsZS11bmljb2RlZGF0
YSBcCj4gIAktLWRpc2FibGUtdGVzdC1tb2R1bGVzIFwKPiAgCS0tZGlzYWJsZS1pZGxlMyBcCj4g
KwktLWRpc2FibGUtdXVpZCBcCj4gIAktLWRpc2FibGUtb3NzYXVkaW9kZXYKPiAgCj4gICMgTWFr
ZSBzdXJlIHRoYXQgTERfTElCUkFSWV9QQVRIIG92ZXJyaWRlcyAtcnBhdGguCj4gCj4gLS0tCj4g
YmFzZS1jb21taXQ6IDI2ZGQ3MGU5NTRhN2M5MTQyYjA3ODgzN2FiMWJiZmFkNTRkMGU1Y2IKPiBj
aGFuZ2UtaWQ6IDIwMjMwMjA3LWhvc3QtcHl0aG9uLWxpYnV1aWQtZDYwMGQzMmY3MGFlCj4gCj4g
QmVzdCByZWdhcmRzLAo+IC0tIAo+IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekB0aGVv
YnJvbWEtc3lzdGVtcy5jb20+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
