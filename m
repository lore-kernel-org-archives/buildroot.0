Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD3BC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 16:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB92D617AF;
	Fri,  1 Mar 2024 16:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HA09SpqKWkEM; Fri,  1 Mar 2024 16:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2FD9617B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2FD9617B1;
	Fri,  1 Mar 2024 16:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 149BC1BF2F7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 16:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02710838B3
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 16:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kOJc2-yNfUq for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 16:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A25528384B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A25528384B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A25528384B
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 16:56:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CD4BC0006
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 16:56:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rg6BN-006wjy-09
 for buildroot@buildroot.org; Fri, 01 Mar 2024 17:56:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 01 Mar 2024 17:56:24 +0100
Message-ID: <87jzml99hj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.10 released
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
MjMuMDIuMTAgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHA6Ly9idWlsZHJv
b3Qub3JnL2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMy4wMi4xMC50YXIuZ3oKCm9yCgpodHRwOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjMuMDIuMTAudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxk
cm9vdCAyMDIzLjAyLjEwIGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0
ZXJtCnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxh
dGVkIGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIzLjAyLjkgcmVsZWFzZS4KCi0gSW5m
cmFzdHJ1Y3R1cmU6IENQRSBpZGVudGlmaWVycyBhZGRlZCBmb3IgYSBsYXJnZSBudW1iZXIgb2Yg
cGFja2FnZXMKCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGRhcmtodHRwZCwgZXhwYXQsIGZyZWVyZHAs
IGZyciwgZ2xpYmMsIGdudXRscywKICBnc3QxLXBsdWdpbnMtYmFkLCBtYmVkdGxzLCBuZXRhdGFs
aywgcmVkaXMsIHJ1bmMsIHdwZXdlYmtpdCwKICB4c2VydmVyX3hvcmctc2VydmVyLCB4d2F5bGFu
ZCwKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1
ZXMgaW4KICBiYXllcjJyZ2ItbmVvbiwgYnJsdHR5LCBkYXZpbmNpLWJvb3Rjb3VudCwgZG9tb3Rp
Y3osCiAgZW52aXJvbm1lbnQtc2V0dXAsIGZhYWQyLCBmcmVlcmFkaXVzLXNlcnZlciwgZ28sIGdz
dC1vbXgsCiAgZ3N0MS1kZXZ0b29scywgZ3N0MS1saWJhdiwgZ3N0MS1wbHVnaW5zLWJhc2UsIGdz
dDEtcGx1Z2lucy1nb29kLAogIGdzdDEtcGx1Z2lucy11Z2x5LCBnc3QxLXB5dGhvbiwgZ3N0MS1y
dHNwLXNlcnZlciwgZ3N0MS12YWFwaSwKICBnc3RyZWFtZXIxLCBnc3RyZWFtZXIxLWVkaXRpbmct
c2VydmljZXMsIGhhcHJveHksIGxlcHRvbmljYSwgbGlidXdzYywKICBseW54LCBtaWNyb3B5dGhv
biwgbmdyZXAsIG9wZW5jdjQsIG9wZW5jdjQtY29udHJpYiwgcGhwLCByZG1hLWNvcmUsCiAgc2Rs
Miwgc3FsaXRlLCBzeXNsaW51eCwgc3lzc3RhdCwgdXV1LCB3ZWJraXRndGssIHh0ZXJtCgpGb3Ig
bW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9v
dC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMy4wMi4xMAoKVXNlcnMgb2YgdGhl
IGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpN
YW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNl
OgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIzLjAyLjkuLgoKICAgIDU0ICBGYWJyaWNlIEZvbnRhaW5l
CiAgICAyMCAgUGV0ZXIgS29yc2dhYXJkCiAgICAgNyAgQmVybmQgS3VobHMKICAgICA2ICBZYW5u
IEUuIE1PUklOCiAgICAgMyAgQ2hyaXN0aWFuIEhpdHoKICAgICAzICBUaG9tYXMgRGV2b29nZHQK
ICAgICAyICBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvCiAgICAgMiAgQ2hyaXN0aWFuIFN0ZXdhcnQK
ICAgICAxICBBbGVrc2FuZHIgTWFrYXJvdgogICAgIDEgIEF0c3VzaGkgTmVtb3RvCiAgICAgMSAg
QnJhbmRvbiBNYWllcgogICAgIDEgIERhcmlvIEJpbmFjY2hpCiAgICAgMSAgRnJhbmNvaXMgUGVy
cmFkCiAgICAgMSAgR2l1bGlvIEJlbmV0dGkKICAgICAxICBNYXhpbWlsaWFuIFNlbmZ0bGViZW4K
ICAgICAxICBTw6liYXN0aWVuIFN6eW1hbnNraQogICAgIDEgIFRob21hcyBQZXRhenpvbmkKCi0t
IApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
