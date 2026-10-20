Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C33606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KHBE+CE8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFCD381095;
	Tue, 20 Oct 2026 10:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1ZVYlt7Dvf1; Tue, 20 Oct 2026 10:18:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B34188109A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491513;
	b=nd2EhTl9feaWqMYVxbvv8xkUqZCRvH+8ZFX0x5wKaTWix9sbr8A4Zm84KinZXiUNKCAn
	 CKAeYKrO8es0PuHQdOoSAWVvU5/Yl/mIXR10YcrCXAGgSRdZSryK1G9aHQnMGyqXqRqyD
	 AXQf4Hn2lC+uOo5yM1psi2gzubu7Aof1vs2rm2O2QxbsibkRlofkiOfXo57QYD5woFm8t
	 ksWcBqWS0wvY1C1rfyFaaedV5pi17e/O+DaILbsNJYZdDeNWiAo7iNd+Nwk+/uDwPM4NN
	 65hLeRGx6YAsL2FH6xTkKn1Xv7/X5bhFmXtLVRQcNDiTpX1J5bsVD2OAP8lGTsCyteA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=mHuaMbmkq2Mi/hbcw5vfahU40ZMg4+OCEzztdcDtgJc=;
	b=BW5bW1cJAWYHsUd/A6UnMh/RvfHp+4d74baqqeUzNrPTjKNh9vV+jj0HVYA77kN260gF
	 iH8m3yO+gdzayH9JLrYvtfvZS8DBw9r4tSTZwkpW2ov9qWZOd9KuXcYXtUlpLtpfjRHz4
	 T0swiotv14R0uMYMS3XzkVKvdLNNfFNKmCIKZV7Q1tDU2Q+QesihNQ2cGruInuIkiTrh0
	 VEXgrVE8pt5Uj1J/MCQGF7T29h93Q6gwz2vi+YOE7f865qnUkwqCq6Kj56Uo2FUH7/BO5
	 +0Lu7ebd5OBmqxes9YneTdSacT3APVX3Uc8q9iFO2tJXaVTz6bnGzqgrX9T+QFS7sRg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491513;
	bh=mHuaMbmkq2Mi/hbcw5vfahU40ZMg4+OCEzztdcDtgJc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KHBE+CE8VKlA9KHAt6P59ZxP0AyxWq3NYzLNYSeG8PsHFaZ9YAj8iqT5zp1aYFncw
	 U7/EFoQCy88YEsEPkWYpSCoUV/B1cS+dT7qnhhQeOw6eCG/cqJMkzSYuE1sUWeds55
	 6YA55fWq4+F4BbTGc8ueApQex6VvQQH/+7B8YxxDANciNMJdj5KCz3F8QcBaZFIJF0
	 pdZPnuPNvcR6Ffqw1dakSZtIAoNLd8jaqh/te7bOogkbyg8iJzB78WrN5KOvCttw3s
	 hNJv3KcUIC4MZ2LOHLy/PZszlQo67jKWCuhqnKbWNRXkYol3mPEwbjcW5BXk7qCrQt
	 4ip1v2RKhEgtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B34188109A;
	Tue, 20 Oct 2026 10:18:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFD271DE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B545C8109A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSJ_N24xCmy4 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:18:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 52E3681095
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491510;
 b=k8dQa7aJTBhXkLfQYDNbwNvQ3VXohF0bPKqIxDL3X7Ze09pzzOvQwr9S7LgrnrjCoNn8
 DrIG+R2fz2bVuxgV/lbGXAPOZ5KfEZo6LeVU3/apdRLXPoa9ly/itynGrZSfmm8gncW9N
 7A1vnutXy85Y6PRLVodEWN890Aw+ylec5PBpkvRWZUUMUc4+tJkHWATbdlQUXn/nanuug
 Z17oLeBe9mBIKJKDtY2CgM9eZB/EtuoaozVJJDltmFXGG8BixHwpT1pcAoLFr1z+vSChw
 FtNMDuduZzD+ixCB5x1Tt08Y0LhWIOeBopo9tRv1vWBTdr/zQ2sK50UFG5dUh65dVDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491510;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=OjXyG2uvaPSNVDZpPgZ0M62i+LnGWDtvxG8s+1AewBI=;
 b=SAxZYPW2Z/dsx+GuHjWcaYmbQ1T5AUAyJ9D5N3a23uLZvJw2Tqyz86904hhgjyvImKtt
 Yd3/ksK/Me47S5FU/SU8AAsbl5YUQKJvRaUjzpOvHeaMXYYncp3ka6KGy670QiN1V2Cgi
 xnyGMjoMt5q2vMyrraHkjSK6Pn5CaqKtvTihRfawtg/LkYwMM0VfViUoDdA8zAukMizMN
 n8xLPLI+Pv4K1Blm2+dvcTDJnNksEmjSTlddzkmEFRNktrJU6hxphRBy4CS9ajbhoXxyL
 91CHQfF/IUSRFFULMNeUW5xKWKaXfxTOr4aQCCdY5dYCIlnsPlfBQQGawY7li6xqQXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=B1NpCqc9; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52E3681095
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DFA4E1A1294;
 Tue, 20 Oct 2026 10:18:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AF6DA60393;
 Tue, 20 Oct 2026 10:18:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A59B10328E21; 
 Tue, 20 Oct 2026 12:18:20 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 20 Oct 2026 12:18:09 +0200
