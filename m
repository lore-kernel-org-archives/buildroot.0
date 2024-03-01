Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA9BC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E2D380BB0;
	Fri,  1 Mar 2024 13:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6NzoLFjeGWO; Fri,  1 Mar 2024 13:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D06480BD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D06480BD8;
	Fri,  1 Mar 2024 13:39:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 125401BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C47180BD8
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5jkih7K5o2y for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D18380BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D18380BB0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D18380BB0
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:39:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4659A1C0002
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:39:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rg37A-006oq2-1Y
 for buildroot@buildroot.org; Fri, 01 Mar 2024 14:39:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 01 Mar 2024 14:39:52 +0100
Message-ID: <87o7by840n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2023.11.2 released
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjMuMTEuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjExLjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjExLjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjExLjIgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MTEuMSByZWxlYXNlLgoKLSBJbmZyYXN0cnVjdHVyZTogQ1BFIGlkZW50aWZpZXJzIGFkZGVkIGZv
ciBhIGxhcmdlIG51bWJlciBvZiBwYWNrYWdlcy4KCi0gTmV3IHBhY2thZ2VzOiBweXRob24tYml0
YXJyYXkKCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGRhcmtodHRwZCwgZXhwYXQsIGZyZWVyZHAsIGZy
ciwgZ2xpYmMsIGdudXRscywKICBnc3QxLXBsdWdpbnMtYmFkLCBtYmVkdGxzLCBuZXRhdGFsaywg
cmVkaXMsIHJ1bmMsIHdwZXdlYmtpdCwKICB4c2VydmVyX3hvcmctc2VydmVyLCB4d2F5bGFuZAoK
LSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBp
bgogIGJheWVyMnJnYi1uZW9uLCBicmx0dHksIGNvZywgY3BpbywgY3JpdSwgZGF2aW5jaS1ib290
Y291bnQsCiAgZGVwb3QtdG9vbHMsIGRoY3BjZCwgZG9tb3RpY3osIGVudmlyb25tZW50LXNldHVw
LCBmYWFkMiwKICBmbHV0dGVyLWVuZ2luZSwgZmx1dHRlci1nYWxsZXJ5LCBmbHV0dGVyLXBpLCBm
bHV0dGVyLXNkay1iaW4sCiAgZnJlZXJhZGl1cy1zZXJ2ZXIsIGdvLCBnc3Qtb214LCBnc3QxLWRl
dnRvb2xzLCBnc3QxLWxpYmF2LAogIGdzdDEtcGx1Z2lucy1iYXNlLCBnc3QxLXBsdWdpbnMtZ29v
ZCwgZ3N0MS1wbHVnaW5zLXVnbHksIGdzdDEtcHl0aG9uLAogIGdzdDEtcnRzcC1zZXJ2ZXIsIGdz
dDEtdmFhcGksIGdzdHJlYW1lcjEsIGdzdHJlYW1lcjEtZWRpdGluZy1zZXJ2aWNlcywKICBoYXBy
b3h5LCBoaXJlZGlzLCBsZXB0b25pY2EsIGxpYmdsaWIyLCBsaWJwMTEsIGxpYnJlc3NsLCBsaWJ1
d3NjLAogIGx5bngsIG1pY3JvcHl0aG9uLCBuZ3JlcCwgb3BlbnNzaCwgb3BlbmN2NCwgb3BlbmN2
NC1jb250cmliLCBvcGVudnBsLAogIHBldGl0Ym9vdCwgcGhwLCBweXRob24tYml0c3RyaW5nLCBw
eXRob24tbWluaW1hbG1vZGJ1cywgcHl0aG9uLW51bXB5LAogIHJkbWEtY29yZSwgcmVmcG9saWN5
LCBzZGwyLCBzcWxpdGUsIHN5c2xpbnV4LCBzeXNsb2ctbmcsIHN5c3N0YXQsIHRvciwKICB1dGls
LWxpbnV4LCB2dWxrYW4tbG9hZGVyLCB3ZWJraXRndGssIHdlc3Rvbiwgd2xyb290cywgeHRlcm0K
CkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXQuYnVp
bGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIzLjExLjIKClVzZXJzIG9m
IHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRl
LgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVs
ZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMy4xMS4xLi4KCiAgICA2NSAgRmFicmljZSBGb250
YWluZQogICAgMjEgIFBldGVyIEtvcnNnYWFyZAogICAgMTEgIEFkYW0gRHVza2V0dAogICAgMTAg
IFlhbm4gRS4gTU9SSU4KICAgICA2ICBCZXJuZCBLdWhscwogICAgIDQgIFJvbWFpbiBOYW91cgog
ICAgIDQgIFRob21hcyBEZXZvb2dkdAogICAgIDMgIENocmlzdGlhbiBIaXR6CiAgICAgMiAgQWRy
aWFuIFBlcmV6IGRlIENhc3RybwogICAgIDIgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgMiAgVGhv
bWFzIFBldGF6em9uaQogICAgIDEgIEFsZWtzYW5kciBNYWthcm92CiAgICAgMSAgQXRzdXNoaSBO
ZW1vdG8KICAgICAxICBCcmFuZG9uIE1haWVyCiAgICAgMSAgRGFyaW8gQmluYWNjaGkKICAgICAx
ICBEYXZpZCBCYXJiaW9uCiAgICAgMSAgRmFiaW8gRXN0ZXZhbQogICAgIDEgIEZyYW5jb2lzIFBl
cnJhZAogICAgIDEgIEdyYWVtZSBTbWVjaGVyCiAgICAgMSAgTWFyY3VzIEhvZmZtYW5uCiAgICAg
MSAgTWF4aW1pbGlhbiBTZW5mdGxlYmVuCiAgICAgMSAgU8OpYmFzdGllbiBTenltYW5za2kKICAg
ICAxICBUaXRvdWFuIENocmlzdG9waGUKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
