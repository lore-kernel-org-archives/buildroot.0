Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769E606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Uj5i/u9V;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jcvUw3yJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73C1280D07;
	Sun, 25 Oct 2026 22:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmvcURyZBj6t; Sun, 25 Oct 2026 22:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 834AA80C3D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966217;
	b=TpocLQDXZPi9ES+NKDgr9E7RzTUElRTUqdplNf2A6VoAgPgayT4I8fWGeNntZNZUux6m
	 xY0By7CY6P9wwTmGdi7YvQwNdqusmZbn9ackenDK0l6kXo7zoSx3L1ghhxZ0LQSI/rBzd
	 Vp5P9o36b0Owaz516vokIFouam0tPHxk/9gCs/itxivVJCxDVmCFWuQbtjoE6q0QMXkzB
	 OCZq6+e/RpZlwoJ77D88r2pXWWIvZmhqzUm0oMRbRFxTki4+oQEpK/k8byfpe+W+f0+Fm
	 V6ZjazSnYhCdSvis7pixieZiUUyTGCqhOTLzNYrEtdWxSCxjoyXVBgRwi+6fp6sNE/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8avgSERIQgCFunacyoym+qbwsOKKM4y0R9PNaG+9wao=;
	b=DN81KUhZCdNwlXZPETzh5dKJRaF/BEWK1nqywWD3jvmlb+8al76I5Y8rICUsx5ieyR9C
	 xWVXUvhA2khxpOvVxwbpqmNMFmK68qGgd6UBzJp3sCC7g16rC6W5rYbK2rA0yN0vtuApX
	 14cIk6PaqJv+ot0qst9iOTMIdrYmuE1mLOl9w2Pj5mVxIeedEPBATz6VKpbTuXRoekKnn
	 HRCNqryrD/tqspGqVfzl35S8rAQ6wXDTUJ8lAToFM10UDZzSDwvlJ9/CgRK2T23GHUb5p
	 CpF9q7PeXPby1WFZilZQoRpBMsrZe4gRvSDZzPC45N+VlB8EaQq2RYIdpHclT06vWtg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966217;
	bh=8avgSERIQgCFunacyoym+qbwsOKKM4y0R9PNaG+9wao=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uj5i/u9V1iPncjQA2mdot3v9ZH4nq9W1EfQVFc1rJDfIv7b+JgyK4FpsUn9N9IPfH
	 1NH7TAx2I7Ep0z8Nru/i4CZZx/gEJ2eIIQ9gFlH6SDfDuRsO5DcxW4tFG1cUlFzP+M
	 zL8TaBJ1seD5KcPOShmG++yJVi6OYCjccFygzeUsZ6TWep0fJ9nE6ykYg9t+hdq1Ip
	 phA3mCt5+l8ftqUjO5azir5dtfebTR5CBibuTjx9F59Rwj4Jl5+ZnrfmBnQyvWUa/h
	 vVf8+Jpy3Xv1fXJPGH+tcl2GY/jBNZKmlRY8WILiDUznsTlebXDiBceYx+h4WN5pOh
	 fkzS7AIAr9cWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834AA80C3D;
	Sun, 25 Oct 2026 22:10:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43B4A334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3599E40450
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-mHb4tTUsrc for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:10:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B135E40437
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966214;
 b=Ln60r2P2uY7A1WeYie4PuTpOJJspv0Ps/TpNJzviHUKGD5PCsimt7VL5l74gDLa08+BV
 llGMX7BYQGdGgdIhrQbvOHAVAlIdoB4vaVKj3Y4QFov387vx/EIL1jp7S8MdRuq4SFf51
 ghcPR3KLwF1iFo9q1/Bb3K2ky2xoSD5GLDZNlunDvZnOk8zxRgZpR4U5fV6Z9ig1Ed5lv
 89m0Vob4CBXjJA79d63Y+nMex1Iozixvj8DTtKnyadAoe6W31CM4Jk9XehBdIeQp1ceIk
 XbohA2S3tn1VGfvbX5f0g6vfiwbPC1MD+HtvnjcjZxBeXfnn9G1YPY0rEN7/U8DW5zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966214;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=NMbKtosBKs6L2UR+FsErnl1dUtSem97EOHlAFVqAUM0=;
 b=eQ10ut4nL7XU9LwtQijiT/1o+HeRRVbOGO6ZgYLho3OZsbTbuyrrE34vkpb+t9T9tg+P
 cdYrVFyLdkzib9HwlKJgKLAybpEG2W/khEkcwllZ3cue4Rk5nFxMfc3dk3jSP/Os98f0g
 HssGehQzNERI0mleYi3IevN/J82E0c638avh68H+TYip8L1gVxCX13mJdjtoTpg9uXrIH
 jAWpAIRVVrhplK3E270rG8nHYcjQ98Os7iT31n49+dH/zT+yJsnjawa+KHFKW/3GKKof6
 FCCHPNgtyy53eoWlB98Q2HM4eWl606FBysXquy+KhNTlfJX2UVigx78rAD+kOUlTnXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jcvUw3yJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jcvUw3yJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B135E40437
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966084;
 bh=NMbKtosBKs6L2UR+FsErnl1dUtSem97EOHlAFVqAUM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jcvUw3yJ9vQE7bizm/khWNcwDmJhW/2KqgTmTDZQRHIANac8bS8VjMX/I1QRifMk0
 TWj25GwElpC4Pic4ZZ0qG9SveL1VfNsH+WLatuJ606amhqX0od/k/xImf6faf/Vn5U
 zqNJd/GaeNanF5bhOzTJUH9kcg+WrayI5wCWUG4+W/FgzWOpU8O84UUSlp+wq0eLi0
 VFuV8HeVLRw+Z1JTG2q4w1TH4DQniOcP7TEHLtynNxiZOOIxjAhUKesahKxzrlpVDb
 L6ON0lWh7veFDnavL5f3hP+5Nr00yA5zsMql+/spvyHgHQaMVSXkROuC2d2Ou4PJ21
 3PH5WZEMPs9WQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 2EyOxgF2MxNvVySRlC7eBn8uobJh1uylFigADx2QmgfNLQutThgpiH1iBv8C5Mp5WDlsxJ8bwKu
 pMEFTTRfh+27BApdTlNKnf20jmwC6yKGMsrjQ52iuH2Xc7eF6a/aVBLJ4xDkKDaAs7XYsbO/SJq
 MCUuwgPxqIug9r/rPxLVki82RQNpl4fLRc4DGYMEL0gdgOm/nKEh7s/tSeasEKIEKDsO7z1wWgw
 RZggIPNkdJ2dlukEIS2aue+NdilXwDZWl7OS2+jjBBtPRaCGS7hGO2E/CCA/rIZ481J+zdvnGXG
 whx+WGHXuoJU46ejFHNUcfln39aq/U2D8OMWh+w5sJYTQqrWUIxDZsURTNZ/j2jPLIFdNU3hFrY
 /GJ3ecOkx0//6taetrpeXND+fR4Odo2p32+u7fFF8SsC9xdq0wgbOyF0SJAA0ro8G8gEWDw6e3n
 sLMe8ClJnA+eLoLcyuVCyNVimyY0dhY87lKwaWBaoXuCFp+NKY5q7Wcol8kedVZk5g7cU1fbJix
 QB6iQaMny0ySHpNxA1t8mQCf3rNkoZcbBiiukR+d49d1FyGZ4hVqGDY//44q/1DsiL1uBDZhNH6
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 157D8A4C6A5D;
 Sun, 25 Oct 2026 23:08:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-3AGC;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:02 +0100
