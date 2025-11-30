Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FA4CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 17:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 857C682268;
	Sun, 30 Nov 2025 17:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T250DFeccj1D; Sun, 30 Nov 2025 17:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD5081EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCD5081EC1;
	Sun, 30 Nov 2025 17:06:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5EFE219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1FA760722
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDnGBKmC6SmV for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 17:06:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CBE0605F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CBE0605F9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CBE0605F9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:06:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1827841573; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 30 Nov 2025 17:06:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vPksU-0000000EHVE-2Xb1;
 Sun, 30 Nov 2025 18:06:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Cc: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 "Yann E. MORIN"
 <yann.morin.1998@free.fr>,  Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <aSv3lJlD1bNlcRGs@landeda> (Yann E. MORIN via buildroot's message
 of "Sun, 30 Nov 2025 08:51:48 +0100")
References: <20251129203454.4193005-2-salvador.joseluis@gmail.com>
 <aSv3lJlD1bNlcRGs@landeda>
Date: Sun, 30 Nov 2025 18:06:26 +0100
Message-ID: <87tsybh2lp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mAyWj2dtnTCBot5N2ELkTD1Bf1nmjbmIrrXbz2zXH+FtrsSrwxYqIyZUP6Ftx3QYc3Dz6GrVMV2x3PMRrHaVc9JpTXgE2pAwr02NeDxVUF2z2voD/miW6I0DbqBL3iNnRL6WMb0tS6Opdx1bYs4aee8kV8w8loXoncnLbjZCol28YxdTW3KsJbTAhw9leuhnlg+CRotxlDWHT7d/UqTyrwrr0ITb1mia4sBlxERJkSB4CzV0mtM372CxtsjMdrbSZi7f4Dyit2AhIX/3ySbLuWQYTkLdlEqsghdnmTfpC18yKH5s3xrg1SCSzY2DcpWUQLhokv4aLw+JYricJUNIyg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=vc4eeqPrFd1YZYp4fvue/4OyeKKva4taydrS3dOf4Eg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=mAyWj2dt
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/check-merged: shift
 args processed by getopts
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

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVp
bGRyb290Lm9yZz4gd3JpdGVzOgoKID4gSm9zw6ksIEFsbCwKID4gT24gMjAyNS0xMS0yOSAyMToz
NCArMDEwMCwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHNwYWtlIHRodXNseToKID4+IFNoaWZ0
IHRoZSBhcmd1bWVudHMgcHJvY2Vzc2VkIGJ5IGdldG9wdHMgc28gdGhhdCBvbmx5IHRoZSByb290
IGRpcmVjdG9yaWVzCiA+PiB0byBjaGVjayByZW1haW4gYXMgYXJndW1lbnRzIGZvciB0aGUgc3Vi
c2VxdWVudCBgZm9yIHJvb3Q7IGRvYCBsb29wLgoKID4gVGhlIGFjdHVhbCBpc3N1ZSB0aGlzIHRy
aWdnZXJzIGlzIHRoYXQgc2hlY2tzIGluIGN1c3RvbSBza2VsZXRvbiBjYXVzZQogPiBidWlsZCBm
YWlsdXJlOgoKID4gICAgIHN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQgLXQgc2tlbGV0b24g
LXUgLWIgL3Vzci9zcmMvc2ltcGxlazhzL3Jvb3Rmcy1za2VsZXRvbgogPiAgICAgVGhlIHNrZWxl
dG9uIGluIC10IGlzIG5vdCBwcm9wZXJseSBzZXR1cDoKID4gICAgICAtIC91c3IvYmluIHNob3Vs
ZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCiA+ICAgICAgLSAv
dXNyL2xpYiBzaG91bGQgZXhpc3QsIGJlIGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3ltbGlu
awogPiAgICAgVGhlIHNrZWxldG9uIGluIHNrZWxldG9uIGlzIG5vdCBwcm9wZXJseSBzZXR1cDoK
ID4gICAgICAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3Qg
YmUgYSBzeW1saW5rCiA+ICAgICAgLSAvdXNyL2xpYiBzaG91bGQgZXhpc3QsIGJlIGEgZGlyZWN0
b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawogPiAgICAgVGhlIHNrZWxldG9uIGluIC11IGlzIG5v
dCBwcm9wZXJseSBzZXR1cDoKID4gICAgICAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBk
aXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCiA+ICAgICAgLSAvdXNyL2xpYiBzaG91bGQg
ZXhpc3QsIGJlIGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawogPiAgICAgVGhlIHNr
ZWxldG9uIGluIC1iIGlzIG5vdCBwcm9wZXJseSBzZXR1cDoKID4gICAgICAtIC91c3IvYmluIHNo
b3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCiA+ICAgICAg
LSAvdXNyL2xpYiBzaG91bGQgZXhpc3QsIGJlIGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3lt
bGluawogPiAgICAgWy4uLl0KCiA+IFRoZSByZWFzb24gdGhpcyB3YXMgbm90IGNhdWdodCBlYXJs
aWVyLCBpcyB0aGF0IHRoZSBzY3JpcHQgd2FzIG9ubHkKID4gdGVzdGVkIGFnYWluc3Qgb3Zlcmxh
eXMsIG5vdCBjdXN0b20gc2tlbGV0b25zLiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuCiA+IHNrZWxl
dG9ucyBhbmQgb3ZlcmxheXMsIGlzIHRoYXQgdGhlIHRlc3RzIGFyZSBzdHJpY3QgZm9yIHNrZWxl
dG9ucywgYW5kCiA+IGxheCBmb3Igb3ZlcmxheXMuIFRodXMsIHdpdGggYSBjdXN0b20gc2tlbGV0
b24sIHdoZXJlIHRoZSBtZXJnZWQKID4gc3ltbGlua3MgYXJlIG1pc3NpbmcsIHRoZSB0ZXN0cyBn
byB3cm9uZyBhbmQgcmVwb3J0IGFtIGluY29ycmVjdCBpc3N1ZSwKID4gd2hpbGUgd2l0aCBvdmVy
bGF5cywgdGhlIGNoZWNrcyBmYWlscywgYnV0IHRoZXkgYXJlIG5vdCBjcml0aWNhbCBmb3IKID4g
b2J2ZXJsYXlzLCBzbyAgdGhlIHNjcmlwdCBpcyBzaWxlbnQgYW5kIHN1Y2VlZHMuCgogPiBJIHRo
aW5rIGEgYmV0dGVyIGNvbW1pdCBsb2cgd291bGQgYmU6CgogPiAgICAgc3VwcG9ydC9zY3JpcHRz
L2NoZWNrLW1lcmdlZDogZml4IGNoZWNraW5nIGN1c3RvbSBza2VsZXRvbnMKCiA+ICAgICBXaGVu
IHVzaW5nIGEgY3VzdG9tIHNrZWxldG9uIHdoZXJlIHRoZSBtZXJnZWQgc3ltbGlua3MgYXIgZW1p
c2luZywKID4gICAgIHRoZSBidWlsZCBmYWlscyB3aXRoIGVycm9ycyBsaWtlOgoKID4gICAgICAg
ICBzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkIC10IHNrZWxldG9uIC11IC1iIC91c3Ivc3Jj
L3NpbXBsZWs4cy9yb290ZnMtc2tlbGV0b24KID4gICAgICAgICBUaGUgc2tlbGV0b24gaW4gLXQg
aXMgbm90IHByb3Blcmx5IHNldHVwOgogPiAgICAgICAgICAtIC91c3IvYmluIHNob3VsZCBleGlz
dCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCiA+ICAgICAgICAgIC0gL3Vz
ci9saWIgc2hvdWxkIGV4aXN0LCBiZSBhIGRpcmVjdG9yeSwgYW5kIG5vdCBiZSBhIHN5bWxpbmsK
ID4gICAgICAgICBUaGUgc2tlbGV0b24gaW4gc2tlbGV0b24gaXMgbm90IHByb3Blcmx5IHNldHVw
OgogPiAgICAgICAgICAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFu
ZCBub3QgYmUgYSBzeW1saW5rCiA+ICAgICAgICAgIC0gL3Vzci9saWIgc2hvdWxkIGV4aXN0LCBi
ZSBhIGRpcmVjdG9yeSwgYW5kIG5vdCBiZSBhIHN5bWxpbmsKID4gICAgICAgICBbLi4uXQoKID4g
ICAgIENvbW1pdCA3OTNlYmQ1ZDI4MDkgKHN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQ6IHVz
ZSBnZXRvcHRzCiA+ICAgICBpbnN0ZWFkIG9mIGdldG9wdCkgaW50b2R1Y2VkIGEgZmxhd2VkIHVz
ZSBvZiBnZXRvcHRzOiB1bmxpa2UgZ2V0b3B0LAogPiAgICAgZ2V0b3B0cyBkb2VzIG5vdCBjb251
bWUgdGhlIHBvc2l0aW9uYWwgYXJndW1lbnRzLiBUaGlzIGNhdXNlcyB0aGUKID4gICAgIGNoZWNr
IGZvciBkaXJlY3Ryb3J5IHZhbGlkaXR5IHRvIGFsbCBjaGVjayBlYWNoIG9wdGlvbiBhcyBpZiB0
aGV5CiA+ICAgICB3ZXJlIGRpcmVjdG9yaWVzLgoKID4gICAgIEZvciBvdmVybGF5cywgdGhpcyBp
cyB0cmFuc3BhcmVudGx5IGlnbm9yZWQsIGJlY2F1c2UgdGhlIGNoZWNrcyBhcmUKID4gICAgIG9u
bHkgbGF4IGZvciBvdmVybGF5cyAobWlzc2luZyBzeW1saW5rcyBhcmUgT0spLgoKID4gICAgIEhv
d2V2ZXIsIGZvciBza2VsZXRvbnMsIHRoZSBjaGVja3MgYXJlIHN0cmljdC4gQmVjYXVzZSBvZiB0
aGF0LCBhCiA+ICAgICBtaXNzaW5nIHN5bWxpbmsgaXMgY29uc2lkZXJlZCBhbiBlcnJvciwgd2hl
biBpdCBzaG91bGQgYmUgY29uc2lkZXJlZAogPiAgICAgYXMgYmVpbmcgT0suCgogPiAgICAgVGhl
IGZpeCBpcyB0byBhY3R1YWxseSBjb25zdW1lIHRoZSBwb3NpdGlvbmFsIGFyZ3MgdG8gb25seSBr
ZWVwIHRoZQogPiAgICAgbGlzdCBvZiBkaXJlY3RwcmllcyB0byB2YWxpZGF0ZSwgbGlrZSBpcyBk
b25lIGZvciBleGFtcGxlIGluCiA+ICAgICBzdXBwb3J0L2Rvd25sb2FkL2RsLXdyYXBwZXIuCgog
PiAgICAgRml4ZXM6IDc5M2ViZDVkMjgwOTVjOGRmNDVhMGQxODNkMjczZDhhODRiM2YwYTQKID4g
ICAgIFJldmlld2VkLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4K
ID4gICAgIEFja2VkLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4K
ID4gICAgIENjOiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KID4gICAgIFNp
Z25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNA
Z21haWwuY29tPgoKID4gVGhhbmsgeW91IEpvc8OpIGZvciByZXBvcnRpbmcgYW5kIGZpeGluZyB0
aGUgaXNzdWUhIFRoYW5rIHlvdSBFZGdhciBmb3IKID4gZ2l2aW5nIGEgaGVscGluZyBoYW5kIQoK
Q29tbWl0dGVkIHdpdGggWWFubnMgY29tbWl0IG1lc3NhZ2UgKG1pbnVzIGEgZmV3IHR5cG9zKSwg
dGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
