Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E2F606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ofnx4VkY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=sA7LOLRn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1587360645;
	Sun, 25 Oct 2026 22:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTSKtXsOW5eH; Sun, 25 Oct 2026 22:10:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4425D6062A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966242;
	b=dyjdbqHLU29IsmEJKg/sAD3E2BFFW8tsnUjf6rBKJ9IgO4//Y7oD2FQNUYYS0oVVsvVg
	 /0ATkbjy1cdRtr4adqbHoxAuh9Pq96kzAKzsKdgHRSYspbgA8GpFBAJympEPc12PrDVT3
	 fbTkMGiqJ++te5gKMKC0kQI5wnh8Lrq0VmU2VrQDPHnaz31JZ7OASLyV30OvDD2sW6ddt
	 yynfL1DrUWXCXS3BchSEnU9yTiRh5DSn/cWf0YdlmAPInQdt41QUU0mh5J9v9yNMZV+Ao
	 u74zEaM1cgh6vFgmyZpvOLEpMqxt4AM8H7BaEORPjCFVHf4yKZQasvQic5v9cJ7qLCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y6R/0mDVubsL2yGLd4mRIJg5/HIkueEpnAzVKW9l8KU=;
	b=MlHQn5SpgIHq7x40jbV+dKfBZMPtCRc8RcNy0+l/RaZXZBlRiSjXaU1cK5WNCntaolX7
	 COIdljH1IVNVM5nhxnuVXbVAdEhY+zNZ1ksUBABSj/ndRcZ4asqAbJvhogFuSCo3dDpqb
	 cryeptaHGhCb/4BglzJTn4Fw817ZskU1MW/qRr2o9yCtPpIdVWTfW740wR4WWsGEUfYdN
	 JHSoSQcn6rBNU2SRhB9Hl1Es90+uTnNT/3YduggWWPgcUg13sLf3T7dEVAYaTk04IyDfM
	 c/5YmaLWqBRBWLd6dEltjFAE0WivoY0A8mva66K5LAxz3jFIZlVk7U01ArssAGw4m1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966242;
	bh=y6R/0mDVubsL2yGLd4mRIJg5/HIkueEpnAzVKW9l8KU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ofnx4VkYy3/tH4KQsyQH0HHzQltSf4C5r067/TKWXOL1UZ9c0cmPvmqRHWSAM+bap
	 3LZbUAaUwpb0Vn4cbZwS2BDjUN7lOJrEupspiNtRwQgeUYEDtbzR1mRYE8ADtjP0Uz
	 O2Zi+dyqXQgDYTG10TeRciDW+2jdhmouVutZbyOqo6EFKFu25nY0rBqekMFPfbmE06
	 aABmLFDH8SZv1vjM32h0ni1uTLU5PaBNboWZC2OUb9wgUO2gt5G3yL2nr2fENFebvj
	 6mz0ntoLNZfqmT5Bbwndpi0RX+CZTQcszLtKUW20lNTgPIPEDLzlxWdFCk0ssr8XZH
	 5a48tTLc7GTag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4425D6062A;
	Sun, 25 Oct 2026 22:10:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9457A334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 861E740450
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ny5JUzvBwjb for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:10:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8CFF740437
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966239;
 b=UmiYWr7b5UAY8aciiwyuklgTEIhGJd0/nYeYmaPhDVRmW/E0lhLcLRUBMt7FxNrd2Apz
 m9C7T+Ba92SbP+qcR+WEVSFV/qYzXKhsihFvgZybWLh86NpGQcfl3qpODk+1E/Azi1Eld
 TT8iJ0YZUdciiEBu3wH8dEHQT0v3ZHw1H2H2idxMTEPRBVwR1ALUgQjOQ478ZMG4QL+u3
 tyX3dMobhw/CcfbKQnLJ84lnAHP7joBHUH2I+/mnNvYrhDCZHGCi/KV44C8mhEaql9Os0
 Xz9szn6XxY5JQKW37+m9aGWuXHqV2kqgfdDs2rr+pNNWpr6VuJlKnPfb83+gZOWm99g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966239;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XPXlorlAmyN1CaqO6iSlmsWTv2sFmu9XGda9AJE8YSM=;
 b=epAp7nLMEB3u5EcgA+8f3Tna9wDPZpht4WH1cTqrgiVnbNcvbRHYRf0zrLkFZXuQkJR1
 PtEriC9hYFsFg1g88jsR2N0P7e+PkXXc+O7/dCeApFX4WNmGxyDsoEqAW73NEm5FDIUzk
 0vWaGXcjnj2GwMgi2jqU5Y8QRvLyxuA+z5XRn0oKUb50482hNWhQ0q45tw3edIhLpgWg4
 fp89kUy3BKBMK0H1w/+kuvHlRNJxCSxmCrj2K7CWrw0pUx8kXPJGwr+OF3+/2KP+DiIR0
 EBxtp8ZqhM4CJuTZnq683UzqiFyeis4kpb+WOOwMsWrZkj/gdzdOwSZaPVLSPYnwuDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sA7LOLRn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sA7LOLRn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CFF740437
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966084;
 bh=XPXlorlAmyN1CaqO6iSlmsWTv2sFmu9XGda9AJE8YSM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sA7LOLRnzFz/PWRNbqpPto0/x8QtwpjhcTU/1JAhQbb1M05pX9q4JmuYWvRVNgW9t
 VEfhqtIHUn7vvbcpA+v5nPjyl4wMNIc6TOSx/93haazFe2R2Z1DXbpqhbnBVtBxeYV
 0S15gIa//G50C+XXi/8/GUCXIhxRxMSWijhR3GD3SRWzvhyI2BmdQZu+nUqxrg5VX5
 qmRqkQ0Vj4/yxZrWQVmHu+gWWgH9PCp9ph9FY2sEVdQirBNwAFysU/yb70gi/x5kQ7
 UF5/4dOltzNHjw6tiHf4TupnoebzV72vYvZq1CrdmX2bP7WZAN6CTWKyebzQH6axSc
 BYy5C/ihpurxQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 Rds+3o5k1Fe3iS1z16JQ7WE3MglukiF4UmEGd1Po8+M+KDHDxJG6GYnWgW/eG2ABfH7wJ8dosee
 XTF7idv96phbA5NqRZr5MYnXoF3HC2PsTOWrXqiS1kVbWWVkOi+TiUN1oEAnLzT814Mc+Am8RmR
 1O/AD1SAbfEvtcyyxBPn4uX3R1rAXiHRRm3YTpqJTrGY/uHWsZHc9ndQNnV15aosSKLTkGm4q4U
 nGdcd+4+bq5OxK/y57DWRle7FVP52PDT/lh5Ie93aK6KLoGe4tpzAvoo/DrRPGf2lP+CJV9yADP
 7en3DzoIYCU2ATA5O7ejvXFjENesLSXO+i6UN5dHYPFOeEjW1tWNkgJCs9TlBdNNHjD4i/tJh6O
 4wvaybznKbNO/QT8WbTzUhNV2hMSyuCcL71wK0qm6C/InWoiMlbsJ5dx2Ysm7oamVavYI5wCVz9
 Cvc2oC1Nj87GFErm7hA4J46Uvbn9bhNqsYF/CMA/aaby6Vtq7z5H2alZEWcLzRRxc0lr9kotfm/
 0yT6bReQSdHCBSUWQrWbh3Kj++VTrfeIxjnbBgNO9zCNa4vdasEhfNJ8pcnWfgxYZ7CNt3zhunn
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 778FEA4C6A5F;
 Sun, 25 Oct 2026 23:08:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-3kX7;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:04 +0100
