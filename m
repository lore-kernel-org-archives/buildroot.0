Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9B1606A337
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wn8Fmz1j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GE4tehxu
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F00406B7;
	Sat, 21 Nov 2026 21:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7X-VykBHaKoY; Sat, 21 Nov 2026 21:51:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3B92D406BC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795297916;
	b=oaUAjiy1qsPEHiXX5IuhjZJylta8K2bJSXNKh5Fg9pcHGqkPPFqod2cdl6YaWi/CqfAP
	 zCKt/j0Z4TxO7CooBygRnHKQKNYecoZARood1nRnoyF9atOuz8SEggw8vEU9JR1SUjGKY
	 iW+Gl9CKoh13GoDCJ9VFGHuZevKRTZcgnEATvN43F9uP/OWSPo0UoJ4wWMjB2lrhbqZ30
	 V/EDffhr7QtwppM6KPyojq+Ja+Z7SYEHUN9KGhgqhmMrhU2wWKXDAdSv4H8YfB0EZSBjF
	 6bxBYc2cVvYuFicOm/b6i/szQn464mrCGLgEQTFJ7H5O+gcApWpc5wp2oXidWb6jG0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795297916;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UOXOtenq8PALQhbq+4BYrgKEVrFNXEfPkJTMHsJorJU=;
	b=dXpCh8w5elMyPHXMP5+7eCUoel+UIz8FhTDacrdQPBQ39PkrutgeZmoavjGk/Ylr5CoH
	 nOUNn4hK8ELZUeQLoqr1XvrMn+NXvIx8lZGrIJRNNKQGH6Hcs7CS0OlkTcUKbsCRFm2kx
	 kAWLHzs/6bRxp8oK8qIjNNrLYfO8ZwDZcZ2uabEO98oeZ1A9/wPFIM+nuuL4Z9dbkSFMo
	 15VPTIBqK85PXN1yrL/10R9ff24jCqVL6QFXg3FA5+ACicg6u0SbOMF1Z6aPCPy3s+TGg
	 qMoUeP3XP5+RWX6Od1GIteqkgcQW3kB7ZYpn70nkDGpP3CncIVBeU3PP5vpdHKgI2GA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795297916;
	bh=UOXOtenq8PALQhbq+4BYrgKEVrFNXEfPkJTMHsJorJU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wn8Fmz1jFnZpMEtFGcwweN5qGitQIrwr4aOvBLxkzxxEWIhA7sAd+o/IsIPSniPK4
	 7idW78NaJVWhp2lDfT1nhekrl8mkLrKXhnSdgDBhY2hqCWugLH6MsLolhs945qpdjj
	 GzkWsh+YHEE3oUxXefrOxsux3TXeMOrH26jxduKCQB8swE3QQTfDZfqcjzDLohW/kK
	 VBiRHB96wyhCDIZMaxK529kicze4r/xH2FR1qnmdkejwLJYcVf4AYLezD+J38Rs4se
	 G4n/26g8mmCovtbVK8IsLbCKZLPB2DQU/S7qXCUGkpa/dQD5LMQ0mOMxfiQXTpElal
	 T8cG5rYl2qMYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B92D406BC;
	Sat, 21 Nov 2026 21:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65388465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55C5C6061A
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eheYvbJsqQrD for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 21:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0EACA60617
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=GE4tehxu
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EACA60617
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4ba013938d7so18383085e9.2
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 13:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795297911; x=1795902711; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UpB3Jo60o1NHa98RNBoSx6+4j/qWWkZ1N7BgSdnJOoM=;
 b=GE4tehxuih84TwbICiBsul3bovkmoRfkRYNz2vwpwr5+f3gseXX8anOcAQFfR9p09f
 80nZ5hNItLLrZPSvoGGI/tf/ncYTMFZeoNxEvz0UXqTG1BuWtHRr3fpxaQNxZKJ+kju+
 t9wx7blItX8powXNEk7A3gc16lEWMJzscU412/xLzSKAU5EwcInNMdf1eBFqZza3ArkE
 TUQu/pv2eRNgJevj8jGEBmsIcRzFGG4yIbBwZeOTTeUdzc/39MMpIqd0xrPYcKeTU+XG
 nskI86Oi/+ipKuDZgs3XnpQeP46T0ZSpZnnahycznBZgOqL4PuxGrBYtJR4ShR0u4hdH
 ZBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795297911; x=1795902711;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UpB3Jo60o1NHa98RNBoSx6+4j/qWWkZ1N7BgSdnJOoM=;
 b=T3UWRfHeQqAglcGmf5UyLznbwfHzei840MbTWiuaoq0ehDhDm1vLDpBigM4eS+m2pg
 WPd1GjWappO4WLF9QRuvCWHYnnH7+1LvPG2v7aRnc46sO4tHMRc8unpDOIw/kWNFQ+3L
 C3+y9HBwjHaVRF0AQkECksa75dQheoDniHAoFXlkH2Mv1LVKylAr4e3I/L6fNw0E0MuT
 swz5c+jr6+KRz1nZgYjwZrE2MFVNbJYJosertNtCDbgIw2hLoJ2PGJG9GOa869KJTMeW
 NVrO4EKyStKKhjn73mF8GdXgmGVRWp/cEUL93/q61ebHlUKBdiPHNyknAtl7qEBAoZp7
 l3lw==
