Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C3606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rrQ8cZ7Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IQA/umPK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C37A660684;
	Sun, 25 Oct 2026 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nK8GMNJ2KT_q; Sun, 25 Oct 2026 22:11:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E9F7960640
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966301;
	b=NT5oGndj3gfmLx+IdUhv00uXFy/BQSoBNJ7IXeAVBblLusoRONvOh10ZJ2f71S9EEwZE
	 uQ0EXLmYm8wGyV8n4QXzQkKsGeaqKOfOHyGNaOvcxesmjN5e4sPBJyvO6IEY4Embh7h1W
	 pJ17VaG/E5uooW49nEx1ESLCSgehkX1fDLOldgxOducxnZJDHNYrOmAtrkue0ijiCBE4G
	 FlbSbeZro0BAwwS1pdnTo90PB8HCY+rxntFRNrRuzs+RLU/HFVI4WwMw5QEgiyw0wpeJz
	 wVeD2vO3XNBrjIDoOrjnqPFmZ/54kOhoRIKDV45R9h6EofEpMcHF+9S2N+3XNT/4VmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966301;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QNo19FU5FZmj0t2xIV+Cbxga+RYWaeOxOtVxnWdOKJU=;
	b=LuO74zvhprNnYkkmAcFvxAT4MYxp5xGz/iSVsdTx1Nl/t/7DKVH/v+6FP8wRw1QlgIP6
	 QN0q0UGWV3Tbh+3rhGRTgj4RhFB20vB3rJURGbOv6oY1kOF32sc7vKaPPLnHCaf5zThEb
	 D+jv3s/hfQi2dRGRWRnWdVrlQF59e33uExeFASTHcmQr/cX8LO+yeZKYrCYkVUkCtIls5
	 XnZdJXQHZ0nliGv91M0c6hA3/fGLcZ8iJw4jp803DBqtZ4Vz7AVOo/gUDIeI2IkuExJKp
	 0MOax52F9kZkf0p0TzrCTt+DzNPrFlTfXpV6PNHdmunR7oAC9EzuzSuq4IVzyzx9/LQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="IQA/umPK";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966301;
	bh=QNo19FU5FZmj0t2xIV+Cbxga+RYWaeOxOtVxnWdOKJU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrQ8cZ7YvdS72o4EIpSqSduwA/FC/6wzFNyOFXd5SzeAEUx8jlcxLvV01l8h0Z8au
	 hRj1LGAs4YV1hYEJkcvRb6ADAYY0YdzazSk2hVcAhF2PyO3nqVzXMxLuB9FKJFVqiJ
	 mKz5hRX3OWPzKDOkK/YpRZFr8Y+Z8xwJ81Y1Ak7so8+Vktlvb5QvDn8fyvHUaNaMo5
	 wSRz+CM2rxkuKhgo2HPYiygONHfv8D7iBrKQb13L7Pxfu/M/5+tb73OiCGaRYPfabB
	 CutLeOX5kky+xt/uyi7P1ndi9+W/WbhfVw6b+5Nz9Poq6T93RMv+dLYY2NLnxIf9PR
	 VbBi83hEyf+7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9F7960640;
	Sun, 25 Oct 2026 22:11:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36E63334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2619460640
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd1ooNCN_61V for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:11:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 394E960626
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966299;
 b=ofRTgGUjXE2cadbT/TCI1ArhwlrrvlBtOejP4zunu62ALVpV7s4T1/818fwzP1uEaRrB
 whP3sBCfBGiIZllGM+LK24gBlgv1njp+wODCUdjlgZbvKx9elRzzijkXdjZqyPpr1K4CT
 NdNvouKTG5RB+lOMthUOyEgDKn4jBzH90bG42OcdGkwLPc7IJ/xJyBnaWkWQNjH+WyS9Y
 ZUh51oMYq77+dXz+41NhbVdsgvqKs+0h+5zdWsmKAH6c27UDIL8Sa0+1nnpNZD18h5xY8
 MMTTeS58F98g7hVgDW4CIiaQsEjTvq4nqp5raH2VQBt9a55CAgmNkkEZy+zf2VviuAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966299;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1idHwm4nBOx0M6qI3nL55DEJ5dhodrQUmRTCn1jYl5s=;
 b=nrO5M2EHPC4KnV1cHSTku6DJJY8VR4kNps7CWnBXC9tXBg1VQnx7cL2TZqxN6vwcbKv1
 LHz5Ju55wUBL9v+yUAoB9pH3+LxCTd3t6boP9eZar8jdJmXquH2kpOn7toT3s8Zfpq5Tv
 ctMbpeC18FYTRfjF/KqsLmmempQeRtvoxrlymv49LfeHo38Rkz3J1QE/kdgn2g40cOIg0
 stZzbUi24KJn5pToaAJ9T7Vost3eTgWJLGkrmRrvO5ebew8Tr9zGFDwZnkxE50NyG8v2Y
 +VmD1+NsZu//YmH38wDOjCtDEghKAVv9TbiMalSUZO8jbFzZa6azHLvMwf42EKaU1sQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="IQA/umPK"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IQA/umPK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 394E960626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966085;
 bh=1idHwm4nBOx0M6qI3nL55DEJ5dhodrQUmRTCn1jYl5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IQA/umPKVAFiT+RGpUweea/Ml8C7snTYQqZIH0j/S6z1mRcNoL6dpjVnHrmcsqYfa
 7413PXQ8Iiztc19m5smXVXVE78VIGhK2p0OuOpe9pGf795AzLDdeWFg6T21g4SSX6X
 pe6khfKAU4KksxR4O74O0yLIUMAwH3ULCsmE+8JXQ929uOfMlq9lo8irYxYPxlyVsk
 InbTj2pcoPhUVvKETrzF9TzWuJ6jlJpvbTLIPDNSOHRlFG5kudaMmpddfWOcnLwqRv
 2jN/ow44FkbEiGIKcMoO2aLGgIhV0+BptDqtiuKmzwSs6XM8FZu9Mr97uS206s1+3G
 c6wwqz+ahVukQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 FAJU0CPgvCqMmWR0Jcw5nwXYUdYJchCNmKxwj5gSeg3L82EnTxW7VEaN8uS39dkDBYAuotefz7d
 exDXSo5LBd2YaddY6SPgsxdxaaK/5JvCySTa2Po9En6h7QwucJ47s7hKGzDmfEfkKG30GGmDuLb
 U7bG0S3O1eYvXqSRZLompcc3EBh0VE54pZbcD/t+IU6pehTLatkpQE2WCM4aPZNVSIKUw+Oy8Kw
 yvx1B6D7yfAcXtXzLumbbvllBkTFbDgwEq1vUycuMGzBHDN/t9aw1/jwYP/sv3OqZlFnERaE2EW
 2Obe3p2CBGM/z5dilLkld39z9rnHb5+R6E6TApLjWyamhgRxQp5Vao7Ir29/G4SJ6Hf7ZpC8y3i
 aHDtdtll6MUccMEm+ZVfVhduAj9lBjnMzrSuGJ3fhqSqaA1/W1tVmD4Rejr4GzH2PygTrnq/fUH
 tSdlhOwT3QJGB8nDzJ1U3Oyn61ibbBD2+M2fQ2GprMy7KqcU9htYmjvBPluNzcV42YQDeVf8S8J
 +nRTJveUVRcalFcBHqXmXnumkvOYr301gopu8WNEupRW/RiACa4Llts4pcNKieuLR3v3edlqhcw
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A257A4C6A9A;
 Sun, 25 Oct 2026 23:08:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-0znN;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:09 +0100
