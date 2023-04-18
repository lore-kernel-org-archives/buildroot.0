Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9889C77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 09:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5605C41870;
	Tue, 18 Apr 2023 09:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5605C41870
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrKI568JBQC7; Tue, 18 Apr 2023 09:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6035B4189B;
	Tue, 18 Apr 2023 09:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6035B4189B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C39981C425C
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 09:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90E2D83C6B
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 09:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E2D83C6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rpz4JW9GLPpI for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 09:46:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A0683C57
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71A0683C57
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 09:46:11 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id c9so32732839ejz.1
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 02:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681811169; x=1684403169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hMmkG7LZDxGKEQNyG1VvCdBRvWVFvWdFqOuUhGN+4IQ=;
 b=CsGwooER/JjiL/d48azSbP1TJJXY+dYOhdgBRdaIlYChb3dLBov6KkZSIwTnhyhPx4
 8JBuQqr22RDwR441fuEnlEPmEWvqlmTO+0cPU7qVdc82b5weLWuQtPlCJCRBHGwazzP7
 phiWaifR06LTRtO6e2I6ELPzc3zWpG7e+Jvv2dMZJBpMoLvwXXFG7lktJxy2tIrRITtC
 dI64/HbPlKuLLib2Bz2fvh1yboLvaiD5OglDctMNVVxvYq/Oq2kdzgkbpnhiMt3RsGVk
 kE3+ZkO2u5FrORLGT+Zen3CU8KglZcMzwVHzPWGNAOf2g364CUq75F6NVEVeR2bfMByh
 MbXg==
X-Gm-Message-State: AAQBX9eyWl4CyHGYEjv1lgmc11+UwhjqYkakelqOZw5f433YPVHk0xtg
 AmXsVxA70tY9yjmSlu449mVN68gWGpDukr+KSYPXGQ==
X-Google-Smtp-Source: AKy350aJU8CWG1WSUdFYxyKrSpHc5WUE68Uv2kGQOp3Gv6laEVT7QdBZlWQ+2XWIoUDejdyuEa/abw==
X-Received: by 2002:a17:906:80e:b0:947:92c9:6aa4 with SMTP id
 e14-20020a170906080e00b0094792c96aa4mr9902185ejd.4.1681811169404; 
 Tue, 18 Apr 2023 02:46:09 -0700 (PDT)
Received: from junian.fritz.box (94.105.100.233.dyn.edpnet.net.
 [94.105.100.233]) by smtp.gmail.com with ESMTPSA id
 x12-20020a170906b08c00b0094e6a138170sm7830208ejy.72.2023.04.18.02.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 02:46:08 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 18 Apr 2023 11:45:53 +0200
Message-Id: <20230418094554.2236758-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681811169; x=1684403169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hMmkG7LZDxGKEQNyG1VvCdBRvWVFvWdFqOuUhGN+4IQ=;
 b=U9s76FV9W0qxP7AjthjonHE0/bQjaMrkidP74nB8z8ZjtvDoU+PY96ncuxRwzQSl3C
 Yyv1UFH/GzSdYTMpMEN3vuVD32381rw9quPkn3WnGVZ80BUW8NSoR66zbvOE7Yl8H6Ae
 jFyCGjlQHjRxNfMEmlGqWWbJ6xqZHqErS7dA+ApkCq1yFmoL2yqU01pf+mPcYRWfXXqt
 fcc2ZiVIKO89cNsnw9IB8HY9eFmEVOuKZc+cjNYLtHuSLUJKMZGmnHW3CdrdHI8BMGqJ
 5fhKZ2JSoLwPfR4H3v8cCGePpFVyZJHmLPO8bWe8ugoI7LWhoO0BUdbs9gB+cE/FM+CP
 nX8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U9s76FV9
Subject: [Buildroot] [PATCH 1/1] package: python-boto3: bump to 1.26.115
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5oYXNoIHwgNCArKy0tCiBw
YWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsgICB8IDQgKystLQogMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1ib3Rv
My9weXRob24tYm90bzMuaGFzaAppbmRleCA2YjM5NDc5NzhlLi5lYWU1MDgxZjM0IDEwMDY0NAot
LS0gYS9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMuaGFzaAorKysgYi9wYWNrYWdl
L3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgbWQ1LCBz
aGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvYm90bzMvanNvbgotbWQ1ICAwOTEzZTJh
ZDhlYjIwOGJjY2I4MjZiMTBjOTJjY2I1YyAgYm90bzMtMS4yNi45Ni50YXIuZ3oKLXNoYTI1NiAg
NzAxNzEwMmM1OGI5OTg0NzQ5YmVmM2I5ZjQ3Njk0MDU5M2MzMTE1MDQzNTRiOWVlOWRkN2JiMGI0
NjU3YTc3ZCAgYm90bzMtMS4yNi45Ni50YXIuZ3oKK21kNSAgMjEyMzU4ZmI4YjljYmVhNDRhNjNh
YjkxODVjNjI4ZTggIGJvdG8zLTEuMjYuMTE1LnRhci5negorc2hhMjU2ICAyMjcyYTA2MDAwNWJm
ODI5OWY3MzQyY2JmMTM0NDMwNGViNDRiNzA2MGNkZGJhNjc4NGY2NzZlM2JjNzM3YmI4ICBib3Rv
My0xLjI2LjExNS50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBz
aGEyNTYgIDBkNTQyZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1MTI4
N2UxMWI5MzhlOTQ1OTQgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG8z
L3B5dGhvbi1ib3RvMy5tayBiL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5tawpp
bmRleCA1NzI5NTRlODFhLi43OGU0MTBkODA0IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1i
b3RvMy9weXRob24tYm90bzMubWsKKysrIGIvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJv
dG8zLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlU
SE9OX0JPVE8zX1ZFUlNJT04gPSAxLjI2Ljk2CitQWVRIT05fQk9UTzNfVkVSU0lPTiA9IDEuMjYu
MTE1CiBQWVRIT05fQk9UTzNfU09VUkNFID0gYm90bzMtJChQWVRIT05fQk9UTzNfVkVSU0lPTiku
dGFyLmd6Ci1QWVRIT05fQk9UTzNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9y
Zy9wYWNrYWdlcy9jMi85Yi84ZTkxMjRjM2QwMzA2YWIyZWU4NjVlNmFkZmZjZmNiMDEyN2JmMGMz
MjczODZkNjJkMmM5ZGIxOWI2YWUKK1BZVEhPTl9CT1RPM19TSVRFID0gaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzc4L2E4L2IwNzY4NmJkOWE1NmUyNTU2NzA4ZDU2MmM2
YjhhZGU0MjNmM2NmNGNiMWI3YzNjYmM5ZWQ2YzI0ZDAyMgogUFlUSE9OX0JPVE8zX1NFVFVQX1RZ
UEUgPSBzZXR1cHRvb2xzCiBQWVRIT05fQk9UTzNfTElDRU5TRSA9IEFwYWNoZS0yLjAKIFBZVEhP
Tl9CT1RPM19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi4zNy4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
