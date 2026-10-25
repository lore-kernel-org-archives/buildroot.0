Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8539A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NsMtjxn2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KcV3Qinf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607F080CF0;
	Sun, 25 Oct 2026 22:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55EHpjTObMVb; Sun, 25 Oct 2026 22:09:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7036580CBF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966178;
	b=HRrRgj+PoDnjx9SEw1d7z5mUSKMaK1K22Z4rGM1A1posjO9lpW2+2yoNPpMcIemc4oEn
	 TanGVxsHxikn+/2XiZKrmc9IzG7KIDjG1SYEN1cyIhOpwT68uCKNkUNZEiDeFkctRh52t
	 Vdlyru+ITxYKhtO/qN3ArLFI80hH4s2nYmmWGgja2iKaNFLmk72YJe5vvScyqQQShxlMx
	 +mFxTNjdfbQVtdN6uM0Eal1Xc60m9G6LZWm2EB9v6lzyJxD0Mh3bUxUc5+s2BsXUUtKWF
	 PNnqMdmOmzo+c1DtflG3RAI/E3t3mHGT3CxTa4fgmaBi+zHq8+WkySyQcRyiisjRWmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966178;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=58xRpwhpd5GhFryjmzCAKtdtMvf75UPMLz3RDyqaHRA=;
	b=XF11lrX1ZweAPbWvmmgVILGC2EsNrXaKzR7jTULMssVQGAbYkB/+Ak9f5A9cS0mQeufx
	 BO4XFuCVyPo/OEHeRUNkkFIuyodm+17U38TIf0BJPyFsvWeBb/lDM5sdVCLuovQPi8l1S
	 ocrRQcLIgIRfhqQJ5Nu5hUlQjTW/vZ+a3kWFz9f22TvrZmm09k7qKoJhxsissQ0oReTRE
	 yXRbl/g7j3YhOQIKSpLRXgrQ5gdk/BUC+uBgPNTP4pNqQ08v1fiJPflLuarDQphVHy0as
	 X4URWL9gzq7sulIEJXyicaiT/PwrGj1XpYzQnp24xketaLg8OZCPvfpsIT7xbsqg3dg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966178;
	bh=58xRpwhpd5GhFryjmzCAKtdtMvf75UPMLz3RDyqaHRA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NsMtjxn2UguGqJD9Ywmid4FEBzsAPnFyp54R0MqhhNAeOVbsXWN529CRvAGiAl5zy
	 D1+QtXNtfgbWnWBtL5bx8+Hvb15kCUdYVic14Pcz+FUZQsKv7zigl0TKg/vEeomBsk
	 YgOBc1oTztPBPhLGaegPgV94GT0du1Dgy4/55P86f8urhOmZR5pxeY54hBhWDUxJS/
	 rV7HFJ8f45NrsQrftDw01VnzDRYxNQs21pvb12wtgVUTlND2dCZhyB4rxFTqQeREcL
	 icIwIt/M6yMluh2T4hrCklbEa8G6ZpEr6VmAP/aBu8hWxc6s6Bg5yejghYLx+MDnLQ
	 paxBiYJL9AfzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7036580CBF;
	Sun, 25 Oct 2026 22:09:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36154356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27EC060626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUq2-ggzvgNc for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:09:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3414F60601
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966176;
 b=FRZHHrqzQsR1D2sV7P4srokfrT7IfNHsVd9LZOk3COfgO3A8dg2+r75sLDXnx1xZZuGl
 xIiy/cf68ay3W0iyi7r4MiucpHytYmNG1zkftOnXL1tUC1kq6QPuP/q72Ypa7XSVn1eYp
 H2k4bOuus08kfgeu0jm3NtFvcyTwS4zWtarNLKri86Hg7vsH4bDJryX8Zc10SGZAG34PX
 P/VvC8u9YAR8qdoliDRhPWjfnSqVnKGYcMYGVxIZE9vqqr1/kSK74QlmZ5sjvgd3W8kea
 dSp1g3vvBLycBIU20SN3LLVZFjFfqAN6sweORAf738SwmhQij3vgPb3MBIW9btXrnDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966176;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=QjnKXEXhpHhmgT1vhyIxDE4UbQlC5usrsV1bwf9M03o=;
 b=HMkO9S0pOanaKaj6n9yfxRjzGhY2d4swqiMeuD7BA+SPy3tZyvgGUecn6cjgy/w161QD
 UIfETX+CO66DW6t+hkbDB49v8WfWJYyKZSxWH70zW3OMhtUPUOkHe44mx5F3DbMveU0Ix
 5qTto9oxBKP4oLm0tSyqMZpZRvCuQiS6v33j6gS4G7691F+bvgRqryuWvTi1HQzSWQ6vn
 03XKX/l5JnikY/EaJApaEwh7+2xz/1ynpZYz9WpPQUCzjzoapuhHBsS6QW8H6UzpaaRhD
 tp9xLs/vu5rZKGFxGVXpwQ+IkZ3F1qTuSdYBO+Wh0au4w+gAKOgFapGsM9uByTaYkDw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KcV3Qinf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KcV3Qinf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3414F60601
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966083;
 bh=QjnKXEXhpHhmgT1vhyIxDE4UbQlC5usrsV1bwf9M03o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KcV3Qinf0cWgC/LyU9sM4PDmdWhC2iJ7g3nm5QLYTzx/SdXwAttl60XIzi9fXlThh
 G8t41XvCYfNsVR4Ex0Xk7Ehk3FyuxWHsFJxf0Y7eNRnZHXb3uhlFsESkqBw2Zc6Cvg
 UvTAvURU2/zgzZkt/tMtXiQVeUxgyB2cgOj6anX2/xB69RJWF0ZeiX0gCrY6A+RDg2
 JdxvmOMfLAQ1cFxHLKI00hffZLzvSGQitqIeflM+/1lfEb1ru5RTLxO/n+Frh2TuLc
 qreq4nf5BeXLGDLYR83f720dqENDCx8IXbad7YzhkcQ8YCBHMtWZJQFD9Z9AGKzwVh
 27xNMvT9baOLQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 OaZ9cYkCWsMbBb7KnBOK2Cq/Wxompuzm7XQ+jJIeg50zsjuxIhtKmrByBJ6MCTG4Um15pP+WyBI
 TSBb5NNOfFCXFna8YuCgbAZMhkGT2L/rDpSAo/yRZ86HIGCfeOwYUbeU2p1IsiHlk2Pp7h43gUj
 TYNGVo0UZMWRKiz8hgZp4HBbTmugbnT1OMzT7MiEoNRhYom4XUwrDXUdg6p8/g5w3FCWs8jT43f
 w2kuDqdU/9U5EwtoxcWjguT+68+AcJ1zbI0wLZ0KEv4WsuH5luUSRY50xOEklWdFw/EJVHm/Eb8
 sVvW278lYdTkB7hOskqtoYZzb8EGS4xvoi51GdQI6znB8wP4W9QIy3UkB4tjSPsUrFAMncknJ8R
 mUGwvfcNm6Fp/5HiHvA5008CphflocR1xlUsQ2Qq3WA/L4WNCRUMGfEEa0110er3br1DaqeMFHx
 8SuGct9HDqEVSlMhmgJFoqNKgwT+3hxAiN2ko2fis1GRwYcWnLj8R6jmnf/9VQZdelIh7e+/2Xz
 atb/eJ/YXU2dwRl9Z+qAO21E5Zs2U1vyiEIBNu3LUVgdHBFEllXjkWV/vEmTqPD1pUqDAgqzsxp
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D65DA4C6A2A;
 Sun, 25 Oct 2026 23:08:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-2IS2;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:06:59 +0100
