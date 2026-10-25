Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C767606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mAiCQ2PQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZNsjgFiq
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61F4880CAB;
	Sun, 25 Oct 2026 22:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3SDX8954rJH; Sun, 25 Oct 2026 22:08:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CB5780C97
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966103;
	b=VBA2ANwJP6owZvWEU38HNE1yXGTq24jOMjWpktZPVIpjn+aL5kPGnhL6EA42uz2Vtbm3
	 4IR3NOh3fatU3Y+5ORapb0t4IYXnqWReRbfLGNXrujLi2eMK48qjZX6y5NK39HFUgITg9
	 VYArx8MS1798RB5eex0WxqVcY3xb/DmYbyO8RsYpU9SSJ5rLSmy8tce7/Zk4bQPoCU1BR
	 926uA3PFW0bg/2fHm+oeGBJQSLK9UH3krGykDhh58P9lA8xpMO8XD+lFdLd9ckZHwAqkv
	 SIqzgWBtaP/UKj/+1pjoqiyTMoRmaFvhDMEvYzizfrk1FEtRHOfT4W3oeg0eDUVMFvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1nu3NJ+Bhcm7FOxdSQFpiPOfohJLOsjNd7jkzK8coa0=;
	b=HRtm69aibW+XdW9h58DEdWwsYVtNTVr4YgDAtrHo/iNehcN95NXSc/j7Tu9ZrYhkXKIC
	 jRxaE2AHXvV1Mwt82ZDJII0SRlXMqKp2a3lP2myOnuQUOpr4LsRVvHn8rwhvgNq4LCdfK
	 VhDxki/4Qdc/FoqAcmNAmTAMDjQbPhkAHAjDXmxSKGenG95g2wD/UND5ggTjdsbbn4MzD
	 7afHiMxDQ/zb2IzdY0ELdB7hyIJ6lRH0C+rXk9a526/HILDKyUwM5shelBrWRTbGtvlyV
	 WmCYazPPfL1pHx7kGs6ZfxiPMrYFDyOI/MAJwfQthJUVFM2SJtlwR6KjzV3pmW+fgmw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966103;
	bh=1nu3NJ+Bhcm7FOxdSQFpiPOfohJLOsjNd7jkzK8coa0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAiCQ2PQMGp4lIbjBQwXx3u2WQ+YgBMOIT9UxrQ4TYw8jCxIQunUun7UFrhR2x5XF
	 ZcWah4upT6oZRLN1ak2/TRzR2XwmvvnE20I+EOnqE19UGm5GxKcyhQIoJhCGtZINHE
	 RnTuCaI7OxXRrsBa78YCDOSE3c1mujW2WI+cIm/y7m1nVOvgjTnHrG5EKFlVZcIWTn
	 eG3Trsb9ztaPiIEjXChD8e86KmVAc+eoZ+BiTAXejyC/c/IUA+DjorWj2rU6BL/Dqm
	 TT1hCxuPdA8JJhtMp9eqY4s4Y/YTl32zugSyvL3DvhH2JNGkRONOODSeS1hxejbhDf
	 4IaQX+Rsg3zvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CB5780C97;
	Sun, 25 Oct 2026 22:08:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43034334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2950960626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Zc-JexKc2HD for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:08:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 416EC6060B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966101;
 b=kiuatTn3THoccm/X/FTTN/1kDrIaRj9x59pJ14NYN+1VMuusPJ12nYCigZeSLyZ/z9P4
 aJd4NHiP78y4VBuPER1TRa+5bQ27EZkcjkpSCMYAV3pwKsua4c5ieUJfcXIjG3kgXNbOS
 xFmrsqNs9GER/6/glQ/xHQ/MRiMQ00Imr1k9XYtbLjJKTirjx/catKUssnGTeUggdrmWB
 W59l0oBT/TvxpWp+02YWk7Yid5RfN58vkxeWbGQU7QPQZQNm3q58q0G8gPAZin9HYRFXs
 F4jN7Azz/slhkKYYszLy8SKt1FvjQcvP81RAl0uYYuJ9UNoXMsVJd7wAo1FI1UzuQxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966101;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Rw/hHIPyVt3I0JXwl4vqLvBNGCuREjP60npuoZeY7Y=;
 b=Dw0Wf7E+DB7LWH/LRS82PUKzvBI2jnKeNl9nGwhXwGpOEaQAWhihbspYF4AZfpCvAV97
 bCmAmc88MpwoYMazBtP0Ph5UxNm5TL9EFUVfOdWvhgjtDgDw0keOUc+bJzwIO1Vg1Ernw
 AIf02/1x5OZxbQGwWUEOj5qI4s3tKErSjTVv8yEhrKmItWGasBUSD/WJeXAegX+S8kDS7
 XU2trWcPsTK7bqx5GWSzjEwEPS7QidTQdpI+TtrpFw2Ki4L5JykU3Q5RVrFbIUxMy7mNA
 sbJjXf9oDxxPqgveqCoeLpbHn7SetkxecNT3hAnwIHAm3S+bYUKdw6LiRmILOW5tvaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZNsjgFiq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZNsjgFiq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 416EC6060B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966082;
 bh=0Rw/hHIPyVt3I0JXwl4vqLvBNGCuREjP60npuoZeY7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZNsjgFiq6pQytDHHrCHlKC2w8gLlJajnrtDOgkyYMWFoNvDMmNy1O1VNKgGGePaAU
 KgaQdSynGBpEIo3qFkpZt61rJ1NA3jm1kKP4BtfwfNM0YOOKEphviL/0vafbFhC3z+
 m/1pOSullb+2jk8z31RD02IPhI6EBrwbeP9xLTrcR4dMhvf9KHHc5tkHLSzWSLNlxE
 uLEDqDRaGH72wituJIz+X4F1hd7c+qRTQ+NSeMLl8Rbfp/Emkfi6HP/fu5+80ZTy/I
 7cZUwSaiO5Rs23pzh07p4xWZW3U0BHK52xy16qS2znLiy2e6JRgcw/S8TpuCkCPd/U
 7UArP7L9irwlQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 TV0WN210tdb9PY6yNtFXSh10ObyZN99++HbBP0bZu1BPIIxwIokhIIcMYyP2Pr5UQySGlQJ0oyw
 LJTtprtfZxMsmmq8zZcgMCBCGnwevm88biVuSUw9BYpdQnQ/vhHzyknedvL6QQd6fX3GZNaFuQI
 XVNHPcl0JmZg+qWOQzQygh7ttI2ynM75m79peBC9ettY4IXpM1StWB78/hEDh20uotDmkcigDYv
 IiKWYB538/ySrgYJQfnv77rgwkvCebER8Sts8gdZaJesTep3HdRhjf2lq4CrujlyEolJIAr24bX
 ibnKlPmubs0B9JXy56JU81KoXE8DDiQL52V2Pr98/PPbOBCWGovUb808jJ9H1ZAkrXjT/lA+l1Y
 f++wTk9CdxUGYFz8Fi/8z2TMWD+9P2nlXtZCjpR+MzSeLekfI7b86JRZyguGyH1Wi0V72Y65cRc
 lp+ErGGCkafCZawd4q8qJ53ogCpeuvsv/sNk/GYhzMEIweMP65IEj86dv7UnaBTE6ubcTjOk3df
 AUz0CI66mmDogczuk7uYieTeM/eEC3K1tBRNzSDP1fuwZV9x8605ohAJ7Pt8mmA0oKScLOzzg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64E27A4C6958;
 Sun, 25 Oct 2026 23:08:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-0yQa;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:06:55 +0100
