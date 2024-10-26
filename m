Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01219D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866FD405EF;
	Sat, 26 Oct 2024 14:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDoBh-92AI5E; Sat, 26 Oct 2024 14:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6BA940538
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6BA940538;
	Sat, 26 Oct 2024 14:28:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A4E5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4334F81551
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHnVzxBgIuCi for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 039C7814C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 039C7814C9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 039C7814C9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:28:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F1B1C0005;
 Sat, 26 Oct 2024 14:28:00 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:27:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>, Julien
 Olivain <ju.o@free.fr>, Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241026162759.0100482f@windsurf>
In-Reply-To: <20240924023919.1502635-1-james.hilliard1@gmail.com>
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729952881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUm0GEwrdKYmHZS3T9hcNX9S4MrkGCZc3jMllfZB7H8=;
 b=R1W4PIy3DhNNUEl6jkwj/S4rsuyWl6rDj9sCjWQANu79mSKlIwcvNNjq4iEdH7eS672NPc
 G/CtQrVTJ7aFnpxQUSe2uVjODHR9SGPQLCY2ojeVoMxyv/E5fzMWqyYGwe+Z/r6Q4oAElO
 Olf6wCJfznwPEaPEKmRD2x7JONtjmHcqV0uXmwk5f0KjyPnGLn3YhgKmVzGn2jgd6zhs4q
 c19yT84QctaybMdXLLUCEH+iytK04coDnl3Br2+V2kZ+o68E5Zd/x4RKasv+JtEBpZU6mZ
 7rIhb17PIXL6PBFpNF2ajWjcYQBUZjN/b6cCwHW2Wja8tSexxqo5KGT3RSWmXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R1W4PIy3
Subject: Re: [Buildroot] [PATCH v2 1/3] package/{python-}protobuf: bump to
 version 28.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyMyBTZXAgMjAyNCAyMDozOToxNyAtMDYwMApKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE1pZ3JhdGUgcHJvdG9idWYgYnVpbGQgZnJv
