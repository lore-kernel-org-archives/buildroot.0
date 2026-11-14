Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B6606A32D
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OGR3oy13
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0277F811D1;
	Sat, 14 Nov 2026 14:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYOGkKVbJCEb; Sat, 14 Nov 2026 14:03:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6E9F81187
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794665011;
	b=sYoYDQEBb5/lFFn/JArdGMV8eyiQNgPsaP9USfXKPfl+il8cTslPpyQUSpJ/a+3LOXJh
	 S7vsJEbgY6m1g1ykharkdapEKX+w1sbB011tKKjnjJz7y8TM2/f2k3DJhGMlIcKV9XUEa
	 WS/oABSvTFLlhun6bhl2JYyjnhwwQFDd8CBG1SLSehBSd6wjbMwAOCKa3GCzoJdPPD7xy
	 mQn+ghodWRhDgyjczXrIqTHUh/b/o5PPvAJ+jJjKl0leY3jSE4UdyRZ4Bk5IRPLqxWGFs
	 /tnzHzWhV4cKgZbOzD0dB2H7caq9HWcZxvhl/jNMRAxX6UvRsB4ueyNRIsUPCPBo2NQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794665011;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6f5PY0l0OZCrn8aLCRQE0VVpZQ/pr7dqan0o/VV3BKc=;
	b=JjrFjBLLTCu79u24ZUR2w6Z2wQS+GR84Atos/LZUKcAEGjk9fUgeXo81EaMcIdbQaxb+
	 2XNm2Xxqk29InQKfROGJV89BsHg1BdrnkTpg2EYJsCA9lLVAsfASfB6HyLk6W0B+hiowy
	 WYQP1tj8eZeK3YYqUK5c8S6Q5F+pXTUNdeXxmqDK266r9wyj8IJCCmPhpWmWubFIbXQPl
	 ILTcEKYDsh1ewNYEA8At18dcDBWYV7rh/sMU/tY3oua3xHhzaPuLLmaVY0JwqLR3cc7X/
	 QSBxvqfoIDTAgGQwIjyC+vVC1HppfNQEweXTou/dGwewXEyTDXtPpnk/emAuFqu7lug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794665010;
	bh=6f5PY0l0OZCrn8aLCRQE0VVpZQ/pr7dqan0o/VV3BKc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OGR3oy13NTl356hBWtX6vH2ml5F0AJ2eYWTmhnuCgLlN5J52hVLpQ8OI2s75+/Xyu
	 ehxAeNz4HjGX+0Bty61zGkOXZS94j97pQ97HosiQGj19vHqnYaIP3t86kvoLlYbdXe
	 VJYfZYTzG/n1nRpDqJ/Oo63Sbse8uGHsPd2yZjK+HHJ/da2iuT1RTu+KvTuI4oH6jm
	 ww+nzaU+rwyAVVzOsKxj7MZfZ1drNlwXbqLFnLd07OMuAaIu4u36JO66rQSV5hoZeG
	 eCk78CktcJZSenw8EvBnYOLEdMdQ/YOpLSgsOl9AYAvwZPZNrAZR6OmsTBeHEazjsi
	 ePD5f3lbBKotQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E9F81187;
	Sat, 14 Nov 2026 14:03:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A6819B6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F7E940912
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvgZAVx35ieE for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 14:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 61748408DE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61748408DE
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:03:26 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794665004; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:EKIfERNCMSzSrOgXb/KVAI99QKqT
 7hr2Z2+XcS/P55UB1Omhk2XNNwRQDDEXbJzJ37DfWPjnvMp5K2/F/J5FUovyn0oFA5KYUbdMD8r
 V7uzLMadT0LGgAIg2l1FRcLwoxGEUr5Yq03CDmcsx5IFUaWrDPSjtCRPhw1ICtXh++A5Z37TVO6
 82M6/wSv9N11sQbEztO3ZZBTThSWELLY9oqVGn5u8jNpW6F5jXL4VBy+T5ZQi08550hbpxeA97s
 FPjLD59mv4JQxRRCebmCOe69wFYNTw+/eFMKIiypJQ8GarG2bkgkzVZSBLGQdxw9UyuVYfOSqc8
 QPfLzxqXfVXS8w==;
Message-Instance: m=1; h=sha256: JDBiMNWbCbiqG8Oxexc8pNjQnSMA8HNO8uEeE5jnzbI=:
 D/8wHHHE+krTmrQhYcpEPjrpeYhg4PuZznafd+XToW8=, sha512:
 J3GUl26DsyBovfkgxvr3F7N6Kb19iZxY/ZbWfjYxYSm4ftZr+DBa0H+DLktbo34IKjqKSD2udbFsGcHy8ds4Ww==:
 0JEhpHLzhsDUWYEZO4B0K3dPt6lSSroVr/yhn2gSysl9tG76rxR3qXZQqRHLWaB6zxhI4O3R3OY+4YAUlt+JMg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzhj9-1wXOfq3rs1-00uc2L; Sat, 14
 Nov 2026 15:03:24 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 14 Nov 2026 15:03:16 +0100
Message-ID: <20261114140316.956334-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:IVKamGtpBvjoggazUmuxVS+/bA5XXspJ2phmnzhNzCARI4i6l37
 sGRoaB/v+MB4mgyGAvEpOIkCcB50mIFt0FmhcuIuOmsXRpXnoWPwLTW4Wej7ypOm221zLPQ
 sapIidvPddd3ERT9FoTMKV9DHtDrui0QwSg78SPdJ0euibwJ31cAuxglASxdXqtRA71UYzQ
 b9T9lkp9yNExaEIM/39AQ==
UI-OutboundReport: notjunk:1;M01:P0:pJnC9xVUXZw=;RqoU+1pBpmmUn3YNzZNmlczp2Df
 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
Subject: [Buildroot] [PATCH 1/1] package/cgroupfs-v2-mount: allow setting
 mount options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Certain cgroup v2 features can be tweaked via mount options [1], so
those should be configurable. Implement this following the common
pattern for init scripts: Source /etc/default/cgroupfs2 if it exists,
and pass MOUNT_OPTS to the mount command as options if defined.

[1] https://www.kernel.org/doc/html/v7.3/admin-guide/cgroup-v2.html#mounting

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/cgroupfs-v2-mount/S30cgroupfs2 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/cgroupfs-v2-mount/S30cgroupfs2 b/package/cgroupfs-v2-mount/S30cgroupfs2
index 42839ef921..7c40bba6e1 100644
--- a/package/cgroupfs-v2-mount/S30cgroupfs2
+++ b/package/cgroupfs-v2-mount/S30cgroupfs2
@@ -2,10 +2,14 @@
 
 DAEMON=cgroupfs2
 
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
 start() {
 	printf 'Mounting %s: ' "${DAEMON}"
 	mkdir -p /sys/fs/cgroup
-	mount -t cgroup2 none /sys/fs/cgroup
+	mount -t cgroup2 ${MOUNT_OPTS:+-o "${MOUNT_OPTS}"} \
+		none /sys/fs/cgroup
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
