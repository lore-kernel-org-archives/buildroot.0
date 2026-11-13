Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCFF606A8B8
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oysRby0g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256 header.s=ovhmo103079-selector1 header.b=KRbO26OD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 323D04094B;
	Fri, 13 Nov 2026 15:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqzJy6XKuP2s; Fri, 13 Nov 2026 15:20:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2A621408B0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794583235;
	b=JTvKVKyqq01j15FJq6yo3VkioS2gL2rB2ah5cOQGUdaZZxORUGXeo06kvDvNXTEVSVnw
	 ahJ80Y0PtS/QDAmv8X9d+FWhhd/j7BQpd0KR7PpUp5lJRzMIx+Qv8G8j+hNtI1Bq56hHt
	 0D0B6QGww2ndIzzUyd3I8Q7LE773j9CWSIbgmp4DhRcj6EVHfhEaSc9/WpRenS+ZOF0s0
	 +bO7CFeWXqvi+lPtqP/8FtrgcKg0OPrwSa/5dM6nJh1LYYHNsN5sfJDXWHPsy2JsPL4Fd
	 op6nBuHr27cFucpUwfpJ0bdwh5ZTo272l+2rfwHoQ5LQW/1gCq4BLFbTk/xoLG+PNlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794583235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:Date:MIME-Version:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:X-Mailer:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mTiQSSjX5LupX/QvWqJRrAVoh8C2ohRj4V/a/7y557o=;
	b=tcAxpP9p5GAoZwP+dknexBsd7dFpZObh913tdrqQJmaq86u0C4fCmQVSlRP0ZgMbqXZT
	 RhJU0TeV+djs7tM09Mnx4VZtLrAAi1QpbBl0Rp+qgxcwk2lcXniKJnP9rbuGb1jz2/Qqy
	 JhOi6L1naHySkkL09X9Nz19LAf3Zd14WQYW9N+qt6Z84rSR8L5QWFNn1jJA2EwHCxcAi4
	 6VKL0514tnUZVUgSM9yCxdVy7WxgvgNwjOsnz1otqwYFpSQmWa6c5fk1dLM9Xe3cGGne7
	 8KpRaVZIu2byw2AANeP3U/NvjK06Iz3kd3juzpAoLMxzpNLxG1swOa62HP9NkBvNDpQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794583235;
	bh=mTiQSSjX5LupX/QvWqJRrAVoh8C2ohRj4V/a/7y557o=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oysRby0gWAT0ZZk6+TboKWgV0rKu/vCg/sBPriY+BJrkIWHie8d5XPEp/SreKFMXP
	 k9UzDg9gbwwqYuI208RbngDkZX7jx44VKevId4RYSWzA1ft5FxTq1EiW06KG/LXjAE
	 /E4nrkNoqQSI4WCS9skoBP93r5+IrTDWcgK/CHJTlRj0OFUPkFr1DwkrYgsFujCvtE
	 ZGzrKdoTUYx7e9OnjaGtgfjId5NQCZAwcXsGm2chb6QP6bXA8+QiUK/srtksij8hw2
	 MpNMyedBH/LUGDY/Bl8PngnpYAJyHWZFui+pmkCpXLJaiFGGoz3tm7TM2DD30iuKOF
	 QmIJLNapFSzJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A621408B0;
	Fri, 13 Nov 2026 15:20:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F9FFAF8
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 15:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31AC560634
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 15:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WvlhhDmQATJ for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 15:20:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 51A4B6062B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=178.33.251.8
X-Greylist: delayed 473 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 13 Nov 2026 15:20:29 UTC
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=KRbO26OD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.8;
 helo=13.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net
 [178.33.251.8])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51A4B6062B
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 15:20:29 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.254.104])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4jR12n5jN6z8X4C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 15:12:33 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-6q59c (unknown [10.110.58.217])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4D514C29BD;
 Fri, 13 Nov 2026 15:12:33 +0000 (UTC)
