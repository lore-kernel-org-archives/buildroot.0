Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7D6C79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 17:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 940E580996;
	Mon,  7 Sep 2026 17:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enMGlKECcB4b; Mon,  7 Sep 2026 17:38:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5F14580972
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788802697;
	b=FVr0s/IHt7tu4P1DomBHLZHbXkrtPzhkWWbeLBN9q2GDyQ/WUPJjdWTNtPgP9zsqzhes
	 JkiNpe0+j5CK3eOPq14bJyX/k5IhOnKhGnYjMo1S4ncOe9bDqjHj1rUhp91jHF16nucUP
	 o5fChkumaxhSQk4m2mZ/WM4eOt0p/uYZdXSoRW0kmWjW9xe/e46yOZVytJaRlPVUUKivz
	 DlfhHoYQLD/Y2qscJptefybor+laA/+AIyJQcvQcnvlkfjRCVM9F0e06nyJ/nXrWjSRDr
	 gxpRcZQJWtR6mFABmrQp6yQhHZ2mqrXDSWh8T+025strK2q1IFcOMIJl+3bx0gzEvLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788802697;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tK3oZjqX8+trmWelJg2qC/4flMvwtjLi3W/W4qPetW8=;
	b=VoVxZDk6i86xCDo2UBZbr7YTe35kxzuuPVLtuK57VaMo+yZrehQ2AFopqDicKE95vltw
	 WPG0nYRN8eqbiRtpejFQdh6BB69Vg0lRqmIH2jqoZ+T5Y8HM9rFpNyY0gc4ne38nTFlJ2
	 Li/mreRh49ggxHILMJdPkNfPxZ457QjqyCQSixGcouZ5IAimjJ0KcLfX+Qan5qMIEPTPo
	 ZKw9OPO2bxFzicCV1v6rKsFmMbvT1UE70aQm5KDWahXcb9dYQc/tk3KNo5yRvfIxHrdJK
	 HXuSNo9jvVP8A5hrOdzbvQOzJpnwFcvjS3bV0m2v6Mm35kuldHdIXov2iucpsOBzIUg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788802697;
	bh=tK3oZjqX8+trmWelJg2qC/4flMvwtjLi3W/W4qPetW8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Sxa3yCXYEaNQhvpaZAp9m51ZrSBvecCnlyt8DSF1hvn41XEMODc6/XzGMC/2VziHB
	 WGaRzbSojOtYNGwy3gcDXbNHkrqHVLU8a+b/BZMeEPlFbTskC3E3YU/EspmlA9p8Vo
	 qq8ioGPM5O/2wGpsh7HGLb/QEedRWbHegOYd02nNPxO9Gv77Ur5DQWpasr6HlhrAWC
	 +gWJOwu0k0qD5K9A/o1+SMFNY/DjJg8vRX4+BKc5dzWSi7PdLZEaftT2gwv4tLaJbg
	 Zby4ydjdI9zG8hIsM6ug2TUO9XiYqbKBCIxtH/ZZELYj2KfcRSmsMs7STXfHmhMrdx
	 nIs5oGYkSMZYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F14580972;
	Mon,  7 Sep 2026 17:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F52DAEB
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84F20404A1
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPlig3AqrDJ8 for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 17:38:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A9C04040C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788802694;
 b=pE97RLk41DVnZjj5f0p60mUlzHuLaqJmSOnzBmRhTJBTcGBNCA+kiCUbiFGY7UOv0fpI
 AY6gSRtf7Sq72B6Bb4Mhuvd0iNqn0/LUwsFCnFYayegqjTs4k3pOXJ1imuvDk/KEvWZo2
 XJ8hkLNtw6kUxF5wgJGm/4a0DXAET6s+gVUL4D125dqnpJnKTLMoSrob6XdNKpHgO5eCf
 fWks8F6/wd0kswaK6fYedrMEZyoOTrgOi5rBGckTffewzxbkQcKfxCsFqXvPTy0D3z/ej
 0V/1N7bAOVHOOhtR46sF01fxZD3M/vo1cQx6tEEcGKtP1k/S3T2VVTLw3Rs3Y9ZB0zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788802694;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=9hMyTe9UUeTq7bK6a9eIqapjnayx5Cs/MJ+sYVUVhVY=;
 b=WP5GHuBwOiqBGHJTAnSXX9oJKZhIu+LFo0lG36Haqyi3tHs2N6A3ekGwO/GCkm6C6dJT
 ZmWD69jzsg/N20UovWFCk0ETZZ9/pGuikJMcZzTsy3hLHpoxe9I8KQkQ7K/gu/ZVPtjBR
 sOEgomMGAivrCAmDEFGHZ8uqhZSHhCbGny8M7AeGHkptWaj7vcnuYrFV2SgdyGuSdOb4p
 ALuSJ4AZCD7Xk14y5qgJW43w7aTOYbPZOTbDnwk5bi94XwQCswkwXR8oyONMVuyQ2vwtE
 pvdSafjXiDg79midUR3T7mBqIAZdtynw/I12AnKszVAwTQPWPMzLSC8cI8mWDrIeONQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=tkos.co.il; 
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=OSP+g2q7; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A9C04040C
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:38:13 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 736AD4400C6;
 Mon,  7 Sep 2026 20:37:49 +0300 (IDT)
