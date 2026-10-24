Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8545A606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aKrUhI8g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=O64N1bYO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF4F40719;
	Sat, 24 Oct 2026 18:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1GIc0Q_ZGob; Sat, 24 Oct 2026 18:42:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 600D1406EB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792867374;
	b=R81Xg3d1GcmqaklYp97r3MQgLk16WpaBRZbELwfFGVldX7HNvtT3JFqyD/DLvmtAxEP9
	 +WTbBO9DJnbsYZVS5Lh/nUKkFn/2CrVHl/iiQiK2qSUYf4EPF/mNZeduIqZCCjilntPcp
	 /jL/i7hJNolA7yOKQs4hEwkyEqhwSgIpw9KwCUH6sRmzoKtFz8GHX+k6FjYWPwUAM2KcP
	 T94oN20sgyqy1KQ4jNQXE1agtLivMmlPdFZBEzxHOBYsMf9u+z2nzWbWaP9IV8tIwDTzu
	 EbTeWQQTLuwwkPdh+V5VRiNPRioKWzKpOr2TIelSncxZA4W9gsIEcZxaBwwTtZE1hPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792867374;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T+lM6x/0uOMin3u7meWxAMK/FJbS3bgLqjWq1tQP1uM=;
	b=KhwhVUE/Ipsk23QTVLyFwJ5k3Ydo5KKE+3+v52UaNfv9mV6W+zX7kk9Cc4kajAI9hh8l
	 KgdcgHT7CAEueAYSER1Z6zPvBXrvc4AmvZjMe5HLW52pPgNWEQ8Gw2MA7ZuEWdsr3DkHL
	 Y4xYQRow5CwvTP0qeOj0u2vC5HVuJTT1eXcI1orLehTYsT4yPXDXbcDIQjF/jnGUcXER8
	 yjVw+Ku7+82WMoXkSkiC9NXih2gP2Ms2To8YnmKJrzzR/wPu32xYJDly/xKi11BxVRUnw
	 QnM3nS/K0nN5LYkagPngdLN5+YRAfSbfTMl+3tmx4w7feKKbjBNQNiOJmpjc8m2u08w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792867374;
	bh=T+lM6x/0uOMin3u7meWxAMK/FJbS3bgLqjWq1tQP1uM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aKrUhI8gSG2IXBhV5XBEIAIA+c5fEQcu0I7rYMeloSH39nG8Fmmvzduchd+p3MUMS
	 /rcFHORo0cADEEQn59B5OWUSluJnZLJy+eBraIPQj4RwdtW1ez9w720I8Wer2Qim5S
	 VpxEKV6E29hLjOi24ItAt7KECODl+DD/eZagLRYJBLJqK7KvfZ3m3q5/j7yDaMt43+
	 zCIf9JcbggHWpEBWDpm92ETAz6fow2/koQIpMBEZ0kD2v3YmeHKK1eMgVcH8nkWQi4
	 rUikH/Ha3H48UcxexYVLnK9UBqgwy3eEdctfyr06rUoCmKH4SRFlfkCtjwLi0NloTB
	 DlgCW1e2SMFtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 600D1406EB;
	Sat, 24 Oct 2026 18:42:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 637722F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5573260638
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLUlv3UsBd9a for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2115560622
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792867371;
 b=YvXeXBbc3ACVVmB/qIP+vSkl6v/QWKqpCEQJ5mwlgpmrVE58DWk2mPjcKpUuA7XnTzFC
 9tXqOKXWtSMH+BzlazoWZt9uQcdy2KO66qXTi3oHrO3sMXMIL0jaHQN36YLUwgPbcYrK5
 03qD+9RFiBSVSExSI2hz+Lr8pwXa8pKUOIXFrdjZzXX9CKb3J6n/glxaFFif3Up2ptUW8
 t593rlKZVnXEHc91XQkVGgQQdmVmypgFiw2geQ9eCXnKMIK1lFsbujecXzVfiduziJOWZ
 T44wfUvBKfTbYH1a7vN2B3vVGnkfJu8/oPwmihBKHUNlDQzAXSVR+AZFmxxoDLLkwAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792867371;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IrxM5t8P1BjxmFeh+tFSac7F969AxnokUK0Wa07Sdos=;
 b=YYREauPo5DgWXq2IP7ojSNa0e5b2dJV/tUxWKGHKcVjnqZsnAI8uucS7wh2xrl5Vcg+M
 lEFM7IdzWfqjl7QFEuQGPj1lvIgaYnMiraWA/aUCRSgXtILshWkiKjTdG2L1xB6rE5Fgm
 UedzoswBBbvn/AQgAGND9Fbg9SO9qi5W6EDxaaXbxi0e2muqLJ3kzl4C2DRuntFGzPZ5f
 01V2es9EUP2DE/HTYjHXj93uZ78YMl9bjQNQcyJmOuxxQDqpcFbpDrYGMTHSI/TyoK8Tc
 M9bP5fl7cEFXHM3wbnFnVf8/l6BSfdOM4kjo6Ej+Ekmpy8C9BWPASmlbhs3onKV0dzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=O64N1bYO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=O64N1bYO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2115560622
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792867368;
 bh=IrxM5t8P1BjxmFeh+tFSac7F969AxnokUK0Wa07Sdos=;
 h=From:To:Cc:Subject:Date:From;
 b=O64N1bYOVo1j8SzM4tpv2GS5ct3iPnIFDugV41hayHli5hPKcw3S9WdJbE6tuVgAP
 ydr1yi2XEg3oZtnvZ+Ghp5Bmel0SLZROuGjUZ+o0jQeWWM0+26e8ME5YD3Hk8mufL+
 T5LX/L54TaOnXaNd1azHWibtmLT9eHn09nARNpBa+9GiSdSBgByU9B4c0vLHiUU3L7
 T4uziNKD/fPoTh69td3JlgTyygbLxds0VNLiAAnz92pU/7rc9Vtqj2vtOmFB6ysr14
 WsyQahC4DWGl8sgIUscBxbISfWAoFUTq+B3M/o2vOnebL2cnX80Gqai9J7+LkUSQaE
 0x5dcRT6ArRwQ==
