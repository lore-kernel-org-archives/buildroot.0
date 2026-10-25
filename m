Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C911A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BF0aNqvs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=V+b7xTcc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A45AB80D91;
	Sun, 25 Oct 2026 22:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjYWpZWC39np; Sun, 25 Oct 2026 22:13:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D05EC80D74
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966413;
	b=IGmU2B+xE0tXI+wiV9x5vOmtoZGB/FSWKdXhtnRwt7N0EG6/uvm5gCT7vooBN80DI3uh
	 2oHLNEedkCUqmTAgbHIuZh7EchzmC+gXw2QHxI4t7al8QJPf8g4c8e0cbWe1gr41Q85Zk
	 AY0pLN9gVXAIT9tZO7FZ8z1WIaxCdu77K2iZAT/RJw982ImaAwWKN0ahayttX8O3Zaen3
	 1AYjwvK+5k6QPWfKECNYNrRH0xnOOTGRrHX4xipmssYMNJultgTeUu5d6F29n7KuUo1pw
	 mHpH70EvKHD/nQ4lg+Iesks3WfZhwzOwoyxxjkbU7OmKRlvtj5CQvjORe0BQN7xPG1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966413;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZPqHbJYtRLkyCR/SYwVdijGgsCkC9O9HYxrbJ7fGcnc=;
	b=qA9+9kYNBMMw3A5Eb5mPwlM+KFzhWQouLTp7Xt+UVe3XSxh1zxq7Bs8/HCK4R95JDiJ+
	 2Ra5WkOdmPQFZKFc8sCpNCvSXbSsYln10IJde4UqecxrOuk/LGG3cPBTDSYqapOONjYDY
	 OdFGvmwJvPfytaHaLUhy6WqDSlGZ3n2hM6fGP9L+PfcXedjUFxNIywdVv7JBvA/CB6GTy
	 yGekMbKBddbOOBYfnVnes7u6TRtRJik7UNbG+NV/myAWh5LWAqrzw1hKydl29a+f76xAM
	 FvCRss7Zdr/oMfLZAczHnk0DJRk9cxPDy0ZQkQx0xCZL8pLDjHlsT3+3Ca0bMHCYSCw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966412;
	bh=ZPqHbJYtRLkyCR/SYwVdijGgsCkC9O9HYxrbJ7fGcnc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BF0aNqvs8oJF+fNkiGfkjwprLJC76sMhZ+182ptnJGE7l1I3Rab6qA1i5jsU8PsLL
	 2InuLOx2hRMQXd2WqvGk3TMl0ecYAuQagnBpCyCsrJD+RwWv+lk1L0U7lxtJO5lLnS
	 mee52JdLbUK+T+xlZYsmWnX/+SZ7bwPi0z+0IVXEWzbT1UTqI0GYVf3pw62iKLjZE9
	 v2t/xuxNKfTHKMsD1BAaA9D5UqJCU03ry/sa2q4r24AJWxpGPaXblCyPpHv7cmoHvm
	 eb0mhMLleG5RvubYeVoudcwfW28nruGrpHL3IZROvMh2WC2sFWcDPUn4JWdXd4OJvU
	 SdaE8+rpifrgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05EC80D74;
	Sun, 25 Oct 2026 22:13:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8AB3334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAA0240057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3l-keHvnSc2 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:13:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EFC7140050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966410;
 b=fXLdXxMC4A9D8HLXOF93cg4kbDZzsWtU54xzccvm5Lkye63CPxpDyQeSeryknRrmWdxv
 018TjNQyjhzmF+5jew21yjp5LXuP7KOT7Oh163UV7NjBouliUmc+0iz/1Kfxif9iMAA+d
 fz2PJTsApaGabFJdPQwdGWnwdy0OnfwkzxShckKjZf9m0bpQZNeHjMsJGocMJ3hVYC0pn
 KN0TDD90GYnMnl8iUL1uLXBrt7ezHuJBiwDxyrsVKGBGzptyB9pFtmv9xveCq2UrBJkdi
 wniiXnA67kfBcb4flBhcgeuI/o/BmYCkCchKjAVLiUDR8JgA+lrSaUwuMXtLuR/jExg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966410;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5UR33T1G6AnzGcfNnSDQ55KRTD62eMYIJjHnJKp/Y7M=;
 b=kv7y8hbDvwewAUtj/RXgu+KDRjCR2w6SxiMuXBlIt/YZ5iHJTnFWwsEuxD7nt5R9VR1f
 CW3S0qqfTFepuu2BCMbCIgeM5/hDkN113+OtRBnbcR0IRFdmVYh4jCTC6wjJ+SB6Fzp1X
 vliDXVSdlGkGyKxE5rY4W+378JYbNmPn2QBQWTxxygTxyr5Xf2EfIVoC9iz64hO8tg3IW
 v5eg0p/ZKFMOWrbrsVBiZF10EH/ON/LLaOZ0PbvfoOGU05sidOETzZm0FSP9w7RPlJC12
 vhaoZqfnRQaqrU3vGgRgwGmwF95M0JYUGjtdWaQYgBIT/AzdVflz1reGD0w5s01UCVw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=V+b7xTcc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=V+b7xTcc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFC7140050
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966086;
 bh=5UR33T1G6AnzGcfNnSDQ55KRTD62eMYIJjHnJKp/Y7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=V+b7xTccUOEiqLsF4JQ3qqh2d5Pm7dzDXdfp4M91EFl/1DLFB4+scrcbJmcf8Qh8B
 q7mfFA7K64Qk09sNCqBIvu8zJBPyNkH8SCffzKrIa8zlBgL0TECkHtXlk1XzOoW9WK
 WNpk7P6ifVN614UBz02TbwVch2bB+h9K+4Z/cb3CBmkPKPToqtyKlc7+fdjrqtf4B1
 Jm2sChfkvQT5YO0VWDA7vTNLarFZBu7Z2KcQ6zQobgZmEdYFiV7ZNKApqRfnOMkId0
 /U+iUlmWDYXVPcs9/zFr7/1ol4AippNtOfMZNRUyB44e/8Ggp9h3qiuni1GqUtqdXm
 RHqWO4XIx0NdQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 d/nU+lPgot3suxQfmxrPLPhd3rUC9yBU3xFO6UUMg5IQAFLJnmyYqzlmhktuJ7BBuUf4KtyGSgW
 TIFFAF1oTXOIsx4x/fJHw77oX4RGTbMa/5qCn5nsDsKz3CvDxjVNxYq49ceUW6e1H0O97nfh3H9
 uJT0ZLsqCfpHQwlrVQ31YOGU0gyD6K87/nNK5Bo9hx0C9Sf5UOybdWgMXHg9EV8B3CdI808cpyK
 LFfKKstNw94+NUYDq9LoDVPJW+5Qv5f2Xuk1tODkp7Hyr90EHa1ygEgWE0vUsH/zsoRyKg8xweA
 Zy6MAyumEOXqrT7xPlQwM7h8D7O0Zxpvbp3LEDhfrWNc41L0r8FcREfGbh7X5AQn7LOXBfMSvZe
 bnEjJXQ4fbxNRO0BUOJzfSmMKpzO8tv8bmp+m0OpgKqSmXO37anN/rL2DhDApsU5lVleCplLaoJ
 nBNmNhhIf05WnqGNOFbV1fZdc9Xt7wLJXR2NX3L2ucjkxdWHvv/RLKcH7ZXho4lOKEafLm7DRIU
 l00yWxOBqD2fijQPEjURynSg7WDNSVx3rRDqfj/hVIJrniKaUbGtPwDxFM700ZnB76i0LMQI1aV
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DE1B5A4C6AB3;
 Sun, 25 Oct 2026 23:08:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-3xHY;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:18 +0100