Message-ID: <20261025220723.1332924-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 15/34] package/docker-cli: bump version to
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
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWNsaS9k
b2NrZXItY2xpLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCBiL3BhY2th
Z2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKaW5kZXggYzY0YTBmMmE1ZC4uZmYxOGQ2OTU3
MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaAorKysgYi9w
YWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgMzNhNWM5MjE5OGEyZTU3YTYwMTJjNmY3OTM4ZDY5Yzcy
YWRmNzUxNTg0YmMwYzk4ZDhkOTFlNTU1YjFjOGYwYSAgZG9ja2VyLWNsaS0yOS4yLjEtZ28yLnRh
ci5negorc2hhMjU2ICA3NmExYjkxNmUyMWMzYWRlMzAzMWZiNDE2MDI1ZmNkZjM2MGM0YWIwMDZj
NWI0MzU1ODUzMjJkYTM2ZTk0ZGFjICBkb2NrZXItY2xpLTI5LjMuMS1nbzIudGFyLmd6CiBzaGEy
NTYgIDJkODFlYTA2MDgyNTAwNmZjOGYzZmUyOGFhNWRjMGZmZWI4MGZhZjMyNWI2MTJjOTU1MjI5
MTU3YjhjMTBkYzAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2Nr
ZXItY2xpLm1rIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKaW5kZXggNTJlMGU2
MTE3Ni4uMzcyZjk3MjVkNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1j
bGkubWsKKysrIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKQEAgLTQsNyArNCw3
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfQ0xJX1ZFUlNJT04gPSAy
OS4yLjEKK0RPQ0tFUl9DTElfVkVSU0lPTiA9IDI5LjMuMQogRE9DS0VSX0NMSV9TSVRFID0gJChj
YWxsIGdpdGh1Yixkb2NrZXIsY2xpLHYkKERPQ0tFUl9DTElfVkVSU0lPTikpCiAKIERPQ0tFUl9D
TElfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
