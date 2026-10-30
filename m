Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8095606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tz7IHJcX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=dtmLIQ47
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1C8B810A2;
	Fri, 30 Oct 2026 22:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndrzFprbVYK8; Fri, 30 Oct 2026 22:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3521B80FA3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793398828;
	b=LJUCwNQVxghVx6gGkAHaG8b2ANNar9BBgBbOrsMDlK+iuWaFswIQJKm0nu/tGcFw/KUv
	 tYOGnICbux13unz5ZqIAPkWL2YwF0Y/j+0VvTVNjokwdCBiyX9C9FkjsqDOt/LDCMboCf
	 Rfr1lZXcXn8A3fefzGM9iYcjEgz2B97CWeTboCC6dOW7lOVQskHbO2UEY9z3pU7xqlkIy
	 l7D3IN7bddgIfmJCxcw2T2ABmM5X6VJGx/dK/MqG3cV7sSaDgMmKqdjbnoi1KVYsLaBAD
	 tTCA5xClDb+tl5Yu8XVQ73vVCEsC/IQhISUZXVDPgxkuwfLH3c+P2f7ZwxvasK11N5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793398828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=S54z7ZhVU5wOpZ9qzBfuZZYhMQ81KQfWq8r8fb0BOLg=;
	b=bEFJyEqY1np0ZijLPJtkZT4netd5LAlecy1+0qNbKOxG95PcStBcEaObTKXpqdU6Cx88
	 6Hvx98lCfrI5GUSymcPG3tWlT6E6HUsTPA2w/5JBohEbyF/40W2Dy9Ml1MpAjqWcqLzbH
	 pEHZt2qELQL2Dd6gVuNqz+TclsKqwUzsLJCV9vQiuJLAryZP2WMVw1SXSseCyvJZBU88b
	 CJO2MZNgGcFbRuePVsz0XQaHetoNXtnMkh3wWJ8G3IxpQS91qvCdkf3cF4jgLxNBJrj01
	 PxH1Dg2NNwPOhp2rk8nVPrDWGnHuTgqeIm1WWwWCpQ5p0VQUUlMmTHd16CIJlRwrrig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793398828;
	bh=S54z7ZhVU5wOpZ9qzBfuZZYhMQ81KQfWq8r8fb0BOLg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tz7IHJcX9DRVF0j3SGXPthHWWW9E9nRB2EbDe/jm4EQhCam1LPghFlya9n16QsMB8
	 EN0r05j91R7zBIeG7ywv0JZ/HmH0OfwgrdgmRUjlYCwqIrhLklA3V3rY+3+LzcZu07
	 VOILvvZILg90gq1O5g/v+YplYq03P8EXrGHa2QSsQqnv3JntQAXQ2pZnZx+oB0nkc9
	 sDCqjQrtpTbf20jdSmapKlJdIoKMGkBAxfH+X/ea+K+0H3Y9DXmNQUjJzaGKZA293x
	 XDxq7e4Don64R1kftUUhJs8HSLaR0sqmh4HP0AqpPagRHfUu9Y5meIqZ55qzSN5OXv
	 2hMrQZ/EOhCeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3521B80FA3;
	Fri, 30 Oct 2026 22:20:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ECFA2AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C19040588
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNWF2rZu3kgV for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 22:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AFA9340585
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793398825;
 b=CtWMFimREHGeH9pKtoRGtJC34h6TQrYjysclz74qd+s59VfMDtqe2J8s6dooox7Vl3r5
 GH2DchoeTar1xUaHIhyWf2Pz+BNvyJRPqF1F3yvc2d1ILwhgc0XEF1m97Ie7RnvT7JOO4
 zpHn18TlS/04WOc3Yxm7rhZ1mPpWUtbTL5wwDZQCjn4eXE2el7kj54kj1myrZ/x7OnQ6D
 ZQNqFiHbN9xRa1LFruuUHD0Q8NJuRiPbTCIt6ohDpIOngzG++OV0/vmR/ZyB2AfksciqK
 STlWcm3VVQtA2enshXLM78vgkFLOxVaXaMS3xMwsftrgKizyJkqXOEFlaV8Hx+Zus4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793398825;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=S1DX7dI456V7PIZlMwtSYPlQ6D6HwKtadK7n0Cd3+gw=;
 b=ndBlJQlFa4hF/ncEM2+rFSXT6BsmKe36BKjGyi5TKU5HBki45XjgW9bSo3efuTu97nDP
 SnIVy6j/mnfC+fSL03A8aGYvr/WpY6QArGVlC980M2TQv7ONYFmdXWXwSXcJqWOPtf7ns
 QTzriw2iGAIUDLD1ToD3e3ROpMkhV8uW3WfWFr1d4mGcIi3nmx9dC1kgIq89orCoeFKxU
 ZtgbrG4MgZnCEaZfvfdiQMvWUc+1Dl1I8lS/jN4ssDNzlySI6ct9mrPOjcMsV1WRXVKyP
 dFTIjqYVIoZTfC931vr/OfEXz1lEBf6CSxqS/8zm+I4duKo7AfNy6OH9ZkCfiN5YiHA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dtmLIQ47; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dtmLIQ47
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFA9340585
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793398819;
 bh=S1DX7dI456V7PIZlMwtSYPlQ6D6HwKtadK7n0Cd3+gw=;
 h=From:To:Cc:Subject:Date:From;
 b=dtmLIQ47+Jbup4uFfluqO9x4s6TbjzbrdbUZ7z/L3wKHrrpfQ3EghwYLdfJJlKJWs
 f7kRCx4/IjGKYQtb9R127Xove7SZCK4WckjW89nqTW+1uxRLckcP4LggErVUYturcE
 +gGmxkmZidI11jt6nMftwFMaWtjuhp+XbLV5ZJEh6dUT8kptZfhfdZQ8f6L3w+0slg
 +HSIIrGH52se7q0P4Bd35pCfC7U/0leL3DjDOdYJ8OvPl3S2un3qtAcfbxugelZq9T
 Fds9fPQ3g2BLo7nSHEhf+tsIIkNW4PuthD9y5A2S/bgdxqJGwxc6hjtaR+4lqIhfdo
 qJht2J60AREcA==