Received: from armadeus.com ([37.59.142.108])
 by ghost-submission-7ccd8bbbb6-6q59c with ESMTPSA
 id 7aOiBuEo92qVhDkAC98uGw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 13 Nov 2026 15:12:33 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002e480778a-eb93-441c-b068-e9575700277d,
 1BD46D7BADB2B03721375F79FE7BA5E52EA066B8)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.202.169
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 13 Nov 2026 16:12:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-fix-host-vim-build-v1-1-58b2e5f832b2@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqEMAyF4VeRrA1YxQq+yuDCxqgRL0NjRRDf3
 c64/OCc/wJlL6xQJxd4PkRlWyNMmgCN7TowShcNeZZbY0yBvZw4brrjIQu6IHOHrmxLW1miihj
 i8es5rv7RT/Nag5uY9l8J7vsBIpizC3YAAAA=
X-Change-ID: 20261113-fix-host-vim-build-b5a5676cc7ce
To: buildroot@buildroot.org
X-Mailer: b4 0.16.0
x-ovh-tracer-id: 2945635631952484045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGw7Q0bhyp2ym0IoPJ7HLY12wnmX5fxusx5H2cklG6k+nwC3Kg/lzb5vFowtnaZnL6aiaFEYQVccjyrg9l3TeHeMsVlUpZr7wmkLYKqoEam7suzFIUcJgGXXRD9eWibwX9EAsIJVWhRJzV8ZElpgRiySQ2grPV1zwnYv55tjDagrO0qgJvole53vTJXF/r1f/I2IO/CAph2WfzFKsRIyOpTAOz6+/nleapNtQfPPAiPbuLa0F74G9RKPP3XlKyEi/n18X3pefjxK/ULN+4I9yG1AyTGeILG7vELRhRThE4RA4qKfeiAaLSGxC+r4pXDEcvE4NEucBKV2BIe4sCCwgoHFrV0gncO4kjzj+4sBl8TsHB/uJJi55lUy3JZ9zAcaDAjoFdvtnX9K/18uzkNFi245yRI0fUPekJsEIB1GeewcrRK1VP1LLdC1Rr9/OLIx1hjpHe6LVuGEKD4RFDXBjmEG74AgOyVZfqvVGqKgz9xxYZVhKQHeOM8FlhSnuOx/x/kXfT+RcznWR7pRE3c6+Jlzce5tl4I81H5eWdZe8P1CO0EnHyLE4vhglo+4PU+Y4siRkl+qlN9xTbHcoTqURMfdxLIpkglaX8AuW+al9COQfjPJjiW4OVMqr0QUgl0v3krDv9O8osH8MHipHbC9hu0P0UIPgYUPaTc1KtYzOeXBQ
DKIM-Signature: a=rsa-sha256; bh=w72HJWbT4IS+rmJQfpfLJVy0WQALD1qoYAfE0B5Mkas=; 
 c=relaxed/relaxed; d=armadeus.com; h=From;
 s=ovhmo103079-selector1; t=1794582753; v=1;
 b=KRbO26ODJvUJiD6zSFvbHEF7ivwPqPySy7VGhjPkEohlZGoMIEvmWO3RyDfbVViPmpYrn2FO
 V08/Aa2O56+OZTyJtle2GhT2C+KrMzIx+bquw6qQSbgiOdjN5o2IlWmLUqOt4MGQ1nSBEOwg9AI
 72B3xZX8D92Xvr+OFwSyxhA2QvLGki9/OXWtmh4GOyJZ5dnMUYSyF3bD/97jzIyhFQeK3wGG5Uk
 WfbMWL6iLvGtYvH6aWWbB4UvwVddTU5nZO75KvJafmvrTtyQhg5nfhRHqB7cMT4wkO4ttcszsjJ
 a37mCtbxZU5+vzn8vAWewPR8T/ObD+G3AICKgi7sFuvmw==
