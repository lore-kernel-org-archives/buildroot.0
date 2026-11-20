Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47617606A338
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Jc4lHk2K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=dcNerndO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E39B60760;
	Fri, 20 Nov 2026 18:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pENzytK736xz; Fri, 20 Nov 2026 18:30:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2786560669
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795199436;
	b=YYJSC6ETNicEy+qepXYksYrGlkcsnhdxexB8ZAdurmTyl0Q8+ZeP6LpFt9urFffg0XF4
	 y/A3ABeUCO9A59X1fEpMoeVbOt0DoGeuBBKAqK18V9wDnMU/PTPKsAUMjW9HJ7LxatGaJ
	 717/8YZox65g8nGFZGdfKHJ3iVEg4kC5fGm5/8ZKam/Nj6o1Ut4trp9zL2Mf+OX2Au5sU
	 vKNllnHXgzbaq1kYNZcPry+uM/FueWsnrWDI9IXTzSfrdqsVR4B+yNMhCWXiMdA1lLR+k
	 6LAi08PG9qb/o9NtCo1WcxLNBcBa97xXVQpsMRiQ3EOJ5U0zdBZK1c8uEl8XJvxu6+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795199436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=KQ3fNiixJZWj48D3kypkLhKe287moQOV58kbjQaJhxI=;
	b=BC+emOUbdTBlrQCtfV38m5H3h5LuGQRct9WCpvI1APTu4PZox/4MEUwzykLNmsOWMubQ
	 VeIDBxmjDRoDFgC9lDNQRAteOSKB4lfFg6tVA3T/fAlvvJXFILdAm6Ie4Vs9Ix9bqwRTe
	 9+mc9VoZSdMeGr65SB2dbNA8znxnz2IDYioVb1MaZxuRjR4mmTCz9bh3Z5wht6LNwesDh
	 tKfkLBpIzTvZ9+EMbRneUItwSBPIsajnFzOJfjiHeLCxh8Jdr8Z70f6j7gi3wKryMN9Dt
	 XiLCTgP5US/5ci2z1KTLlWCGYVeYhVuhuEMFtknBVsPd7TDrYp2fcpmwKdIR/lm6vew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=dcNerndO;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795199436;
	bh=KQ3fNiixJZWj48D3kypkLhKe287moQOV58kbjQaJhxI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jc4lHk2KXW3zefdFzk8V0XRkPjRu/KookGYkbg726m/NcEVwr3suW4E/VNWkQf9CO
	 ppXO32hJX2prRE3rpI51W43c1oc1BMM/j2a0H1pc6Fd2Kn+dpSupAFtlbYkAkpeSgo
	 M3r02+yPrBO7FpeUnlCa/4NLifXknhMLp0m5XqTZ1/Xz5U8/NtSbLTGnVbQCY4ru6E
	 cNmKis8ffFEci2mlSOLOssJJhfqvCbAVC5U6/CnNu3fBwKM2Qa6MeE5zqxqAhhDRif
	 6fPBCc4PLuq6+GGocC1Mlx592lYCyJrjbH42Toj59CMRm3kNQx2509fvhTgToFiGkx
	 Mo9y7t9nVQUfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2786560669;
	Fri, 20 Nov 2026 18:30:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 088BD310
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 18:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E272B60669
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 18:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5h0ZkWhcro2F for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 18:30:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D1676065D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dcNerndO
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D1676065D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 18:30:32 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id UTNWxGsgnmlDxUTNWxg01M; Fri, 20 Nov 2026 19:30:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795199430; bh=H16wUXL13WKfBIaKF7gTLUbr2Ng6RJojcHc6Wb2i7dY=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=dcNerndOIFenGpU1iG4OWAjyxovWBDgzNxkBhyaenBUq8IbMzee8rfV+5omesFdot
 FqWrncSfvxzHcJLsNBbFY2fBe6gwwOXnkiyAWbaGlS5RHLKL18zs1YTwQce9y0SqmW
 XAW+rsilO+4X1LCqJUpbLqKjlLONcoU47VyE9QRf1XQGu2TzJLPh/XLcuIbEUvchrf
 8WBfGAONDX3ewpwtk5Xjl5GY6Qr51Vl8tqM2Yl2QF2J4k7xK+uCL9BDkzBeJboUgch
 ZV3jU7K003C82YBgnJXSbrdMQuIw+9ZXTEj2oVuz4Kxqg/yCFOAADjRxT22dwwNpX8
 KzOFK3fzppN2A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Nov 2026 19:30:29 +0100