X-KAS-Sym: v3:f51bdf72230551df:GKJ4qUW3jcHHXSPweD2j4PauF9GBg3+bh9U26TkAS1DKy
 vRwBiYqVZpMFJwJtLvgjb3UrzB5uhkjMQt+v1WrjdRkCdVgWvlOwS6aIEe9lAErLUJWFyqiT78I
 ZAVSUqTX5gJi1RFE2vG1f9bsbB252nZyxyFDFz9AgUQVVWr6omQwb68Q4LLHddFaG0u8UK1AWcD
 VQ1ukLW/CZvI9rfVkTvft9YzyMcz4P8aulTptkJ7gMSYeAPXIhpbgD0Bwo3WYVdGCGXbHTmB8Rm
 GcPxR7cWYnkIp2CXPzXm5tfUF3X40CKCZZ1HR2EA+8lZS1jdHw66jPiPIT0IgfuVu8rXox4w==:
 IH9qr743HKilcHZmAI8UsDugxcjWRpqCOaP7Gjam90eZ3r6jLiktxi6TxtGRR8eIS9AcAVXS2jk
 WPlkyYBQSFbWP5HJuBdYQ2Badk9AH2DkvXSZxeMDuW4RQQhBxiFhzVYwDIkuQzeVPYjcAd+Fkdv
 ztEfSX3D4TiJXFzxtUAWyaqaHjW+3sjTNFH3wailVoXfXmLgdQ8nBZf4Xe2T10OqRhA0CZRZH9M
 qtKHIxwvnuLvghyD734+2HiWPEjAsCNMA/8nSUZJCmE6XEhT4SpHmtyQwPlMkPsR/Y29j7nxuym
 LVqrstNKtcj210Yqp124uJ/exsmnRCTfeIHuFBEgEAOjESnAMWNGRSAjKzFbGpooyKvaIvFbZDh
 u9IQbXm72Gp1is8S3rs9gjExcuuCr6+LfrhjQhMKiP96KwgUHhjsCAW2A3uiU7nuqa83hMpSlwz
 juOQI4ZnEW43WDoBecm8QQ6wGzYvMkRwGOUMcEGUKVFa6VN0HP4RSTzKekzEz+l2K8kFk83AwvQ
 Jip71EkezjDsAvfgSg39WX6yNA3FQm4I0LPJiACsbsCrHbmgrSuacqrJZjyufrwv9SdLWcccauz
 EdwEs4sKdiXkvH3k
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C801A4C689B;
 Sat, 24 Oct 2026 20:42:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33428)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKghc-000000006f5-0Sm3;
 Sat, 24 Oct 2026 18:42:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 20:42:46 +0200
