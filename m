Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00E606A32F
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 07:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TtQmF5OL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tTtpCgiZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96EBF60732;
	Tue,  3 Nov 2026 07:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Hyy5IjQ1uZ5; Tue,  3 Nov 2026 07:05:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 974FA606E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793689504;
	b=Jftv9vsW4KM3ZTBNYcq4B/D3uOwzOuxyUxUCnSzBaKFzCft/9kKKFDTpkrV3MuZeSvwC
	 glNbVp/ocmve//u3+JE0JqrT7NJJdlhHkoH8JCpMNCQHmofv+4orPxQKJu19q9fbViclM
	 c8iFM19z0MywbA1XWm88Ce2ccvY/nv8oRDWZR8ct9Y+Fm+hwqyTciLIelDi10icBHPwyE
	 FRkEBPiIoEcz6pmdQYXDIZ/7GLV9ha9psTjJxptYru9vOIekg8LP7hGnrexBR/8nZX6rT
	 97fTyW8VyEhMSCGKLFlCDaliDgWYo7kOVXzpHVPSaig5x9hfVx9OYdagh4MM1DyEwWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793689504;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d7Ge2Bb4VcoxlGvel4oLaqqfq0g0RpRHaR2sCAkqNI0=;
	b=Pp9JFF97HMetrvBVYxmjaMOzhhVmxUT/X2EBDoe+30LYgApy8JF3xIiQ1ZyWb8CorT6k
	 +VqifypmfY5HYaBTY6qn92trhLz0rXKsN3z7xZp95s638NJCBr77xuxUH3KhiVJC9WpsW
	 Q46IOskW/9rs4IFDo8cA6+FIGuytmhCrtOxTN92Jr/La1cnKixPm7Tv0k7yGIf7eiuDIe
	 zB4L0D3fAz9wVMgomRWcyKya48gMFhg35M5Vg8hjAdMGwo5GoYySzYQi0cOfuDKD5AfBB
	 7xZ4IJqBgQTRhhnaGYQeKTX7H9znQnP/OpWcFCOjVwNIeO8O1OTC/W3E4yiJDgwWcEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793689504;
	bh=d7Ge2Bb4VcoxlGvel4oLaqqfq0g0RpRHaR2sCAkqNI0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TtQmF5OL0oDWPElVsOmMtfckxdMb/lNsp06x3xHpQY7ve19kJliX5wspFnknmYEY9
	 A/rFbOKr5S1AKPvGJOwnODl9rZMHNVRBf7ZnzwIb1LzJRODgyIVbY/uiZhfOuJxd3o
	 3dr3N233wkkw8MeiPPK/8OdPmkJdZpBfRwMSLnzIWuTOo35s+mpDyXYpkDQSaovtFq
	 h12vIxuLRJcGlkRZLz+zkOrSz0txRtt1Wnjt1Rk9F5zfimgVSDVSWHz+gBilEKK7Hq
	 ZieRuTkDmqKYuxLYNpt1D9c6n1qIrrZdzsHRdvm2NBnERcFL63zMAYtdpBIJBHh9oZ
	 HwJgd37kXQCpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 974FA606E9;
	Tue,  3 Nov 2026 07:05:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92646235
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 07:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 745EB40229
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 07:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDxgZxzS0C07 for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 07:05:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D31914009D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793689501;
 b=Uk/9opLebPv90Ka0LttJkTZiZPrPvd4Euzu2V/FuWRIZxIPoiOOzi1dAm8es3DZylasa
 a3dUo2K55/ipFS5UhRNroGr73lG+PEWDrxe/J4ElS0PTkcqan70/Z8RQjXSTv2PNUCQzP
 7ZDk4r5OfGUvFQM8QiHxhvE5tmwJ2B4oBnDThCy3XKc1UrSPWd8bgzJzLvfjqmqdz/pfv
 +aadzFBRzR5FzoKiJqGOFH9ZBj4vnHAsSu29Mu6psqQbx6CaUksiTOoAG4LQ5lJ6d5Pv1
 8QFGmXqaEYBa/CW4GvVpnocIbk2EWUfi1jogITAJR+SKCNUhg9qbXYD73qm4bERZ8lQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793689501;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=2RBJlisNP73wD9CB08I+mIQbw4WMYNioNm/6ORoLriw=;
 b=hnLIjvVag2AAH5XBRgZ+LaMhjjR3lu3rhZZCicwSHUomgzAgfkFI8yiAu6y0cc3OUOAw
 ArRFRz/B0oUbGMVvEfrAj9BwmPVKKuLSAJD3miJoMaOvJO2L8hdYBi3ZpjwJcaG6R0o02
 sCFxoskj3QfRe6iVWBT6oZC6sKS8SRLMQl2lvT8Wm0i00beznPKOiORhuvstsp5rUs1Vf
 gatC+tAO7bNx9oUil0jN9eXs8KJdo9+vARaXZBQVwfMegx3LyNQtsP28dkpNjabso1jDf
 flXYIUgp+aBSW1et2xmMtjnvI4vN7Xa4VXZI/NelSI3kYIOTrU/b/dvP3nkyDFkFUag==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tTtpCgiZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tTtpCgiZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D31914009D
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 07:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793689498;
 bh=2RBJlisNP73wD9CB08I+mIQbw4WMYNioNm/6ORoLriw=;
 h=From:To:Cc:Subject:Date:From;
 b=tTtpCgiZ8kNu+wlm62D81xPSoEPyQ+KH5rrkpvjEltwJBraaRk+TGGABcWnR+MHA7
 JA+6YyaXWHlkoP5dbSlYKij6NFuF025vXcwY69ZvkXWR9vRVqNFC7Pv9K+nCqR+Pxv
 duQPmqAewc1GJNXf1++B20pduatVhgLtesszVHfjSaFkvxL5y0UfjR2zg6PT4CWKZR
 F6RfybgO/O+riunpvPNx9t0ELYuf0QF/G78CdOldW2oOAvQ+Ju5J3po1SRGyzzcOJY
 f5cZ/gycWeVFbxAsmrTNMvdFgX3n9emkXCfhv1KD7rS2qkH3hHuOIjT4NK1qt1Ibnd
 OOKfXFWnBMqwg==