Message-ID: <20261025220723.1332924-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 10/34] package/docker-engine: bump version to
 v29.1.3
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
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkxMwoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWVuZ2lu
ZS9kb2NrZXItZW5naW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUuaGFzaCBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKaW5k
ZXggMzlhMTVlMGU2Zi4uMjJlZjhmOWNjOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5n
aW5lL2RvY2tlci1lbmdpbmUuaGFzaAorKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgZjExOTQ5ZjNkOGRjYmNiZDZkNWRlMGIzNDViNWVjOGRiZGQ3NDU3MmM2Y2U2MTRjN2I2ZTc1
NTE4MjlkODAzNSAgZG9ja2VyLWVuZ2luZS0yOS4xLjItZ28yLnRhci5negorc2hhMjU2ICBhMzk5
OWFkYzIwOTliNDkzZDkyNGZlN2UxZDA3ZGZiNGM3Y2IyODg3ZWE1Yzg0YzRkZTk1NTU0ZWU5YWM4
YTA3ICBkb2NrZXItZW5naW5lLTI5LjEuMy1nbzIudGFyLmd6CiBzaGEyNTYgIDdjODc4NzMyOTFm
Mjg5NzEzYWM1ZGY0OGIxZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTggIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1r
IGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKaW5kZXggMmRmZmJlZWNj
YS4uYzljMDQ2ZDliNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUubWsKKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfRU5HSU5F
X1ZFUlNJT04gPSAyOS4xLjIKK0RPQ0tFUl9FTkdJTkVfVkVSU0lPTiA9IDI5LjEuMwogRE9DS0VS
X0VOR0lORV9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LG1vYnksZG9ja2VyLXYkKERPQ0tFUl9F
TkdJTkVfVkVSU0lPTikpCiAKIERPQ0tFUl9FTkdJTkVfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0g
CjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
