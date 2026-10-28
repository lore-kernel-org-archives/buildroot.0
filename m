Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917F606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EyeJMLho;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mLf4zncs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61C040396;
	Wed, 28 Oct 2026 22:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYSkQyO61PPt; Wed, 28 Oct 2026 22:33:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BE3FF40052
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226825;
	b=MCGMOaHCuKWvwe/5v5iijw6Mpr7QOMdm6R03oho243ozn9/tgiLWb8TVBaaxfnUdxHIU
	 0COrdzInskUdVkXeliv8R32DkJjpubPIvVFGdfz4bJkfdHg0JphsqyerBy8Wj/tP3DikQ
	 CRPQdjVKRy26+Zr97wJJpGiiwrkHyD0bLfqVYG/+iMoCblGgqPX8fojlqj8JQpnDlX7Rr
	 vyczgXhWOb+uoQ7cI1u3H4DMZmpcYEi80XGAHz3OQ6VFXecQ6OpjAU3UsT7o6klAaX54N
	 6RUsQk73YWJdFQZRib2dE31OuY9RhhuMrFd9xlarYUlxAXpyB+UN8f7ngdZqOdtxYoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226825;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7l9UWnOXbpTcFpcT9oyVkUi3CQJswHf0VBpWF1k2Jno=;
	b=k8K/jm1XNBbF8ifdgARcLv1x0A/HkhqO00Dm+WslOGWxrKPJz4o8s14qfsq9ZclYQM2J
	 8OHjKHB7AYDwLHLsFjJdrhhs3fhQK4Ctw4qaf14FQjqoxCc1+wfkPzY5ds0AOmZtXLUuM
	 FqMpfkI36JhWwvsEteokMGouHvPZQmEL3dSGCRkFZl1AN1V1W4xn1V4leT/5QpMQrCXUk
	 D2mLoBZ8tCcUGLJakHIL92TFmJMfBh/cWrxPsAQNoPYd53IvPu16jjoXvy172absNsCKB
	 7WsY+RQiKMcaTuxGBZb6Wf/Tx7VhQ9tZjAtndtQ2ageSxyIWM57hEiRm4kyvDeScLpA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mLf4zncs;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226825;
	bh=7l9UWnOXbpTcFpcT9oyVkUi3CQJswHf0VBpWF1k2Jno=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EyeJMLhoDT6nNj63FD2VbIZa6dRwZwtjTddmI6guJAT+Dl43vroyXhqZqd03O9awr
	 krcnEfpRem8rtE8ia6C0L02oZsEr2X/qRVZJDuUupw31YGrcWkWq2verO7vgyTjPi1
	 khp6bvzrD/aHq0+okk6IJWf/wmsbzRR9mRbK/AoL9N4ZJ9ueMpRbV1Osf6JuD/5b7E
	 +NoFCna15zJQ2+LbOZyJFq0L1TmRzidM5hD6pGJheFb43q89ht6HRqqA+bpCjgEbq5
	 GQkhsj62KnE/XeJX3X0Cim+2beBQ7EYVNkaJwZllHucCeu77yBi/9EuTcrA8YtqFtx
	 rjx6+kx6IUZqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE3FF40052;
	Wed, 28 Oct 2026 22:33:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3E359C6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A5B540775
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JH3uJSoXjXh for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:33:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CE2A0405B3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226823;
 b=kl2d0ZHHI2Cfzzh1fjtTPuc2gIdWCwYJKFHduPlADLCXET+lKUMh1lr96k+vU0qSOxVi
 MonvIpTw3t3KaPAKziPEgCLL0wpj2qnma14aRaT0xsoeoJ3E7IFViB7Dz6EwkM92EFrWE
 n9G6yXW5Vhh/Z9+EqTVLWF+yaY1KLb2/yIA8SpclxOA/ZhKRYS82mu40blGxtdH756CWd
 QYeZoBMG8mQt1lnkESct30yPLqiwXIrG2iUPAHOVY1o8bSf1UC0cdE89XnTgyTPJbSAWt
 S3GdcR2iEPJrOZzMNNmtKQuuvl+jimwQ6PvU9X/CKuVqo996hUppHCRgRRhRPncaMpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226823;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UOpsnj157ropW5BGZmwwcIJqJjF3MMwYl97kPgnjNrc=;
 b=b9TDjtLovjhwPW/dBx6vOvIK3aFku9aApwKUlYMTFg30nZhiV2/fBE2DCHhRR21R+JSc
 H0haGrhL3AQjCzwrvocV9pY6WbEf81/Y4dlUSK+x6ENLDUUiKMKj9Gjq6m8zHV9vy7fOi
 WaP3gxObJstRsNrWkALPF7yZ6sXmCQF/ymvjECGltY105b7ylEU9CBYCUsDVQxfqvck1i
 JeRu+VLbcFyj98zDbTisG4PwMFOaXk6NTAFeTspE568VjZDxveHB8Zbvp8CNClK3KvO5e
 04CGzpNDysVbgEgWRfkC0laTxmTNl2fW3hlTnedDhSZVaI5LkVqjU3LgB6NT3NCVhBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mLf4zncs; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mLf4zncs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE2A0405B3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226577;
 bh=UOpsnj157ropW5BGZmwwcIJqJjF3MMwYl97kPgnjNrc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=mLf4zncs1WMJzD7ybvAy1uBtUHo8mBn/l00U+eKGrf0rxufBiiaAFqiKC4kQ8gWBs
 LN9QBqbLdQ0YdLSm5Mbt6y7ZGdVHq5g4N/2lfcdmJOt4cslZKPZt1wprdL5lCamOk9
 4dW6V024lgBKI5zR3JOKYbE/xaxwh7pEm5KQy0jR7bQ9dHlMhPrYyi+EtsEyWLHeZG
 N625KnB+EriM1WH+J1YV0LNC4wwUBCyeo4gYAFfVwLqJT4sdPNfVLn5mwXXhxDBULJ
 0yZKc77u23ediA/yN1GEbSePZYc10cT5JEMySjPoxEdqSWAjwP+l4Nm4lepdWPJVSx
 DfSpmNySQqQxg==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 ZQgKAzwk6K2OgPes4/nxPLIgRIab96EE8z19s+/9ynZASGcffh+fC9X34gK8x0KoTfeMRuXd7LF
 QQPyZTfFuLA9DCrIuSbmACkRd+V+bVEe4AFXnYf1y/G5t0pmZbxnA9FaJeRRaVs/+AtiZz5Zc7w
 hHxAvg9BPRCrfMwsAQohvZlG4QwmcuGUICj41t5r/l+TUe8ZYNxYxd/IJkOEA1OGGMPeyWYnmJP
 u0Q+eaBE3a8vCtsrjVEwM0UJ54vw5i5OHaNAdyhBFFYSQdA4nSHtA4BRBT4IVkploTeJqjO1ypt
 RblAYaFJf+Bu++Fs9nqxl6IfjpDy98BS5XaHt4NzmS2ekepZK/L3xzrq7743T+o/twQAQ0+DQDO
 KhETG6ZvQHyteg5VOUJwO4Z29p+1ew2lzClAmyT8SMT60/DOd2RAZPg7Xi3ieIwR7VCePfKcEJe
 4E9YYpMslhgbCof4c1N9lU3diWOKrl7+kTRjfrO7aNVaHBCV9lCUrgHbFox7/gVMJh62Rt9Per5
 D6Hc8O57uH+P56Cz9lt1gY8gZw9Y3K0OeaUFtInGRsYpQIHeKDeeMQlfrIMl1aTFnU612xUDMrt
 v1y7
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF28CA4C6FE0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9J-000000001i7-2lp0
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:22 +0100
Message-ID: <20261028222936.514451-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 05/18] package/kodi-imagedecoder-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash | 2 +-
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
index f8bd74d0b2..9c821cd331 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4502522c6e71439114a57cf51f444e38b32c7f786636ca6c361c94aaf5ffe066  kodi-imagedecoder-heif-21.0.3-Omega.tar.gz
+sha256  186539681e6067fa24ed3c0f526301224de30edbbda24e347af3d79569603cdd  kodi-imagedecoder-heif-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
index 5114dad72b..66bbdb832b 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_HEIF_VERSION = 21.0.3-Omega
+KODI_IMAGEDECODER_HEIF_VERSION = 22.1.3-Piers
 KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
 KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
index 98adf46a9b..0b724e9383 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  421812f6ca8d70e6736c920935461b43f1338ee04a919dcf7e5f7ce1879b54e2  kodi-imagedecoder-raw-21.0.2-Omega.tar.gz
+sha256  ee4692563acff8fce4d77ffd629778d9df3cb516825b7a74ffc80f25d902f419  kodi-imagedecoder-raw-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
index 989742a901..ce5514cfcd 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_RAW_VERSION = 21.0.2-Omega
+KODI_IMAGEDECODER_RAW_VERSION = 22.1.1-Piers
 KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
 KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