X-KAS-Sym: v3:f51bdf72230551df:Ufy+umaY0aXg2pGF0jgD59Bc85Y+wg1oM1/kzTqqu+mBM
 dFYHYAm9Fh4qui+rqGAZHHesZ6H21uLiXsSAkIGXjUtRqqCiKHbXhyIj6JRaFK8XTriTyuqe/xC
 IytvUG3P5TXLzv+lIYUhKDglkLNSIaYT7O8s/EkIuSus+IUF31qSbG+vqMc3S1LygJvKuuj1CC3
 jqLfY9AAI6L6su+dtGtIbT9QtleJ1+VAY0h2wyubGrUTA1erC0jXuSmtfInIDMO/xyBIFwz4tNj
 7HENI/JY9N1cXl8nC01dEcHyCGeekx/F1GFM8oz5U5LNpHtniMm3kmCh1pNceUqmnJ8o+R2g==:
 QHAd0kSWolVh0OgbQZFWdxJp3PKwa9QXyVsq6QfxRzHeweT/Tmed8PTTDApFd3zCAeZwqq69nEV
 6QZgsdXYdyOfEjAbNJOh4zPWVwUKUKQnQ/58nZu5LlsBchirNSYbA0FRNCrzrwnd+Oe3MuTJSjq
 VLamt3/mTFTCCIwJReUsU3xf1iEYsDS9CjM2r4eyVRVRUB2VJ4oRsxnojAgYD7XzAjH+5wj4Ieo
 RXFhoEXkbpDbBeFRWx15T5jIiXlQj3QPrUuN5qfa0v8GtY2h38qZJ6M77lYXS5lOGDg7ylvIDJJ
 CHPt28lzu1yCWrAQue02IyCzvZ28rVagO2td2dGHegIWanEpGVjk0yY3AFTZuCI4QVNLsON4Rst
 QLlfeJ2BJ12BgldwkOkQ1dOClYH79J3yWwLn5lZMqXDdx3w0fKRvQTOqKq5FhuWSfubdDYwv9AB
 scBEEv0jh4zHRKDKyN+vGV+4PDaz2cc1dyU0P3wBr15JwzMjrnSvZEZRyOv4m10wp2MWsPxsFap
 8MyyCRO2QMXsOJ7pjMo5FgK5XxpXNGtllYG282sEuRBwszuA3uMppZ5bRz0xO2DAOPZeameQhxt
 B5im7ST2cW2urOgkbpwChkeFhkb+JoFGDYdUoPYIGtMZNTtjPGolmhrFGDI=
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62F2BA4C0CA3;
 Fri, 30 Oct 2026 23:20:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56238)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMuxO-000000005rA-3mlX;
 Fri, 30 Oct 2026 22:20:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Fri, 30 Oct 2026 23:20:17 +0100
Message-ID: <20261030222018.1092294-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: fix build on i386
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes build error:

/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 libavutil/x86/tx_float.o: warning:
 relocation in read-only section `.text'
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 read-only segment has dynamic relocations
collect2: error: ld returned 1 exit status

For details see:
https://bugzilla.redhat.com/show_bug.cgi?id=2428281
https://src.fedoraproject.org/rpms/ffmpeg/c/786464f23944a2a6e082404b589d1ec7ac568d00?branch=rawhide

Fixes:
https://autobuild.buildroot.net/results/c3a/c3ae9a6e6f6c4060feaa1d62dbc2b08da2437f38/

The oldest build error of this kind dates back to 2024:
https://autobuild.buildroot.net/results/e66/e665577347857b548f34f9b4fc86f2c573f27282/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 4ce129132d..6eb3afe277 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -584,6 +584,7 @@ FFMPEG_CONF_OPTS += --cpu="$(GCC_TARGET_ARCH)"
 endif
 
 FFMPEG_CFLAGS = $(TARGET_CFLAGS)
+FFMPEG_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 FFMPEG_CONF_OPTS += --disable-optimizations
@@ -599,7 +600,11 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 FFMPEG_CFLAGS += -marm
 endif
 
-FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)"
+ifeq ($(BR2_i386),y)
+FFMPEG_LDFLAGS += -Wl,-z,notext
+endif
+
+FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)" LDFLAGS="$(FFMPEG_LDFLAGS)"
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