Message-ID: <20261025220723.1332924-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 06/34] package/containerd: bump version to v2.2.0
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKQ2hhbmdlbG9nOgoqIGh0dHBz
Oi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRhaW5lcmQvcmVsZWFzZXMvdGFnL3YyLjIuMAoK
U2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvY29udGFpbmVy
ZC9jb250YWluZXJkLmhhc2ggfCAyICstCiBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5t
ayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaCBiL3Bh
Y2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gKaW5kZXggOGIzNDUwODIzYi4uYWExYjJk
YTcyYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaAorKysg
Yi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBD
b21wdXRlZCBsb2NhbGx5Ci1zaGEyNTYgIGY4ZGVmNjllMDJlY2ZmODRjMDdlMjQzNTBiZTBiODM0
YTNhOGUxZjZhY2NmMDQyY2FlNGQ1MDRlNTJlYjAzZDEgIGNvbnRhaW5lcmQtMi4xLjUtZ28yLnRh
ci5negorc2hhMjU2ICA4NmU3YTI2OGZjNzNmNTMzMjUyMmJhZWY4NjA4MmMxZDZjMTc5ODZlMjk1
N2E5YWQ4NDJlYWQzNWQxMDgwZmNhICBjb250YWluZXJkLTIuMi4wLWdvMi50YXIuZ3oKIHNoYTI1
NiAgNGJiZTNiODg1ZThjZDE5MDdhYjRjZjlhNDFlODYyZTc0ZTI0YjU0MjIyOTdhNGYyZmU1MjRl
NmEzMGFkYTJiNCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRh
aW5lcmQubWsgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tawppbmRleCAxMTdkZDFj
ZGEzLi4wZDIxM2E2MzEzIDEwMDY0NAotLS0gYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVy
ZC5taworKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUNPTlRBSU5FUkRfVkVSU0lPTiA9IDIu
MS41CitDT05UQUlORVJEX1ZFUlNJT04gPSAyLjIuMAogQ09OVEFJTkVSRF9TSVRFID0gJChjYWxs
IGdpdGh1Yixjb250YWluZXJkLGNvbnRhaW5lcmQsdiQoQ09OVEFJTkVSRF9WRVJTSU9OKSkKIENP
TlRBSU5FUkRfTElDRU5TRSA9IEFwYWNoZS0yLjAKIENPTlRBSU5FUkRfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
