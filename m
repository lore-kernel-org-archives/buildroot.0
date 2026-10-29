Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6985606A322
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bkvebEcD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Q+qZEKce
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A5F81066;
	Thu, 29 Oct 2026 20:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVaozWt32EJZ; Thu, 29 Oct 2026 20:50:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 37B018104B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793307003;
	b=Hjw36KnSVwHmb6zzXpUHPzF/U5wvQ7PGTVzxD191zKLLQK4rEJ52gb3/zwmeXsjoa07+
	 LpdDAve3aqLF95EgM/tV3hNf9c+vxSSDWZ0KLB3mySfA3JDlT1sqf1oZIXbZHW0ZgAqX0
	 ytWH4XlqyU05qazTck30tZat8iiVmxOclRY8LsP/z3OZgKJT6J173sXuVZoSgK3crDl+X
	 AiwfUHGitWzZPx01uNxjRIlZuCB5UDxF14OvQp5BOEjZOy+wUA34mHEoU2weupsDtPZhK
	 bHvXgtScYGIEclVR0x8STs2WtT6IKXv+5UlJoeDWnQxLn4+Sur+/KOo8GnotmsJ4zGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793307003;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ViD63mu6aIo3NZurBMTgYXbBEmjlK3FJg3455EgXKUE=;
	b=AXIxq9ZXo0zqHmYbb7sNOhFwsZgfFMW+DPq/yZmPAqJwF2zGiCjUx2+xbm+Aob7Gamxp
	 Y7WZXBg+zx63XSVeUPMjxC0QhflzzUJAOF17+jGpY+qI58JxBFIa6sFAqxjYJ8gDN4Bwy
	 +28sC613aAsN3BeCsQRzdI6v0q1VT20f226TM7y4pq5x9d2BSbMbxNJBALgoTlptbVJsm
	 36GecUxhdI2EuxtxFWMyBi3LNf8KJ18xok+ABW17UcErXPhkPfphZ4WETXfI/1PC08xJ9
	 Ti+Onx86iZV0xrVkxFuguSjnNX0R4KWYFMqfgV5PqykN9pbOjDqYl9wq0HvZ5Kc1/5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793307003;
	bh=ViD63mu6aIo3NZurBMTgYXbBEmjlK3FJg3455EgXKUE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bkvebEcDbsnBC7fuMAlqc85npkDCWDNwCyC9KeMjvbhW46ypxfqshMyBXpLy1jRQs
	 tVyrZWBREa1z2onJlGLlev58Z0CLtRRzDcHDKZatBgdHtuSU3t7TdwggcbKIr1MMeK
	 M5EP7yJe1+gHYizc+X4MjgvRIEo+TX9XmkTZpgIetbIJRWwNVlGNwT33RNnvV7dc0+
	 oU5U1q1lewUkSkl/3IOLAP4i4h3wsehcIzz+STXk63ic9deRAeKTSclW4+zZ9ApTeB
	 NO5giVsV+r3Sw5lEOOlnjV5vwg/noPJTqKd0iJUfSbRYimikwTKu5FaAKK6mrPcoUW
	 0h/tx12VOP43g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B018104B;
	Thu, 29 Oct 2026 20:50:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D030A972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B45B440587
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WeEz88w1wY4 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:50:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4473C40536
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793307000;
 b=tKmxqEkb8/O6Ao6F0XDZtsn7Ts8kQ5/Shi5M9fe2ZQ+3eB2CKRrSGG2WIiIlQxTNUH/5
 2AEwT/VLW6WYC0hWq6w3OROamY3Yx+yi8Se5+6bADFdoVZadQfEWSK+EoSUrzt7eprIOV
 9mAqxsmigRfoznDx4nmp7bCYyicyB+M0T53BQgqIz5b+5h4BkW3lv9xknTEnwNggtdEas
 Y+9ntp6F55vOlLYtAxt5C82r7mpKKh8UqsFRfOaS8ev/Mhfytrhv+u5pGnLecm60iM7oj
 +Q6SavD3Hnga9BKpsPfIUuK4zXb9+jTAjV6GaqcHpzrqc/AXCksAb2ANcPtk1OavngA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793307000;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bs+QrcE6ha7lHUHRZbC3iGeDoDqahFl0bDBoo5y2ldA=;
 b=TJuTT1ciSqRX4p2EhNkSWQkqHCNHstE1cKw2laPbs5+3aIktDhVyItudJslO8SyRXQaz
 Tg22A7qb2Mn1HhcmntIlsBifUAIm90TwoOD99uTVM84tt+tRrufCWhvI5T8wzJ3vUwERX
 GBumiBEvwZVtkhzgW1srKEeEZV7fsn9oQe5+ddYhtKMMmOJV0EopJieSBpotUFUkpsJtw
 tC0AvrG1XDW7yYQid6vzUGmVkPCrC9fVO5VuD8gakCqp1+axDlTtVtwSbfiPyBG1dn+sw
 lopSiKUOmRnbpmYQXl8gN8zftawyQ7qj3gRFrpq0B34H/mcZVbUTjQw4nmBhwy1tf/g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q+qZEKce; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q+qZEKce
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4473C40536
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793306994;
 bh=bs+QrcE6ha7lHUHRZbC3iGeDoDqahFl0bDBoo5y2ldA=;
 h=From:To:Cc:Subject:Date:From;
 b=Q+qZEKcemAFoWPhK2znlRNSU+Clz815qhjvfhfqjLqLEY3hisRG+k4otE7xPsVnzz
 ytwqGqSHAwG/1Jvz9pG2qqdRSGF/fdGKpp+MtB4TkjoR/nC3/7N+lhi87vyl7HSEsk
 0iAsXo35jpbLKnLyS4Jqy9aniiO/Fw96dngnM+trF7Wxd4B9Cr0ShZEgjnTYL+6dyw
 2cBsFojBCMk7WkWweCjfquZzavUgrW27IZry4UYUNP1FaXDVzfE6WpJvGxFbbTzAfX
 bRWQB2f3gOmgu03RB0A0qof+nA+68JcNkJ/VbSyOwrPeRR/MWlc3YvAVwKZzI8c3aZ
 OzZnb3Zz6rbvw==
