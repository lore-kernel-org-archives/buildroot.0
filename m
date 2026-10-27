Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819F606A325
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 05:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aMOYyVob;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pOiiq40/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B4AA807DD;
	Tue, 27 Oct 2026 05:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzC3quDYqzKs; Tue, 27 Oct 2026 05:41:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6630F80BE0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793079709;
	b=mEUTVhY9uixSqMX4rq+9dXnAr3nn0NgrvIelYBoAXHVKdcoa+x1GwPlS8AUNdfhfPJfq
	 T1igO3XNjCEGAEWJrLR+u2rHpZwXYJ2ySjwKxtYm5bcYcVY9qOKKf9VJhPrjhoJGVqeAi
	 7Z8sA7W64VFT+72mKv1RhUXwKJEk9VtXSqy7zj8gThWNyIPwoCywWFkGpD6fx7QbQpH6S
	 kixLEhbqu5fsI6vc2s9/JI9Wncr2meacfYiauJRP3wgGruqN/CYhRxDB4Hrye2/IufCka
	 YVDQhH4adnuXy16/bb+m0/ENvvm9Wu1pWroheU9mp5mk6mor+28ISGoGYlhkg1IG+7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793079709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tLsAGwEGsA1JK31wuVYpHyWyIH04FYntsa3K7ga5jP4=;
	b=gBpFZj/ZbFKRJs1hA3pZCO1HaBDJl2Slx17jsbRcPuJ7YiuYpZzcMqCaaZFPfuIZV7zH
	 nECTrEKQ6bUsRnmpj/tURg9h6lyCR0n4LKbiCEzopZ+J/50GnQelYAwxqMLFfVBBdCJKj
	 0PB5LboflqSAqY/Jx9fRJfQTyV0Bn8xUpUb8L9b82kn7s/lkewzn+xQ+wxU6rC6nG1wHD
	 ob9eBx1iZIEAY7lFC3jqxgmWQ3C1kK+hpAVg0pSSUiVRow+0cuLEOoZ83JKUIVo1YxlTn
	 jrS5uF+IpwgencLMpRHy5+7tWPJCkknN/tEG3PB8CgdAvqqO+f5tAzCfxXrAsuZ64Eg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793079709;
	bh=tLsAGwEGsA1JK31wuVYpHyWyIH04FYntsa3K7ga5jP4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMOYyVobx4y4jvFakpvMZLAUxloIdvc17MVljpY0GSreu7AqF+9spuZmhawU2Bw7f
	 Ti3O8eO+dj0qn/MUOg1SbFn39X6VtKjGcNk1LjlmC9P4+EBx80nFNn87Msx2w1G1kp
	 y2bMEKCktwm6T/7/Q+KRzfEe9k8bQTaaC+MKBVkY/af4D+x9FpBQ7Q/66ugTMOEy82
	 7dzfKGS5bBPr1LMOJpEq0C7VxUQphUWqe4VEm/CyzT8Lqbj/6V9M+L+m9c9MqMHSdh
	 WOru6J6L0znqZHpIojsxW6O5H4ECPmr5CYkZlPMT68LCSiZOdth6RGSIe9t7X4dSRQ
	 JB74/UIgANzEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6630F80BE0;
	Tue, 27 Oct 2026 05:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48C6F2AC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC47400A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rljix0JG3vln for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 05:41:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7C98C40062
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793079706;
 b=NkvD0N0S34XcICsXuwIf6wcxpsF6RUjl4ola5jDNN+IsOKFApp+KjUCBhUT978dlJiRs
 6+OuYZlK+FtpYdkFAEx7sYahTc6/9ka5kivDUru+IMBsaoXY7pfuW5kv2gA2qxqcpOyfb
 Q+YeGSiibWsU0YgGLyrXvsEzRREaFzo8RYbINNYCJjsw7AtmcmkOVWXz1z/n9uH/5zVLC
 Dd6d+wCCf+M091DiClgOvBcIej6mZM/sMLG5+b0MrZ7YQTzdfMpy0CBmbaS2/ycMLs5Y8
 pIqR6pfxlvqDbtr39DTQv2aTpSK9yjqbjOFb93RjWr82mEMViDBMjo9cADpup7q+41w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793079706;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=PKXHzT2mSo79Sp+ABkKuMpZuXpKsleW5CcfmneOy1mQ=;
 b=cXTKP6ni3BL3KK5Gzi2HaYCHF5KGDNqAocU84Jcydmvu58BDCCqgk6DLQl2I/Haid8Gj
 63j6wSaDCZ5PZzszkjjYy0mP+Ckq+DWGC9w5CBg9UGbEvyWy3xCAc4rW/Inw8i0/ydPhN
 INwVCMLZy/XklaTXRmKacGsdYy3pLZIscySvbXAW1gUygVKdRkX+40V0XgSj9uK10E6Cp
 eaeXPj/10bzAgKh/GeCXixzRFMoOjPSfBK7m7kFOqOJ/CmBte0zkouO+0jtM5CW0lN/Uz
 r6cIy/8Tc03au6ywBStwtBVJVdTA9AtFcTOgM22/f5aJg7KGyqdoMHJ+hVBMSOgHt3A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="pOiiq40/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pOiiq40/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C98C40062
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793079661;
 bh=PKXHzT2mSo79Sp+ABkKuMpZuXpKsleW5CcfmneOy1mQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pOiiq40/oPz8rs3BMUbUA2IWAfqP9FAiy3Ta761yphsAmQxvKQmV8+7LvcqdQjP7Z
 evBiLup9Q94Ao8O/TMYYzH4cw2j3QdfzyvDKVCOsfvUOHbJt4H5YkT1ua0gTNa03t6
 jeNtsG5RW9cfP5mtU5nzlvq3t/GqrEpTF5w33SYEOxnSen1OZ5Ertn8BmZ73AX15Vr
 J+T9H8VxlmClB7aTCwUjkEDLxY1/hEMeoavPp7EXMhPQ4ofmfUGfGqN4m0MxPs8Fdy
 xolCAxEH8OV0wvs7SlIH9w9h5+8myrFssCO05WmKbj0OXyLT8AMdI0pEUGyvBNf0iR
 Y8uB4wuVHg5ng==
