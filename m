Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124DE606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wbjv9rcM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B602409DB;
	Fri, 23 Oct 2026 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcLBv7cdxmWr; Fri, 23 Oct 2026 14:55:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53577409F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792767340;
	b=QP9HfFMsbsSj6Dg0utjtKurC1ZCCpmZiQo++exvRkyDug8vsncoTwnl7AOnb7EKHeodw
	 nhz9Gt4k2HRZ6RMx6As4YF9LaHA1MykTd1gWM57SnNnqmD+Iu4+PvnYU+VVKtPy6C84ZM
	 J9WiRxgw2B8Jj3JVXSmGLLVViaybRJsXi4pWyV+CX0tglgffi1FOCSzODgk7fgEspDb57
	 0rc5GOfjv8BNdNL0TT2FRStLiUp8QK9QarrafBJKs8zE9hlCaAMfwXO+gyR/KnPG1lfvb
	 8npDhC9grdL/CCPO/1iBzrJqZ6WOtmyuprEfjL0WMyTrbV+cCR44H7qylEMwZXm9Gxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792767340;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BGhj+hogBN6/N3aMW+v0t8HaeeUoxzr8G5rbxUsDKuY=;
	b=TnUrt+qjHYaxj8T6+A1JrdSgwOQFc1ufUvxmnyIZMhTiL6tFX9JWA32yWcHBTQru1vOC
	 xea+DbOYkzbsdc0BAmehVfhsVc0H26N9agJiyYwkwC9MTmVRJGO31DV8jlMmQIMBMTjpd
	 Ttv9sTZQaADt9mjgCwX/OBpvdf2HxqULBhGOGFUsfdInb12XdqVRfRJB+gYNuAVBtA0BE
	 lvWsJZwW8XCNxIjyEmBwe4wzqyxpWZrnkcv5+AAPw+PVUwBpSmPSX4dGW9XZxsO80EdG7
	 QXOEjQ3IuDSNIk9qJZZY9lmQSKkhftfGjl3UQ2jqsXAeiVnL8PTNJ37zVhhQkS2h/uQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792767340;
	bh=BGhj+hogBN6/N3aMW+v0t8HaeeUoxzr8G5rbxUsDKuY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Wbjv9rcMWvlP9cJ+HxP65SVs9PZJh2u2MngM1/f/cN5D8QHo6ElxWGZIZeeKr2wqv
	 pUdk+znKMPYTLJcXfz2tdCXrNsh7fX/jBSi0xmcE+/MkuxToKfHpnwRpNg/IFdgDlf
	 LijhBIHwLKbqtzSFY/SczCt7S4n7J9clylbSpc2t41O8poaaXpDZFCEyp8sM0ohlyT
	 yIuY2gnYh7JgOwMpDHg7Qi1ir1B8ggI6Cnm/wkTtIODqd7nJV/Y6cvRfTPPQD7GuVY
	 9W6o1rB4LLg8AEZ+aU1RonOhE5Ht1It9U0d4yauRYSVxzykFjbYrcAPg399rvFR+Lp
	 mX6EkRhIbAxpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53577409F6;
	Fri, 23 Oct 2026 14:55:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 364E949D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01B1A409AD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdrRME1aDZ2Y for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:55:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31A7B4096C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792767330;
 b=ipDW14H3AAR5dJ363hOwaTvLbf2LKXsNCpK/PNtDVOI9Xx/DzKkhb3t/mgP3slfx1Cgb
 HwnDxxPDOiqXnujwE0Ozubon4eSlPj7eLmajv0o0VBIzgFvLOVLDd5dn+44UrqxdMNHW9
 USPaT37hq5mnjImxAoiPyhge1nvoWmJ/O5ki9XOjycxv4TUFtHvlS+FP8pexPoIPFWgms
 Wz+krAXD1p9VBnviz5sCgTCPDLEeF/8sAX6kuJq2CoWHSCtdt4tBKmoNesn/aBJ2Hv7xy
 c49w0RnN2wupoM6zWYPgef+UZtQP8BOuk6hp88RBOA/u0dB6lnfaQKgtnLRxU0R/dgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792767330;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=neo44aUJc46hysO8b22T19ukhusA8sCkQyzxzR7/yQw=;
 b=ALfcZF6011kZqbGPkqjnv4IY6vtIVBLn/tEn63wp469MbNz8aRDrTd9Wt64J2fGaTtzg
 Z+UcxbHEUeK3yoEeQu2GLZz+F4FWp2/YXjhNis6VjcysX2hHl7t07qmkqR2ujOe5J2T9R
 1YD94nD007+hPY3pjdAAIv07kQlCPkGRV+vwKP2qTpIwIR+/hN3WUoiXORCoEmSoF6Rx5
 YiaU7lzk3L9A3f8UrhVNvS9UEWKI8ziRCWgRLzBtEQwbud9HE29ZrozkXHhEYsMOgyBH2
 M85uDWsVE9ODCaacRsyS/BK2+QAIfvNg40Jkgt1CQBcK3qm5s9jweZf762olAGxOC1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Hu3kul1P; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31A7B4096C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so10438975e9.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792767327; x=1793372127;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=neo44aUJc46hysO8b22T19ukhusA8sCkQyzxzR7/yQw=;
 b=ONrf+h5du8XkI27oB/xf7AYZU0xEIgbkiF0N+toLnc8NNcHjEms+45Lv8yQJSJxp2I
 sqjZazl9/PPhMT/w36/8ITC8JLUUpCjG+Gdomxw/kGFr24sM2+kUpsG85CgMf8dQg7Jx
 DqOhagwHsRR6OdNycuRce0ENNTIZw8n8X3iluDbJKGeQjQZJ4oRzWtQ7hMV6SKckPigP
 EjH3q3jShMrUZRQ7GFB4BaONol4CQBbbheIsM/FpAxtnGX152oLauU85ujn/Lpjy6MEC
 SZBM3890sxDR8pIm3lw9HjelIM5CuCozet5E8sw9kJutjmSUJrQKPgF74NdDCWPGArU5
 N6VA==