X-KAS-Sym: v3:f51bdf72230551df:c1dhsUUCf51VkUnvoOV8ClHi9T4XixYUUkBTIQGf4vbxX
 TOdv+mtEbPmw+PFaoKQ2/0gPCHOxkRKIZuNC7zuUW3VVpFTNXwZm/jeujcZwpf20NgZ1hRlNNEw
 ZAWvt/EO9nfT+sf8yqjWdcxagITVmLW6wtafCnqS3VVg7yFlfonlo7ObXJ6GN6ng8mMASNOd54H
 8wwG0a9cH/G5k4Y4Ydt/y+YiVs7QjWnDQfiXFishGTyFg/nmA9HE0jMoLOk+/fMsr0rORaQ+Lu4
 U9atvGSp1jdsrmWMjPjL5grBKFnD8GBJjr37G3PKFfgU/B5BQASl89Ye0IvVumY7bTEkrVkQ==:
 r3ItfMamyonIHCxqMvaVzYqNkLcqk+pGC9Sso137nEDhZe5lmV0xqgb8FH8yjnPYv15xKMVVD7u
 QcwSV7awU4DmkYxz05TGQJxGWBK5pPemAZKI41o3hUV3Zh3gJyf66c8RY42nMS8YA3VckR1aLDS
 iMai8CP+SQMN+IyQ+Dm0Je7qoad3Zkb1/UJBzhUyRQ1qjWzSK28yj4+KzwtMXbEPBwNw3fvId3w
 dJiIm+LQlfmUlk8epbvZZQog6wXRnqD+ZzbPX6cYuieKbir82G+gxqmpuogG1X/impf61Baj6Rg
 rmIxozgrgsAqkdxW7r5+w/2K66fgPA8QuYSUfwwzAlx5XzX3pdZDz7v3zedrzsBn5PfDnDmmW76
 234nyejFdyprBB42YMiG+pJG4Ri/z24lX2JVGqrmcfurzLmjT1ODWpanB7/MGqZdDfQSvtHFQvF
 WBSMH+KvzlzyYPy5G5ifD9C2HDdSN1lHUybinxd/6jo0Vv4oqXK8Kda4NpNb9pU8cmIjmc1UAst
 U0HjCycJbrAXhK7Y60/9kh7N0ZlErNXeX9KBykit9+ZNuAY1+q/t6At0YEoLYoSFI67X2WmMTTz
 v6QCAtAUQ2X4iB6UuZfrgbEqamwZo+Qlv8wn+mKyDL9gr+HWRGVOS4BLV8kLaOFLINhQBnpZ6im
 qYKMI
Received: from fli4l.lan.fli4l (p5b3a07a5.dip0.t-ipconnect.de [91.58.7.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1DC5EA4C2E77;
 Tue,  3 Nov 2026 08:04:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40596)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xO8Zm-000000004Fu-0TsG;
 Tue, 03 Nov 2026 07:04:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mikhail Boiko <mikhailboiko85@gmail.com>
Date: Tue,  3 Nov 2026 08:04:57 +0100
Message-ID: <20261103070457.5964-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: security bump version
 to 1.0.18
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/fribidi/fribidi/releases/tag/v1.0.18

This release contains "Security and robustness fixes".

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b1f717f968aa2e503efbf3966c8ee1d9c258e50e

with the exception of an unrelated build error with ffmpeg:
https://gitlab.com/bkuhls/buildroot/-/jobs/17679187034

which will be fixed by
https://patchwork.buildroot.org/project/buildroot/patch/20261101191738.2091630-1-bernd@kuhls.net/

 package/libfribidi/libfribidi.hash | 4 ++--
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 38acd814d0..cca8bb2da5 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,4 +1,4 @@
-# From https://github.com/fribidi/fribidi/releases/tag/v1.0.17
-sha256  6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2  fribidi-1.0.17.tar.xz
+# From https://github.com/fribidi/fribidi/releases/tag/v1.0.18
+sha256  1de5e8073d035388b71d0b2d452b1da1f8caeea8a7702997b401fe1b6250727f  fribidi-1.0.18.tar.xz
 # Locally computed
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 1a275c5fcf..7a64b2ffd7 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.17
+LIBFRIBIDI_VERSION = 1.0.18
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