X-KAS-Sym: v3:f51bdf72230551df:c4629r8Pn2ZdpjbQ8YLptVU1pUVQYg98YzLKEc0eC9cw5
 qKI2FJLEzWjjcZFHJxPhS0cNbSQxl+2aU57phSULUFaprM11ab7BueekHefAxsFf1uND+F6daut
 zJQSX9Sr49kk2UvongHFgFj9a4o4RkSBHSO0aFPQ0j59UBK4uyeUO/6Ov6ECGiQaraep71CGE7e
 hPeGOervrSoQQtowuIPQyd0L0RBRYelWVO3kbFbgs56nRfHyXgVMheTjyJMK8FQsXkyYkfoWFZj
 /q/OeWL/j6r0wPIR5+ptpA4dohe3N/bnod72m6k7qrUOga+sguVFyFbFDp6/za/G/VQX5Pqg==:
 +/IKhiDRAj6LYTQy9Cvq6C8K8PSfmn+gpv67dc+wuqfNIaCva9y+MzqIcnIE6nzlzWmeiV4IlJC
 IlHBu360ARsnQbErFFMiDsvJoNVA7y5IgvPrNWyNUmCGhCdEG+CzuIafoUlW7imX28PIAguI8PB
 lo5id0mx5LzaTM4CThPl2NZoanOtSKXie/heCp0oOzoavSqXK4c2+Tn1Yygo5mVzZpa0GDAdBfW
 1iSHFFrC51mdgQKKSF+ymLfEnAQ4FnI2tjR5U7DzFbmK4yDwqJXURL0cpC/y9TtQ12qWU70m4/N
 5/WBJAIVBulbKT+CwC1FuMMJ9d834vB41KqU0yQ70bvvmij5MpBOYzANqJ2O4tp+xbUplBqfQOK
 AcgDBT99nnr1ZTrzN0ll6sIh+QRjE0vMDyarXbNcxCyAwxkv81wFI16n34TvBf3JZsGVoLCemPI
 +1wTEZv4U2Hz9La1krEGE3qFxReWUqXbSFpfsX4bnijLLnpgiTQh86OjKzMMIwjsCjgphrBCCnx
 OLDBGK/qlvKMWSQKMsgNVsg3Qkp0dwOq3gaAM/mWHGTEohVtpdypQPqNOsNxPZblfgs0WfxbN3h
 xc+hsiKTDKVU8qILhTqfAKlU27I2HdBeqaZk35Z7HfjzeTRqPM3AkamzvTbp9vE=
