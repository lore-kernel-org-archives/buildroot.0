Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA35606A329
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ogAcVHTV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256 header.s=ovhmo103079-selector1 header.b=Wbplyfx6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92EA9810AD;
	Tue, 17 Nov 2026 09:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFSXk9V25Z1r; Tue, 17 Nov 2026 09:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80E2F80CF8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794909507;
	b=jwb2eqteXUVHv2SLpan4XbhZ/IKg/JbRXpGrDXk1v4fgYu8u/TQfxIc0hkWQi+kMyegQ
	 W6uIp2whR9gG/Mgg6+WVGG3E0jQF4f0qut+oeEgXqd1+9Br+L6BrLwxhD/Jhxr4nDZ2dE
	 0hNMxpVjQL6H8IB8WAKrZbj7E7r0CajnEerUhbwl9L/kz8JEVTk4vGRfVqWu7odpIZEIG
	 7HsxanxQKuXXvN3qHmMd2eebSq3ADpWQ2O9uxnI8Y8vi3WIvK1n4mqKCIPZmbBfrc73iQ
	 K1KcyPift1Oe8P+/Jvq8KXWL3EQedmg+wxtBy1mqNnsy/ctlQPdyq6j6iTv9SqCOFTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794909507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:X-OVh-ClientIp:From:Date:MIME-Version:Message-Id:
	 References:In-Reply-To:To:X-Mailer:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qvKON55M1Xf0pmGsEJUSX4C4sgWgRWLV/grhQ2rFowE=;
	b=T5I7kVZnGaKAc3136uxJiXsBGh3CMZGaAUBSC1WDvo92+dPY3BaqFRla0By4gxd5kUUs
	 3l69ciehd4HGu9QvIVcL2120pRx2Fk2wfmj2QwCEsUd4tyTf+dqzPGlORW1mZVuXgIy7X
	 Ygsc7fuz3zKAbz26OH9D+WogqaXzyZRK5eBOPxYnR6eUHBJWCg81q1z4CdRxvfXoOjXeA
	 B1afwP07bBtAetLHR+zTDJ0/8e5+zKulxO9OHtXmmzcDWiCgpPFNrjo/ozuD4VJkEkwXy
	 xCU2ftp/uXfiVJmwNNNDXs3riZpKoHgpBRYcQNkfP5oWYa6VPLITBNIUtuHYo3LKx7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=armadeus.com;
	dkim=pass header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256 header.s=ovhmo103079-selector1 header.b=Wbplyfx6;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794909507;
	bh=qvKON55M1Xf0pmGsEJUSX4C4sgWgRWLV/grhQ2rFowE=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ogAcVHTVt3HC52zMesyCMavzEZEd2NgGOkW12sMrozJc/MGB6O6QTa9HmMrewWO7a
	 3ciR1zw2QCOkSlPmyRiGaGuQySD7ZxtQjpiP396rclKBVmKSkgYOaigR9eFJev9tm9
	 ukHCqH5NwDEsovREnLw6+ggp5kLIwUI3F6tyEtGl/R030MPes8cASZe0TxmNBnaKkj
	 B3pIQ7l3mJWDGJsGRfcCHp76YJHChtao9Iqz7rDSMJltlRsjQOpttQ5CvlptHSZ9aN
	 AdUqwqZcUPsZwz0AGlQKKC0hmrWAo4iOgQg9M0sTe8gnb8LCjT8XRDSAXGlEMUfRz3
	 lba5pPTGI5Qig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E2F80CF8;
	Tue, 17 Nov 2026 09:58:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A5813C
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 09:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 033F680AD0
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 09:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqNKYMtMJmtT for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 09:58:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1205F80CF8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=178.33.251.173
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.173;
 helo=1.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=Wbplyfx6
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1205F80CF8
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 09:58:21 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.0.7])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4jTKtM2WwSz5y3D
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 09:58:19 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-5vtz7 (unknown [10.110.118.244])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2425080DB0;
 Tue, 17 Nov 2026 09:58:19 +0000 (UTC)