X-KAS-Sym: v3:f51bdf72230551df:idzSaPYQcOBEH3hN4ZWiwbOHktskG+Lrl0WEmAPz82oXA
 x9P0/DSJSXHsBWmUzjiYMlh4U2urOhQ6sNljK8Gg7MUrxk8NhWOS9gYGjyTLmLTvxg2NKYUqByQ
 7dOze/4JqSp46jsj9L2tZUUSPbxlImbpe+S1mid1JN+qG66oTpCOTj1jlmVx/uGnE8oLEisteQO
 220IDjhE7LPI2/8krbJ6GWVtTSVIBXMsNW+YemgzoLXfXrDGJiuW5ibak2NOeYDxYtm86VKzdDg
 vV4lQXuTdRQvbxp9s8WBa4zvXHqyKccFXVLeX7n3rkcdm+Y0yAZCPbCts49bgEGlLRgD5MQQ==:
 2YYeWjAh/V4iL4fEh/wygUsGs0axOWvfEaVd1X9r7IGk7o99Xgw9NHKGPvCTJ//kqlqkbUghMqc
 6lvTBr9p4DeWPACKnte4sECDcyN5Z/ILf12NXDsUEVKeCMLZ0sbwQo1w1aRcAxhauyEDmIarsuP
 5a7gud8RZlw9BQLilCBtPGDptEl011ofjmTXIrH7MbWlPYWL+mGa7wBJBPXVtUxp9ypzBqwEAvR
 mV/pG3nDQzESWsTYjZvu1vpUjkZKOjaWUWXPo5be0y/93OheX7CCx2zfI2wbG3DTWxFLPdr2fU7
 sgLZErVSxqeQ1vLFMIV27WIws2LsPyq6jdgRcRBCwV0nM2aCQd6iX5cZGuHuLSKAI7ouYE9OX31
 ug+daDRyRSD2RzczTyulB5o2N9zRSCy6w4kRulLF/WckbL21fOeNjxpnExkQexAajjfFw8tsXuh
 07v9tiDq6EwPezG+6FqwWUGSwCHTO+l/R0j2p5pdQMsBvactC2bCEoZGDCcjBmcShg/LhVM1C9X
 YQsgPsKvTTsM2pans5XYa3gp3JRMTdzTfm1fq9SFbaxOn/Q0Q==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8011A4C6E11;
 Tue, 27 Oct 2026 06:41:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58314)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLZvI-0000000078y-14WT;
 Tue, 27 Oct 2026 05:40:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Tue, 27 Oct 2026 06:40:33 +0100
