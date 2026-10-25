Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F5606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F2CQb4rw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=XysRr/oQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB8C60639;
	Sun, 25 Oct 2026 22:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gojba8SaGQLU; Sun, 25 Oct 2026 22:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C3346060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966166;
	b=WjjH4YQTq35bvbO8ZWOeyMeqG7d76kU2V2Ip9knJK4Zthoeq4/MuVe7urUoioatNC1az
	 +bP+8cXXUpqYQOSkjuvdhUSoDB/5lItlzh0kuAPepJJVwKe2LmuLcNQJTabHTAicJPBgQ
	 AcBgUHmZxmDUdwhC4QN0TDLLvcAYVECZI9IObQ317YcvTZDxMJtpxxgxniYDaXjUJWAeO
	 DxC5J3EXiULseOtwTvADCMS2vbsSXJW3Z9ILEoIlaPiOxu3TkAvxGKHVAmq1J9JBQRnQs
	 HLU9U05z5suHUbhISCXbDbZBYbjUAGQaIH0QyN5ITFUGm6zcZpFQqNXO63PlSAKjEsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ooJGlGeB14IUAJygZBYhQpOMQG400uK1sMPrSWpMjXA=;
	b=WjKIzEVrOZwMcFdp2JRqiE8j+IahOwyRPwQJv5NAyE1lxdueVAs5A03FAq4a96Qk5LgL
	 zVEVtmPbySVAmH2mvLSuVzXXPajVzUpbTcpEUjIrjIUfsNbHkYz2A5W+BfV4Otgoxzyi5
	 IepYkw991dxGe8GbbCb2d3MU1LuAlzFkkcxrv59CeBIrJYbxU+v2gnuxawKirSmMaJdMp
	 SBA4Ejlws2u2P67rKi1enyFouVTwIAeW4Q96sDvUAbeDifl+PVVoH5LvA7x/zU/buORrq
	 WHY941m9xSO9Zl9bnCNfzA68e9xrpfGcHBQj4aTaF4L1ULcIhzg9NVhP0lBbkwFup0A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966166;
	bh=ooJGlGeB14IUAJygZBYhQpOMQG400uK1sMPrSWpMjXA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F2CQb4rwhHILeduiyQ0W1u0QTumcMAuijsjqJPtAK+NwiSDDyfKqjL46hpq2kR9oy
	 DhSTutWFTe+7oKG2j/VXaVmQCkVTeMOHFz9fhmtt95crP/EgMv9BevZqrttq1wDUYK
	 8ok3v+V1vYWSi4LsY0e5BSiNcN1u/S0I8IYYG+ew4T2aG93k0E724/FOktzjnHmqF7
	 XiMtbxh4aMmIoWJ8gOIspkNCS0fzyFENDNBMVrCy6xPVr5d5Gzl8jUQItKTdhWcftM
	 LR5R+A8GyI1RAhh/uCi0rNQAc4ki6/XJjExOiUb5BpSoocmFS1qYbNEk+HNpU+G2rb
	 XevqWmUqkgxaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3346060B;
	Sun, 25 Oct 2026 22:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96797356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C1C840070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZOAk9J7KWEM for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:09:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 12E4D40057
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966164;
 b=JcM9wZVk21OajnCAdBVhSMV71xC0sDzwp7ex5xxfjijoRpTOaSn+RDcp6bdxBO2F82/6
 bOIQtkwkqtpFJqACpd0rHITjgT4uPMOmNbkmiIjovw7IaJ4HEQzgp1H9kg8MaAjB7Oqh1
 jcNUNl02ykvGLzNNtkVm6OaDZEEO9hPGQCNcY4wBafiG9Xt92uNA/UX6OI8u2SkgkRPdl
 aWWAb5/3Ibsiz6Vvd/maPE+yqt026T/OnLqk8Y7etqoObI+TrOW1xqtu+JjRUdxiq9Wu0
 H5LSuCs0h/LUwJGC7r4U2baAe6kH2tMM+wTztJUAljgJowDxZtWmUh1MoD25kJSpwVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966164;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=PuyalvhJ6Lsv+KvVHgigKWlxxB7hmLp4c5KEkur7d78=;
 b=f1Ghqk6IzsMY+nJGlkiqg9v2z+RCwGH8iHp5diBWs3lQqawjU8FNri2MhX/t2GPa1BGt
 e52rQaZsaWVu0hdaGbw9mDSA/VzKP6qDawlL6TBP19HfUyJiZwTVawg4tUtYiI57b9cqN
 M/NW9HttmPXPIWRI5BZ3lOF9uRojqc6gDrBUUUioZPhTyBhGJn4cxzdWdy32NKhBlqyTx
 0IsuBYMRlkEx4zInrQTAOPwEXweBFpAWTq+fMEumXvxaxS4YjfDwmZiXbHtmxFJJNpz9c
 7vumIaI5IcjEGI4DXD42LEoABvD7Gvj5Q0Ztf/it35nrgd/LomeDI6aeiscBnBJ4CZw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="XysRr/oQ"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=XysRr/oQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12E4D40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966083;
 bh=PuyalvhJ6Lsv+KvVHgigKWlxxB7hmLp4c5KEkur7d78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XysRr/oQxGpGOdv07OYRTIFfhz+LDrWq5Z570dbjDfm+P7U9nUdgy/2HZyg2K/JAB
 aLuJsLV+vHfRqjFZJVQmKSmeScBS3g52Q9IKr0hvspbhU8Vv47EyIlNMt/2QwjcGoa
 42fZn7oirHVkyniYCGms2Ujyj2i4rHwG29qOuLGOzZMW4iu+FeZ0F1zqfrqftZz12p
 zqjR2Wx91eVQF2yI5/rPslGAQgjUna8LM/3J9X8wRbtOY9v4UZGUEBVrZtGyecScmx
 r3wiC74VNlyVA3vTqD+bFo7npHL9Vncg8WeBICK3WWa4xkwxMJHtzBcxxs/9OMidtr
 nMvMZJ0Xg4h5A==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 zDNpvb7obgh47tHYj18fSkNFUCInJf50syJgb4UrYXelxlxCtHgJ49Setvv/GZzpK22Ideld8xH
 eTvlOG+f5hmYO1fzKIqlgPTmUyYNp7TC8hONqgK+QyBcv0DiQmpMvgQzSc4P6xY6BlRXQJTiekS
 lfQF9pfWngzrL/J5+9rENBLBPN3LAcT+3PQTn9YrKWTdVymsKb47HJR130pGUryGsEfMt++s83u
 X9IDpdl99r6sxgBYQvrfxMNUyQOPyOxlTAHPf+rQc2lbwzqq3gHtLzoFBrcWw5k5Tb32s5SCfg4
 8igLPhafuQyfYRGHyNVKRC7FKNgSg5VOUcLlK5SXWbs4tTWEsl9DKoBy0dRZEz58uzuYm3QPF3L
 W0PvK2X6Mmoi8/GxgpWNk4AgEq7rHsS7Uq2xtMHN64BEgkmr6QNMs8Ms06X5T9NH+zncvg3NLSu
 nukwAXk4QJns1nvkgFLzahJ9aRs4Q47NvGZHXQN87cX+Cg0xtrch394k7xzgMGAjWe3FgNKumim
 mek30riM01Bc6GoFfVuqNhA3P3XIr5rLiT0T6eamvr2WXveskNH3CC+qs5WIe3gqR9Ej74Gv3RT
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AE7EA4C6A11;
 Sun, 25 Oct 2026 23:08:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-1yTX;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:06:58 +0100