Message-ID: <20261120183029.238611-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfATae1EbKXbZYdAhbH9Si5WquvMsKCs/aPQ0VI0Yj2AW3klQPzZ+xl1sYPaf1NZWSL40TURrBvXw7VCKw6YdXwEi0Cnmo/snCP5wKzwvF7BRO6qw7EI1
 HEwzQ+VyyhRVntykPlk3DgSO6aCx5zWbbv66IMLJloLhd9RLx0oDK0Es6gnQnPEMD2eMYMKIaXb54gZQksDmSVdHeM0S68psOxA5GvMH0lmJJLDMjs3H91f9
 pq2ZKU8x5pcESbLOENA23BxCK968KG+VssSlOrQ/n4VmaWWtNBczy5Y8KO93eMxX
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2026-11-06
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHN1bnhpLW1hbGktdXRnYXJkLWRyaXZlciBhdCBnaXQgdmVyc2lvbiBiNDdmNzRjOSBpcyBm
YWlsaW5nIHRvCmJ1aWxkIHdpdGggTGludXggNy4wKyBkdWUgdG8gTGludXggY29tbWl0cyA1OTBk
MzU2YWE0MzMgKCJtbTogdXBkYXRlCnNobWVtX1trZXJuZWxdX2ZpbGVfKigpIGZ1bmN0aW9ucyB0
byB1c2Ugdm1hX2ZsYWdzX3QiKSBhbmQKNTJhOWU5Y2QxODFmICgibW06IHJlbmFtZSB6YXBfdm1h
X3B0ZXMoKSB0byB6YXBfc3BlY2lhbF92bWFfcmFuZ2UoKSIpLgoKVGhpcyBuZXcgdmVyc2lvbiBm
aXhlcyB0aGUgaXNzdWUgYW5kIGJ1aWxkcyB1cCB0byBMaW51eCA3LjMuCgpGaXhlczoKCiAgICBs
aW51eC9tYWxpX21lbW9yeV9jb3cuYzozODQ6MjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlv
biBvZiBmdW5jdGlvbiDigJh6YXBfdm1hX3B0ZXPigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb25dCiAgICBsaW51eC9tYWxpX21lbW9yeV9zd2FwX2FsbG9jLmM6ODU6OTE6IGVycm9y
OiBpbmNvbXBhdGlibGUgdHlwZSBmb3IgYXJndW1lbnQgMyBvZiDigJhzaG1lbV9maWxlX3NldHVw
4oCZCgpDby1BdXRob3JlZC1CeTogQ2xhdWRlIE9wdXMgNS41IDxub3JlcGx5QGFudGhyb3BpYy5j
b20+ClNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tPgotLS0KIHBhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQtZHJpdmVyL3N1
bnhpLW1hbGktdXRnYXJkLWRyaXZlci5oYXNoIHwgMiArLQogcGFja2FnZS9zdW54aS1tYWxpLXV0
Z2FyZC1kcml2ZXIvc3VueGktbWFsaS11dGdhcmQtZHJpdmVyLm1rICAgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3N1bnhpLW1hbGktdXRnYXJkLWRyaXZlci9zdW54aS1tYWxpLXV0Z2FyZC1kcml2ZXIu
aGFzaCBiL3BhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQtZHJpdmVyL3N1bnhpLW1hbGktdXRnYXJk
LWRyaXZlci5oYXNoCmluZGV4IDBiNWRjOWMyZjguLjgzMmEzMWJmY2YgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2Uvc3VueGktbWFsaS11dGdhcmQtZHJpdmVyL3N1bnhpLW1hbGktdXRnYXJkLWRyaXZlci5o
YXNoCisrKyBiL3BhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQtZHJpdmVyL3N1bnhpLW1hbGktdXRn
YXJkLWRyaXZlci5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNo
YTI1NiAgYjBjZjI2NjI1ZGIxMzk4OWJlNTQ4NDRkMzYyNWU2OTE4YmVlNmQ0YWU2ZDA1NGRhMTYx
YTJiZjllMzY2NTUzMiAgc3VueGktbWFsaS11dGdhcmQtZHJpdmVyLWI0N2Y3NGM5MmZiY2JkZjE3
NWExNjA1MmQxYjBjZTgzNDVlZmM2YjIudGFyLmd6CitzaGEyNTYgIDIzZjIzZGM1ZDBiOGE3NmFk
MmJlYTgyYzA5MGQxMzMxNjBlNGJlZDAxNTU5YjViZmJmZDBkZDRmMzYxNDQxMzggIHN1bnhpLW1h
bGktdXRnYXJkLWRyaXZlci1lZDc1NDM4ZWYxZjQ2NGYzZTEzYTU2OGM4YzM3MDhlNjgzNTlkZGU4
LnRhci5negogc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1
MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N1
bnhpLW1hbGktdXRnYXJkLWRyaXZlci9zdW54aS1tYWxpLXV0Z2FyZC1kcml2ZXIubWsgYi9wYWNr
YWdlL3N1bnhpLW1hbGktdXRnYXJkLWRyaXZlci9zdW54aS1tYWxpLXV0Z2FyZC1kcml2ZXIubWsK
aW5kZXggMzg5NDZhYTFlNC4uMjVmNzQwMGMzMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdW54aS1t
YWxpLXV0Z2FyZC1kcml2ZXIvc3VueGktbWFsaS11dGdhcmQtZHJpdmVyLm1rCisrKyBiL3BhY2th
Z2Uvc3VueGktbWFsaS11dGdhcmQtZHJpdmVyL3N1bnhpLW1hbGktdXRnYXJkLWRyaXZlci5tawpA
QCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVNVTlhJX01BTElf
VVRHQVJEX0RSSVZFUl9WRVJTSU9OID0gYjQ3Zjc0YzkyZmJjYmRmMTc1YTE2MDUyZDFiMGNlODM0
NWVmYzZiMgorU1VOWElfTUFMSV9VVEdBUkRfRFJJVkVSX1ZFUlNJT04gPSBlZDc1NDM4ZWYxZjQ2
NGYzZTEzYTU2OGM4YzM3MDhlNjgzNTlkZGU4CiBTVU5YSV9NQUxJX1VUR0FSRF9EUklWRVJfU0lU
RSA9ICQoY2FsbCBnaXRodWIsYmVuZXR0aS1lbmdpbmVlcmluZyxzdW54aS1tYWxpLCQoU1VOWElf
TUFMSV9VVEdBUkRfRFJJVkVSX1ZFUlNJT04pKQogU1VOWElfTUFMSV9VVEdBUkRfRFJJVkVSX0RF
UEVOREVOQ0lFUyA9IGxpbnV4CiBTVU5YSV9NQUxJX1VUR0FSRF9EUklWRVJfTElDRU5TRSA9IEdQ
TC0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
