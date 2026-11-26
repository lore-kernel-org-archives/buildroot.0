Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB48606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oCerHoc8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de header.a=rsa-sha256 header.s=MBO0001 header.b=gFyymEcc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64CCC409DA;
	Thu, 26 Nov 2026 15:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_km2zi1cfgu; Thu, 26 Nov 2026 15:01:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E3E6E409E3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795705278;
	b=ICjxU3AY3T2T2lmS8LIGb/cXRfmMPYyyXNppKr8plNMS2rrnYun4Plf6ciXpST+2DIK7
	 ESjIGxU7HpkNEvoKjz0VDpTtc+B6gY4YCxsIT0ZGx4d9IEN8uvfw1WmpV0QXF/6eGDefw
	 UQhnVirNcXBhJSpI+FyYlkBaYBvYTt9yR0vFNb8HVJYR2VVxOM1ZUlVNTj18FvgrBZzK8
	 J0teQ+yI05TqlN/GwJyXClZJJ7fHQZgc0Kf0UXGxzC6/5xehigDV0JvcYTlbcybr/h41o
	 y7RMnxsohtrbS1wzRMuA6VDYjepP+Rgjv/duTp48jcyWaBgo19jyJoC4sg1i8P3McNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795705278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Rspamd-Queue-Id:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fDSgkL2HxSa22mgFsYgsUH+WcSVvEsMAy8PK7Pp/4Hw=;
	b=rPiVNHuR294PGarZITlEazgl2wN/fA5fatv7b6nqv6ePUHG5zo1x76mdatkigjeK0BTF
	 BxIWca+CTJmvSsFnMHUvqIbLnr7FLWp/tfczfwOto/8LdZqQx4ROv9BC4coH/SSlCzc4W
	 qIpVOlNlX0RoyxYQSDJvXlv2bUFmOG5AH4K3+WGCeOIu2tGnpnelisRKKqZphrwiX4lR6
	 kmJsM/qYDe+kdAPEChJBTYlQn+UwDtrvn2fZ7xjBGzzPSxoo4RakKdhvSZ5JcUytGBDf9
	 DSo4dhrkXqc3DphnldphI8nI2RN8GhBSvV5i8w/un8k0SwHNaiO510yDG/DvfuHGLeQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795705278;
	bh=fDSgkL2HxSa22mgFsYgsUH+WcSVvEsMAy8PK7Pp/4Hw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oCerHoc8VO01qG5oLpMSzcwlXOueHqcgpeFi6y3lBcmrdcmQIB4+EGRrV/dLmx/WP
	 NJL7qT+SasekJfTZb83q1UbHDHsOE0QRa8+HciVwkJgv3eCdVs6ZcBE8iKX8WgTjte
	 /JfTxKoNhBo842ZwXcqTSgR9xt2hQYBGIGJG4HPs91a++/bdUDmP02cguHMKWeYsXl
	 m2V+ddG8grmT5BS5PvWW46jSBI2ihZaPOfYIz5zcHqQZyceu53TKx6k9MPsa+ytzf7
	 JCak1p3/xosloBMtz8sV2JsGtx8cAgo1zR22pOECCozVVBPw0L2BcubwOFYJ5aeKt9
	 mL1UYmH/MooXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E6E409E3;
	Thu, 26 Nov 2026 15:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28199260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19E0C811D4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpJYbIFBFQIG for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 15:01:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A48AE811B7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=195.10.208.40
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.40;
 helo=mout-b-210.mailbox.org; envelope-from=sebastian.michel@oss.othermo.de;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=gFyymEcc
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A48AE811B7
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:01:15 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4jb09g35SrzFqr0;
 Thu, 26 Nov 2026 16:01:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1795705271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2xNdohQxRwJdZ4ImU+E3qNRWjVvruXLcdOYeqV1k/9E=;
 b=gFyymEccm1PwECcUJx48+On1In+XlNO1VdsZIZzknws85G2FzXJATbCOb8hoq2ypeW1m4L
 ZunruaVROvDAu5lKTnVpEMlpO9Zn61eHE9S7lxq7SLgYXY/f9YdmTAPgELPdxsDvrbVKH5
 FhIB4nkpPLWFcshL9n6AwWlgIAYuY/qq1SDNo+YWssgxcBEvA870e3ya69+Bj5+bWlxhLp
 sHRb10JMjl/uiOoh4T9km7xN59xFA12gnFwJo/Ng7nF5hTQfEtYQMVCvkeI9atoUolhEAF
 JU7arzzZzBkClGrkP8vMzg99m4Ca7DuH3rTACef8dO5alR1tegzRZBYAhxWFFQ==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of sebastian.michel@oss.othermo.de
 designates 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=sebastian.michel@oss.othermo.de