X-Gm-Message-State: AFq9FYKPr1SC30JZVdbFFUC91rTqWo50d17ZfhDtmClsi+LLTR62cgbA
 sOvYJpYOcET8TYWJm4y+Vn+50J212e7n+EGhjA63NwAH15qnegboJwnCGN5mRlyFS1kAMEVKZwQ
 mapYvKa4=
X-Gm-Gg: AYBFou2O+BVTZKMLn5BL2BSGlmWuu2IW1PeWyBFCQQkpX5CZNk4O8HVzIc7ahTlhXLt
 wAIiZxFgElKojJfVrPIO34p6Dml9f5zC0ELPX8G6D1vcVqwFll8StPF69z4kntpsbcWuZBEILsS
 cWKWPnrnYEI0/GRLgXISrE/6iMC1iEmKO3FNMIcOaBiCQkGxjfPtwUlb3BuGKXU2CYJoCUmnrbi
 fIt1AQMBuP9QmMvvTOqUr5FSYuOTj1dyAqbptL+PuSQo3Wtd/sl91x+oYnpK6QXH9WN5iHZtICb
 tojbB9Z6y/rODYdhvf+TzC1+AF1/w80WfzJaTZ1H47hfW4cU3CTZf30XcFeXwR85PzRQyEikDAf
 KoLNj/UfScovpOc4aCq55ASaLP6SykYkiLjv/YGw6PtDzxJoWQud2mtpm4zFO6xTpSPEhxDG+Jp
 xRKELvbzbwKzFLMcg8Zfc5S1vfTTnjazxInYjtCS5PvtIjb4BlhLbMmcers62+AB+QhCztcitMC
 Uaz+NtlnnMiJ+W0u1PNfDX+HtefEtBPq1O7XBFg9PsdZWFprmkShUX2MA==
X-Received: by 2002:a05:600c:c44c:10b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4a219600853mr12146045e9.4.1792767327087; 
 Fri, 23 Oct 2026 07:55:27 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a29cd9d09csm10429205e9.5.2026.10.23.07.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 07:55:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 23 Oct 2026 16:55:21 +0200