X-Gm-Message-State: APuU4Z/k0x1HzRyPV7gp4Mf/aQc5iCVErq6k/uLy7K+ZUOxbMTzB0fta
 LrZEiR/pCJ3T1Wp0RnLALL7rYlZJHJ8v7KgrRehldwVzPyB0zNhw8BI9+UBtUEaw
X-Gm-Gg: AZFdTZdCuzbxyqbDQcm7bb2vbd+176hh1GcxhKA7Bc7xatWuCpow8rbffWncvF86ikw
 3sKCahtwm4MRRrh/G5H5UdQX+G0ODwjKRkK08bXaucyD7AxWiEHtRYCiDas9np8E7C2Qt8tSapx
 4mna3M2HtjYMmIzkZSUdTTcrn90dilmDPd6ZFu4/OqDJbHqKjKe91DE/Ifk38jVLEVbhIR0a107
 zHUhh0m4r9nILSaLnVNWetUbGSmUbcNCGrcItGn9gpgf6Ofx7uHxhDpAx/mj+A3KScbssG/VzLO
 Gxus8JQ8Dq36NyNZAE5f0yhg52PbXAU+RjCWMxdfynmU48hOA89s17w3CbvoFXDrynH3erqJEyK
 3ilWXGDucPXkPxWcGJXuiErijADiRRvMCO46q70VXZN438be8GMCWTyHWJQUqUvsEZ1DQiN+1+U
 sj2EmkjhwGyxpLp0lSVsCr0dOe11f/SP1IGtF0HkbGqrW2tyMiivIY37ge2X9wNJ7xcb7F+u2r2
 orFhqLCS+SfUNk7rZYfOOMXvKstJQFE9J6o3uQrZaMLK+RelV1UivT//Bi6xiBU+BXNp17emG4u
 +hyHZCDq1cIOX1GyByE0xG9AWNZ88mTmuY9j9UWUKgIyd7s5MGw=
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id
 5b1f17b1804b1-4bb88938dbemr163637325e9.29.1795297910912; 
 Sat, 21 Nov 2026 13:51:50 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm161893155e9.0.2026.11.21.13.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 13:51:50 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Cheng Yang <yangcheng.work@foxmail.com>