From: Sebastian Michel <sebastian.michel@oss.othermo.de>
To: buildroot@buildroot.org
Date: Thu, 26 Nov 2026 16:00:46 +0100
Message-ID: <20261126150049.905428-1-sebastian.michel@oss.othermo.de>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4jb09g35SrzFqr0
Subject: [Buildroot] [PATCH] package/python-can-isotp: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sebastian Michel <sebastian.michel@oss.othermo.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIHRoZSBQeXRob24gaW1wbGVtZW50YXRpb24gb2YgdGhlIElTTy1UUCB0cmFuc3BvcnQgcHJv
dG9jb2wKKElTTyAxNTc2NS0yKS4KCmh0dHBzOi8vZ2l0aHViLmNvbS9weWxlc3NhcmQvcHl0aG9u
LWNhbi1pc290cAoKQWRkIGEgcnVudGltZSB0ZXN0IGNvdmVyaW5nIHNpbmdsZS1mcmFtZSB0cmFu
c21pc3Npb24gdXNpbmcgdGhlIHB1cmUgUHl0aG9uIHRyYW5zcG9ydCBsYXllci4KClNpZ25lZC1v
ZmYtYnk6IFNlYmFzdGlhbiBNaWNoZWwgPHNlYmFzdGlhbi5taWNoZWxAb3NzLm90aGVybW8uZGU+
Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMg
KysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsK
IHBhY2thZ2UvcHl0aG9uLWNhbi1pc290cC9Db25maWcuaW4gICAgICAgICAgICB8ICA2ICsrKwog
Li4uL3B5dGhvbi1jYW4taXNvdHAvcHl0aG9uLWNhbi1pc290cC5oYXNoICAgIHwgIDUgKysKIHBh
Y2thZ2UvcHl0aG9uLWNhbi1pc290cC9weXRob24tY2FuLWlzb3RwLm1rICB8IDE0ICsrKysrKwog
Li4uL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9jYW5faXNvdHAucHkgIHwgNDggKysrKysr
KysrKysrKysrKysrKwogLi4uL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fY2FuX2lzb3RwLnB5
ICAgIHwgMTEgKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWNhbi1pc290cC9Db25maWcuaW4KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1jYW4taXNvdHAvcHl0aG9uLWNhbi1pc290cC5oYXNo
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tY2FuLWlzb3RwL3B5dGhvbi1jYW4t
aXNvdHAubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS9zYW1wbGVfcHl0aG9uX2Nhbl9pc290cC5weQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2Nhbl9pc290cC5weQoKZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDU5ZmFkN2YyNmIuLmViOTllOTExMDcg
MTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMzA1NCw2ICszMDU0
LDkgQEAgTjoJU2ViYXN0aWFuIE1pY2hlbCA8c2ViYXN0aWFuLm1pY2hlbEBvc3Mub3RoZXJtby5k
ZT4KIEY6CXBhY2thZ2UvcHl0aG9uLXNlcnZlc3RhdGljLwogRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zZXJ2ZXN0YXRpYy5weQogRjoJc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc2VydmVzdGF0aWMucHkKK0Y6ICBwYWNrYWdl
L3B5dGhvbi1jYW4taXNvdHAvCitGOiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2Ft
cGxlX3B5dGhvbl9jYW5faXNvdHAucHkKK0Y6ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3B5dGhvbl9jYW5faXNvdHAucHkKIAogTjoJU8OpYmFzdGllbiBTenltYW5za2kgPHNl
YmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgogRjoJYm9hcmQvYXJtYWRldXMvCmRpZmYg
LS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IDQ5NjU5
YjAwN2UuLjNkZWNiYzY2NjEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3Bh
Y2thZ2UvQ29uZmlnLmluCkBAIC0xMDUxLDYgKzEwNTEsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRo
b24gbW9kdWxlcyIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNhY2hlbGliL0NvbmZpZy5pbiIK
IAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNhY2hldG9vbHMvQ29uZmlnLmluIgogCXNvdXJjZSAi
cGFja2FnZS9weXRob24tY2FuL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNh
bi1pc290cC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1jYW5vcGVuL0NvbmZp
Zy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNib3IvQ29uZmlnLmluIgogCXNvdXJjZSAi
cGFja2FnZS9weXRob24tY2JvcjIvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tY2FuLWlzb3RwL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWNhbi1pc290cC9Db25maWcu
aW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNTZjZWIwYWI1OAotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLWNhbi1pc290cC9Db25maWcuaW4KQEAgLTAs
MCArMSw2IEBACitjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0NBTl9JU09UUAorCWJvb2wgInB5
dGhvbi1jYW4taXNvdHAiCisJaGVscAorCSAgTW9kdWxlIGVuYWJsaW5nIHRoZSBJc29UUCBwcm90
b2NvbCBkZWZpbmVkIGJ5IElTTy0xNTc2NS4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL3B5bGVz
c2FyZC9weXRob24tY2FuLWlzb3RwCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1jYW4taXNv
dHAvcHl0aG9uLWNhbi1pc290cC5oYXNoIGIvcGFja2FnZS9weXRob24tY2FuLWlzb3RwL3B5dGhv
bi1jYW4taXNvdHAuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44
NjIyZDA4YmM5Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tY2FuLWlzb3RwL3B5
dGhvbi1jYW4taXNvdHAuaGFzaApAQCAtMCwwICsxLDUgQEAKKyMgbWQ1LCBzaGEyNTYgZnJvbSBo
dHRwczovL3B5cGkub3JnL3B5cGkvY2FuLWlzb3RwL2pzb24KK21kNSAgMzRmNDAzOGJmZGQxYTcx
OTU3M2ZiNmU2MTBkNWQxZjUgIGNhbl9pc290cC0yLjAuNy50YXIuZ3oKK3NoYTI1NiAgNDU4NmNh
NjJmODY0NmRhOTE4ZGYxZDNmZmQyNTdjN2UzNTMyYTRmYmQxMzhjZWJkOGZlMDc3N2UzYjk0ZTM2
MSAgY2FuX2lzb3RwLTIuMC43LnRhci5negorIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVj
a3N1bXMKK3NoYTI1NiAgYWFlMTIyZTIyYjg0MmM3ZmUxMTNlNjk2OGZmMDBhNTI2MTlkM2ExMWIz
N2Y3NzkxZWViZWNiN2ZjNzA0MjEwMyAgTElDRU5TRS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cHl0aG9uLWNhbi1pc290cC9weXRob24tY2FuLWlzb3RwLm1rIGIvcGFja2FnZS9weXRob24tY2Fu
LWlzb3RwL3B5dGhvbi1jYW4taXNvdHAubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uM2M4Y2UxYTRiYwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLWNh
bi1pc290cC9weXRob24tY2FuLWlzb3RwLm1rCkBAIC0wLDAgKzEsMTQgQEAKKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCisjCisjIHB5dGhvbi1jYW4taXNvdHAKKyMKKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCisKK1BZVEhPTl9DQU5fSVNPVFBfVkVSU0lPTiA9IDIuMC43CitQWVRIT05fQ0FOX0lT
T1RQX1NPVVJDRSA9IGNhbl9pc290cC0kKFBZVEhPTl9DQU5fSVNPVFBfVkVSU0lPTikudGFyLmd6
CitQWVRIT05fQ0FOX0lTT1RQX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvNzkvMjkvNWE0YmZhNjI1MjU0Njg2ZWUyZTZjZTRlNTQ1MzA5NTZkNjJhZjZlOTk1
YjA1ODg5MTZiNGNhYWU0ZGMzCitQWVRIT05fQ0FOX0lTT1RQX1NFVFVQX1RZUEUgPSBzZXR1cHRv
b2xzCitQWVRIT05fQ0FOX0lTT1RQX0xJQ0VOU0UgPSBNSVQKK1BZVEhPTl9DQU5fSVNPVFBfTElD
RU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0CisKKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fY2Fu
X2lzb3RwLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9j
YW5faXNvdHAucHkKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYjI1ZjU1
NTE0ZAotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Nh
bXBsZV9weXRob25fY2FuX2lzb3RwLnB5CkBAIC0wLDAgKzEsNDggQEAKKyMgRXhhbXBsZSBhZGFw
dGVkIGZyb20gaHR0cHM6Ly9jYW4taXNvdHAucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2lzb3Rw
L2V4YW1wbGVzLmh0bWwjZGVmaW5pbmctY3VzdG9tLXJ4Zm4tYW5kLXR4Zm4KKworZnJvbSBjb2xs
ZWN0aW9ucyBpbXBvcnQgZGVxdWUKKworaW1wb3J0IGlzb3RwCisKKworcXVldWVfYSA9IGRlcXVl
KCkKK3F1ZXVlX2IgPSBkZXF1ZSgpCisKKworZGVmIHJ4X2EodGltZW91dCk6CisgICAgcmV0dXJu
IHF1ZXVlX2EucG9wbGVmdCgpIGlmIHF1ZXVlX2EgZWxzZSBOb25lCisKKworZGVmIHJ4X2IodGlt
ZW91dCk6CisgICAgcmV0dXJuIHF1ZXVlX2IucG9wbGVmdCgpIGlmIHF1ZXVlX2IgZWxzZSBOb25l
CisKKworc3RhY2tfYSA9IGlzb3RwLlRyYW5zcG9ydExheWVyKAorICAgIHJ4Zm49cnhfYSwKKyAg
ICB0eGZuPXF1ZXVlX2IuYXBwZW5kLAorICAgIGFkZHJlc3M9aXNvdHAuQWRkcmVzcygKKyAgICAg
ICAgaXNvdHAuQWRkcmVzc2luZ01vZGUuTm9ybWFsXzI5Yml0cywKKyAgICAgICAgdHhpZD0weDEy
MzQ1NiwKKyAgICAgICAgcnhpZD0weGFiY2RlZiwKKyAgICApLAorKQorCitzdGFja19iID0gaXNv
dHAuVHJhbnNwb3J0TGF5ZXIoCisgICAgcnhmbj1yeF9iLAorICAgIHR4Zm49cXVldWVfYS5hcHBl
bmQsCisgICAgYWRkcmVzcz1pc290cC5BZGRyZXNzKAorICAgICAgICBpc290cC5BZGRyZXNzaW5n
TW9kZS5Ob3JtYWxfMjliaXRzLAorICAgICAgICB0eGlkPTB4YWJjZGVmLAorICAgICAgICByeGlk
PTB4MTIzNDU2LAorICAgICksCispCisKKworcGF5bG9hZCA9IGJ5dGVzKFswLCAxLCAyLCAzXSkK
K3N0YWNrX2Euc2VuZChwYXlsb2FkKQorCitzdGFja19hLnByb2Nlc3MoKQorc3RhY2tfYi5wcm9j
ZXNzKCkKKworYXNzZXJ0IHN0YWNrX2IuYXZhaWxhYmxlKCkKK2Fzc2VydCBzdGFja19iLnJlY3Yo
KSA9PSBwYXlsb2FkCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3B5dGhvbl9jYW5faXNvdHAucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3B5dGhvbl9jYW5faXNvdHAucHkKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uOGY1OTJjZDgwNgotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2Nhbl9pc290cC5weQpAQCAtMCwwICsxLDExIEBACitmcm9t
IHRlc3RzLnBhY2thZ2UudGVzdF9weXRob24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdlQmFzZQor
CisKK2NsYXNzIFRlc3RQeXRob25DYW5Jc290cChUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgorICAg
IF9fdGVzdF9fID0gVHJ1ZQorICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25m
aWcgKyBcCisgICAgICAgICIiIgorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKKyAgICAg
ICAgQlIyX1BBQ0tBR0VfUFlUSE9OX0NBTl9JU09UUD15CisgICAgICAgICIiIgorICAgIHNhbXBs
ZV9zY3JpcHRzID0gWyJ0ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fY2FuX2lzb3RwLnB5Il0K
LS0gCjIuNTYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
