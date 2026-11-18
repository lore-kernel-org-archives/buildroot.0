Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8C9606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ONgNGU3h;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=cRqbh3J0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B97F80ACC;
	Wed, 18 Nov 2026 18:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYzQ6UDlf2Ou; Wed, 18 Nov 2026 18:13:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F642809BF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795025590;
	b=FedCtCMsZx2++4ihp9bkqZJHaWJNdYiH9SSJwIekB5VQ3jfen7wD1+1tzQXPtbanb3eg
	 NWav/1kTGqKkF4OKLHAXoiRQaWL+gBy/PzJPrjK7c9NnvdlZw7t5WJHkPYNC0PQ2vfO9l
	 A9kBJxXIh9HpeW3DV3SHakEtUijd5Udie1VU0wL6eqeGS34VMa0XhMyY8xKFuWoPnBhfc
	 EH3tBcUwi+LRUa+KRuRtYVBKg+6HRn00MYV/5AFu9WfS8PpUslNIZ1dp32FE/NR48Vym+
	 RpDJWoLTyQYq/Vjv61q8Wa8HCJZGTGFqTyUSizHwqhknFWDckXyHtLeEP8HJg94yc0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795025590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GP9UMeMpPmYnTMp4QwlYYv6eW71wHMyOMaG6m+aNBJw=;
	b=SaEcF1c9RFIZRqHb4dLolZg5w2yYzBH60rkQl5XEapZXjygHtQ7VqNZxez2f3nrHalrE
	 tqinknjrEqDXBp04n2CR8zYKn2dFSzhNGPx0pqPfiVTLqFgbr0U8RkK6n9Q+dT+eMnoDa
	 ZcSP0SFWojzNNJNkAw+GlHNlrNUN07jKFU26JE/64zB2gkr61BhlgkfUbNRfsA6KqTxKy
	 p+xkKF1U9IyongAL9dc6jlAtKDEQGeSSdy59ATAsf/SSv96JWItP6qsdCy2BlPXd2wCKs
	 awcuy8BH51wohdI00P4ryEeq3PKGigdX0OXmb8oRGLzGSLBE59Mb4xqBjD4SnaKQGsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=cRqbh3J0;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795025590;
	bh=GP9UMeMpPmYnTMp4QwlYYv6eW71wHMyOMaG6m+aNBJw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ONgNGU3hrFMi5ATIG172OseNKYXF7N8x3fqyearvu9jYARPAno0PHNLkwC9gvhg1F
	 wRJsITtqedFdG0ZSnOwxfMoCpkeUsMXOF9Y6q9kdxiqMZ/Rl+rOqjv5j9CMzav3Rdn
	 1pzRfEvvzq5onpjx5af39F/qoSpK5sT1t5X4aGPbxTr/ygUxMLUbGb8/+KlC7wROzd
	 cbOihkYP3SzbfI0fhhmUebZxcEG4vxIW1yfeAjliTExitmcSi73OvmLU6MOlotEjBf
	 mYGZfKlIdZVTa3r+Ay9r6UIPLv7jLW3wq0kbOsPRjEcXykmaN41AiraRO7buXeos6i
	 ZIGCcLMjkP/VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F642809BF;
	Wed, 18 Nov 2026 18:13:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59EE561
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FCAC8021C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_yELrZsrdjY for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 116A6810B8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cRqbh3J0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 116A6810B8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795025582;
 bh=/pDyZCkZ8WW5H0YcUL22WXqGCfWa8OeY/xhjKD/XWck=;
 h=From:To:Subject:Date:From;
 b=cRqbh3J0tmVemEVmzyJNzh6z2UOb2rr2pe4V7X75JgpH3Tg3oC0UfuQEniIMUlu6H
 b4FU+DJJaPYaeYr1O6i492DCOMPP/ECZ8+BxogXHKfq5u7a52E7bY5nB82MAHYIRZA
 nPy2mwjQqDVn2v3TfvnhDR4lR5dYf2IHD4hVKMaN8P2VaN89j/9104/duySAU2swqV
 x3xT7HF/GD0VrHqazAnasK5cdErDkNHXmWIcRqfhn/RJJQCLqxZj65kkI9EByGTOHm
 qYGveLR0HLuQBYwV981fb5Y1CZ0G48ZdhrzqtWGIve+fjU33UmVyWk8TkpDd4Lthgw
 99G+D45YKBEVQ==
X-KAS-Sym: v3:f51bdf72230551df:uTjvsLqhVvxkSox0d7Y5XZZ+Jjs78wyiQr9ZCKThLAoe9
 MtImAfJOaooxayjLNYA7mkEcmfce5S8OQcbG5wiMB8cjcZTc4L2N5FwLT3KKCmHjLyfzy/66vc3
 49pBdsohHmgFCw7hkF7m9M0zJItreE3fgdd8CvdrV9qQyFHFtvSaRUi6TOJDbz7LkJCMOiPYwJC
 KInrMQEWkIEWvviiDWvso5J3ESIX5WW4Ox3bz4THxUx4/uYdZX64R1GDXns3hoHkczEFNsbPRI5
 m8UJWOfELDH7JXbo80HDAHW0Rav9B/ads+yiSaL3JwtUKH9KV9nJJ30SMO+PoFxMzAdfZSrg==:
 9fW8G8GFTPLrI60uygtsVolybsUVgJ6YTEMnrcU+j9poVd+Eu9NibCsANztkXXe2bdZ+4jCAh83
 MlylWI53HqRlxzxHWVFBVhktRTro4zsgvJ3r2z3h0fM/9LEFBatWiYygGrJV7E4J6COGDi/Txjt
 J+4bV+/kCn8uPukHfFR92P1Txb8eM5LdQyI6BfVqAJVlTaMk3OYGqDDcSNBqYd3Qgc2yxRO2mDr
 CC2jmnadO2r4+A5dhgzHvgTYo2tPRu4YPhmGla//rS5S9nuEm3CchjtXJyh4MAwd3rAWQ71OuVE
 q4EWFFBfYJs7T+0+9XYmqJ6cG8r2QkiI4HUzJNmK8ARtWPkxRYectrg8cLLaT69wcmMimeygELd
 ahvSRkJvxgaSBkG+kMdkMlTxAj8t7I63Qn9RNCo+rXT0rdjDNC+03uQ4ABXuNGkcyvm6grEoKh+
 pT9qPkaAZweVQ+QzF2xkxLU6YyZTS3I6yTDwstOPEM5D3sX4zyG+Af6lFtPZa1NCBqwXFowzH0u
 7n5yMCmchhbp4lPs+Vrm/NSqL+m4FsZY3siaO36XZrtFB51wLiMUXg3PapaCfcfi2ethw8=
Received: from fli4l.lan.fli4l (p5b3a00de.dip0.t-ipconnect.de [91.58.0.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4A16A4C4DAC
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 19:13:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39252)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xTk9W-000000001K0-1Kwk
 for buildroot@buildroot.org; Wed, 18 Nov 2026 18:13:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 19:13:02 +0100
Message-ID: <20261118181302.156512-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/ytree: bump version to 2.14
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

https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d5c21a8d43e999e43003eb367a9444b24da916ec

 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index 1fbf7eca73..031d41694f 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  caeeeac334dac83921bd8b657ad2d4cf234c15da4ffc7d15dad0bda99e52f197  ytree-2.13.tar.gz
+sha256  1dac8ce79a075c17de159383c2056961f51bf1160ade3661e7a831755bec0f93  ytree-2.14.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index cdd16fd3dc..743d5521de 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.13
+YTREE_VERSION = 2.14
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
