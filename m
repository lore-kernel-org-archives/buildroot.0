Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D93606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mB4iWpzJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=n+e53S3P
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E097B6060B;
	Sun, 25 Oct 2026 22:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7xDWlYvZ2mU; Sun, 25 Oct 2026 22:08:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 124AE60626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966116;
	b=Pt91Wa8iRiTjEyrulA3GPWHB4pqvA+I9ma2sUTkndL0UtCbrlKxS/UCRPFP9fpMq1iII
	 zFi2qtfbEftoQy1izRRQ0tk8/Sb9xdj7rYjD7oRyyaIf9+B87qxh6ntwFtwo0bQa5s7jH
	 gjGVbwCI3s+2xKj3U1DtMwJUfVJOoV3KnOcS4nCQ3N6T1XLs9zCo+MVM1+hNRcMJcGWFk
	 ek+9Q3si4jvcK7fWj9nnl3CkzWGAM/46Uf8/6Gnrt5P9lHlqOhk+m0FONuE9k/Ir/2wOs
	 aClrSH1zf9GXWuxKSxC78XDO0elsrLEDWblz+1siRAo7B26jqTofIhrQ8Bpn/163vCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lDjF3LbtqTEqu3eHESf3z5pYrK6Q1xgErt9BBPDAB7c=;
	b=QM/SPMnBySEaUCeamktaQIwztM8LnJ+8a1+5r710pbWzWNlzRhTJJvDBrr40S0en2ddz
	 k6Tl03MrO9eG7a6RxEmsrQRFPHdYY8NUk3gTevuATC8z9u+yKT8qY1/GI0clXqgEtHTKm
	 zzuuNhmc0FHkK9nBM2OMviOIUWS8hqApyL/fHmahG33RJZ4yXBZaBsUwMRJ/Hebx74aJZ
	 8LetHqSpFBHh7JmbE86rswoUs0V4ztkYQ54wVazKCWrQ8E5Kjjg8rVXFTguvgRfnlmxUO
	 VeuXg78i3R0vEZucYuPxq+7bQ5iIP1E9jMhoX6NrRhIzenyrm93auXmg4MT/HseC4bg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966116;
	bh=lDjF3LbtqTEqu3eHESf3z5pYrK6Q1xgErt9BBPDAB7c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mB4iWpzJqjsqheITAinlj6hiUeiJAYLbCOO1B5wmdQfVBub3fn8mJ+FeWrdj/5h/Z
	 rzzozxd6un360ceBd6Gg0H8kTkAje//KgxPNI3SriEPGpF/Npu/Z4u9llw+4fPF1Wb
	 PmmaYlU0GtUfjt2qD5oDq4j7CIQcuoiO2XaH1FAgmRnxQQRlkyvfeNckhT6GGh/tZX
	 n8uzO0FnNrl5G6n9wncJ9kXDevgbj1IJWi+Uq2APZ2sz4fnzXFoVEphNAq4ZEdEv1T
	 QL9UqbPi8aZVwYm41du5FXew/TNdmsZbwUQpQzIUAcWTsH3vl6Km3BWPv8tIPk+FN6
	 TOa2j/s7PXKQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 124AE60626;
	Sun, 25 Oct 2026 22:08:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFDBD356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1EBE40497
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfzVAPId0Uxf for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B73A40574
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966114;
 b=sVAfAJFmCtN2y1QudXQZ0yz71z879EgYjYGrttdZqLUoapxmAFuVHCHXyq0uzMEoOi7j
 FxS+kNAWBTQ0ttoQEEn1FUNTwDzXgFqIU7EQSKl1WVQtwPxx7y8zvEwRBD727APj1vY5i
 6OAm/58SM6i8X8PIElp2xSUpSxDnMSd9DWEAcHHknbq5GnboUfHWrovDcXPu9KORfvoGB
 bM9i3tCkMnvXwM6mqxW4y5UYxmUiV+PQuQqig73IWf9lMsSMVKDjlW5BT1n9XyB/2MXot
 S2CRpAMBNCSvFl6myURqP1J3maOdf/ud1ydVnI67vqcMvySVacwZW8fytMJrIJdHVrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966114;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Vosf79cgA15L6Dvn/JsLgLLTnq9KBiSy07WVrzVO4Js=;
 b=nRudp7DimDfnCMHJcm9KV0YEvnCibgNmqDfAKWUAlrFvRcFZDD9eMAX2QdkXoIvhnZQO
 Ncn8sLy5MmW7G3LoPMdeiUkdwqqEJnZZ12xgDmYdErlQ/qL4yRpC9pt9T7amOn00Q/eoE
 e5UmCLPhWQo+kuxLV7xsfpXEykmYF3WymK156Iw12ygkOaMq9VvV2Ygyd7wMdhkHl8htD
 WCApueem4Ml5CrtWyLo5A2XWQmCmkMUYOJXn7JTtMILCqzGk6k1Y5dMk2SbBybI9E/CcQ
 mqm86ljWZrgaCFKyLQok9LWIaV8rO43PoUaPQV+w5COl0FII+j+MbDaGU01AqlRZ/MQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n+e53S3P; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=n+e53S3P
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B73A40574
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966082;
 bh=Vosf79cgA15L6Dvn/JsLgLLTnq9KBiSy07WVrzVO4Js=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n+e53S3P6Wu7MZ1Pllh5jyPEvap11AOD1jcyxRFO/98n8NOz6ETdkLCeVYC2TzujW
 MdHNvzhR8zDT5O42YXahjOfzi6Uc3YnZqFxIASEWK8VJeeVYhhQmmj8zRYK3hEqWht
 0E1AqnRd2XYuc+6CBJCvrdsYwokQ8Xs9PwZLHJ+6H15rmwk9ECUz3Zq7/D9EmTykaW
 f3FHOAImpu1o5BP43VgoNjVM/5dl5cxOqKp2oTzqenJJMICEvdY8yW9CCNSxrn1u2w
 4CWR6L/RGnlq3cqRn9xx4BIcY8dLnigRWlx2ObLkgF6OBDavQQIg2//FxGSTaW4NXy
 SYWwvFA0S89bw==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 uVhbJE48osDObhg4fygEz3mWIAIAaCp/dT+SotdP/BVrIgqEYP8kK/E0zkw7RRpM/bDMZQgMrA/
 6/MfOBOf6iO2kxK4fyfem23LPSTdedNBISgwELLSjm5ID5GqwP6FXSB994eJNvzbU0JxXyu2cGq
 Yn5Q4e9me73OayaErRo2HreBPf7SZwr8vYaYuNE0k8glSWmzwWknHc7k8nAAQBoUlr+QmYmX8/L
 Y6QwsHuQmPoYy6TEtSGth68pyrXCG+ncI74lC+1bPbFcyWLjICeybmysxQwVIsaFuq1Lfduyft3
 FpYzOfVGUtzGZ+DYVr2tOS/pzv7FXVGI4i6mlhYloQalyr2fwEwnTRRj0RIgvvYn1yIgOEFxrpx
 FxChYNVzpnnQNwNNjhHswkFUOdXNiYTOik1S1OBincIp6AS2ElC9IPBCFs9/GiA3swt1v6/r5Xc
 z8SbmUtCEyJhdpfEhaTfRiiQgSQPRdj0RV0BhdeaiyMOrcUWpDEfzabzGhO3en/2YYehi6ZFaZn
 94F+dIbIvr4wghqi2ELoTm5R890ElFob8T4hhpdnEdAZ03E/47/Va4uq9IVvQ+YEPeMeOVCuVI=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 957B3A4C69B3;
 Sun, 25 Oct 2026 23:08:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-1HxJ;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:06:56 +0100