Message-ID: <20261020101809.1246135-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/hare: define XDG_CACHE_HOME to avoid
 writing to $(HOME)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIGJ1aWxkIHByb2Nlc3Mgb2YgaG9zdC1oYXJlIGF0dGVtcHRzIHRvIHdyaXRlIHRvIHRoZSB1
c2VyICRIT01FCmRpcmVjdG9yeSwgd2hpY2ggd2UgdHJ5IHRvIGF2b2lkIGFzIGl0IGNhdXNlcyBi
dWlsZCBmYWlsdXJlcyBzdWNoIGFzOgoKRXJyb3IgY3JlYXRpbmcgL2hvbWUvYnItdXNlci8uY2Fj
aGUvaGFyZTogUGVybWlzc2lvbiBkZW5pZWQKbWFrZVsyXTogKioqIFtNYWtlZmlsZTo1NzogLmJp
bi9oYXJlLWNvbmZpZ3VyZWRdIEVycm9yIDI1NQptYWtlWzJdOiAqKiogV2FpdGluZyBmb3IgdW5m
aW5pc2hlZCBqb2JzLi4uLgpFcnJvciBjcmVhdGluZyAvaG9tZS9ici11c2VyLy5jYWNoZS9oYXJl
OiBQZXJtaXNzaW9uIGRlbmllZAptYWtlWzJdOiAqKiogW01ha2VmaWxlOjYzOiAuYmluL2hhcmVk
b2NdIEVycm9yIDI1NQoKd2hlbiB0aGUgdXNlciBob21lIGRpcmVjdG9yeSBpcyByZWFkLW9ubHku
IFRoaXMgaXMgZ29pbmcgdG8gYmUgdGhlCmNhc2UgaW4gYWxsIGJ1aWxkcyB1c2luZyBvdXIgRG9j
a2VyIGNvbnRhaW5lciBzaW5jZSBjb21taXQKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vY29tbWl0L2ZhYzZkOTJhMjc5MjUxOTJiM2NiODEwNzQ0OWU3YWJmZTAx
ZTJjZjMuCgpXZSB0aGVyZWZvcmUgYXNrIGhvc3QtaGFyZSB0byBnZW5lcmF0ZSBpdHMgY2FjaGUs
IHVzZWQgZHVyaW5nIHRoZQpidWlsZCwgaW4gJChARCkvLmNhY2hlLCB1c2luZyB0aGUgWERHX0NB
Q0hFX0hPTUUgZW52aXJvbm1lbnQgdmFyaWFibGUuCgpGaXhlczogNzJmZjJhZDg4ZDZmZDkzN2Rh
MTJhYmQ0ZWQ1OWE1ZmMxMGQwMjFhMCAoInBhY2thZ2UvaGFyZTogbmV3IGhvc3QgcGFja2FnZSIp
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxp
bi5jb20+Ci0tLQpGcmFuw6dvaXMsIHBsZWFzZSByZXZpZXcgY2FyZWZ1bGx5LCBhcyBJJ20gbm90
IGZhbWlsaWFyIHdpdGggaGFyZSBub3IKd2l0aCB0aGUgaW1wYWN0IG9mIHRoaXMgY2FjaGUncyBs
b2NhdGlvbi4KLS0tCiBwYWNrYWdlL2hhcmUvaGFyZS5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9oYXJlL2hhcmUubWsgYi9wYWNr
YWdlL2hhcmUvaGFyZS5tawppbmRleCA4ODY2MmQzYzIwLi40YWNmZjA5MWE1IDEwMDY0NAotLS0g
YS9wYWNrYWdlL2hhcmUvaGFyZS5taworKysgYi9wYWNrYWdlL2hhcmUvaGFyZS5tawpAQCAtMjcs
NiArMjcsNyBAQCBIT1NUX0hBUkVfQ09ORl9PUFRTID0gXAogCVFCRT0iJChIT1NUX0RJUikvYmlu
L3FiZSIgXAogCVNDRE9DPSIkKEhPU1RfRElSKS9iaW4vc2Nkb2MiIFwKIAlIQVJFUEFUSD0iJChI
T1NUX0RJUikvc3JjL2hhcmUvc3RkbGliIiBcCisJWERHX0NBQ0hFX0hPTUU9IiQoQEQpLy5jYWNo
ZSIgXAogCSQoSE9TVF9IQVJFX1RBUkdFVF9BUkNIKV9BUz0kKFRBUkdFVF9BUykgXAogCSQoSE9T
VF9IQVJFX1RBUkdFVF9BUkNIKV9DQz0kKFRBUkdFVF9DQykgXAogCSQoSE9TVF9IQVJFX1RBUkdF
VF9BUkNIKV9MRD0kKFRBUkdFVF9MRCkKLS0gCjIuNTYuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