Message-ID: <20261023145524.1751306-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnss: security bump to version
 3.132
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VmVyc2lvbiAzLjEzMiBjb250YWlucyBhIGZpeCBmb3IgdGhlIGVNdWRocmEgaW50ZXJtZWRpYXRl
IENBcyAoWzFdKS4KCkZvciByZWxlYXNlIG5vdGVzIHNpbmNlIDMuMTMxLCBzZWU6Cmh0dHBzOi8v
aGctZWRnZS5tb3ppbGxhLm9yZy9wcm9qZWN0cy9uc3MvZmlsZS9OU1NfM18xMzFfMV9SVE0vZG9j
L3NyYy9yZWxlYXNlcy9uc3NfM18xMzFfMS5tZApodHRwczovL2hnLWVkZ2UubW96aWxsYS5vcmcv
cHJvamVjdHMvbnNzL2ZpbGUvTlNTXzNfMTMyX1JUTS9kb2Mvc3JjL3JlbGVhc2VzL25zc18zXzEz
Mi5tZAoKWzFdOiBodHRwczovL2VtdWRocmEud2UtaGF2ZS1hLXByb2JsZW0uY29tLwoKU2lnbmVk
LW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0K
IHBhY2thZ2UvbGlibnNzL2xpYm5zcy5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL2xpYm5zcy9saWJu
c3MubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5oYXNoIGIvcGFja2Fn
ZS9saWJuc3MvbGlibnNzLmhhc2gKaW5kZXggMDJiYmNhZjAwZC4uMzc5MjJmMDk0YyAxMDA2NDQK
LS0tIGEvcGFja2FnZS9saWJuc3MvbGlibnNzLmhhc2gKKysrIGIvcGFja2FnZS9saWJuc3MvbGli
bnNzLmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cHM6Ly9mdHAubW96aWxsYS5vcmcv
cHViL3NlY3VyaXR5L25zcy9yZWxlYXNlcy9OU1NfM18xMzFfUlRNL3NyYy9TSEEyNTZTVU1TCi1z
aGEyNTYgIGNhMDAwNWJjNzdlOTI1NWQ5OTQyMTAzZTZmOTc1NmNmZTMxMWEzZGY3MmFmYTk5ODYw
NzA5ZTM4NmViM2MxNjcgIG5zcy0zLjEzMS50YXIuZ3oKKyMgRnJvbSBodHRwczovL2Z0cC5tb3pp
bGxhLm9yZy9wdWIvc2VjdXJpdHkvbnNzL3JlbGVhc2VzL05TU18zXzEzMl9SVE0vc3JjL1NIQTI1
NlNVTVMKK3NoYTI1NiAgZWU5Y2Y0ODM3YmE4MDExNDFhODA0MzIxYzQ0NjJhZDhmNDUyZmY0MzE0
Mjc1YzZkNTEwOGE2YjA1YWYyMjdmZiAgbnNzLTMuMTMyLnRhci5negogIyBMb2NhbGx5IGNhbGN1
bGF0ZWQKIHNoYTI1NiAgYTIwYzFhMzJkMWY4MTAyNDMyMzYwYjQyZTkzMjg2OWY3YzExYzdjZGJh
Y2Y5Y2FjNTU0YzQyMjEzMmFmNDdmNCAgbnNzL0NPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGlibnNzL2xpYm5zcy5tayBiL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5tawppbmRleCA2YjRlNjhh
NjI0Li4yMDk3MzBmNmI1IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm5zcy9saWJuc3MubWsKKysr
IGIvcGFja2FnZS9saWJuc3MvbGlibnNzLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotTElCTlNTX1ZFUlNJT04gPSAzLjEzMQorTElCTlNTX1ZFUlNJT04g
PSAzLjEzMgogTElCTlNTX1NPVVJDRSA9IG5zcy0kKExJQk5TU19WRVJTSU9OKS50YXIuZ3oKIExJ
Qk5TU19TSVRFID0gaHR0cHM6Ly9mdHAubW96aWxsYS5vcmcvcHViL21vemlsbGEub3JnL3NlY3Vy
aXR5L25zcy9yZWxlYXNlcy9OU1NfJChzdWJzdCAuLF8sJChMSUJOU1NfVkVSU0lPTikpX1JUTS9z
cmMKIExJQk5TU19ESVNURElSID0gZGlzdAotLSAKMi41NC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
