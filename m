Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7503606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ib4/8eot;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rR+QHVzK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862FB80D3F;
	Sun, 25 Oct 2026 22:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWdaSQYwQsiP; Sun, 25 Oct 2026 22:10:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B00880D07
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966252;
	b=Q/8jI+ZB3FTK2db4Bq3qxuxqhQzi3hQvrB2ySZfXYvIWEgJ+qgEVayFgAwzDV1I6lLZo
	 FNdf/NHuXRHM0tOGcNNAwIUgj/bOCGgkCiK64yJsVS4Xo1y6sQKa3asfM4yCWcOoirIkV
	 ogCi8tUs99CeSl/3VOJGes0dV0AYCbAAFmldDjNVyu5ZhebjDW17Omcyzy4MlUG0PqRR2
	 fCWgzQYHle8UEUrLfaRnkbl/dgghE/E2qgoVzUPEV5nW2EniFSvBqRiudnSoMkj+6CAd1
	 7HWFAVUlRJ3TRwprJaIlSVIcYaaOLcBDUiJHptlPYU878TzzLOa45xxOQAJzCyzWIAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9DEMEy8/VF+DOCBvg2W1PKoCq5neZONlplvRXAXRQhw=;
	b=TqTjjDcA29KGubVfHqMSxWagxi369tZ++Y4aI7aCE8ScQURlkrUpv4KE72dnEgDf5vQP
	 dXwPvMjCZQh3SxOMKGpPgxSPA5VsnaKNfEeL/Bo6Fl4FQ7247FLs0f3lSTTOQxPKdZ/vE
	 opm6EKr0DLzM1oXxBUYhXQ9rXb7UStZIm8e6iQ0kt+hXpuOuvoRjHM2yuDazz/BPV/arK
	 V7VfgA5fnTA0rpQuxVS7pwqT9jDDeSZl+yjvBKGqYoeH+MsSRd6LaLu94iiBtkxWdDbHg
	 LWoTLGrz5m6BX2Bj1p7gJ3BMzxkko4VEozawyZQiwuIAtLm26krzHU4N4I7uYcLAJug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966252;
	bh=9DEMEy8/VF+DOCBvg2W1PKoCq5neZONlplvRXAXRQhw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ib4/8eot2HqP0ZuV6MFIi23LUUnSAF0pALiueAlIggHkS2ohNKMJ1N/9KczdP039t
	 ee4CAtungwkjHeTX43ZNIUE+494HtP/WsaoKQacK6KiJck/cDJ8qZLK5p3ZO8B8aQ+
	 8hNZj+8tklBXVicxzFU7h5NoIA4PI2N/HjKWPXkF7yz9MFcMDhXPbGuTS4kWOtmiwz
	 Pc810oRHk2x8uyC0MkyqwhY8sbliYsKZKaLlUEcTg4m9gklOqdd7LTuM+oY1P8bEQp
	 aPL76E/u1C1zsPTeH2mog9UlBTQvTL7JYi6Iy3QcsAWlpxXdLrFmhqnTLXHUxz9Moh
	 Z367/u9gNlqCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B00880D07;
	Sun, 25 Oct 2026 22:10:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E95A5334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB1C060640
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pZ-4WMnv7j3 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:10:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F07C360626
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966251;
 b=knl6npwV0voK01bxTGKvp5qKQBuzxy5rVj5SsaZBUMzyUS/6bULQfqL6eFxvnCxlffVf
 WjsaWessytgSDbtt9qbNiG2+xt284J24pqGIvq1ZuPNyE2o20MKfHntUbY7DxHre3kKo7
 yLe5FbjUwdoJSRlLYKzoD//f4jRsVwQWhW2nd0EoKOLEVEorw8UQGg4rgQ7XWOqyaniAm
 kC5ANG+y28qXuXiBuqLY5hN1KkeMhNB7rwGJPrJrS7ndmEzG8aoQmxoH7XrNQbQfUJgC5
 cAOHw2xvjEBh8b7wPtR7GxiYc6GrKi/uDHuxj7lFELFja1wwxuawlgjcF13IpD7lU4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966251;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dkyEEVP1a8sfgPv3bgtztizlLjYVeEwX1tkINLLI+a0=;
 b=DFGcU+LQTwbStcvQfQb5qXQxvF6hRa7c8G8PlXb46lbWlxRMOQ8j+mIBXhxC3AbAZe8H
 bNc/CHjokbuBkwqWiY7OAIg417V4S0hdxcuHExiLtiMF2T5nJJemmYDtlU1IYyDkNMpsw
 e4R0wLxj0pdyCkgfPt7uf6LdXoBE5ySd7ydPS8e0MqtV4+E/ovpDrQ5CMHMpZ8P9dXxkg
 BSwOhhCGcIpTb4E4nmngrsfP9Bdso37IXqE+1XPia4QA2e5EF6Nl74IqYN/pQXmhWNbO4
 xtDEx9j6yJkMuJDFpNeNhh4gXkrICxUtpLmaSN1SLZaMtCFeKkpjLxWa1iO2kpWAvQw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rR+QHVzK; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rR+QHVzK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F07C360626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966084;
 bh=dkyEEVP1a8sfgPv3bgtztizlLjYVeEwX1tkINLLI+a0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rR+QHVzKeOZzRNeXW0js6iF68ZSdzAXkFCR8YE97X7P4kDDC+g/PRmtx1wcrlEBeb
 tnA0+enE4/6091kkkcF5vwD8M1GccApHcpOB+7QolBRNzFPdXzf4ofqk4P58iexGKI
 Pttxx5uXUnKyoLt1Vu6SYe4orrJrTI1v7+0ZrGbrtTjuMHxrggeUc3O4gaVNnc0jgh
 6eQKY2xMCVlN6lO239Lfs3is5CPd8Bp7oXz/iaHjMQccbrPBHp0Y6FgSkjX2sgaWjo
 ubtfnPxxTZINwiFfdT3sjdRd2I9PTIpgbw7PFdhtoc24xtlH8o2uUVLbI6LTKmoUiP
 hdAbE3eLaXq6A==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 pGe74ZQhZZxBwXaVtYNtrfDVctGpFbcl9SauPquNxlUWAfIcpaIsr5PmjlspiYI86BpB3TFR8dZ
 V0RbCk3qpU1VFNjIYsu72rIMAOc2NxXR2lxDEdui2rFO8HeWeoo7y3keEgBfbLYomFd+4a42RwV
 xC1jbgoY+SN8A0+6TomU/sAb0Pt6Q1AOyJypRcluYr0t9Dw9cqW5Uq3r5+RZl2xR5oJWjtQlGHo
 gGmZmqoVYWwgpCpyYLnnqoShuZLqvhBEa1XWuuWGdScg/bsOzX3aLV+UTZvekUnww2a/taFrzcc
 m1I+2k7KCCfH9kt+NZuS4a3Bn6LVxn0mFDyQsomaIhhsa2BJTzwMosXejtQTfgXq6SDdsm9Yv2F
 yhzTiZbpoWd043ubgasfdGHfTQdL0Rc/8YJA9Ald/iViWgxjhGlL5EkUPbPk4oouyxogMjgCI+5
 ajn7oGIPDm3+YMD2GvfUDMPDehaXwkmYvYEEVORLOb9OhviVBzF6KKQ6SUd3+2WIfU98h3FK8f3
 3i0plbOT6RgczUsb6ylCnBqNm7bkW9SddecvoPY7bgZLbN+gOSW3a6wB0WhQWGjZLPnYvioQV7T
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A683A4C6A7A;
 Sun, 25 Oct 2026 23:08:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-42Bl;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:05 +0100
