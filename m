Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325AA6075521
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MeFqc+A4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AF3B80D3E;
	Mon, 19 Oct 2026 15:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_z3k2niHtVP; Mon, 19 Oct 2026 15:40:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CF3A880D9F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792424408;
	b=syu4TCaYJqhAjiLD2Bh0uX31qsn3FsybI3RQ+YwE2fn+7am/0E6GuxFn1SmamRH5bJEc
	 EIj6ckF4vZIyetxH4BjKNDNER+oM1PH3Qbal5YkKMwKvMQ6xvhERAuESO0lww+mODbJCY
	 kqDucacPzqzqkV3bUnpCuL4gW3r0M6PDblw6Ax6/eBMGmiyztl6bEv5274Otm/go5Lfsq
	 QZQ3IBalnBmZ3QpG+XqAgdQQundgOqYpQinVi0DxcBHIzw7kl3/HpwkbacRJzYBLAcu+Y
	 OkgEwOzi1enLKwsl4DeQmwKc6RgVaBsLJPqrXQ4xFSZwtrgynIxYE6t+TWWdFmyDclg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792424408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=byFY11HbgWU0iyAvGSIhCBpbumAVhnWiVsxal5HfCrk=;
	b=FQOhOOO/6HPSoo7PSOhmi9v7vmKrKvPJ7GE2OQltsAyTQ3bD/0A5vYca/AUrki263pZa
	 zdREAcyhXlYM8bLIgP+7ouOGH9sBuyEnXEmX+/sYN2AjEKuC5uuNAMGOBB0qznMEPjGax
	 J8vhnkqK5tLXsQC5HnnyfcFfIO07km9v7x8rWMGdJynVqXA2PmX5/NBJ3dHznPkDP9HLR
	 x8KNPCXqdySbkgk5iFKVKuIXxihWD8CBi2baAGeAwp18ERy2/glmtXqfOr4MMGhKK4We1
	 s1PXPC0u+356Z0beiieBDj2Bo3ybIgZgxiaHdhYiGaHjRUcNRKC6/mwv4Ak5EOfMupQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792424408;
	bh=byFY11HbgWU0iyAvGSIhCBpbumAVhnWiVsxal5HfCrk=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MeFqc+A42EHYBL2Xz+/mbyh5p5r2CxnCtekbQAbud4BcJupiuWuBoS6RXppCwfDnI
	 IzdZlDeTUOyD3SS+ImRBN6iYq2uhvP6sndPVao1OYnQpslxEtq0R39jXxPn7jF0Ae4
	 1M66amMpioupL8sL4pct0OR6bcJBMDVX7b+92uj5pcnVY1s/QIrKQgqX1QQkVjir5C
	 +SOP0d4WObKcfcYzKxFLc7nIfdWrIds8r1hhMDlH3KtQxyAixPAX/q/ouUEPfejN+O
	 aqexGAZY7K3UAuxwO8X5nvzhuevlql0+m0v7kpebwqwIAcUfKmUcUjLXZxVL/fvEIa
	 GoYXFF+gLv25A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3A880D9F;
	Mon, 19 Oct 2026 15:40:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F396D23A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1011400F9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wx-xgVx-lrI2 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 15:40:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8D76E400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792424406;
 b=J/oMH69Uh+i+wDCYH1Fs6CMToKRzJJufUEDntshHhx9WB/62ZWj9aboXo6YaKWo3xjMx
 JCtAwk1xrn231IQ8PRgCqpr83N5n5SVRPOsBU5WUllg/ExynmwF0qzsy7CJySvL/fpEL9
 qKGqhkdWZKnxxK9ViFT56TnZGYkTHYjJoOZaU7YRhnW1bG9GIIr0u/IlmNu0M21+XFMEB
 nOOhsl6amGe/2QCPheXUiJjrvX0FYOx6EjwdtqSkX8zCjYynjWuM09eZDLfmG1V27FU5h
 xWIrQrkQzVDyYxL1S7gTZgklCljv9MyBgaTenWch618Dca+1IIopejE7mzSx8Ad4jFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792424406;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Date:
 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
 X-Last-TLS-Session-Version;
 bh=txxNzyQ/IyBKk38323+26HBf5Om6qAgPV06uT8R/zX8=;
 b=Z+mpN1QddmLSWyx/jii1eH2tng5AyVCXLFCXmeB9qqcPgHBcAn5Zbs0jLNf99k7WCgxq
 AqMTFowIpueB42PQQ7Mivf6Wsjy/KlNGUYsS4gGAIs0DmvuY7Qe2O4IlN31Wsx3LnXlXY
 qCN4qPdHQjlHAsva/pYgeQUWjqPA3NrApmZ0Htludr2WhklWHnUW/snZ1dZraFpcxnU/b
 JPzXpEtydF46J8+vhOjAt4Bdul7+rcCKWPu0JRqWt7Tt0LIEyY0LhpDOv5ishDMt+D1bj
 d3azqsCAgUmbltWqgNkg/0c/f5VytXVVVdRhzSH+2lkasSP5TfyotbZwhHFhiYLFVyw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=y48GZNFc; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D76E400B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:40:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0D2CC4E41223
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:40:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D56C460582;
 Mon, 19 Oct 2026 15:40:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8ACCC10328C5E; 
 Mon, 19 Oct 2026 17:40:01 +0200 (CEST)
