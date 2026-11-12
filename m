Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CCE606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hxfeCqdA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mJwcdEZm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB91815CC;
	Thu, 12 Nov 2026 19:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5etZlw3yfCj; Thu, 12 Nov 2026 19:16:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1AD098159B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794510990;
	b=AVE6BwysIdx8lG0srMpdgUNtRAV2nSmkgb5NJ9Bsaz+V6qmZ4TbtJw/78PZQLd/u9qWw
	 /e4zXEleNe4p4yDmjHcQAZd/vmPcDoNjg7SVe2xJlYJNowuyfQ3bFjpfkLboOdcIsuSXy
	 bieKUs5WrE0ld6UBXLJVDapRugoCM4vnpyR+U+u6HoGctKCzgjITDUIvE92emO4/Osq1y
	 H59Fs/1Ohx9xQI74DLF7RCMSN7uF/X+kog+N3jPrqcD7CRyxPzJMYKreazFN4wkVg+30W
	 em0QLZUSg9nv19Wfx2sr2X56OSluwFgSsUPeGTgOg2rb2Jaj2TtV9HhiNm6EYTkn6TQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794510990;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PAs+4nG61UL+ENFksgku/D3tIKhDuF3b2x73/StX9AA=;
	b=Wsuj130xBK9E1pcK8lcnG1b5MieGzC1jjku/4sKrmP6MXVUQcapfUMUs+IiyH7q/Vxbj
	 Yu5rq/2aihe/e0/zUXoQW/32FuB3dkFMpaGbt4djO4N2V48hs2jCEyMCATB0g4DJbMw+i
	 j/cnVhMmsWOe00kUmEeIQnClU3X41e6EnG+qZ8HzAYvogkzY1uiJ5+3HUgLnyB9mkwj0S
	 ee2xaRJcgqLf3Yc7Op96fBUD4bUVq9+OdCkzk4nU2bLu2kA+AtoQlnqR/n7oNGvvB/dq7
	 EWFwFt0mYTwzJWbpTgq13U+S4QbhdMwRoCyu2J2NPGKUNpM69c/77EdeYDZlLmGkLsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794510990;
	bh=PAs+4nG61UL+ENFksgku/D3tIKhDuF3b2x73/StX9AA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hxfeCqdAia6ysdQpRv6srcOVdACgq9L94GkkhNSYJzbRfzYLf+eEFVrAoZQrWT9P2
	 MWGaiPRG7yTXzSQm4EJjYjCfDmjtAeL/Ks25EOEPpd4VO5t+1zBsf+CDVYY9wrDs6A
	 XWOjHzPVArQ1mzmLVmeCkESsJRLHaOMfQfmGzhUiniSKzjd45kdfEM7RK2HGVZfsWI
	 4GVZafj0ihXUBfAdaFpJIPMnHLLX5IAzTPPrZLCkvr1QE9vyJ43MNSrxNgTVQzVra/
	 nH4q4AwWKfxkQfwtmXUvzCxSwRXiBoQfv/UHHuHDRMZRhprtYymqq+6a+2j6vFFBaO
	 6/9/oqIHwh29A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AD098159B;
	Thu, 12 Nov 2026 19:16:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72E31AF8
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5887D40A46
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBUzUjYS71eM for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 19:16:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 54138408DB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mJwcdEZm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54138408DB
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794510986;
 bh=Kw2OIR7cwsqJKQX7baat13LZAjZSPJk5QFWCORF8boQ=;
 h=From:To:Subject:Date:From;
 b=mJwcdEZmMSG1YnnEVk7j2mw4hg2arVthCMr9HcyaisNuWH/oWe4X1q/EyTH1WBygR
 ugZwzCXur4vYjGop7TzFZsdYkQYtX1g5FvaT0fekkQjcK5ZlECa+s3a6bqbpfnFuFw
 Oq5g8NbKzPetGQjCWMcwdrEGfKqRbgTus35Xl3318V9C6gpxPZHF4tLWcW+TrxzpPw
 3UBcOo+YRmghzAYaJTKT4qiPt5lr50bQzosjCXUY5Nw4v2qknNLeZnmFndGlVccJIa
 VREHYXNOO+hpxH9El4xuptGpi/Pps/8uVksnGBaWntYzAGXkP8XFddSE1N5HrHL0Ka
 5JbYih0YbRWMQ==
X-KAS-Sym: v3:f51bdf72230551df:Clbr0x+vcQ+nh8vBqvFoeZstHusRJYrRDDnZznkXjRYlN
 ebf6e7/iHV/u9RUYEfS4E0HJ6KsO48+V/xEOn5+Cg7YfAAMuZXQQYhoLw9y4MTpkcyz2l8s900H
 teTo6LqQtb59w/+q6FSzp4L2qxSCANHJvRVokv3rVcpk1QnraAosmkIulJqTmlcrxPkrG+iaHfW
 TMy2RGQXSDOsYZZske4MwoIehla6vD2WGp+Ss+N70BpW/K5niNVj6AY8sac7aEyGuBTbAOp1L99
 rAeX55JwxJy1koM809WZ+qR2MB9hNg3x4WkKIZc+h9dFkHqDHChn0WJFJ9irW0BvXmZ2fX9g==:
 3GQc5BrjKpRGdhmblDe0yBv1Id1AkDwimtnKiMlpbQtInmgI9eU3/QIDcQxNMFL9hRKejbwT5Nk
 9vmmMDZgoE3jMp2jVbJu33sP1ZzrvYGKHkE/fbukbUOVZ0JD0bqOmhOu5pMKtBOm8yxcaUSN26d
 eX/NiIR9CpL+GtQoM0xFohmaIppOJkuxrE+9MkuTwZW7jCo+ZXRtotgmjW+OabMS4bW4BHtm6Cf
 FLAkC8Yy3hQv0QK7S8fMlDAw52Q9USd/kKANFuNdv30d7VT9forl1crU4vSgxTKZJ06ZDg7SW9t
 EIMFmGBtIX+akRpq2We6gB63S3jofZaLk/b3D+EOdZd3uJCCtq7mq1+vUOm1hHm018D2I7IvMOR
 r+uv5EY2iejYVSP4rTzANQPSLfMyxbf3+gIhZaDt+k+Z+faQWhsIKzwHUEQnf2hR4xBBqmEWwO7
 EktvpaWjVUnP6NLkZ9Gc4Td3xPfA9Iq5wOKHomAN/+VJ3kPbXExgHr+BCr5/MNK6H1HiAPIFcrI
 EKrwiFpEC1xuVyvctRFV0veGP3VyARBTyEFBncU7QDe/x8s7uKkkjMXWjPpfrG1pDZA1sYhw+1Y
 kQo=
Received: from fli4l.lan.fli4l (p54a1b984.dip0.t-ipconnect.de [84.161.185.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 44368A4C3AFA
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:16:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36772)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xRaHZ-000000000wR-2lwV
 for buildroot@buildroot.org; Thu, 12 Nov 2026 19:16:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 20:16:24 +0100
Message-ID: <20261112191625.102355-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +++
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.4.2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/intel/media-driver/releases/tag/intel-media-26.4.2
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index ee6e694b42..3b5fdd12b3 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ff79e04075fa52ad9d5bc66154f508892241a61f85192d0846de9f55b9f2ef2  intel-media-26.4.1.tar.gz
+sha256  93e82dc3c3682feab12b8c861be8762730349d09d8c20f7dd78c0f533049e24a  intel-media-26.4.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index ede12e9270..871e52f04a 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.4.1
+INTEL_MEDIADRIVER_VERSION = 26.4.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
