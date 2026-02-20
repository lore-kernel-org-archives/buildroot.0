Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234A3C54FD0
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 08:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE0741839;
	Fri, 20 Feb 2026 08:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02_FsUmAj0ND; Fri, 20 Feb 2026 08:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B653341833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771575195;
	bh=TSOEEV45+JjQ9sZ0OIROnHQ/k0V7izMzQJInZTZsAfg=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BmO+3yfOBfyr/dTLEvA8NrHqaTlsW4xcyDSwUYjC6ulI+8WFTGfuF5bRVu0B2cZd/
	 WPuWyAyE44FauQHbNowDqGShkrWI3hsdXDeiGR4KTyoioMY7b41xRfWku7GtEorlZA
	 tgtyUSpyBzrBYeebqBEwBiwvc2aWpNkAglcIv42XcUArjqeQMx05Q6yodcQ3QCnpYR
	 VC6urk1lulj1SarQUk6d0vq40WDyZVZbre+UNkVjTrx1zCrSnFXMHQJLee+q3KOf7i
	 V24nNYzbg0Xy/1LVeYX82fZjMTHSxL8MS8gL6YiYz1ha19baI78Ys4qIEhfkdEtIVf
	 wp8pu9S79v24A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B653341833;
	Fri, 20 Feb 2026 08:13:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69BB4183;
 Fri, 20 Feb 2026 08:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 669F383E19;
 Fri, 20 Feb 2026 08:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_T6vkg639kd; Fri, 20 Feb 2026 08:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26A9483E17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A9483E17
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26A9483E17;
 Fri, 20 Feb 2026 08:13:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9FB49B97B03A; Fri, 20 Feb 2026 09:13:10 +0100 (CET)
Message-ID: <e0164268-1836-426e-8a81-5e2790b8cc3e@rnout.be>
Date: Fri, 20 Feb 2026 09:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: ML_BuildrootUsers <buildroot-users@buildroot.org>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 buildroot-lts-sponsors@buildroot.org
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1771575190; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=ZBMxJjtovHVA2D0KPL3H2/sOE24tMP4ohp2ab5zVc2U=;
 b=bbcFhDB33+QYwcpT9e9TEHz2Mj8h5aeoomtETAZvHqviIkrgnb1QOpxXP8a2ipj24stlOi
 uBmQWUF6MMYO+CX1CdtTUiTBAlJNGp+60Mi8x7Rxd+rpKhoq0y0+ebWrLO0bw90/lgzmHY
 cSfSbnP0GrNEOHD0g8y/q4cHO0+f7gjg/Wl1n8R50BHvYUnIRKB1Ftzj3YozMmZ4oVr3/7
 S1CFaQiLfGhfTdWSCC4/0OEI0IuO8AHUVdojhIux8YE8SAYT+gJlf44K6UfbTdxQf4G4Mf
 /Xl22d+BvGOvgsj8h5bQMhuwbCa9u1pAQuFzUMb31PPmt8+5HSTzD5tWPp8eqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=bbcFhDB3