Message-ID: <20261025220723.1332924-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 29/34] package/docker-cli: bump version to
 v29.8.1
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
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk4MAoqIGh0
dHBzOi8vZG9jcy5kb2NrZXIuY29tL2VuZ2luZS9yZWxlYXNlLW5vdGVzLzI5LyMyOTgxCgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+ClNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS9kb2NrZXItY2xpL2Rv
Y2tlci1jbGkuaGFzaCB8IDIgKy0KIHBhY2thZ2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLm1rICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoIGIvcGFja2Fn
ZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaAppbmRleCA0NjBhMmMwNGRjLi44YTY5YjA1MzM1
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCisrKyBiL3Bh
Y2thZ2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZAotc2hhMjU2ICAyMjViN2FiMmExNWY1MjMwYjQ4MmRmODQ2MTA2OWNkNGJj
ZTM4ODkxMjY2ZmI5ODk4ZDQxODhkMGEzY2JmNTRhICBkb2NrZXItY2xpLTI5LjcuMi1nbzIudGFy
Lmd6CitzaGEyNTYgIDU1YmNhZTUwNTNmMDkxNDExOGQyMjk2NThlMmFjM2E4NzdkYmRlYWQ2Y2Iy
YzMyMmU1MjVkMGMxZThiZjc4ZDIgIGRvY2tlci1jbGktMjkuOC4xLWdvMi50YXIuZ3oKIHNoYTI1
NiAgMmQ4MWVhMDYwODI1MDA2ZmM4ZjNmZTI4YWE1ZGMwZmZlYjgwZmFmMzI1YjYxMmM5NTUyMjkx
NTdiOGMxMGRjMCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tl
ci1jbGkubWsgYi9wYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tawppbmRleCAyZWZjOWY3
NzZlLi4zNmNkMDQ2NzY5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNs
aS5taworKysgYi9wYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLURPQ0tFUl9DTElfVkVSU0lPTiA9IDI5
LjcuMgorRE9DS0VSX0NMSV9WRVJTSU9OID0gMjkuOC4xCiBET0NLRVJfQ0xJX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLGRvY2tlcixjbGksdiQoRE9DS0VSX0NMSV9WRVJTSU9OKSkKIAogRE9DS0VSX0NM
SV9MSUNFTlNFID0gQXBhY2hlLTIuMAotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