Message-ID: <20261025220723.1332924-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 13/34] package/docker-engine: bump version to
 v29.2.1
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
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkyMQoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWVuZ2lu
ZS9kb2NrZXItZW5naW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUuaGFzaCBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKaW5k
ZXggMjJlZjhmOWNjOS4uZDQ2MzVmMDViNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5n
aW5lL2RvY2tlci1lbmdpbmUuaGFzaAorKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgYTM5OTlhZGMyMDk5YjQ5M2Q5MjRmZTdlMWQwN2RmYjRjN2NiMjg4N2VhNWM4NGM0ZGU5NTU1
NGVlOWFjOGEwNyAgZG9ja2VyLWVuZ2luZS0yOS4xLjMtZ28yLnRhci5negorc2hhMjU2ICA0MDQy
YWM2M2M3YmI4YWY2YzA3ODgwYjhkMTBjODIyNzllMDJjZWQyOTc3YTMwODkwYTRiM2M3MjliMjlh
OTM3ICBkb2NrZXItZW5naW5lLTI5LjIuMS1nbzIudGFyLmd6CiBzaGEyNTYgIDdjODc4NzMyOTFm
Mjg5NzEzYWM1ZGY0OGIxZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTggIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1r
IGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKaW5kZXggYzljMDQ2ZDli
Ny4uZTRlYjgwMWUzNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUubWsKKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfRU5HSU5F
X1ZFUlNJT04gPSAyOS4xLjMKK0RPQ0tFUl9FTkdJTkVfVkVSU0lPTiA9IDI5LjIuMQogRE9DS0VS
X0VOR0lORV9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LG1vYnksZG9ja2VyLXYkKERPQ0tFUl9F
TkdJTkVfVkVSU0lPTikpCiAKIERPQ0tFUl9FTkdJTkVfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0g
CjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