Subject: [Buildroot] Buildroot 2025.02.11 released
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI1LjAyLjExIGlzIHJlbGVhc2VkIC0gR28gZG93bmxvYWQgaXQgYXQ6CgpodHRwczovL2J1aWxk
cm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI1LjAyLjExLnRhci5negoKb3IKCmh0dHBz
Oi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDIuMTEudGFyLnh6CgpP
ciBnZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QuZ2l0ICgyMDI1LjAyLjExIHRhZykKCkJ1aWxkcm9vdCAyMDI1LjAyLjExIGlzIGEgYnVn
Zml4IHJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLwpzZWN1cml0eSByZWxh
dGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDI1LjAyLjEwIHJlbGVhc2UuCgoKYXZh
aGk6IENWRS0yMDIxLTM0NjgsIENWRS0yMDIzLTM4NDY5LCBDVkUtMjAyMy0zODQ3MCwgQ1ZFLTIw
MjMtMzg0NzEsCiAgIENWRS0yMDIzLTM4NDcyLCBDVkUtMjAyMy0zODQ3MywgQ1ZFLTIwMjQtNTI2
MTUsIENWRS0yMDI0LTUyNjE2LAogICBDVkUtMjAyNS02ODI3NiwgQ1ZFLTIwMjUtNjg0NjgsIENW
RS0yMDI1LTY4NDcxLCBDVkUtMjAyNi0yNDQwMQpiaW5kOiBDVkUtMjAyNS0xMzg3OApidXN5Ym94
OiBDVkUtMjAyNS00NjM5NCwgQ1ZFLTIwMjUtNjA4NzYKZXhwYXQ6IENWRS0yMDI2LTI0NTE1LCBD
VkUtMjAyNi0yNTIxMApnbGliYzogQ1ZFLTIwMjUtMTUyODEsIENWRS0yMDI2LTA4NjEsIENWRS0y
MDI2LTA5MTUKZ251dGxzOiBDVkUtMjAyNS0xNDgzMSwgQ1ZFLTIwMjYtMTU4NApoYXByb3h5OiBD
VkUtMjAyNS0xMTIzMAppbnRlbC1taWNyb2NvZGU6IENWRS0yMDI0LTI0ODUzLCBDVkUtMjAyNS0z
MTY0OApsaWJvcGVuc3NsOiBDVkUtMjAyNS0xMTE4NywgQ1ZFLTIwMjUtMTU0NjcsIENWRS0yMDI1
LTE1NDY4LAogICBDVkUtMjAyNS02NjE5OSwgQ1ZFLTIwMjUtNjgxNjAsIENWRS0yMDI1LTY5NDE4
LCBDVkUtMjAyNS02OTQxOSwKICAgQ1ZFLTIwMjUtNjk0MjAsIENWRS0yMDI1LTY5NDIxLCBDVkUt
MjAyNi0yMjc5NSwgQ1ZFLTIwMjYtMjI3OTYKbGlicG5nOiBDVkUtMjAyNi0yMjY5NSwgQ1ZFLTIw
MjYtMjI4MDEsIENWRS0yMDI2LTI1NjQ2CmxpYnRhc24xOiBDVkUtMjAyNS0xMzE1MQpsaWJ2cHgK
bGludXgtcGFtOiBDVkUtMjAyNC0xMDk2MwpuZ2lueDogQ1ZFLTIwMjUtNTM4NTkKbm9kZWpzOiBD
VkUtMjAyNS0yNzIxMCwgQ1ZFLTIwMjUtNTUxMzAsIENWRS0yMDI1LTU1MTMxLCBDVkUtMjAyNS01
NTEzMiwKICAgQ1ZFLTIwMjUtNTk0NjUsIENWRS0yMDI1LTU5NDY2LCBDVkUtMjAyNi0yMTYzNwpw
eXRob24tZGphbmdvOiBDVkUtMjAyNS0xMzQ3MywgQ1ZFLTIwMjUtMTQ1NTAsIENWRS0yMDI2LTEy
MDcsIENWRS0yMDI2LTEyODUsCiAgQ1ZFLTIwMjYtMTI4NywgQ1ZFLTIwMjYtMTMxMgpweXRob24t
dXJsbGliMzogQ1ZFLTIwMjYtMjE0NDEKc3Ryb25nc3dhbjogQ1ZFLTIwMjUtNjIyOTEKdG9yOiBU
Uk9WRS0yMDI1LTAxNgp2aW06IENWRS0yMDI1LTY2NDc2CndlYmtpdGd0awoKSW5mcmFzdHJ1Y3R1
cmUgdXBkYXRlcy9maXhlczoKCmFybS10cnVzdGVkLWZpcm13YXJlLCBhdDkxYm9vdHN0cmFwMywg
YmFyZWJveCwgbGludXgsIG9wZW5zYmksIG9wdGVlLW9zLAogICB1Ym9vdDogQWRkIHN1cHBvcnQg
Zm9yIGN1c3RvbSBsaWNlbnNlIGZpbGVzCmNvbmZpZy1mcmFnbWVudHMvYXV0b2J1aWxkOiBkcm9w
IGEgbnVtYmVyIG9mIGR1cGxpY2F0ZWQgdG9vbGNoYWlucwpnZW5lcmF0ZS1jeWNsb25lZHg6IGZp
eCBkZXBlbmRlbmNpZXMKTWFrZWZpbGU6IGFkZCBjaGVjay1wYWNrYWdlLWV4dGVybmFsIHRhcmdl
dApwa2ctc3RhdHM6IGFkZCAtTi8tLW5lZWRzLXVwZGF0ZSBvcHRpb24KcGtnLXN0YXRzOiBmaXgg
UnVudGltZUVycm9yIHdpdGggcHl0aG9uIDMuMTQgYXN5bmNpbwpyZWxvY2F0ZS1zZGsuc2g6IHBy
ZS1jYWxjdWxhdGUgZmlsZXMgaW4gbmVlZCBvZiByZWxvY2F0aW9uCnN5c3RlbS9Db25maWcuaW46
IGRvIG5vdCByZWZlcmVuY2UgbWQ1IGZvciBzaGEyNTYgb3B0aW9uCnRlc3RpbmcvcnVuLXRlc3Rz
OiBzcGVjaWZ5IG11bHRpcHJvY2Vzc2luZyBtZXRob2QKdGVzdGluZzogcHl0aG9uLXJlcXVlc3Rz
OiBuZXcgcnVudGltZSB0ZXN0CnRlc3Rpbmc6IHRlc3RfcHl0aG9uLnB5OiBkaXNhYmxlIGludGVy
cHJldGVyIGNvbG9ycwp0ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9maXJld2FsbGQ6IHVzZSBl
eHQyIGluc3RlYWQgb2YgY3BpbwoKVXBkYXRlZCAvIGZpeGVkIHBhY2thZ2VzOiBhc3Rlcmlzaywg
YXQ5MWJvb3RzdHJhcDMsIGF2YWhpLCBiZXJrZWxleWRiLApiaW5kLCBiaXRjb2luLCBicmx0dHks
IGJ1c3lib3gsIGNyeXB0c2V0dXAsIGRhc2gsIGRjM2RkLCBkb2NrZXItZW5naW5lLAplYXN5LXJz
YSwgZWxsLCBleHBhdCwgZnJyLCBnbGliYywgZ251dGxzLCBoYXByb3h5LAppZ21wcHJveHksIGlu
dGVsLW1pY3JvY29kZSwgbGliY2VjLCBsaWJjdXJsLCBsaWJncGhvdG8yLCBsaWJncGlvZDIsCmxp
Yml0ZSwgbGlib3BlbnNzbCwgbGlicG5nLCBsaWJzZWxpbnV4LApsaWJ0YXNuMSwgbGlidWNsLCBs
aWJ2cHgsIGxpYndlYnNvY2tldHMsIGxpbnV4LCBsaW51eC1oZWFkZXJzLApsaW51eC1wYW0sIGxv
Y2FsZWRlZiwgbG9ja2RldiwgbTQsIG1hbnVhbCwgbWNlbG9nLCBtZXNhM2QsIG1wNHYyLAptcGcx
MjMsIG1waXIsIG11cGRmLCBuZXRkYXRhLCBuZ2lueCwgbm9kZWpzLCBwaHAsIHBocC1sdWEsIHBr
Zy11dGlscywKcHl0aG9uMywgcHl0aG9uLWRqYW5nbywgcHl0aG9uLWppbmphMiwgcHl0aG9uLXVy
bGxpYjMsIHJwLXBwcG9lLApydXN0LWJpbmRnZW4sIHNhZmVjbGliLCBzY3JlZW4sIHNoYWRvdywg
c3BhbmRzcCwgc3Ryb25nc3dhbiwgc3dpZywKc3lzbG9nLW5nLCB0b3IsIHVjbGliYywgdWZ0cCwg
dXRpbC1saW51eCwgdmltLCB3ZWJraXRndGssCndpcmVsZXNzLXJlZ2RiLCB4bWxzdGFybGV0LCB6
ZWVrCgpOZXcgcGFja2FnZTogbGlicGFtLXBrY3MxMQoKUmVtb3ZlZCBwYWNrYWdlczogY3JpdSwg
Y3ZzLCBkYnVzLXRyaWdnZXJkLCBkdmRydy10b29scywgbGlic3ZnLCBsaWJzdmctY2Fpcm8sIAps
b2NrZGV2LCBnY29uZiwKCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToK
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNS4w
Mi4xMS9DSEFOR0VTCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5
IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNv
bnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXMgLW4gMjAyNS4wMi4x
MC4uCgogICAgIDM1ICBCZXJuZCBLdWhscwogICAgIDIyICBUaG9tYXMgUGVyYWxlCiAgICAgMTQg
IFBldGVyIEtvcnNnYWFyZAogICAgIDEzICBUaG9tYXMgUGV0YXp6b25pCiAgICAgMTIgIERhcmlv
IEJpbmFjY2hpCiAgICAgIDcgIEtvcnkgTWFpbmNlbnQKICAgICAgNiAgR2l1bGlvIEJlbmV0dGkK
ICAgICAgNSAgVGl0b3VhbiBDaHJpc3RvcGhlCiAgICAgIDQgIEp1bGllbiBPbGl2YWluCiAgICAg
IDQgIFdhbGRlbWFyIEJyb2Rrb3JiCiAgICAgIDMgIEFybm91dCBWYW5kZWNhcHBlbGxlCiAgICAg
IDMgIE1hcmN1cyBIb2ZmbWFubgogICAgICAyICBKb2FjaGltIFdpYmVyZwogICAgICAyICBNaWNo
YWVsIE5vc3Rob2ZmCiAgICAgIDIgIFJhcGhhw6tsIE3DqWxvdHRlCiAgICAgIDIgIFRob21hcyBE
ZXZvb2dkdAogICAgICAxICBCYXJ0IFZhbiBTZXZlcmVuCiAgICAgIDEgIERhbm9taSBNYW5jaGVn
bwogICAgICAxICBFZGdhciBCb25ldAogICAgICAxICBFbCBNZWhkaSBZT1VORVMKICAgICAgMSAg
RmlvbmEgS2x1dGUKICAgICAgMSAgRmxvcmlhbiBMYXJ5c2NoCiAgICAgIDEgIEZyYW5jaXN6ZWsg
U3RhY2h1cmEKICAgICAgMSAgRnJhbmsgVmFuYmV2ZXIKICAgICAgMSAgSmltbXkgRHVyYW5kIFdl
c29sb3dza2kKICAgICAgMSAgS2FkYW1iaW5pIE5lbWEKICAgICAgMSAgTGFuY2UgRnJlZHJpY2tz
b24KICAgICAgMSAgUGllcnJlLVl2ZXMgS2VyYnJhdAogICAgICAxICBSYXBoYWVsIFBhdmxpZGlz
CiAgICAgIDEgIFJvbWFpbiBOYW91cgogICAgICAxICBZYW5uIEUuIE1PUklOCgpSZWdhcmRzLApB
cm5vdXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
