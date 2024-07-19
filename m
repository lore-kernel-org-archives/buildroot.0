Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9113C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 14:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59121409FE;
	Fri, 19 Jul 2024 14:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69b-twaSq3JO; Fri, 19 Jul 2024 14:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6785340BD7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6785340BD7;
	Fri, 19 Jul 2024 14:18:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E84A01BF335
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0D0680ECA
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fFnyWhjuyum for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 14:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8366F80E89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8366F80E89
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8366F80E89
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:18:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDysm-1sefnA3oYu-006Ff6; Fri, 19
 Jul 2024 16:18:16 +0200
Date: Fri, 19 Jul 2024 16:17:59 +0200
MIME-Version: 1.0
Message-Id: <20240719-micropython-v1-1-9d71f1125e49@gmx.net>
References: <20240719-micropython-v1-0-9d71f1125e49@gmx.net>
In-Reply-To: <20240719-micropython-v1-0-9d71f1125e49@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721398695; l=574;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=xIA526LKNVS/aF0hTTv5bqEqBvrIeOkl/KledeosKaw=;
 b=edlwMYSYkTSXXV8V7Lz3w57BUTGBfKb0eHcqd/q8w8vAlTz4/tt9h37mKjIeSCXwiS9j2L1ue
 sVKyYTmJXmiBKjKx5xq/su82M3ybYujSraO2WqbBxu3ZYRzbQbPiLoP
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:aWTrnLpSnfNLvckcqlMAG6V3yfnQ4+oJ/eJyu0DGiNFhi1ZGe5O
 whE+zy4KISSYbc0g4UR8TiAGKASik3b/iIKqdOn2wsSITgYhD69iQkZpGRdbucjaJNidmoj
 fEsUxBgRT2jg5EZ2lmToijgGqWN30Nv9E60iXOLNEf4hue9H+9zyWXALhPJHJQhmxH0FxL7
 I5yl/TiS+9HxM8PkXg7GA==
UI-OutboundReport: notjunk:1;M01:P0:cvCGNo82wv0=;LHgB/NdiWTgG9f6ardNoTKHxs71
 Yvi7vV0DlU+1wLQpFqUvrVOj9KRArUt2urf3Tf1HnvrCRuHc3kY1xUaxqYQxTpcU8iSuush1h
 nI+STdyX03Nvn7P/BK8FDRxtRaVJivH0FvrVwdCrDUMm4QNKwW8y+9vAosHh6yYsXDGzl7LgN
 n7uTdY3MkQG7lrG6kmZItFdN16pdL9oOjR8q5hu+1dGZFVubNPGsR06AXD5KmRPB1lJJT3sya
 tPGbYB7l+hEy4KTUluHqO4VjrH/wgwu7glTGfVcRqsRb8RJ+WpuDn4rBwYb3mAMiFT2Li9n3U
 1Ino+B4UzllAaWvu06JiEKrCOw99DLXQQ1OSasb10CshKBlMJ23FrU7LVG3fR7/nXCSgvWvpl
 1TiFE1sN7zMl4gC5SV9U70L2vqxgpZnMur6rbmsHnukgm1iX19ZQtTZFiprSKpod792fG25Yp
 zkDCg/z/O7dZ+rMDTqrd4mqXJfJrynqpB5ylv/YAq+nriHI+GVUIdwpBZnvC8e7QIBluFvvYc
 RLSou0DapNost4hYomnuOWAmhfDvW7qgfWL6Lt5qL7pmDf7pwF8TdAAhTlwSp6uyrVU5wDokI
 Vcz53zAVM1h9PJmlGUZ0tPCodduEiw04jFiRj9KfZ68sGLDzRonsAeFMsSGPqdZbiky6jMaKW
 AJpmoLkKNyOS1m55uxH8wNi8U1nq73CmE4S7hns+FjLXhHWQbsKsT8WTYNpdVTDPXSL8Iu3sC
 guSCMSngGU2dHABQQVpBGCPdGv52hbWRdTlFwVUxgIcWnlw4ia/8a+1wh74lyF0F7CnacfIOL
 1DZWc6V4sxNeuCatw81Do2oqI930kNpRRAPPkU7elXXDs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721398697; x=1722003497; i=j.neuschaefer@gmx.net;
 bh=kVZ/RNpWIEWqbpv7ldDERbJRyt9jl62N29965slahGQ=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BSqvarsyV/OlYAUc/pTgZdCLhxtdyF9CrMTYX5PKv0nBhyshEx38+9Gh5yRiV186
 ECs+YSdXRrERxOi0lFpvi0FR5EShi6IjuPypoFPtWSphe/GQLvvUBwDlr5Py5f9YK
 O9+l2cnRW7G46kWQILgFwqaISMXp+6VFM+Tv9JJ0gn5RpIDTKXeEz3mSmRz3Smv9P
 fwn3sNRZ5eg+vSQaJP2zTMPXPtecy1c2DV1LK1avFQu6yXjQCP/ylzz25OdMEcVMs
 EMWAW2amj0wejJaXjOhUwE7E58kjRssZiOvIxA6mUPdz16ItpJObEgQrRn4ZdGuBV
 ZlL4zjtyqG1YsQu0fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=BSqvarsy
Subject: [Buildroot] [PATCH 1/2] package/micropython: Change URL to HTTPS
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Chris Packham <judge.packham@gmail.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CiBwYWNrYWdlL21pY3JvcHl0aG9uL0NvbmZpZy5pbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWljcm9w
eXRob24vQ29uZmlnLmluIGIvcGFja2FnZS9taWNyb3B5dGhvbi9Db25maWcuaW4KaW5kZXggODQ5
YTU0NTJmNC4uYjQ2NmZiYWYyZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9taWNyb3B5dGhvbi9Db25m
aWcuaW4KKysrIGIvcGFja2FnZS9taWNyb3B5dGhvbi9Db25maWcuaW4KQEAgLTcsNyArNyw3IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9NSUNST1BZVEhPTgogCSAgMyBwcm9ncmFtbWluZyBsYW5ndWFn
ZSB0aGF0IGlzIG9wdGltaXNlZCB0byBydW4gb24gYQogCSAgbWljcm9jb250cm9sbGVyLgoKLQkg
IGh0dHA6Ly9taWNyb3B5dGhvbi5vcmcKKwkgIGh0dHBzOi8vbWljcm9weXRob24ub3JnCgogaWYg
QlIyX1BBQ0tBR0VfTUlDUk9QWVRIT04KCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