To: buildroot@buildroot.org
Date: Mon,  7 Sep 2026 20:36:08 +0300
Message-ID: <48f3d7ba06cc6490b6c018243840d9900adf0dfe.1788802568.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/strace: fix build with uclibc
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IGExZTI1ZmU3MDUxICgicGFja2FnZS9zdHJhY2U6IGJ1bXAgdmVyc2lvbiB0byA3LjIi
KSBicmVha3Mgc3RyYWNlCmJ1aWxkIHdpdGggdWNsaWJjIGJlY2F1c2Ugb2YgbWlzc2luZyBoZWFk
ZXIuIEFkZCBhIHBhdGNoIHRvIGZpeCB0aGF0LgoKRml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvcmVzdWx0cy8wNTQ3MDU2NTIwMjdkOTkwZmIxYjQxOGVkNGEzYzEyOWZiMGNk
ZmUzLwoKU2lnbmVkLW9mZi1ieTogQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KLS0t
CiAuLi4vMDAwMS1kZWZzLmgtZml4LWJ1aWxkLXdpdGgtdUNsaWJjLnBhdGNoICAgfCA0MSArKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3RyYWNlLzAwMDEtZGVmcy5oLWZpeC1idWlsZC13aXRoLXVD
bGliYy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3RyYWNlLzAwMDEtZGVmcy5oLWZpeC1i
dWlsZC13aXRoLXVDbGliYy5wYXRjaCBiL3BhY2thZ2Uvc3RyYWNlLzAwMDEtZGVmcy5oLWZpeC1i
dWlsZC13aXRoLXVDbGliYy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwMDAuLjEyMDEyMWE0OTkyYwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvc3RyYWNlLzAw
MDEtZGVmcy5oLWZpeC1idWlsZC13aXRoLXVDbGliYy5wYXRjaApAQCAtMCwwICsxLDQxIEBACitG
cm9tIDFmZDY0NDA1NGIwNjE4OTg3MTUwMmIzZmMwMmY5OGQ5NzA2MDEyNWUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitNZXNzYWdlLUlEOiA8MWZkNjQ0MDU0YjA2MTg5ODcxNTAyYjNmYzAyZjk4
ZDk3MDYwMTI1ZS4xNzg4ODAxNjcwLmdpdC5iYXJ1Y2hAdGtvcy5jby5pbD4KK0Zyb206IEJhcnVj
aCBTaWFjaCA8YmFydWNoQHRrb3MuY28uaWw+CitEYXRlOiBNb24sIDcgU2VwIDIwMjYgMjA6MTE6
NTEgKzAzMDAKK1N1YmplY3Q6IFtQQVRDSF0gZGVmcy5oOiBmaXggYnVpbGQgd2l0aCB1Q2xpYmMK
K01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworQ29tbWl0IGVlNTQ1OTUzMTI4
MGYgKCJvcGVuOiByZWZhY3RvciBzcHJpbnRfb3Blbl9tb2RlczY0IHRvIHN1cHBvcnQKK211bHRp
cGxlIHhsYXQgdGFibGVzIikgYWRkZWQgYSByZWZlcmVuY2UgdG8gdmFfbGlzdCwgYnV0IGRpZCBu
b3QgYWRkIHRoZQorcmVxdWlyZWQgaGVhZGVyLiBUaGlzIGJyZWFrcyBidWlsZCB3aXRoIHVDbGli
YzoKKworSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGJqbS5jOjEyOgorZGVmcy5oOjEwNjA6NTM6IGVy
cm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh2YV9saXN04oCZCisgMTA2MCB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZW51bSB4bGF0X3N0eWxlLCB2YV9saXN0IHhsYXRzKTsK
KyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn4KKworSW5jbHVkZSBzdGRhcmcuaCB0byBmaXggdGhlIGJ1aWxkLgorCitVcHN0
cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvcHVsbC80MjAKK1NpZ25lZC1v
ZmYtYnk6IEJhcnVjaCBTaWFjaCA8YmFydWNoQHRrb3MuY28uaWw+CistLS0KKyBzcmMvZGVmcy5o
IHwgMSArCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQgYS9z
cmMvZGVmcy5oIGIvc3JjL2RlZnMuaAoraW5kZXggOTFhYTMyYzA4NWZlLi4zY2RhZTA0ZDE5ZjIg
MTAwNjQ0CistLS0gYS9zcmMvZGVmcy5oCisrKysgYi9zcmMvZGVmcy5oCitAQCAtMjQsNiArMjQs
NyBAQAorICMgaW5jbHVkZSA8dW5pc3RkLmg+CisgIyBpbmNsdWRlIDxzdGRsaWIuaD4KKyAjIGlu
Y2x1ZGUgPHN0ZGlvLmg+CisrIyBpbmNsdWRlIDxzdGRhcmcuaD4KKyAvKiBPcGVuLWNvZGluZyBp
c3ByaW50KGNoKSBldCBhbCBwcm92ZWQgbW9yZSBlZmZpY2llbnQgdGhhbiBjYWxsaW5nCisgICog
Z2VuZXJhbGl6ZWQgbGliYyBpbnRlcmZhY2UuIFdlIGRvbid0ICp3YW50KiB0byBkbyBub24tQVND
SUkgYW55d2F5LgorICAqLworLS0gCisyLjUzLjAKKwotLSAKMi41My4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