Received: from fli4l.lan.fli4l (p5b3a01b5.dip0.t-ipconnect.de [91.58.1.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20F59A4C71A3;
 Thu, 29 Oct 2026 21:49:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50336)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMX4L-000000006rx-1JCY;
 Thu, 29 Oct 2026 20:49:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:49:52 +0100
Message-ID: <20261029204953.1447140-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/2] package/ncurses: install wide-char headers
 in usr/include/ncursesw/
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UHl0aG9uIDMuMTUgY2hhbmdlZCBpdHMgbmN1cnNlcyB3aWRlLS9ub24td2lkZS1jaGFyIGRldGVj
dGlvbiBhbmQgbm93CnJlbGllcyBvbiBkZXRlY3RpbmcgdGhlIGNvcnJlY3QgaGVhZGVyczoKaHR0
cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC8zODNjN2JkMzhhNWYwOTIzZGI0
OGY2N2ZkYTlkODUyZDE4OTkyMWU2CgpCdWlsZHJvb3QgdG9vbGNoYWluIHg4Ni02NC1jb3JlLWk3
LS1nbGliYy0tYmxlZWRpbmctZWRnZS0yMDI2LjA4LTEKY29udGFpbnMgdGhlIG5vbi13aWRlLWNo
YXIgdmVyc2lvbiBvZiBzeXNyb290L3Vzci9pbmNsdWRlL2N1cnNlcy5oCndoaWNoIG92ZXJ3cml0
ZXMgdGhlIHdpZGUtY2hhciB2ZXJzaW9uIHByb3ZpZGVkIGJ5IHRoZSBuY3Vyc2VzIHBhY2thZ2UK
ZHVyaW5nIHRoZSBjb25maWd1cmUvcnN5bmMgc3RhZ2Ugb2YgdGhlIHB5dGhvbjMgcGFja2FnZSBp
biB0aGUgY2FzZSBvZgpCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVM9eS4gVGhlIHRvb2xjaGFp
biBwYWNrYWdlIGlzIHNvcnRlZCBhbHBoYS0KYmV0aWNhbGx5IGFmdGVyIHRoZSBuY3Vyc2VzIHBh
Y2thZ2UuCgpUbyBwcm92aWRlIGNvcnJlY3QgaGVhZGVycyBmb3IgdGhlIHB5dGhvbjMgcGFja2Fn
ZSBhbmQgdG8gbm90IGludGVyZmVyZQp3aXRoIG90aGVyIGJ1aWxkcm9vdCBwYWNrYWdlcyB3ZSBh
ZGRpdGlvbmFsbHkgaW5zdGFsbCBvbmx5IHRoZSB3Y2hhci0KZW5hYmxlZCBoZWFkZXJzIGluIHVz
ci9pbmNsdWRlL25jdXJzZXN3LyB3aGljaCBpcyB0ZXN0ZWQgYnkgcHl0aG9uMwpjb25maWd1cmUg
YmVmb3JlIHVzci9pbmNsdWRlLzoKaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2Js
b2IvdjMuMTUuMHJjMy9jb25maWd1cmUuYWMjTDcxNDkKCkNvbmZpZ3VyZSBsb2cgc25pcHBldCBv
ZiBweXRob24zIHdpdGhvdXQgdGhpcyBwYXRjaDoKCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy4uLiB5
ZXMKY2hlY2tpbmcgZm9yIHBhbmVsdy4uLiB5ZXMKY2hlY2tpbmcgZm9yIG5jdXJzZXN3L2N1cnNl
cy5oLi4uIG5vCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy9uY3Vyc2VzLmguLi4gbm8KY2hlY2tpbmcg
Zm9yIG5jdXJzZXN3L3BhbmVsLmguLi4gbm8KY2hlY2tpbmcgZm9yIG5jdXJzZXMvY3Vyc2VzLmgu
Li4gbm8KY2hlY2tpbmcgZm9yIG5jdXJzZXMvbmN1cnNlcy5oLi4uIG5vCmNoZWNraW5nIGZvciBu
Y3Vyc2VzL3BhbmVsLmguLi4gbm8KY2hlY2tpbmcgZm9yIGN1cnNlcy5oLi4uIHllcwpjaGVja2lu
ZyBmb3IgbmN1cnNlcy5oLi4uIHllcwpjaGVja2luZyBmb3IgcGFuZWwuaC4uLiB5ZXMKY2hlY2tp
bmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyBpbml0c2NyLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tp
bmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyB1cGRhdGVfcGFuZWxzLi4uIG5vbmUgcmVxdWlyZWQK
Y2hlY2tpbmcgd2hldGhlciBjdXJzZXMgc3VwcG9ydHMgd2lkZSBjaGFyYWN0ZXJzLi4uIG5vCmNo
ZWNraW5nIGZvciB0ZXJtLmguLi4geWVzCgpjb25maWcubG9nIGNvbnRhaW5zOgpjb25maWd1cmU6
Mjk4NjE6IGNoZWNraW5nIHdoZXRoZXIgY3Vyc2VzIHN1cHBvcnRzIHdpZGUgY2hhcmFjdGVycwpb
Li4uXQpjb25mdGVzdC5jOjUzNTo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24gJ3NldGNjaGFyJzsKIGRpZCB5b3UgbWVhbiAnZ2V0Y2hhcic/IFstV2ltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uXQogIDUzNSB8ICAgICAgICAgc2V0Y2NoYXIoJndjdmFsLCBMIngi
LCBBX05PUk1BTCwgMCwgTlVMTCk7CgpDb25maWd1cmUgbG9nIHNuaXBwZXQgb2YgcHl0aG9uMyB3
aXRoIHRoaXMgcGF0Y2g6CgpjaGVja2luZyBmb3IgbmN1cnNlc3cuLi4geWVzCmNoZWNraW5nIGZv
ciBwYW5lbHcuLi4geWVzCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy9jdXJzZXMuaC4uLiB5ZXMKY2hl
Y2tpbmcgZm9yIG5jdXJzZXN3L25jdXJzZXMuaC4uLiBubwpjaGVja2luZyBmb3IgbmN1cnNlc3cv
cGFuZWwuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIG5jdXJzZXMvY3Vyc2VzLmguLi4gbm8KY2hlY2tp
bmcgZm9yIG5jdXJzZXMvbmN1cnNlcy5oLi4uIG5vCmNoZWNraW5nIGZvciBuY3Vyc2VzL3BhbmVs
LmguLi4gbm8KY2hlY2tpbmcgZm9yIGN1cnNlcy5oLi4uIHllcwpjaGVja2luZyBmb3IgbmN1cnNl
cy5oLi4uIHllcwpjaGVja2luZyBmb3IgcGFuZWwuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIGxpYnJh
cnkgY29udGFpbmluZyBpbml0c2NyLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tpbmcgZm9yIGxpYnJh
cnkgY29udGFpbmluZyB1cGRhdGVfcGFuZWxzLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tpbmcgd2hl
dGhlciBjdXJzZXMgc3VwcG9ydHMgd2lkZSBjaGFyYWN0ZXJzLi4uIHllcwpjaGVja2luZyBmb3Ig
dGVybS5oLi4uIHllcwoKVGhlIHJlbGV2YW50IGxpbmUgaXMgJ2NoZWNraW5nIHdoZXRoZXIgY3Vy
c2VzIHN1cHBvcnRzIHdpZGUgY2hhcmFjdGVycycKd2hpY2ggbmVlZHMgdG8gaGF2ZSAneWVzJyBh
cyByZXN1bHQgd2hlbiBuY3Vyc2VzIGlzIGNvbmZpZ3VyZWQgd2l0aApCUjJfUEFDS0FHRV9OQ1VS
U0VTX1dDSEFSPXksIG90aGVyd2lzZSB0aGUgcHl0aG9uMyBidWlsZCBpcyBicm9rZW46CgouL01v
ZHVsZXMvX2N1cnNlc21vZHVsZS5jOiBJbiBmdW5jdGlvbiDigJhfY3Vyc2VzX3dpbmRvd19hZGRj
aF9pbXBs4oCZOgouL01vZHVsZXMvX2N1cnNlc21vZHVsZS5jOjEwMDk6MTU6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZgogZnVuY3Rpb24g4oCYc2V0Y2NoYXLigJk7IGRpZCB5b3UgbWVh
biDigJhnZXRjaGFy4oCZPwogWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCi4vTW9k
dWxlcy9fY3Vyc2VzbW9kdWxlLmM6MTAxNToxOTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mCiBmdW5jdGlvbiDigJhtdndhZGRfd2No4oCZOyBkaWQgeW91IG1lYW4g4oCYbXZ3YWRkY2ji
gJk/CiBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLi9Nb2R1bGVzL19jdXJzZXNt
b2R1bGUuYzoxMDE5OjE5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gbwpmIGZ1bmN0aW9u
IOKAmHdhZGRfd2No4oCZOyBkaWQgeW91IG1lYW4g4oCYd2FkZGNo4oCZPwogWy1XaW1wbGljaXQt
ZnVuY3Rpb24tZGVjbGFyYXRpb25dCgpUaGlzIHBhdGNoIHNob3VsZCBhbHNvIGZpeCBzaW1pbGFy
IHByb2JsZW1zOgpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9v
dC8yMDI0LVNlcHRlbWJlci83NjMxNzkuaHRtbApodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
cGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI1LUphbnVhcnkvNzcwMjE1Lmh0bWwKClRoZSBzcGVjaWZp
YyBwcm9ibGVtIHcuci50LiBwZXItcGFja2FnZSBkaXJlY3RvcmllcyB3YXMgYWxzbyBkaXNjdXNz
ZWQ6CgpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIx
LUF1Z3VzdC82ODQxMTkuaHRtbAoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1
aGxzLm5ldD4KLS0tCiBwYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tayB8IDcgKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmN1cnNl
cy9uY3Vyc2VzLm1rIGIvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsKaW5kZXggNWUyMDc3NTAw
YS4uYTliMmYwODlhNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsKKysr
IGIvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsKQEAgLTg1LDYgKzg1LDEyIEBAIE5DVVJTRVNf
Q09ORl9PUFRTICs9IC0tZW5hYmxlLXdpZGVjCiBOQ1VSU0VTX0xJQl9TVUZGSVggPSB3CiBOQ1VS
U0VTX0xJQlMgPSBuY3Vyc2VzIG1lbnUgcGFuZWwgZm9ybQogCitkZWZpbmUgTkNVUlNFU19DT1BZ
X1dDSEFSX0hFQURFUlMKKwkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFMSkgLUMgJChARCkgXAor
CQlJTkNMVURFRElSPSQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL25jdXJzZXN3IFwKKwkJaW5z
dGFsbC5pbmNsdWRlcworZW5kZWYKKwogZGVmaW5lIE5DVVJTRVNfTElOS19MSUJTX1NUQVRJQwog
CSQoZm9yZWFjaCBsaWIsJChOQ1VSU0VTX0xJQlM6JT1saWIlKSwgXAogCQlsbiAtc2YgJChsaWIp
JChOQ1VSU0VTX0xJQl9TVUZGSVgpLmEgJChTVEFHSU5HX0RJUikvdXNyL2xpYi8kKGxpYikuYQpA
QCAtMTE2LDYgKzEyMiw3IEBAIE5DVVJTRVNfTElOS19TVEFHSU5HX1BDID0gJChjYWxsIE5DVVJT
RVNfTElOS19QQykKIAogTkNVUlNFU19DT05GX09QVFMgKz0gLS1lbmFibGUtZXh0LWNvbG9ycwog
CitOQ1VSU0VTX1BPU1RfSU5TVEFMTF9TVEFHSU5HX0hPT0tTICs9IE5DVVJTRVNfQ09QWV9XQ0hB
Ul9IRUFERVJTCiBOQ1VSU0VTX1BPU1RfSU5TVEFMTF9TVEFHSU5HX0hPT0tTICs9IE5DVVJTRVNf
TElOS19TVEFHSU5HX0xJQlMKIE5DVVJTRVNfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9PS1MgKz0g
TkNVUlNFU19MSU5LX1NUQUdJTkdfUEMKIGVsc2UKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
