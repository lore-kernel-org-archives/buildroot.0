Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D97606A31F
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mqilaq4s;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fu7+SJyS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF7880D92;
	Sun, 25 Oct 2026 22:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiI3hTdGElCP; Sun, 25 Oct 2026 22:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BE55380D74
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966374;
	b=a7yMsjNaVSf6JBd0HzUkccalQOx3HMNVV+63q8usqfe4gmPsQeODNnOjNJh+MkISicQM
	 5LTR3R4vR6PGIWWdOlnCg0CvyYPwgD/V7dJHqF0GUYU4uk2UVTMNycdNeOH1sQYivFYIB
	 0mHwmhXIl4gkkIcqVMxbjPAY+UjSJ7Ed8TuHCdb7n07cfduP+9EpJ7l5iio75m7jo+WFN
	 afi6eDeFVgD9Rhpef4zkU2oLZyXrrHsxJnpxU5ZCNmW/sB4a6pf2gkzLqL3MAf4utYjhN
	 pDKSgBIcH/IJ6SebaIpKMLz+YPhZ2l9LkvRKps2pTgmb30hipEkN83JlAkJHGP5QojQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966374;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9XtKwRcyDC0nAcrd6T9YWT24X2kx4now+RL6DAVLsnA=;
	b=ZhpRJBSD4/3V1xI2DqW4C/wtsgyvlw3VtdDY02lQf7Hoclly6b+4CKVjcKETVEe0wkm6
	 guEPFMk6x/FtPqBGrCGi7Nb0V/nPj9GLyGx1Ac30WUBS1C573aDucvHopodeFAWyDeR6P
	 XRtUbdHi2MjqYSAEagb53VHoui7CmivNPedORjsFIckIeClnQJsmrSWMWDJ/EEOppem26
	 JOLJ34dhBHxdj0lsaHLQYX0hv75XUySqTGw6fgyblH1w5gden6G0Pr5dBZuvTUn7SGFc7
	 SXcSaGSw2leY3J/RzQAhwVPm05X6xlKXfMhdDIYQuwZ78yx95hsg8sd5jlAEkL+zwbg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966374;
	bh=9XtKwRcyDC0nAcrd6T9YWT24X2kx4now+RL6DAVLsnA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqilaq4slBDogVVfoBWyYf7Yzdd5NUxxmuukKqeRSghlV/pSgjQKXSEVm94oqdEKX
	 Kzv2HEZHqLj+/QxlASeBam4BLuMNvkv6coKKaslDrmo17w1sxKDDOE0HmOF4GOdFmf
	 /2kro8nFMH+9uHf1E9WABSjjcew6wX6saFvKYRzsPkX+wHtnBq4cYeoTXfJOF5eFNk
	 I02QuQB1x5nE9YOOTyHRVOBZKff64yMa9hFN46BRtzDRJXSLVGlv0R5jIbvXpYeFBi
	 UXhNs9L/Pr6qV46yQuhdssOz0/hjNJza5E5ilEmeYIOalKvWqqDl3WuTUNaz9Goobo
	 ZGnl5OGacxikw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE55380D74;
	Sun, 25 Oct 2026 22:12:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A692279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FE1360687
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 261Z64IY8Jn3 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:12:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5AFF260626
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966372;
 b=L8jy/LGUdX8UgLiS0HlQy13lg7oemmrPKx5penNNfP8GZz0oGDfUA1VHR1AQbP4F56+j
 NbUH46iWSZns9RsCkXFxY88Ep+vehzndwvoQovsJ0jKu2Lke1QR1pzCbvRkC4HbMLxT/l
 Mzwly3XUdJ0ppVE9G2IrrJjskTUVSm9Ga/iqg9FSziuQvI7aukD8dz/diKxFbl6+znDjw
 1z9ETIg0jGERAnTysp9tYjzRUWSZHW1clbEilzMZ+u2jMgwaim0OaKM9+STkksMlrV1bN
 cx7eYgjvJLxj61R9m9U4ScdFlAS1apenVU8pXIvkjdMGf3uAGcUVOzT+AkKz1BvYJxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966372;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=AZg9zNqSPSkJ+JkUuIc9D/cLRJTf8WV4wFz0OdpTvDI=;
 b=dG0ZgIQE9QclKuiEiKXxZyFshfnsejia2t7i/RYTok0s/WsB6K1GLLkxcmL7JkIWYnW7
 nuBLSHHXazXBvSSpXZ8jkWLFB4dUtaCrKUkYO/8rU0Oy/IDd4dcmhhJUJ/6vLjotS9Pvr
 Q2ESUP8gj1BUXCPm8+HG2w0IgYTcc2qa97CaFtC4+AsyG0NUejufavjHCHcUfxj2xU9CP
 C9bRzA1ReLlpCyR9Sr+/9WmiTEYOqgLhyAAXXwRFDLf2B/snmqPa8b5OZy+g2hYvawIsF
 sI1wDCmAQdYtEKR8DKE1yL6MDfdQHuXBi81rRUPV1JiLTryvPiu/7JS8Krx9gJrp9iQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fu7+SJyS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fu7+SJyS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AFF260626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966086;
 bh=AZg9zNqSPSkJ+JkUuIc9D/cLRJTf8WV4wFz0OdpTvDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fu7+SJySLJjt29x7CkgTCfLOBsHa14p4I53Sy0QfbX1k0+NFhk9nlMotf3u9UkJBY
 K79uOo1jLRAKa5/9m2e8C3zf7yGJD/8UrjLAkoijkBF4BdvuupY2bbmGwCa9jaz4v+
 1ML1QuPa5tSGj+1z4MVl3XXUonhFjLmOXoqnRNVkESM6dgBNgSrwjxjDj5RhFcIw44
 h2RPaOblDpXPnnNFVTp+GRnvgI0l4Pd4xTuCxD6MvuFw6BZ45MLhryJH8666mIk6Jk
 JepkGXz5SudYBk9QEyLSnEF/aesV8ab864gLYITHuiVShZ1FdMmUJhQnsquVyLrBrI
 87ic63TnUddFw==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 hpBJ5pUsBctX1KHVOct1L6yoGfAp9xoXyOv+lgxIf2JjrgJ8di9WesZcftXW2Vg43Cirr2UCMIs
 DelRdWUTDl4BKI6lwN95PMVJNYD5po0yUrFhl4qbYy1/Q2VYVveAI6iy2RIfbfwVuaGnUpQA+4X
 iEgaWdRVh7g1IjJLvJHGyjZ5UpF4dvtv6yMWihgrv5syMqQoPkMeWgMeCdrumOY62DY/mCqGw62
 Yt6AYWpbob/3NnbYd0AyVOPaa/cXLwh0cFDTq0TLHrMwALjlmWAArYtLKwgCGStbPGEUj7xmDgd
 u3NDqFEpatXiV+chavhuVHVqE/VS2q1HNkVJ3yXBND1YofrYiZcKGiHO+l0JH3uu58eGqwzgPJa
 71uUt4riLRLo3nKeqRobohjaZQr0Bjwiz4TNOlbUwFb5M2LvlLCYzlU9XXhjumDbVdzQVTL5cXX
 60DbPI6xwA//SKyBAWxeTBBujDG/84LUo5buqbFhPaTdtCQHByVheBnTRBGL/JDjTieeqkjAoPH
 VnyIHJOuGQ/YEsxlsYlzmkPk0FpacQeIt+QM+NK8qRr+I8ksjkQvHRlaep2Dysy4T/NUGJsWQ9k
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5B821A4C6AA9;
 Sun, 25 Oct 2026 23:08:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-2r4P;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:15 +0100
