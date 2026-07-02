Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E0BC43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A1760B00;
	Fri,  3 Jul 2026 14:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CC1VnBWZdcdi; Fri,  3 Jul 2026 14:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7E360B1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088820;
	bh=o9vkfAOMktS3ASedJ51TzjxSYAPumQdAVSSfyrp6jis=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XRs6HZh9jLBhPeBJJi+GoFfWCkqXLfNT131h2UDIlu/sjSzWUVeqePO9/ds8CV3v4
	 GHvmfrITq0u1oGQR/ZhBLpQ1V04PANnTN7p5z/PlW+bxCCLNeM2WLZNryrfSUliqoq
	 vYCPfkJd6dh08ee4/j0HxZQgQncjLI40yFMzSMRkD35PG5WTBBzJ1eEgVOcl0VkQ1C
	 afyExanOEvMzqtm8kfYgzDTOgnWQ7jH/kQQrndDihqn8haxe06D+Aa8gZ/9U9ffkre
	 xs9H8rH2WIfquEzfADu1gsORZvO+GE44CY6kRETs9IPCfHKdkEK4QLEtsUJd4AJcGT
	 5GifbONoyd8nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F7E360B1D;
	Fri,  3 Jul 2026 14:27:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E14A747E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3BA140E90
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urZ5xcjifCyF for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A20E40EF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A20E40EF6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0EEB883A2; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:52:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 456b26cdf432ec295f733400a38a13b06f2ab6d9
X-Git-Newrev: acea9f47033cd5b6b0024bf1118531b9381b8bac
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.A0EEB883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swupdate: add
 upstream patch for CVE-2026-28525
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/acea9f47033cd5b6b0024bf1118531b9381b8bac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-28525:
    SWUpdate contains an integer underflow vulnerability in the multipart
    upload parser in mongoose_multipart.c that allows unauthenticated
    attackers to cause a denial of service by sending a crafted HTTP POST
    request to /upload with a malformed multipart boundary and controlled
    TCP stream timing. Attackers can trigger an integer underflow in the
    mg_http_multipart_continue_wait_for_chunk() function when the buffer
    length falls within a specific range, causing an out-of-bounds heap
    read past the allocated receive buffer to a local IPC socket.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-28525
  - https://github.com/sbabic/swupdate/commit/beee2dc0feef1cfe84f1aa6fc980e104b2e47a74

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(cherry picked from commit 0c6595aaac7288335e8d8bcccc383a8a12f635f7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/swupdate/0002-CVE-2026-28525.patch | 51 ++++++++++++++++++++++++++++++
 package/swupdate/swupdate.mk               |  3 ++
 2 files changed, 54 insertions(+)

diff --git a/package/swupdate/0002-CVE-2026-28525.patch b/package/swupdate/0002-CVE-2026-28525.patch
new file mode 100644
index 0000000000..75f99a698f
--- /dev/null
+++ b/package/swupdate/0002-CVE-2026-28525.patch
@@ -0,0 +1,51 @@
+From beee2dc0feef1cfe84f1aa6fc980e104b2e47a74 Mon Sep 17 00:00:00 2001
+From: Stefano Babic <stefano.babic@swupdate.org>
+Date: Thu, 19 Mar 2026 10:50:13 +0100
+Subject: [PATCH] mongoose: Integer Underflow in Multipart Upload Parser
+
+The function mg_http_multipart_continue_wait_for_chunk() has
+a discrepancy between its guard condition and a subsequent
+subtraction in the else branch.  The guard at line 250 checks
+`(int) io->len < mp_stream->boundary.len + 6`, allowing execution
+to continue when io->len >= boundary.len + 6.
+However, when mg_strstr() finds the boundary string in the
+buffer (else branch at line 264), data_len is computed as
+`io->len - (mp_stream->boundary.len + 8)`. The +6 vs +8
+mismatch means that when io->len is in the range [boundary.len + 6,
+boundary.len + 7], the subtraction underflows the size_t
+variable to SIZE_MAX or SIZE_MAX - 1.
+
+This will fix CVE-2026-28525.
+
+Description of issue copied from vulnerability report - many thanks to
+Kazuma for his analyses.
+
+Signed-off-by: Stefano Babic <stefano.babic@swupdate.org>
+Reported by: Kazuma Matsumoto, a security researcher at GMO Cybersecurity by IERAE, Inc."
+Upstream: https://github.com/sbabic/swupdate/commit/beee2dc0feef1cfe84f1aa6fc980e104b2e47a74
+CVE: CVE-2026-28525
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mongoose/mongoose_multipart.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mongoose/mongoose_multipart.c b/mongoose/mongoose_multipart.c
+index 12ea54348..7fdc18632 100644
+--- a/mongoose/mongoose_multipart.c
++++ b/mongoose/mongoose_multipart.c
+@@ -260,12 +260,12 @@ static int mg_http_multipart_continue_wait_for_chunk(struct mg_connection *c) {
+ 		}
+ 		return 0;
+ 	} else {
+-		size_t data_len = io->len - (mp_stream->boundary.len + 8);
++		size_t data_len = io->len - (mp_stream->boundary.len + 6);
+ 		size_t consumed = mg_http_multipart_call_handler(c, MG_EV_HTTP_PART_DATA,
+-														 (char *) io->buf, data_len);
++				 (char *) io->buf, data_len);
+ 		mg_iobuf_del(io, 0, consumed);
+ 		if (consumed == data_len) {
+-			mg_iobuf_del(io, 0, mp_stream->boundary.len + 8);
++			mg_iobuf_del(io, 0, mp_stream->boundary.len + 6);
+ 			mp_stream->state = MPS_FINALIZE;
+ 			return 1;
+ 		} else {
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 647a6f071b..ecf7864225 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -20,6 +20,9 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
 SWUPDATE_INSTALL_STAGING = YES
 SWUPDATE_DEPENDENCIES = json-c libubootenv
 
+# 0002-CVE-2026-28525.patch
+SWUPDATE_IGNORE_CVES += CVE-2026-28525
+
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
 # TARGET_CC is used for both.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
