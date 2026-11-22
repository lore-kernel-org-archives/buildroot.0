Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF1B606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AykWxQjw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=l3Ev1rAT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C1A780C7E;
	Sun, 22 Nov 2026 22:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZPsCEWgpdIG; Sun, 22 Nov 2026 22:13:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA0AF80C93
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385604;
	b=O3j1TsWgslYxf5v/jJKNdhIeDBKFf3c+Cm4sfsnTPZBY0YfvUd161WM1saBUja3A8CSm
	 JhV8LWOeL3SAgmqPFDBODWEjCEtFgm3T1vjicNRRStBnD50dVTPROWOJDOV3weDUdphXj
	 oHd9Vq72zL/v5THhdUahN5hvv8T4XH2kWGQJqYuMgNh30ZqlDrmI/co1HeQ1DooFuo/l0
	 vErZQgXJeJTT9G01TNj/R9ZVskF9eslUDsfvmrgtCtBarynZTqqYNWy5ggauEbaz7E1GT
	 YKyY6WdRcnOQtpjIP2MJJFEi7wsjLGMqsqzyeOzKeDLAaeXhhEgBZ5V07p/XxFCjMaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RoS0vU6fPFOX0jCfW3ITL+F419j703STCj9otr7cvXg=;
	b=OovL/78BJG65XWEgRaAed8Tm3Srp9NE3Q2LjCQfLIeM1n33DIb25LVbtfWdlbS4VthHY
	 iaRMizlwkKQcp069DFxQl3L4i4nJ/Dorz2bYIRQMQrE6ElolbxomG2vcYbFmKJ8pU3Tev
	 FCil23jKEv6eGtrSCrQCDhZ2vWlB4/mxxmZl5c+MUAMasFhGL9j17JOOX4bePdE34ZjDc
	 /UgVNMnmT9ABdjjSZJ22EfmI8PC8v2X3dU0LJWxa7YBuNMftUZ7f4RP+V6TcrXLjRXdBi
	 H2ISWr0IKj38W/ilKymxO7C9sSJUGXj8KNfGwzggU6vBrmyGxp8k3FH8mqFCHtjtjcw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=l3Ev1rAT;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385604;
	bh=RoS0vU6fPFOX0jCfW3ITL+F419j703STCj9otr7cvXg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AykWxQjwp0DHzM6eyWaglYjd38tIbyMICkg1GUHJm+t0FN1qiWfqlSUbCCTLegIuK
	 GFnhrU3oNlNOASMWBampdypSlXf1v6vkEmXkpT+eVTG9qc/+q3Tc0YvIzWa2dwrecZ
	 rHWr/5lcyl9NgZz3Vj1KE5luTcEUqAPvky7v1NDfjDkLTuEbPt8/g1NREcDEkcZTBZ
	 5Wzak77BdRCCWU5WMchXOkkS/4p8DDjvssJ8JtxdplH5XRLNpdE+wVFMma1F9D7Pyu
	 tUo74MkKs0zvmMqYq9KSTByjZW0/Afa2RL7UFrgMsSzxflXGYcqRjx8qDeBxJiV+fM
	 jfVFar394JNDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA0AF80C93;
	Sun, 22 Nov 2026 22:13:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9653310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF60D80C93
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEC7ShG-ET1a for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:13:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0B47280C7E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=l3Ev1rAT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B47280C7E
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385464;
 bh=FfVeLv4JHZAH24MKLW4uE6cqZRnCzeAOoUQmRjCtnCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=l3Ev1rATVIvAz6SE3j4mN2dvfaPnRl7g1UPx8CBMtpQjqSKyVVtdbRbzoo+JcCH+N
 P+U4ZYX+6uvFEmuYibgU0+cJc73rD/zAcHYL08Db5KuD/U/K5JATFfVhCS7UYioGql
 IRM0wsP3rrbqZjy8Apvv1uO1J3bVDZDSojgqCk2F4cVmbljqALKykrql1BpvTjSPbF
 C8iy5dtl/CmhOoUU/sb5ewyR834esF69XeXFvZhufF+uYA9oZ2AY44F1FZ8CqlRh35
 K4xTucF6dtNb5pZkXWDcD6mxnycQ6U0crPjuLcqpGFmTiTFVq2I9m0tw0xi/ipVkUw
 6tanqB7bE9NfQ==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 yTaAkoLzJivUxjBsz2ckJKdFt/RiKf1TxSzYjrGtQX49geQP7EpatKIH5/BS99p65Rt7vuVUoKl
 A5Yv+0e2w7CjKOwTWUZyuqj0PDBSBGboGqjsHCYM43VRKFQP78xhcAVXCLBQzNJTStC1IPCY8f2
 YE5xS5ks0R+TZ4hGk+iLPS0gceUgYguH8IKKhywq6gagYEhJCN2e0hcn/ZmVPecva8UJzQiVBl7
 QSGPGUm1zHqN1BOoKsj4mEZE3YqtwitUOROt29r3eDeCEnzVRrVS+8rIam8mNQDu6NM51exYIkJ
 7uzdVA6vc1wl/k4QHMZjKbD5MgD5ifjDZur2GAtwWSQnswTws2Ii3IdhoW2E6riIfICE1sgf5Nj
 BLQ5WsDsICVV8g0VCwc+kO+9X3UfaK+JWxMblFC0CX6w33dR1TGcTveCaXR5kskrWlbsUH1686/
 iDOvne0EhJlAh3SAgqy/Tp8Gr5RiYp9xTRnt17/Nv/caKzIvhB79dxWmM/meeV5ftlzOT0lzwhb
 o3uuFExBKPbNycmh+VBl1V56JJGDUaFwhwjkzOzK2tgMSeg4Waab2ZpFZ3uITXKJKF5ca8T/Ga8
 nFNH/DCLjDPuu7ikUazxOMEKV8ppzNz5cffMmiU=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2DAEDA4C4E91;
 Sun, 22 Nov 2026 23:11:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-4BtL;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:08 +0100
Message-ID: <20261122221014.3945599-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 15/20] package/boost: date-time needs container
 & exception
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As of Boost 1.83.0 which is currently in Buildroot, there is no
visible impact if this dependency is missing, but as we're about to
bump to 1.92.0 this missed dependency would be causing
problems. Therefore we do not recommend backporting this to previous
LTS/stable releases.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 4ab59a8499..aee89be87a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -101,6 +101,8 @@ comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  A set of date-time libraries based on generic programming
 	  concepts.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