Date: Sat, 21 Nov 2026 22:51:46 +0100
Message-ID: <20261121215147.4121-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121215147.4121-1-angelo.compagnucci@gmail.com>
References: <20250411172944.1379043-1-vincent.stehle@arm.com>
 <20261121215147.4121-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/edk2-platforms: add custom
 version option
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgoKQWRkIGEgY3Vz
dG9tIHZlcnNpb24gb3B0aW9uLCB0byBlbmFibGUgZWFzaWx5IHNwZWNpZnlpbmcgYW4gb2ZmaWNp
YWwgRURLCklJIFBsYXRmb3JtcyB2ZXJzaW9uIHRvIHVzZS4gVGhpcyBpcyBzaW1pbGFyIHRvIHdo
YXQgaXMgZG9uZSBpbiBvdGhlcgpwYWNrYWdlcywgc3VjaCBhcyBsaW51eCwgdWJvb3QsIG9wdGVl
X29zIG9yIGFybS10cnVzdGVkLWZpcm13YXJlLgoKTW92ZSB0aGUgZGVmYXVsdCB2ZXJzaW9uIGRl
ZmluaXRpb24gZnJvbSBlZGsyLXBsYXRmb3JtcyBtYWtlZmlsZSB0byB0aGUKY29uZmlnIG1lbnUg
dG8gc3VwcG9ydCB0aGF0LiBBbHNvLCB3ZSBuZWVkIHRvIG1ha2UgZWRrMi1wbGF0Zm9ybXMgYXBw
ZWFyCmluIHRoZSBtZW51IHRvIGFsbG93IHNlbGVjdGluZyB0aGUgdmVyc2lvbi4gV2Uga2VlcCB0
aGUgc2FtZSBsYXRlc3QKdmVyc2lvbiBieSBkZWZhdWx0IHRvIHByZXNlcnZlIGN1cnJlbnQgYmVo
YXZpb3VyLgoKQWxzbywgYWRkIGEgY2hlY2sgb2YgdGhlIGN1c3RvbSB2ZXJzaW9uIG9wdGlvbiB2
YWxpZGl0eSBpbgplZGsyLXBsYXRmb3JtcyBtYWtlZmlsZS4KClNraXAgdGhlIGhhc2ggY2hlY2sg
Zm9yIGN1c3RvbSB2ZXJzaW9uczogdGhlIGhhc2ggZmlsZSBvbmx5IGNvdmVycyB0aGUKZGVmYXVs
dCB2ZXJzaW9uLiBvcHRlZS1vcyBhbmQgdWJvb3QgZG8gdGhlIHNhbWUuCgpTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBEaWNrIE9sc3Nv
biA8aGlAc2VuemlsbGEuaW8+CkNvLWF1dGhvcmVkLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFu
Z2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+ClRlc3RlZC1ieTogQW5nZWxvIENvbXBhZ251Y2Np
IDxhbmdlbG8uY29tcGFnbnVjY2lAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmdlbG8gQ29t
cGFnbnVjY2kgPGFuZ2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+
IHYyOgogIC0gcmViYXNlIG9uIG1hc3RlcjogdGhlIGRlZmF1bHQgdmVyc2lvbiBpcyBub3cgdGhl
IGVkazItcGxhdGZvcm1zCiAgICBjb21taXQgZjhkYmI1YzYwMzMwICgiQW1wZXJlQWx0cmFQa2c6
IEFkZCBzdXBwb3J0IGZvciBjb25maWd1cmluZwogICAgQVNQTSBwZXIgcm9vdCBjb21wbGV4Iiks
IHNldCBieSAyMjYwNjI3NjEzY2IgKCJib290L2VkazI6IGJ1bXAgdG8KICAgIHZlcnNpb24gZWRr
Mi1zdGFibGUyMDI2MDgiKQogIC0gc2tpcCB0aGUgaGFzaCBjaGVjayBmb3IgY3VzdG9tIHZlcnNp
b25zLCBvdGhlcndpc2UgdGhlIGRvd25sb2FkCiAgICBmYWlscyB3aXRoICJObyBoYXNoIGZvdW5k
IgoKU3VwZXJzZWRlcyB2MTogaHR0cHM6Ly9wYXRjaHdvcmsuYnVpbGRyb290Lm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDQxMTE3Mjk0NC4xMzc5MDQzLTMtdmluY2VudC5zdGVobGVA
YXJtLmNvbS8KCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL0NvbmZpZy5pbiAgICAgICAgIHwgMzUg
KysrKysrKysrKysrKysrKysrKysrKystCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxh
dGZvcm1zLm1rIHwgMjEgKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItcGxhdGZv
cm1zL0NvbmZpZy5pbiBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvQ29uZmlnLmluCmluZGV4IDE3
NjMzYzBmZGQuLmZhZDA5ODNkNjMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMv
Q29uZmlnLmluCisrKyBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvQ29uZmlnLmluCkBAIC0xLDgg
KzEsNDEgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNUwotCWJvb2wKKwlib29s
ICJFREsyIFBsYXRmb3JtcyIKIAloZWxwCiAJICBFREsyIGRlc2NyaXB0aW9uIGZpbGVzIGZvciBh
bGwgc3VwcG9ydGVkIHBsYXRmb3Jtcy4KIAkgIFRoZSBtYWluIEVESzIgYm9vdGxvYWRlciBwYWNr
YWdlIHdpbGwgZGVwZW5kIG9uIHRoZXNlCiAJICBkZXNjcmlwdGlvbiBmaWxlcyB3aGlsZSBidWls
ZGluZyBmaXJtd2FyZSBmb3Igc29tZSBwbGF0Zm9ybXMuCiAKIAkgIGh0dHBzOi8vZ2l0aHViLmNv
bS90aWFub2NvcmUvZWRrMi1wbGF0Zm9ybXMKKworaWYgQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9S
TVMKKworY2hvaWNlCisJcHJvbXB0ICJFREsyIFBsYXRmb3JtcyB2ZXJzaW9uIgorCWRlZmF1bHQg
QlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVNfTEFURVNUCisJaGVscAorCSAgU2VsZWN0IHRoZSBz
cGVjaWZpYyBFREsyIFBsYXRmb3JtcyB2ZXJzaW9uIHlvdSB3YW50IHRvIHVzZQorCitjb25maWcg
QlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVNfTEFURVNUCisJIyBLZWVwIGluIHN5bmMgd2l0aCBs
YXRlc3QgY29tbWl0IGFzIG9mIHRoZSByZWxlYXNlIGRhdGUgZm9yIGJvb3QvZWRrMgorCWJvb2wg
ImY4ZGJiNWM2MDMzMDJkYzY2MWY1NzJiNTYwYmRiMzRmN2RiNmVkYjUiCisKK2NvbmZpZyBCUjJf
UEFDS0FHRV9FREsyX1BMQVRGT1JNU19DVVNUT01fVkVSU0lPTgorCWJvb2wgIkN1c3RvbSB2ZXJz
aW9uIgorCWhlbHAKKwkgIFRoaXMgb3B0aW9uIGFsbG93cyB0byB1c2UgYSBzcGVjaWZpYyBvZmZp
Y2lhbCB2ZXJzaW9uCisKK2VuZGNob2ljZQorCitjb25maWcgQlIyX1BBQ0tBR0VfRURLMl9QTEFU
Rk9STVNfQ1VTVE9NX1ZFUlNJT05fVkFMVUUKKwlzdHJpbmcgIkVESzIgUGxhdGZvcm1zIHZlcnNp
b24iCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNU19DVVNUT01fVkVSU0lP
TgorCitjb25maWcgQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVNfVkVSU0lPTgorCXN0cmluZwor
CSMgS2VlcCBpbiBzeW5jIHdpdGggbGF0ZXN0IGNvbW1pdCBhcyBvZiB0aGUgcmVsZWFzZSBkYXRl
IGZvciBib290L2VkazIKKwlkZWZhdWx0ICJmOGRiYjVjNjAzMzAyZGM2NjFmNTcyYjU2MGJkYjM0
ZjdkYjZlZGI1IiBcCisJICAgICAgICBpZiBCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNU19MQVRF
U1QKKwlkZWZhdWx0IEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1TX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFIFwKKwkgICAgICAgIGlmIEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1TX0NVU1RPTV9WRVJT
SU9OCisKK2VuZGlmCmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxh
dGZvcm1zLm1rIGIvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5tawppbmRl
eCBiN2NkMjk3ODRhLi45Njc4NjJiNDM3IDEwMDY0NAotLS0gYS9wYWNrYWdlL2VkazItcGxhdGZv
cm1zL2VkazItcGxhdGZvcm1zLm1rCisrKyBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1w
bGF0Zm9ybXMubWsKQEAgLTQsMTQgKzQsMTcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CiAKLSMgS2VlcCBpbiBzeW5jIHdpdGggbGF0ZXN0IGNvbW1pdCBhcyBvZiB0aGUgcmVsZWFzZSBk
YXRlIGZvciBib290L2VkazIKLUVESzJfUExBVEZPUk1TX1ZFUlNJT04gPSBmOGRiYjVjNjAzMzAy
ZGM2NjFmNTcyYjU2MGJkYjM0ZjdkYjZlZGI1CitFREsyX1BMQVRGT1JNU19WRVJTSU9OID0gJChj
YWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1TX1ZFUlNJT04pKQogRURLMl9Q
TEFURk9STVNfU0lURSA9ICQoY2FsbCBnaXRodWIsdGlhbm9jb3JlLGVkazItcGxhdGZvcm1zLCQo
RURLMl9QTEFURk9STVNfVkVSU0lPTikpCiBFREsyX1BMQVRGT1JNU19MSUNFTlNFID0gQlNELTIt
Q2xhdXNlLVBhdGVudAogRURLMl9QTEFURk9STVNfTElDRU5TRV9GSUxFUyA9IExpY2Vuc2UudHh0
CiBFREsyX1BMQVRGT1JNU19JTlNUQUxMX1RBUkdFVCA9IE5PCiBFREsyX1BMQVRGT1JNU19JTlNU
QUxMX1NUQUdJTkcgPSBZRVMKIAoraWZlcSAoJChCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNUyk6
JChCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNU19MQVRFU1QpLHk6KQorQlJfTk9fQ0hFQ0tfSEFT
SF9GT1IgKz0gJChFREsyX1BMQVRGT1JNU19TT1VSQ0UpCitlbmRpZgorCiAjIFRoZXJlIGlzIG5v
dGhpbmcgdG8gYnVpbGQgZm9yIGVkazItcGxhdGZvcm1zLiBBbGwgd2UgbmVlZCB0byBkbyBpcyB0
byBjb3B5CiAjIGFsbCBkZXNjcmlwdGlvbiBmaWxlcyB0byBzdGFnaW5nLCBmb3Igb3RoZXIgcGFj
a2FnZXMgdG8gYnVpbGQgd2l0aC4KIGRlZmluZSBFREsyX1BMQVRGT1JNU19JTlNUQUxMX1NUQUdJ
TkdfQ01EUwpAQCAtMTksNCArMjIsMTggQEAgZGVmaW5lIEVESzJfUExBVEZPUk1TX0lOU1RBTExf
U1RBR0lOR19DTURTCiAJY3AgLXJmICQoQEQpLyovICQoU1RBR0lOR19ESVIpL3Vzci9zaGFyZS9l
ZGsyLXBsYXRmb3Jtcy8KIGVuZGVmCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9S
TVMpJChCUl9CVUlMRElORykseXkpCisKKyMKKyMgQ2hlY2sgY3VzdG9tIHZlcnNpb24gb3B0aW9u
CisjCitpZmVxICgkKEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1TX0NVU1RPTV9WRVJTSU9OKSx5
KQoraWZlcSAoJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1TX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFKSksKQorJChlcnJvciBObyBjdXN0b20gZWRrMi1wbGF0Zm9ybXMgdmVy
c2lvbiBzcGVjaWZpZWQuIFwKKwlDaGVjayB5b3VyIEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1T
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFIHNldHRpbmcpCitlbmRpZgorZW5kaWYKKworZW5kaWYgIyBC
UjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNUyBhbmQgQlJfQlVJTERJTkcKKwogJChldmFsICQoZ2Vu
ZXJpYy1wYWNrYWdlKSkKLS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