Subject: [Buildroot] [PATCH] package/vim: prevent host-vim from using host's
 libncurses
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2hlbiBjb25maWd1cmluZyBob3N0LXZpbSwgdGhlIGNvbmZpZ3VyZSBzY3JpcHQgbG9va3MgZm9y
IG5jdXJzZXMKd2l0aG91dCB3aWRlIGNoYXJhY3RlciBzdXBwb3J0IGJlY2F1c2Ugb2YgdGhlICIt
LXdpdGgtdGxpYj1uY3Vyc2VzIgpvcHRpb24gcGFzc2VkLiBIb3dldmVyLCBob3N0LW5jdXJzZXMg
aXMgYnVpbHQgd2l0aCB3aWRlIGNoYXJhY3RlcgpzdXBwb3J0IChlbmJhbGVkIGJ5IGRlZmF1bHQg
b24gbmN1cnNlcyA2KSBzbyBob3N0LXZpbSdzIGNvbmZpZ3VyZSBzY3JpcHQKZmFpbHMgdG8gZmlu
ZCBuY3Vyc2VzIGFuZCBmYWxscyBiYWNrIG9uIHRoZSBob3N0IG5jdXJzZXMgbGlicmFyeS4KCkl0
IHdvcmtzIGZpbmUgb25lIHNvbWUgaG9zdCAoaS5lIEJ1aWxkcm9vdCBkb2NrZXIgaW1hZ2UpIGJ1
dCBmYWlscyBvbmUKb3RoZXJzIChpLmUgR2VudG9vKSB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6
CgpjaGVja2luZyBmb3IgdGdldGVudCgpLi4uIGNvbmZpZ3VyZTogZXJyb3I6IE5PVCBGT1VORCEK
ICAgICAgWW91IG5lZWQgdG8gaW5zdGFsbCBhIHRlcm1pbmFsIGxpYnJhcnk7IGZvciBleGFtcGxl
IG5jdXJzZXMuCiAgICAgIE9uIExpbnV4IHRoYXQgd291bGQgYmUgdGhlIGxpYm5jdXJzZXMtZGV2
IHBhY2thZ2UuCiAgICAgIE9yIHNwZWNpZnkgdGhlIG5hbWUgb2YgdGhlIGxpYnJhcnkgd2l0aCAt
LXdpdGgtdGxpYi4KCk9uIHRoZSBCdWlsZHJvb3QgZG9ja2VyIGltYWdlLCBsaWJuY3Vyc2VzLnNv
IGlzIGEgbGlua2VyIHNjcmlwdCB0aGF0CmNvbnRhaW5zICJJTlBVVChsaWJuY3Vyc2VzLnNvLjYg
LWx0aW5mbykiLiBJdCBhdXRvbWF0aWNhbGx5IGxpbmtzCmxpYnRpbmZvICh3aGljaCBjb250YWlu
cyB0Z2V0ZW50KS4KCk9uIHRoZSBHZW50b28gaG9zdCwgbGlidGluZm8gaXMgbm90IGF1dG9tYXRp
Y2FsbHkgbGlua2VkIGhlbmNlIHRoZQpmYWlsdXJlLgoKRml4IHRoaXMgYnkgcGFzc2luZyAiLS13
aXRoLXRsaWI9bmN1cnNlc3ciIG9wdGlvbiB0byB0aGUgaG9zdC12aW0KY29uZmlndXJlIHNjcmlw
dCBzbyBpdCBmaW5kcyBhbmQgdXNlcyBsaWJuY3Vyc2VzIGJ1aWx0IGJ5IEJ1aWxkcm9vdC4KClNp
Z25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFy
bWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL3ZpbS92aW0ubWsgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Zp
bS92aW0ubWsgYi9wYWNrYWdlL3ZpbS92aW0ubWsKaW5kZXggM2I1OGFkNDdhNTk2Li42MjNiOGMx
OGUxZjkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdmltL3ZpbS5taworKysgYi9wYWNrYWdlL3ZpbS92
aW0ubWsKQEAgLTc1LDcgKzc1LDcgQEAgVklNX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0g
VklNX0lOU1RBTExfVklfU1lNTElOSwogCiBIT1NUX1ZJTV9ERVBFTkRFTkNJRVMgPSBob3N0LW5j
dXJzZXMKIEhPU1RfVklNX0NPTkZfT1BUUyA9IFwKLQktLXdpdGgtdGxpYj1uY3Vyc2VzIFwKKwkt
LXdpdGgtdGxpYj1uY3Vyc2VzdyBcCiAJLS1lbmFibGUtZ3VpPW5vIFwKIAktLXdpdGhvdXQteCBc
CiAJLS1kaXNhYmxlLWFjbCBcCgotLS0KYmFzZS1jb21taXQ6IGNiMjliMThkYTEzYmFjZmVjNjM5
NjdjZDVhOWUzNjhmMWYwZmU4OTQKY2hhbmdlLWlkOiAyMDI2MTExMy1maXgtaG9zdC12aW0tYnVp
bGQtYjVhNTY3NmNjN2NlCgpCZXN0IHJlZ2FyZHMsCi0tICAKU8OpYmFzdGllbiBTenltYW5za2kg
PHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