Received: from armadeus.com ([37.59.142.95])
 by ghost-submission-7ccd8bbbb6-5vtz7 with ESMTPSA
 id +ZCOLzol/GqU0j8AT5flKQ:T2
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 17 Nov 2026 09:58:19 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001817d3297-a2e9-41b9-a6d1-4e2bd1e49a91,
 E27E9456AC6DD6F5FB3B2C065D8FDFF45D5FC9B1)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.202.169
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 17 Nov 2026 10:58:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-imx-fix-ddr-choices-v1-1-609ff9c3afd2@armadeus.com>
References: <20261117-imx-fix-ddr-choices-v1-0-609ff9c3afd2@armadeus.com>
In-Reply-To: <20261117-imx-fix-ddr-choices-v1-0-609ff9c3afd2@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.16.0
x-ovh-tracer-id: 2682738004824413901
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFMCtXwgMRsC6caezWGGwO7PPVgZTGGS2SOKtp6JTGFWBIueYAkyVZWO6I/iuz2Q6Lv6k/XoKxtW1ylB0aFobDQIGytplXP/a+24qLTOz7juyFnGAyGPjgoHYs3D8Kl9Me1aHYu5UnQZkhLOnRspUwFm2UwPhKsQ8ups0cgj+BcPTZQLhSSqqE+Y0doWiu3pF3pqGLZ764BEVGtPohDH+ay6Nvp3XpokVZ4ho+AG87byNIzUxon9fIwwqZsX+XWUxrbYowomgK7d004XkTp43Cvy5ymxJwVpwi3A2SZnde1+ErawIohiWp+fJGpie1dXjxPj9coj6w39TNW1Wp61/LvPI0ORH3cwJhLuffp/o/jpocuDGyZtrd6ii653kFqCI90eu0/fEpMbASPfa3cKYrFJWTEEE/Up+zeaPLa8Bx59t/+KI7BM1PsVv61OXHzh7K/paPsA1S7GvfkxDm3b2T+AA6DFI9lZqhNnEEm8jEtup2ELTVjTTyBRrrIRVVRBj+ZtpBV15MkqQxL/iELhI0jSYcsteykn0UoMj44zVdGdOLFeCF27iuQOkZ5lwbZk4JytEDcP+csVwFm5eBN2gaN7rbOe3fp6wvcmLUEYIl/GojdQ3MjtuW2nvarsxkLl9JY7ABdU1JH6UuHnScMKc9nKG44428Q0wPoIKiMubHZug
DKIM-Signature: a=rsa-sha256; bh=JDuGOHkzaakysPhHEnZcTXIi87gBwqKGCYjf48pIz5Q=; 
 c=relaxed/relaxed; d=armadeus.com; h=From;
 s=ovhmo103079-selector1; t=1794909499; v=1;
 b=Wbplyfx6DiEo9xu4DMqCsCTvot/uwyar1tkaA0M+YAxqymv+yGt7+1Rilamgz3PGbQtwBcD4
 uIW45DcqSSkHFE/VPNfPmF1CCfMqVuIrrx+FMCkzgTgWusIJjSonb9T3WenOaZBZLsVInb6A9Oe
 8/MG03mjsr7GUxYkVuUhbKo5dHMJZP4CE7jgfFRkSt65vp9eP04of4cTE353WjT8h5wVjSKKuAr
 aMGfsM1mCS6IF8RHBi6vf7jXT5hseLIQ+naaavBd1mcx8L2nM2OIMfveEJDGkPi9ACBTcM8vN2j
 YDGggZ1DgLpMXaEgroD7eillpU0a2vtM6yD9B6wKwsPfg==
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Forbid DDR3
 selection for i.MX8MP
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIERSQU0gY29udHJvbGxlciBvbiB0aGUgaS5NWDhNUCBkb2VzIG5vdCBzdXBwb3J0IEREUjMg
bWVtb3JpZXMuCkZvcmJpZCB0aGUgc2VsZWN0aW9uIG9mIEREUjMgZmlybXdhcmVzIG9uIHRoaXMg
U29DLgoKRml4ZXM6IDQ1YTA5OTlhMWJlYSAoInBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2Fy
ZS1pbXg6IGFkZCBzdXBwb3J0IGZvciBpLk1YIDhNIFBsdXMiKQpTaWduZWQtb2ZmLWJ5OiBTw6li
YXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQog
cGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9Db25maWcuaW4gfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxl
LWlteC9maXJtd2FyZS1pbXgvQ29uZmlnLmluIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13
YXJlLWlteC9Db25maWcuaW4KaW5kZXggNDNjNzRlOGJiZTdhLi43MTlhZmYwZTcwOTcgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvQ29uZmlnLmluCisrKyBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvQ29uZmlnLmluCkBAIC05Niw2ICs5
Niw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfRERSNAogCiBjb25maWcgQlIy
X1BBQ0tBR0VfRklSTVdBUkVfSU1YX0REUjMKIAlib29sICJERFIzIgorCWRlcGVuZHMgb24gIUJS
Ml9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOE1QCiAJaGVscAogCSAgVXNlIERE
UjMgYmluYXJpZXMgKGkuZS46IGRkcjNfKl8yMDE4MTAuYmluKS4KIAoKLS0gCjIuNTYuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