Message-ID: <20261025220723.1332924-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 16/34] package/docker-engine: bump version to
 v29.3.1
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKUmVsZWFzZSBub3RlczoKKiBo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkzMQoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWVuZ2lu
ZS9kb2NrZXItZW5naW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUuaGFzaCBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKaW5k
ZXggZDQ2MzVmMDViNC4uMGY0OTQwZDNhNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5n
aW5lL2RvY2tlci1lbmdpbmUuaGFzaAorKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgNDA0MmFjNjNjN2JiOGFmNmMwNzg4MGI4ZDEwYzgyMjc5ZTAyY2VkMjk3N2EzMDg5MGE0YjNj
NzI5YjI5YTkzNyAgZG9ja2VyLWVuZ2luZS0yOS4yLjEtZ28yLnRhci5negorc2hhMjU2ICBhNDNk
MDQ0YWM0YTg2OGMxM2IwZTI0Mjc3NmNlMzFkMjk0YzJjMDQ1ZGZlMWU4MTJiYmNjZWNiNmE0NjY1
YTk1ICBkb2NrZXItZW5naW5lLTI5LjMuMS1nbzIudGFyLmd6CiBzaGEyNTYgIDdjODc4NzMyOTFm
Mjg5NzEzYWM1ZGY0OGIxZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTggIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1r
IGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKaW5kZXggZTRlYjgwMWUz
NC4uOTE5MmJmMzQyZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUubWsKKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfRU5HSU5F
X1ZFUlNJT04gPSAyOS4yLjEKK0RPQ0tFUl9FTkdJTkVfVkVSU0lPTiA9IDI5LjMuMQogRE9DS0VS
X0VOR0lORV9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LG1vYnksZG9ja2VyLXYkKERPQ0tFUl9F
TkdJTkVfVkVSU0lPTikpCiAKIERPQ0tFUl9FTkdJTkVfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0g
CjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
