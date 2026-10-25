Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48495606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y7fS8+3W;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Ed23ZndC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E24460687;
	Sun, 25 Oct 2026 22:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KBSpFnkjDe7; Sun, 25 Oct 2026 22:11:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B71360645
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966277;
	b=P0FtPDBi2+xhYYHVYtAuXKzkwmf7HE7xpK3csV5DXeL/VTfFENklw9uywaIT+uHxMD/W
	 oZSUrsp5c/F3JzHUn13SzPt0h8M7wd7WPAIyOcn2PFt7zuu3wSfObtruTsh9Pxp+jt9Iv
	 xFd2Scx2pqpe2QHou8MdKDKeKfU4eiEpOg3eoooBQVdkgonmdoREu4cSBY/WgiKXXxvjI
	 m1jT1ge2VZKEn0Gexf0uEwe/l+JaqM0+EaMDakLS9nvt2BjsqaN0y9Dxx93hIW+bagGxS
	 ZQNF5Mp2NiYcDVlFaXh8Q1Cpzvwd/OfHOyOOgExIPGAhPeH6XK3aBvFfFM0+oGM9AQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oyyUqF7Lm9Ll0Z0DpBzUN+dhb59qz4iWYl2Vt7in4yQ=;
	b=fqNYe/B30D9PEXpTNpXJgh0HH8VAKftRBL0z8+2rcIPoYMK0kJcSayRymUQIeE5bS1yB
	 2NQB4Bgoj1/5EloWy+ZjarlyB1RavHqkqdmQ6/Iwkzm6xKKZoftusnshytiCyvZu7mhnC
	 aMS+8YLFfSVtPh/dfJ9rAuqPgsvXO767stNjMLGNbLsCCBkOBynppSSznh/OVRrNafdy4
	 lDbemDUg7v+CaW/9Ab9SX1b0Z5KFAqTghBuVwWUEclqkQGElNmjlI9XWD7sbMTb5JZnRG
	 2ReQuqA0Ry1vzSUvjyCteM/k2pOcB+AQ+OBmuDKfrPhOF/EzoZPd+LPu5Sd2kreCYSg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966277;
	bh=oyyUqF7Lm9Ll0Z0DpBzUN+dhb59qz4iWYl2Vt7in4yQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7fS8+3Wjgne4NxsCx7JV0IJZzbvkjJdrkPn3iCiN3d1ixMYK6RpDhQBSkJq3jpLk
	 fGFcuRoa+QP+vwhr6WggdHm3YWAvye9E4xPl+9fwguUSdKxGAtiWzqsrMO6AUXRYUh
	 wGtpYEGujkzyc4Ro3v/pkduGFzPleNUeBXFdCEjjyd8WgqDXwVOlVYI+GwuguFK3XN
	 LDnJxptaArXvBgGNUjIfUg3D2BX94j2mtTl7uGhTaABMqhH9Qu6NakOQT/UDF+kuDh
	 Taw/58ikRnIMujwkrNQNduseun1ITpz5eaoZHYQUD/ReEJstlSCGnUxuYf3X1eeB6M
	 3q2QaVWUSaPow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B71360645;
	Sun, 25 Oct 2026 22:11:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B84CD334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E3C640070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kiijEOQWlBA for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:11:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B047E40057
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966275;
 b=gjD+cP7VoqJvs4rScbvxzoOXOgDro54pkglaBQYXO1e67R72tJLQ28VAqLzoESQswZGH
 Sq9/HKJ9b/sbkCOyoo1NDjP5dHNaauC1VA/XTItO+Vxij4BJ12tKr1yDne9TxOYy2+Bd0
 l6u/LC7CM5mE5e6l2NQRBX6LTtuzghtNiIHjdLVsgWl6XzWiTe7y0G5w2GZxF7u7t2DA4
 Pb4jlWrzDcLcpC+xFJCKemJe5poSnveCTs/BxcQun6aT1wOjZaz+FEeeyiharrt5FHDVu
 C+EelnVS8JmiWXRr9dL5EIO+TPhKrul3JTpAFXAaqKxbr9HFLkOot/mtdiwzp+i1VRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966275;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=PrF2gPF0n8ImE/a2/nW7lJYRtk9fPDTP23b9eYrI8kY=;
 b=tXoc6ek78jP7ZNfiJU0+NSUNJVH52ME2RmbkiPEPaJQxuXtB1U6yD2mWnG8GnnFFpo18
 EdcO+S7lpPRGogN16MSRU3QE7x1EFxhmCcXPoVm1ju5a5bg6eMNhdHr4WMZAuTyIbo+Ov
 +EgtgetmxlAYsx34daP6DicaqpGw0OLRmYHCegiPQ6008Bd/SuobptfGUGMJjunYqSdkL
 IwKHoVwVZ/ieoScD+rAzJP9+rvnv/dmn6TQx/JrVm3EX4niKQ5JfmXQd85+VnFnlHhjTE
 VboC5Vwd0qLkO8HXd3k9P9uigBvG/PWbG41BuLI8OBfGZZpGvUaT8bRIaRiUl6FuXug==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ed23ZndC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ed23ZndC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B047E40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966085;
 bh=PrF2gPF0n8ImE/a2/nW7lJYRtk9fPDTP23b9eYrI8kY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ed23ZndCZ6h8hNJgJzr2ncf3eEM1P9V/S+QSjWkNfi8ukKcw3G3GCh4CnlroURKig
 mqdrP2T6jsj1GV0gPYBdejPYTPxjc9wbjvtjFWPuHsz9xOlQtmw2n5DCIfiI0jXtjt
 v0HKd4fmXyMSMReYpXsGi70GK/PDhObMp9za0+MbkXdE3h+QK5zxn+C9kAFhiibe/R
 yYNNoEaQBdrCF7WTFTg7YDjl9QETAuU+QwdDqBWt8BmTPbZ5T3WYqmzMXhIbb2bxSM
 aXVNNKzulW2jOQPuNv0MtfmLneta6BaKHqhsobCzFM+Z4AMKD8/7CI1xj5fB/wt2Li
 1hGnrkRo3zEaA==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 wQXS1jyHVqMipJFVzsIh2gdIP66QPRCfVwaYBtqeZA+MvJm4Tq3A1NJ6jLJxCWWqPtdEKX1BCAt
 HXUDT0/7ziYyH/CmeIhdWHvadQVO83EtveXEM9GlAGz2htwU2/Xb8UGjMCPAlhyx1PgezwrfCaG
 Mzjzlkg+ZwFt+2d1pMMj5Zq2FNhjFsSl10M8ZSbaHDZae21MQr2hYLiFpcltr4h0GpIVl9Oif57
 Qj103jvRg2C5ajhoGdjcNo+B7hkuQKc9MLusfD9FZnwhKj7E5fMMzuCfUHxIuyaftD5OEq+PsGY
 CV7hvRDafOuyrAHIm+ZKDsVTJacfL8IFCT1D2lL4csng+l078kPYUoPOK45bBOt7K8QIjnWgHcc
 irAH3U/E9cmYSAxVcb16n5tghZWiLnEwuR46fFn+N2YRapIOoQMHDE+EqaU32H8hgWYrQNVMR7O
 t2Kmkc452Fcdph8Qzbzt836QWzcC6ULPJE/vPL2lvp7evichjWDpeHerLLcg7nccZETg6OC4Ew5
 q3qhIVVkHQ0v+HmfzQQHUTFZ2PGT7ydsbC+XhBmE84O6eleCNn4S2HAzXm/n/6QlqwbQ+smUBDR
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00BDDA4C6A90;
 Sun, 25 Oct 2026 23:08:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-0PZy;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:07 +0100
