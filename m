Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76F0606A330
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RPEBd40V
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75D860686;
	Thu, 19 Nov 2026 15:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qr8-WI3NGwhq; Thu, 19 Nov 2026 15:22:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CEEAC60AA2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795101775;
	b=q0d0HGoAkYVI1aOYxn5DzDJ1gQFG7LxLmncFZY5jQy18VXTNPqWQQ+TRBraqIhErzJLa
	 GoLcUAIqo0GJxbwrocVp18YjZeRwsjP8Q4XqQyBq+R3Sk2HyelQSc3zNFLxJi5+wuSHhL
	 9VDwNVndsEQ8oAn6HIZK9X3A1XJ0NQjeL3V7LK+AKegXvsDR0yTcXkzl7iYOGet9RBHJF
	 kZRwAywg85jDuV/GAcoAGlc5cIwDCXMtLjOHktWbNQLuXUx7ksPES96xkRivSUThSO/JT
	 IrzS9jfiwB8eWTdSzIvMS+qxmAjI1gbVpqUcm9RiHeajsyt5HSx+4zRRHHNX+6kBklA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795101775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6Wpa3b3HddedIcBENkSulUuI5x+NsiXk6niUbBQhTZI=;
	b=oOK70sPhrKd8gl8JnpLft8ZK01y6XzeuFLlOq6iP2gTlSkaPsU73+9OblyIerzEn1MkE
	 dJtu18ITBcCqyBlFH29qQ+xL27orQFJtNCb9e2qWqoWqrgeKRNapyQjJAQb429jN0dTaA
	 g9zmTkvRuUWnM1RFJw8KgWeZllSRnLheX4YVW7cighD1qkQucYiqeY85IDPgR9Hi7jsXo
	 /JKs5UZ4i96gTNTTgHNjRMg0i+jLhRT/zvHHn/hyLkLynKATrYoIiyCSVvH78J9NMp9Q+
	 egCHrQ8jCmYjJCijvy0saHketM7jm0IZ8meTs+bsQ2s9K7OllTAG+bRGjBO8h9zK6wQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795101775;
	bh=6Wpa3b3HddedIcBENkSulUuI5x+NsiXk6niUbBQhTZI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RPEBd40VVVuMg4pj7AK2kpeqWj8umVkzs4uUvDjL71Lxs8bW98SBoMQh8S2fkD3Dc
	 eKhlvohDs9Ufb9lP+K2Lt/PFtkTpABgF3eXvyHBjakmFmOfqjpS3YOFdxJMeVGZYov
	 C0t0rX9CxuEKpYbNVP0skFk+lVt35JHrLY0GEHMIjYjx1FRd1M8+CRxnPVbnRaGaTJ
	 lnmlV9aZQgVdd3DX/J0pqWOMRmw/O7vJ44OLzPHQpApHBCGGh+oIRJcqEeZO7Iojcx
	 XUMXJuk+WftAhOavvz2ayChCfR429rk7BjCe74a9xuBwI5PRUmXw1+8bCdWeRl6oJt
	 G0rkFPoAi92vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEEAC60AA2;
	Thu, 19 Nov 2026 15:22:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 739ED2FB
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59535813CB
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zug7X-DuH6QS for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 15:22:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C5430812CA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5430812CA
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:22:52 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795101770; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:dpp5BqeEErqfoku7GBWYlDir+W9O
 /dlX8bg9yJzzD9QvIWqUVoXxEXZdWtVvb1HiuRXIQMGbqqdti4+FF0Jt5Y/CcB7r1r4fMLDbbYW
 6uTyrufweSntpNbxTjQ3HwfE5U+ICy6EQ0xMxGearzOXDDoJz8phaOCKHl18ZwRBwhdOittcsSc
 TU9O3W5nBFLXyuypE0LlU/xgk9eAsHtMxI41ZmkZ45rTbnF3Jkt6pj5+EMy5AWroXgPNlqJb/yw
 ZIPUM2qAkKtGjw6SnYZOFlFLmbpXx+Ac8zkoi95yNPSPvOY2WZ7K7SYpVFWQwW6M0/uc+/MCeHI
 qkbSsEuFZ1PcIQ==;
Message-Instance: m=1; h=sha256: TephgUmTThpaSdbLzK+gEMPHlbayGN3UnyKAOwE4dso=:
 f1AETVz7b2riiuwLoE+EzVMRHFDouC4R7VHzdqdjCDo=, sha512:
 tX2CwT4KXi+7gvI4bO2hjpWCW0TAel/9X09iHIjOqUApLQUaRW631cY4xoE9/OGWsMNyNbHl27TKvzjNc44Y0Q==:
 SsP8jJMeObDzABXr2H5xbLV7jZFDwaPnp4VHcYfLeUJCmAvl+nmKZYPtLZ6c/4/znxu+4RKWOk0DK+3GO7qT0w==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCK6-1x70mc1VrA-00LjrN; Thu, 19
 Nov 2026 16:22:50 +0100
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Thu, 19 Nov 2026 16:22:08 +0100
Message-ID: <20261119152208.246924-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VhU1sjkMoGmKBmbhYGoH1SyW7vXcRNnFSMbD7vSbUFjLHNFgKuw
 o87y6PLAxrDhzHhrqnVUwg+1I0zsiuNuHcsOLK7xFxOLOYMBAc9UIYWfdUNaDaQtJ/EpR8J
 CKX3bWsidy//+3008n4KCsGrBb191JmMYDFFpmz8J569t7a8/7+nr7aNm9solp2oYHuECBY
 wl6W60EP/fa8Vu6KxfkUg==
UI-OutboundReport: notjunk:1;M01:P0:OjPnLMH8Ifc=;tRtdskV7w7aTBdYOlKef4Do57S5
 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
Subject: [Buildroot] [PATCH v2 1/1] package/cgroupfs-v2-mount: allow setting
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Certain cgroup v2 features can be tweaked via mount options [1], so
those should be configurable. Implement this following the common
pattern for init scripts: Source /etc/default/cgroupfs2 if it exists,
and pass MOUNT_OPTS to the mount command as options if defined.

[1] https://www.kernel.org/doc/html/v7.3/admin-guide/cgroup-v2.html#mounting

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* mention configuration in help text

 package/cgroupfs-v2-mount/Config.in    | 4 ++++
 package/cgroupfs-v2-mount/S30cgroupfs2 | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/cgroupfs-v2-mount/Config.in b/package/cgroupfs-v2-mount/Config.in
index 2dd2dbc089..d7e9651c65 100644
--- a/package/cgroupfs-v2-mount/Config.in
+++ b/package/cgroupfs-v2-mount/Config.in
@@ -5,6 +5,10 @@ config BR2_PACKAGE_CGROUPFS_V2_MOUNT
 	help
 	  Mount the cgroup v2 hierarchy filesystem.
 
+	  To use non-default mount options, set MOUNT_OPTS in
+	  /etc/default/cgroupfs2. If set, the value will be passed to
+	  the -o option of the mount command.
+
 comment "cgroupfs-v2-mount is incompatible with cgroupfs-mount"
 	depends on !BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_CGROUPFS_MOUNT
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