bSBhdXRvdG9vbHMgdG8gY21ha2UuCj4gCj4gTWlncmF0ZSBwcm90b2J1Zi1weXRob24gdG8gdXNl
IHB5cGkgc291cmNlcyB3aGljaCBhcmUgbm93IHJlcXVpcmVkCj4gZm9yIHNldHVwLnB5IGJ1aWxk
czoKPiBodHRwczovL2dpdGh1Yi5jb20vcHJvdG9jb2xidWZmZXJzL3Byb3RvYnVmL3RyZWUvdjI4
LjEvcHl0aG9uI2J1aWxkaW5nLWZyb20tc2V0dXBweQo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKSGVyZSwgdGhpcyBicmVha3Mg
dGhlIGJ1aWxkIG9mIGhvc3QtcHJvdG9idWYtYywgYXMgc3VjaDoKCj4+PiBob3N0LXByb3RvYnVm
LWMgMS41LjAgQnVpbGRpbmcKR0lUX0RJUj0uIFBBVEg9Ii9ob21lL3Rob21hcy9wcm9qZXRzL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW46L2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291
dHB1dC9ob3N0L3NiaW46L2hvbWUvdGhvbWFzL3N5cy9iaW46L2hvbWUvdGhvbWFzLy5nZW0vcnVi
eS8yLjEuMC9iaW46L3Vzci9sb2NhbC9iaW46L3Vzci9sb2NhbC9zYmluOi91c3IvYmluOi91c3Iv
c2JpbjovaG9tZS90aG9tYXMvLnJ2bS9iaW46L2hvbWUvdGhvbWFzLy5sb2NhbC9iaW46L2hvbWUv
dGhvbWFzL3Byb2pldHMvZ2l0LXdyYXBwZXJzOi9ob21lL3Rob21hcy9ib290bGluL2dpdC9iaW4v
IiBQS0dfQ09ORklHPSIvaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3Qv
YmluL3BrZy1jb25maWciIFBLR19DT05GSUdfU1lTUk9PVF9ESVI9Ii8iIFBLR19DT05GSUdfQUxM
T1dfU1lTVEVNX0NGTEFHUz0xIFBLR19DT05GSUdfQUxMT1dfU1lTVEVNX0xJQlM9MSBQS0dfQ09O
RklHX0xJQkRJUj0iL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9ob3N0L2xp
Yi9wa2djb25maWc6L2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9ob3N0L3No
YXJlL3BrZ2NvbmZpZyIgIC91c3IvYmluL21ha2UgLWoxICAgLUMgL2hvbWUvdGhvbWFzL3Byb2pl
dHMvYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LXByb3RvYnVmLWMtMS41LjAvCm1ha2VbMV06
IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1
dC9idWlsZC9ob3N0LXByb3RvYnVmLWMtMS41LjAnCiAgR0VOICAgICAgcHJvdG9idWYtYy9wcm90
b2J1Zi1jLnBiLmNjCiAgQ1hYICAgICAgcHJvdG9jLWMvcHJvdG9jX2dlbl9jLWNfYnl0ZXNfZmll
bGQubwpJbiBmaWxlIGluY2x1ZGVkIGZyb20gcHJvdG9jLWMvY19ieXRlc19maWVsZC5jYzo2NDoK
Li9wcm90b2MtYy9jX2hlbHBlcnMuaDogSW4gZnVuY3Rpb24g4oCYaW50IGdvb2dsZTo6cHJvdG9i
dWY6OmNvbXBpbGVyOjpjOjpGaWVsZFN5bnRheChjb25zdCBnb29nbGU6OnByb3RvYnVmOjpGaWVs
ZERlc2NyaXB0b3IqKeKAmToKLi9wcm90b2MtYy9jX2hlbHBlcnMuaDoxNzk6NDY6IGVycm9yOiDi
gJhjbGFzcyBnb29nbGU6OnByb3RvYnVmOjpGaWxlRGVzY3JpcHRvckxlZ2FjeeKAmSBoYXMgbm8g
bWVtYmVyIG5hbWVkIOKAmHN5bnRheOKAmQogIDE3OSB8ICAgcmV0dXJuIEZpbGVEZXNjcmlwdG9y
TGVnYWN5KGZpZWxkLT5maWxlKCkpLnN5bnRheCgpID09IEZpbGVEZXNjcmlwdG9yTGVnYWN5OjpT
WU5UQVhfUFJPVE8zID8gMyA6IDI7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+Ci4vcHJvdG9jLWMvY19oZWxwZXJzLmg6MTc5OjgwOiBl
cnJvcjog4oCYU1lOVEFYX1BST1RPM+KAmSBpcyBub3QgYSBtZW1iZXIgb2Yg4oCYZ29vZ2xlOjpw
cm90b2J1Zjo6RmlsZURlc2NyaXB0b3JMZWdhY3nigJkKICAxNzkgfCAgIHJldHVybiBGaWxlRGVz
Y3JpcHRvckxlZ2FjeShmaWVsZC0+ZmlsZSgpKS5zeW50YXgoKSA9PSBGaWxlRGVzY3JpcHRvckxl
Z2FjeTo6U1lOVEFYX1BST1RPMyA/IDMgOiAyOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+Cm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTU2NzogcHJvdG9jLWMvcHJv
dG9jX2dlbl9jLWNfYnl0ZXNfZmllbGQub10gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRpcmVj
dG9yeSAnL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LXBy
b3RvYnVmLWMtMS41LjAnCm1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyODk6IC9o
b21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1wcm90b2J1Zi1j
LTEuNS4wLy5zdGFtcF9idWlsdF0gRXJyb3IgMgoKVGhpcyBpcyBvbiBhIEZlZG9yYSAzOSBzeXN0
ZW0sIGdjYyAxMy54LgoKQ291bGQgeW91IGhhdmUgYSBsb29rPyBBbHNvIE1pY2hhZWwgTm9zdGhv
ZmYgcmVwb3J0ZWQgYSBzZXBhcmF0ZQood2VpcmQpIHBrZy1jb25maWcgaXNzdWUuCgpUaGFua3Mh
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