Message-ID: <20261025220723.1332924-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 20/34] package/docker-cli: bump version to
 v29.5.3
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
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk1MwoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWNsaS9k
b2NrZXItY2xpLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCBiL3BhY2th
Z2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKaW5kZXggZDU4MjY1ZjM3NS4uNDg2NWM2YzFj
NCAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaAorKysgYi9w
YWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZTVjZjgwZDllMGI2NjMwYmIyZTk3ZGVjZjY2NGFkNWYw
YzczMmIyOTZiN2M0NzAzMDA0NGMzYTcyODdiYmRkYiAgZG9ja2VyLWNsaS0yOS41LjItZ28yLnRh
ci5negorc2hhMjU2ICA3NjA4ZDgyZjMzY2UwZWJiYmVkNWJmOGY2OTk3MzE5Mzc1YzMwYTQ2ZDMy
NTQ5NmYzZTg5NzRjOWEwYzhjZTZiICBkb2NrZXItY2xpLTI5LjUuMy1nbzIudGFyLmd6CiBzaGEy
NTYgIDJkODFlYTA2MDgyNTAwNmZjOGYzZmUyOGFhNWRjMGZmZWI4MGZhZjMyNWI2MTJjOTU1MjI5
MTU3YjhjMTBkYzAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2Nr
ZXItY2xpLm1rIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKaW5kZXggYzU1MTM5
MGQ3Yy4uMjIzNjRmMTY3MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1j
bGkubWsKKysrIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKQEAgLTQsNyArNCw3
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfQ0xJX1ZFUlNJT04gPSAy
OS41LjIKK0RPQ0tFUl9DTElfVkVSU0lPTiA9IDI5LjUuMwogRE9DS0VSX0NMSV9TSVRFID0gJChj
YWxsIGdpdGh1Yixkb2NrZXIsY2xpLHYkKERPQ0tFUl9DTElfVkVSU0lPTikpCiAKIERPQ0tFUl9D
TElfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