Date: Mon, 19 Oct 2026 17:39:54 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261019-fix_crng_init_slow-v1-1-48ad2d5008d6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBBF0a3IfDeQGFB0K6WEZpzoSIklY7UQ3
 Htj/Tzw3s0glJgE+ipDoo2Fl1hgbhXg9IwjKR6KodZ1Y7TpVOCvwxRHx5FXJ69lV9Zrso3FNtg
 A5fhOVFb/6P1xWT5+JlzPEhzHD0GHfkZ2AAAA
X-Change-ID: 20261019-fix_crng_init_slow-3b0e363c7f3f
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] support/testing: use host entropy for ARMv7
 emulation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2hlbiBydW5uaW5nIHRlc3RzIGRlcGVuZGluZyBvbiBlbnRyb3B5IHBvb2wgYmVpbmcgcmVhZHkg
b24gYXJtdjcgKGVnOgp0ZXN0X29wZW5zY2FwLnB5LCB3aGljaCBydW5zIHRoZSAnb3NjYXAnIGJp
bmFyeSwgd2hpY2ggdHJpZXMgdG8gZ2V0CnJhbmRvbSBieXRlcywgZXZlbiB3aXRoIHNpbXBsZSBj
b21tYW5kcyksIHRoZSB0ZXN0IG1heSBmYWlsIG9uIHRpbWVvdXQKZHVlIHRvIHRoZSBlbnRyb3B5
IHBvb2wgbm90IGJlaW5nIHJlYWR5OyB0aGlzIGlzIGNvbmZpcm1lZCBieSB0aGUgdGVzdApiZWlu
ZyBibG9ja2VkIHVudGlsICJjcm5nIGluaXQgZG9uZSIgbGluZSBhcHBlYXJzIGluIHRoZSBrZXJu
ZWwgbG9ncy4KCkEgc29sdXRpb24gY291bGQgYmUgdG8ganVzdCBpbmNyZWFzZSB0aGUgdGVzdCB0
aW1lb3V0IHRvIGEgdmFsdWUgbGFyZ2UKZW5vdWdoIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBlbnRy
b3B5IHBvb2wgd2lsbCBiZSByZWFkeSBpbiBtb3N0IGNhc2VzLApidXQgaXQgbWF5IGJlIGhhcmQg
dG8gZmluZCBhIHZhbHVlIHRoYXQgZml0cyBhbGwgdXNlIGNhc2VzLCBhbmQgYWxsCnRlc3RzIGRl
cGVuZGluZyBvbiBlbnRyb3B5IGJlaW5nIHJlYWR5IHdvdWxkIGRlc2VydmUgdGhlIHNhbWUgZml4
LgoKQW5vdGhlciBzb2x1dGlvbiBpcyB0byByZXBsaWNhdGUgd2hhdCBjb21taXQgN2FjYjMyZGFi
YjgwCigic3VwcG9ydC90ZXN0aW5nOiBhZGQgYnVpbHRpbiBhcm12NSBrZXJuZWwgNC4xOSB3aXRo
IGVudHJvcHkiKSBkaWQ6IGl0CmFkZGVkIHRoZSB2aXJ0aW8tcm5nLXBjaSBhcmd1bWVudCB0byBh
bGxvdyB0aGUgZ3Vlc3QgbWFjaGluZSB0byB1c2UgaG9zdAplbnRyb3B5LiBUaGUgYXJtdjcga2Vy
bmVsIHVzZWQgZm9yIHRlc3Rpbmcgc2VlbXMgdG8gYmUgYnVpbHQgd2l0aCB0aGUKcmVsZXZhbnQg
dmlydGlvIGNvbmZpZ3VyYXRpb24gdG8gYWxsb3cgYSBzaW1pbGFyIHBhc3MtdGhyb3VnaCwgc28g
cGFzcwp2aXJ0aW8tcm5nLWRldmljZSB0byBhcm12NyBrZXJuZWwgd2hlbiBydW5uaW5nIHRlc3Rz
LgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGlu
LmNvbT4KLS0tClRoZSBpc3N1ZSBpcyBvYnNlcnZlZCBzeXN0ZW1hdGljYWxseSBvbiB0aGUgY3Vy
cmVudCBtYXN0ZXIgYnJhbmNoIHdoZW4gSQp0cnkgdG8gcnVuIG9wZW5zY2FwIHRlc3RzOgogICQg
Li9zdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIC1kIH4vc3JjL2J1aWxkcm9vdF9kbCAtbyB0ZXN0
X29wZW5zY2FwIFwKICAgIC1rIHRlc3RzLnBhY2thZ2UudGVzdF9vcGVuc2NhcAotLS0KIHN1cHBv
cnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5
IGIvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5CmluZGV4IDM3MDJlZTJkNDgwZC4u
ZDY5MDk0OTEyMDQ3IDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3Iu
cHkKKysrIGIvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5CkBAIC05OCw2ICs5OCw3
IEBAIGNsYXNzIEVtdWxhdG9yKG9iamVjdCk6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJ2ZXhwcmVzcy12MnAtY2E5LTUuMTAuMjAyLmR0YiIpCiAgICAgICAgICAg
ICAgICAgICAgIHFlbXVfY21kICs9IFsiLWR0YiIsIGR0Yl0KICAgICAgICAgICAgICAgICAgICAg
cWVtdV9jbWQgKz0gWyItTSIsICJ2ZXhwcmVzcy1hOSJdCisgICAgICAgICAgICAgICAgICAgIHFl
bXVfY21kICs9IFsiLWRldmljZSIsICJ2aXJ0aW8tcm5nLWRldmljZSJdCiAgICAgICAgICAgICAg
ICAgZWxpZiBhcmNoID09ICJhcm12NSI6CiAgICAgICAgICAgICAgICAgICAgIGtlcm5lbCA9IGlu
ZnJhLmRvd25sb2FkKHNlbGYuZG93bmxvYWRkaXIsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJrZXJuZWwtdmVyc2F0aWxlLTUuMTAuMjAyIikKCi0tLQpiYXNl
LWNvbW1pdDogMDVkYzQ5MDE3Y2NkZjFiZTI1MTk0NjBjNzM2NDMyYjJhNDI2Yzk2OApjaGFuZ2Ut
aWQ6IDIwMjYxMDE5LWZpeF9jcm5nX2luaXRfc2xvdy0zYjBlMzYzYzdmM2YKCkJlc3QgcmVnYXJk
cywKLS0gIApBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