Message-ID: <20261025220723.1332924-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 09/34] package/docker-cli: bump version to
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKUmVsZWFzZSBub3RlczoKKiBo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkxMwoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWNsaS9k
b2NrZXItY2xpLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCBiL3BhY2th
Z2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKaW5kZXggYWVkYWUyMDIxYS4uODg3YTg5MmI4
OCAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaAorKysgYi9w
YWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgMzViZWU1MjRlOWIzNzU3MzY1NWY5MzlhYjhlMTYyODUz
NjE4MjdlOTQ3ZmUwNDdkZjA2YjZhZjMyYzNkMThjMyAgZG9ja2VyLWNsaS0yOS4xLjItZ28yLnRh
ci5negorc2hhMjU2ICBmYTNiYTE4NWRmNGYxOWQzNWQzNTQ5NjJkZWQyNTJjZDViYmQxOWQ3OTVk
NzIwN2MwZWRkY2IxMzcyYTcwNzc5ICBkb2NrZXItY2xpLTI5LjEuMy1nbzIudGFyLmd6CiBzaGEy
NTYgIDJkODFlYTA2MDgyNTAwNmZjOGYzZmUyOGFhNWRjMGZmZWI4MGZhZjMyNWI2MTJjOTU1MjI5
MTU3YjhjMTBkYzAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2Nr
ZXItY2xpLm1rIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKaW5kZXggODdjZWJi
ZWQzMy4uNzNhM2I5MzkwYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1j
bGkubWsKKysrIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKQEAgLTQsNyArNCw3
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfQ0xJX1ZFUlNJT04gPSAy
OS4xLjIKK0RPQ0tFUl9DTElfVkVSU0lPTiA9IDI5LjEuMwogRE9DS0VSX0NMSV9TSVRFID0gJChj
YWxsIGdpdGh1Yixkb2NrZXIsY2xpLHYkKERPQ0tFUl9DTElfVkVSU0lPTikpCiAKIERPQ0tFUl9D
TElfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