Message-ID: <20261024184247.3282648-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 7.3
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvcmVsZWFzZXMvdGFnL3Y3LjMKClJlbW92
ZWQgcGF0Y2ggd2hpY2ggaXMgaW5jbHVkZWQgaW4gdGhpcyByZWxlYXNlOgpodHRwczovL2dpdGh1
Yi5jb20vc3RyYWNlL3N0cmFjZS9jb21taXQvYWRlMDliN2FjMmRiYTQzZDdkOTA5N2E5YzljYjhm
NjUxNzM5M2Q5ZQoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4K
LS0tCkdpdGxhYiBwaXBlbGluZXMgcGFzc2VkOgpodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1
aWxkcm9vdC8tL2NvbW1pdHMvNWQ2ZTllZmQ5MWRkNzU0NGE5YjMwZDI1ZjQ0ZDlkOTQ5YjkwOTgx
NwoKIC4uLi8wMDAxLWRlZnMuaC1maXgtYnVpbGQtd2l0aC11Q2xpYmMucGF0Y2ggICB8IDQxIC0t
LS0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2Uvc3RyYWNlL3N0cmFjZS5oYXNoICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstCiBwYWNrYWdlL3N0cmFjZS9zdHJhY2UubWsgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQ0IGRlbGV0
aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3RyYWNlLzAwMDEtZGVmcy5oLWZp
eC1idWlsZC13aXRoLXVDbGliYy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3RyYWNlLzAw
MDEtZGVmcy5oLWZpeC1idWlsZC13aXRoLXVDbGliYy5wYXRjaCBiL3BhY2thZ2Uvc3RyYWNlLzAw
MDEtZGVmcy5oLWZpeC1idWlsZC13aXRoLXVDbGliYy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMTIwMTIxYTQ5OS4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL3N0cmFjZS8w
MDAxLWRlZnMuaC1maXgtYnVpbGQtd2l0aC11Q2xpYmMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSw0MSArMCwwIEBACi1Gcm9tIDFmZDY0NDA1NGIwNjE4OTg3MTUwMmIzZmMwMmY5OGQ5NzA2MDEy
NWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1NZXNzYWdlLUlEOiA8MWZkNjQ0MDU0YjA2MTg5
ODcxNTAyYjNmYzAyZjk4ZDk3MDYwMTI1ZS4xNzg4ODAxNjcwLmdpdC5iYXJ1Y2hAdGtvcy5jby5p
bD4KLUZyb206IEJhcnVjaCBTaWFjaCA8YmFydWNoQHRrb3MuY28uaWw+Ci1EYXRlOiBNb24sIDcg
U2VwIDIwMjYgMjA6MTE6NTEgKzAzMDAKLVN1YmplY3Q6IFtQQVRDSF0gZGVmcy5oOiBmaXggYnVp
bGQgd2l0aCB1Q2xpYmMKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxh
aW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotQ29t
bWl0IGVlNTQ1OTUzMTI4MGYgKCJvcGVuOiByZWZhY3RvciBzcHJpbnRfb3Blbl9tb2RlczY0IHRv
IHN1cHBvcnQKLW11bHRpcGxlIHhsYXQgdGFibGVzIikgYWRkZWQgYSByZWZlcmVuY2UgdG8gdmFf
bGlzdCwgYnV0IGRpZCBub3QgYWRkIHRoZQotcmVxdWlyZWQgaGVhZGVyLiBUaGlzIGJyZWFrcyBi
dWlsZCB3aXRoIHVDbGliYzoKLQotSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGJqbS5jOjEyOgotZGVm
cy5oOjEwNjA6NTM6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh2YV9saXN04oCZCi0gMTA2
MCB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSB4bGF0X3N0eWxlLCB2
YV9saXN0IHhsYXRzKTsKLSAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KLQotSW5jbHVkZSBzdGRhcmcuaCB0byBmaXggdGhl
IGJ1aWxkLgotCi1VcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvcHVs
bC80MjAKLVNpZ25lZC1vZmYtYnk6IEJhcnVjaCBTaWFjaCA8YmFydWNoQHRrb3MuY28uaWw+Ci0t
LS0KLSBzcmMvZGVmcy5oIHwgMSArCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCi0K
LWRpZmYgLS1naXQgYS9zcmMvZGVmcy5oIGIvc3JjL2RlZnMuaAotaW5kZXggOTFhYTMyYzA4NWZl
Li4zY2RhZTA0ZDE5ZjIgMTAwNjQ0Ci0tLS0gYS9zcmMvZGVmcy5oCi0rKysgYi9zcmMvZGVmcy5o
Ci1AQCAtMjQsNiArMjQsNyBAQAotICMgaW5jbHVkZSA8dW5pc3RkLmg+Ci0gIyBpbmNsdWRlIDxz
dGRsaWIuaD4KLSAjIGluY2x1ZGUgPHN0ZGlvLmg+Ci0rIyBpbmNsdWRlIDxzdGRhcmcuaD4KLSAv
KiBPcGVuLWNvZGluZyBpc3ByaW50KGNoKSBldCBhbCBwcm92ZWQgbW9yZSBlZmZpY2llbnQgdGhh
biBjYWxsaW5nCi0gICogZ2VuZXJhbGl6ZWQgbGliYyBpbnRlcmZhY2UuIFdlIGRvbid0ICp3YW50
KiB0byBkbyBub24tQVNDSUkgYW55d2F5LgotICAqLwotLS0gCi0yLjUzLjAKLQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9zdHJhY2Uvc3RyYWNlLmhhc2ggYi9wYWNrYWdlL3N0cmFjZS9zdHJhY2UuaGFz
aAppbmRleCAwYmU3NTBjOTZiLi5jYmYxMWVhNjhlIDEwMDY0NAotLS0gYS9wYWNrYWdlL3N0cmFj
ZS9zdHJhY2UuaGFzaAorKysgYi9wYWNrYWdlL3N0cmFjZS9zdHJhY2UuaGFzaApAQCAtMSw1ICsx
LDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vc3RyYWNlL3N0cmFjZS9yZWxlYXNlcy90
YWcvdjcuMgotc2hhMjU2ICA0YmRlNjI0NjkyNjg5MGRjZWU4MjRmNmU2YWM0MmEwNjc1MmY0N2Q3
N2U1MDk3ZDg2ZTNjMGQ2ZDRiNzA5ZmU1ICBzdHJhY2UtNy4yLnRhci54egorIyBGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9zdHJhY2Uvc3RyYWNlL3JlbGVhc2VzL3RhZy92Ny4zCitzaGEyNTYgIDUy
OTYzNGM0MDkxMDg5NWE5YTFmM2M1YzFlNjVkYTJjYTllZDcyZmIxNThkZmM0YmNjODllZmRmMDVl
MzliNzIgIHN0cmFjZS03LjMudGFyLnh6CiAjIExvY2FsbHkgY29tcHV0ZWQKIHNoYTI1NiAgYjg5
N2NmNmJiODY1Y2RkNzJmNDlmYmE2Y2E3YjY2YWQwNzViOWJjNTFkM2NmMzcyOTIzMjIwY2UxOGI1
MzUwZiAgQ09QWUlORwogc2hhMjU2ICA3YzM3OTQzNjQzNmE1NjI4MzRhYTdkMmY1ZGNhZTFmODBh
MjUyMzBmYTc0MjAxMDQ2Y2ExZmJhNDM2N2QzOWFhICBMR1BMLTIuMS1vci1sYXRlcgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9zdHJhY2Uvc3RyYWNlLm1rIGIvcGFja2FnZS9zdHJhY2Uvc3RyYWNlLm1r
CmluZGV4IDk2MzRhNmQwMmIuLjhlYWRiN2ViYTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3RyYWNl
L3N0cmFjZS5taworKysgYi9wYWNrYWdlL3N0cmFjZS9zdHJhY2UubWsKQEAgLTQsNyArNCw3IEBA
CiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1TVFJBQ0VfVkVSU0lPTiA9IDcuMgorU1RS
QUNFX1ZFUlNJT04gPSA3LjMKIFNUUkFDRV9TT1VSQ0UgPSBzdHJhY2UtJChTVFJBQ0VfVkVSU0lP
TikudGFyLnh6CiBTVFJBQ0VfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJhY2Uvc3RyYWNl
L3JlbGVhc2VzL2Rvd25sb2FkL3YkKFNUUkFDRV9WRVJTSU9OKQogU1RSQUNFX0xJQ0VOU0UgPSBM
R1BMLTIuMSsKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