Message-ID: <20261025220723.1332924-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 18/34] package/docker-cli: bump version to
 v29.5.2
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKUmVsZWFzZSBub3RlczoKKiBo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk1MgoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWNsaS9k
b2NrZXItY2xpLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCBiL3BhY2th
Z2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKaW5kZXggZmYxOGQ2OTU3Mi4uZDU4MjY1ZjM3
NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaAorKysgYi9w
YWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNzZhMWI5MTZlMjFjM2FkZTMwMzFmYjQxNjAyNWZjZGYz
NjBjNGFiMDA2YzViNDM1NTg1MzIyZGEzNmU5NGRhYyAgZG9ja2VyLWNsaS0yOS4zLjEtZ28yLnRh
ci5negorc2hhMjU2ICBlNWNmODBkOWUwYjY2MzBiYjJlOTdkZWNmNjY0YWQ1ZjBjNzMyYjI5NmI3
YzQ3MDMwMDQ0YzNhNzI4N2JiZGRiICBkb2NrZXItY2xpLTI5LjUuMi1nbzIudGFyLmd6CiBzaGEy
NTYgIDJkODFlYTA2MDgyNTAwNmZjOGYzZmUyOGFhNWRjMGZmZWI4MGZhZjMyNWI2MTJjOTU1MjI5
MTU3YjhjMTBkYzAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2Nr
ZXItY2xpLm1rIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKaW5kZXggMzcyZjk3
MjVkNS4uYzU1MTM5MGQ3YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1j
bGkubWsKKysrIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKQEAgLTQsNyArNCw3
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfQ0xJX1ZFUlNJT04gPSAy
OS4zLjEKK0RPQ0tFUl9DTElfVkVSU0lPTiA9IDI5LjUuMgogRE9DS0VSX0NMSV9TSVRFID0gJChj
YWxsIGdpdGh1Yixkb2NrZXIsY2xpLHYkKERPQ0tFUl9DTElfVkVSU0lPTikpCiAKIERPQ0tFUl9D
TElfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