Message-ID: <20261027054034.4556-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027054034.4556-1-bernd@kuhls.net>
References: <20261027054034.4556-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 5/6] package/docker-engine: bump version to
 v29.9.2
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKVXBkYXRlIHRvIHRoZSBsYXRl
c3QgdmVyc2lvbiwgYWRqdXN0IHRvIHRoZSBwYWNrYWdpbmcgYW5kIHRhZ2dpbmcKY2hhbmdlcyBh
bmQgYWRkIG5mdGFibGVzIGFzIGEgbmV3IGRlcGVuZGVuY3kuCgpodHRwczovL2RvY3MuZG9ja2Vy
LmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkxMgpodHRwczovL2RvY3MuZG9ja2VyLmNv
bS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkxMwpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9l
bmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkyMQpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdp
bmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkzMQpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUv
cmVsZWFzZS1ub3Rlcy8yOS8jMjk1MgpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVs
ZWFzZS1ub3Rlcy8yOS8jMjk1MwpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFz
ZS1ub3Rlcy8yOS8jMjk2MgpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1u
b3Rlcy8yOS8jMjk3MgpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rl
cy8yOS8jMjk4MApodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8y
OS8jMjk4MQpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8j
Mjk4MgpodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk5
MApodHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk5MQpo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk5MgoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpbQmVybmQ6IHNxdWFz
aGVkIGFuZCByZWJhc2VkIGNvbW1pdHMgZnJvbQogaHR0cHM6Ly9naXRodWIuY29tL2hvbWUtYXNz
aXN0YW50L2J1aWxkcm9vdC9jb21taXRzL2RvY2tlci0yOS44LjEvCiBidW1wIHZlcnNpb24gdG8g
MjkuOS4yXQpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0K
IHBhY2thZ2UvZG9ja2VyLWVuZ2luZS9Db25maWcuaW4gICAgICAgICAgfCAxICsKIHBhY2thZ2Uv
ZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1l
bmdpbmUvZG9ja2VyLWVuZ2luZS5tayAgIHwgOSArKysrLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9j
a2VyLWVuZ2luZS9Db25maWcuaW4gYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvQ29uZmlnLmluCmlu
ZGV4IDM3ZDdmNzkyOGQuLjRhNzJmNjRlOWUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZG9ja2VyLWVu
Z2luZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL0NvbmZpZy5pbgpAQCAt
MTIsNiArMTIsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfRE9DS0VSX0VOR0lORQogCXNlbGVjdCBC
UjJfUEFDS0FHRV9IT1NUX0dPCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0lQVEFCTEVTICMgcnVudGlt
ZSBkZXBlbmRlbmN5CiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlNFQ0NPTVAKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfTkZUQUJMRVMKIAloZWxwCiAJICBEb2NrZXIgaXMgYSBwbGF0Zm9ybSB0byBidWls
ZCwgc2hpcCwKIAkgIGFuZCBydW4gYXBwbGljYXRpb25zIGFzIGxpZ2h0d2VpZ2h0IGNvbnRhaW5l
cnMuCmRpZmYgLS1naXQgYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5oYXNo
IGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUuaGFzaAppbmRleCAzMmJkYjQ1
ZWY1Li42YTQ5MzFhNjQ4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5oYXNoCisrKyBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhh
c2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAwZTQ1MGMw
M2M1MzZhMTMwNGJhOGZkMjZjYTRjNGZmOTZmYWM2MjE4MmZkMDQyZmVjOTBmZmRmNGEwOTY5ZDQw
ICBkb2NrZXItZW5naW5lLTI4LjUuMi1nbzIudGFyLmd6CitzaGEyNTYgIGQ3Y2UxODI1MjhlYjRj
MTgyZjM4ODRhN2E4M2I3NjUyZmZjYmM1OWIyMWQzZDMwMjA1MDU2NGZmOTQ5YTk2ODkgIGRvY2tl
ci1lbmdpbmUtMjkuOS4yLWdvMi50YXIuZ3oKIHNoYTI1NiAgN2M4Nzg3MzI5MWYyODk3MTNhYzVk
ZjQ4YjFmMjAxMGViNjk2Mzc1MmJiZDZiNTMwNDE2YWI5OWZjMzc5MTRhOCAgTElDRU5TRQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsgYi9wYWNrYWdl
L2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tawppbmRleCA1NTAyMjg0ZGMzLi5jNmVkYmFm
NmRiIDEwMDY0NAotLS0gYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tawor
KysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tawpAQCAtNCwxNCArNCwx
NCBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotRE9DS0VSX0VOR0lORV9WRVJTSU9O
ID0gMjguNS4yCi1ET0NLRVJfRU5HSU5FX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG1vYnksbW9ieSx2
JChET0NLRVJfRU5HSU5FX1ZFUlNJT04pKQorRE9DS0VSX0VOR0lORV9WRVJTSU9OID0gMjkuOS4y
CitET0NLRVJfRU5HSU5FX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG1vYnksbW9ieSxkb2NrZXItdiQo
RE9DS0VSX0VOR0lORV9WRVJTSU9OKSkKIAogRE9DS0VSX0VOR0lORV9MSUNFTlNFID0gQXBhY2hl
LTIuMAogRE9DS0VSX0VOR0lORV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1ET0NLRVJfRU5H
SU5FX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBsaWJzZWNjb21wCi1ET0NLRVJfRU5HSU5F
X0dPTU9EID0gZ2l0aHViLmNvbS9kb2NrZXIvZG9ja2VyCitET0NLRVJfRU5HSU5FX0RFUEVOREVO
Q0lFUyA9IGhvc3QtcGtnY29uZiBsaWJzZWNjb21wIG5mdGFibGVzCitET0NLRVJfRU5HSU5FX0dP
TU9EID0gZ2l0aHViLmNvbS9tb2J5L21vYnkvdjIKIAogRE9DS0VSX0VOR0lORV9DUEVfSURfVkVO
RE9SID0gbW9ieXByb2plY3QKIERPQ0tFUl9FTkdJTkVfQ1BFX0lEX1BST0RVQ1QgPSBtb2J5CkBA
IC0yNSw3ICsyNSw2IEBAIERPQ0tFUl9FTkdJTkVfTERGTEFHUyA9IFwKIAogRE9DS0VSX0VOR0lO
RV9UQUdTID0gY2dvIGV4Y2x1ZGVfZ3JhcGhkcml2ZXJfemZzCiBET0NLRVJfRU5HSU5FX0JVSUxE
X1RBUkdFVFMgPSBjbWQvZG9ja2VyZCBjbWQvZG9ja2VyLXByb3h5Ci1ET0NLRVJfRU5HSU5FX0JV
SUxEX09QVFMgKz0gLW1vZD12ZW5kb3IgLW1vZGZpbGU9dmVuZG9yLm1vZAogCiBpZmVxICgkKEJS
Ml9QQUNLQUdFX0xJQkFQUEFSTU9SKSx5KQogRE9DS0VSX0VOR0lORV9ERVBFTkRFTkNJRVMgKz0g
bGliYXBwYXJtb3IKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