Message-ID: <20261025220723.1332924-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 26/34] package/docker-cli: bump version to
 v29.7.2
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
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk3MgoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWNsaS9k
b2NrZXItY2xpLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCBiL3BhY2th
Z2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKaW5kZXggODUwY2FlZjQ1ZC4uNDYwYTJjMDRk
YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaAorKysgYi9w
YWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgMTFhZWYzNDg0YzM4ZDM5ZDI5MWE1NGE3M2E0ZDlkZDJi
YjNjMDAwZDlhM2ZjMzg2MmJkMDNmZTg5OTU5NGYyYyAgZG9ja2VyLWNsaS0yOS42LjItZ28yLnRh
ci5negorc2hhMjU2ICAyMjViN2FiMmExNWY1MjMwYjQ4MmRmODQ2MTA2OWNkNGJjZTM4ODkxMjY2
ZmI5ODk4ZDQxODhkMGEzY2JmNTRhICBkb2NrZXItY2xpLTI5LjcuMi1nbzIudGFyLmd6CiBzaGEy
NTYgIDJkODFlYTA2MDgyNTAwNmZjOGYzZmUyOGFhNWRjMGZmZWI4MGZhZjMyNWI2MTJjOTU1MjI5
MTU3YjhjMTBkYzAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2Nr
ZXItY2xpLm1rIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKaW5kZXggNjI5NjUw
MjI1OS4uMmVmYzlmNzc2ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1j
bGkubWsKKysrIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKQEAgLTQsNyArNCw3
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfQ0xJX1ZFUlNJT04gPSAy
OS42LjIKK0RPQ0tFUl9DTElfVkVSU0lPTiA9IDI5LjcuMgogRE9DS0VSX0NMSV9TSVRFID0gJChj
YWxsIGdpdGh1Yixkb2NrZXIsY2xpLHYkKERPQ0tFUl9DTElfVkVSU0lPTikpCiAKIERPQ0tFUl9D
TElfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