Message-ID: <20261025220723.1332924-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 07/34] package/docker-cli: bump version to
 v29.1.2
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
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkxMgoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWNsaS9k
b2NrZXItY2xpLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCBiL3BhY2th
Z2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKaW5kZXggMDY3NTgwODZiZC4uYWVkYWUyMDIx
YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaAorKysgYi9w
YWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNTg2NGNjZGZjZWVmM2E5ZThkZGIyOWI0YTU1NWQ1Yjgy
YTU1MWI1MjU4MDY3YWFjMTY0YjYxNTZjNmNmZGMwOCAgZG9ja2VyLWNsaS0yOC41LjItZ28yLnRh
ci5negorc2hhMjU2ICAzNWJlZTUyNGU5YjM3NTczNjU1ZjkzOWFiOGUxNjI4NTM2MTgyN2U5NDdm
ZTA0N2RmMDZiNmFmMzJjM2QxOGMzICBkb2NrZXItY2xpLTI5LjEuMi1nbzIudGFyLmd6CiBzaGEy
NTYgIDJkODFlYTA2MDgyNTAwNmZjOGYzZmUyOGFhNWRjMGZmZWI4MGZhZjMyNWI2MTJjOTU1MjI5
MTU3YjhjMTBkYzAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2Nr
ZXItY2xpLm1rIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKaW5kZXggMjE2Y2Y3
MGI5NS4uODdjZWJiZWQzMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1j
bGkubWsKKysrIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKQEAgLTQsNyArNCw3
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfQ0xJX1ZFUlNJT04gPSAy
OC41LjIKK0RPQ0tFUl9DTElfVkVSU0lPTiA9IDI5LjEuMgogRE9DS0VSX0NMSV9TSVRFID0gJChj
YWxsIGdpdGh1Yixkb2NrZXIsY2xpLHYkKERPQ0tFUl9DTElfVkVSU0lPTikpCiAKIERPQ0tFUl9D
TElfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
