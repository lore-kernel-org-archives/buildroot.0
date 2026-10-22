Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7B606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zc8l+1r0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97EC160787;
	Thu, 22 Oct 2026 08:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxNqB4iMYt1h; Thu, 22 Oct 2026 08:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 363D460818
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792656764;
	b=GxBsJDxdphDmP+4TBolu1bLlz+owI7ZhdqI3QViK0viz5hw0iOogdrcVmse51PSAoifx
	 qcmPBwSIZWzUGstRR237Ewg7TgSf2uudKHbM+wYAzui9mbWx4Q6kVtFs5O44v+TKUxp6e
	 UZNqqd6YJI/2J+ROIJoZFLNOUfFkBnBWq9n3AQdGwDdKpeVpwjTwzt1Ze+lrOdIb6VEOq
	 TJXqEFzf3XZe4nvf8m+Nf1teJqXTwDEKdCA5WyYsJF0+zwrO6zcMPwDI6NuFAW+py0cXv
	 rt8Zlsu3jNDz1FHxeYdceql96GOyp7JcMvH2ablj5zfpzGlnUR76VYiK1GP5CQ3mPoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792656764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KFVx6DY/U0ujsKSluozSsKV7BRE5QmajIBmmCjxXFCs=;
	b=Pci/ulkCtc04cHL/QnCYohoj6cNmikNWsAGxEKyU3sUHUFeLTWr1AOwcXBTdhOj8ZMxX
	 4cexdF9d+r/hO3o4fbRAbe3tiRHkLMpyhFdpfsqMjGczp06zLqmoCwp9oC6iPAfAmYxHI
	 oycPIEysmbnMlk5Pe8JQpNzpukpjKWPuDC3B8MpDB9jPkUofzbAmr9cZ4o5crQKQcnd9A
	 UpOj0UMDMaVohrNo8INDkva0A0jMPVA1WhyO3olBGSwKYd7jVRZ21q+8qZG87GRIxq9Kv
	 dKdz7+KgOLhR9I88/PXutBeKWXHKWMeVSQnsjt/W16Oz8LLuVybOYj3dKfvUdvtNGog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792656764;
	bh=KFVx6DY/U0ujsKSluozSsKV7BRE5QmajIBmmCjxXFCs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zc8l+1r0klmcuGG8RB6F1AF2/Z2ZjruZ30jtO5aHqYlyP7pjy8e8knnVqYBDD0409
	 cLRnoNbQLBa1GdLmFr7vCgv8CUCJhAnLLCxt13cEuveU9uMPJvidRb+6ZNnyKHLQfg
	 RQbYllZ9hRfKU+sBnj1Ld3gt3qTquagy0ZVI5cHaM8i8UdVhzEyBkvHqISSIlMXpfL
	 gKBFdrYr7nEDC6QhUvucCf74gycg/YXAIYcPtLIK9NdQKkqmGKR8rLNQ/I8rK8WGuB
	 Vzi79+sNkrxEzSARIuXy7k9TbWCNzlKa2ycQWmKtjGC8Gk/Mr9iod+OcuTOXYMI59q
	 4S0MH19rmDNrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363D460818;
	Thu, 22 Oct 2026 08:12:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3FFB95C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A683281237
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiNdLRAw-yyD for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:12:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A0D468122D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792656759;
 b=b4NvlnXbL1MCd2rtG+RatVmlFI56Mz2IGXJDcrqrqOl6W8QowpTT2APtelnnpqXlR/TL
 H8AUJhTCXUNvVs+6enaDKD0vYr/Bm+3BSyn/PC0GC2Vm10bZUhg8yyuGf0TLLjxt89QFk
 +VRGQJmylxQI2nEV9Q346BJ88WLDcLOOpFPCbJqPB4k6XTAGY57LkCsxiqdmP2bpaB1GH
 S+q6tsDKvutfsaR7OIc24KhKxqrYXCYN9Y7KOAQA86ZlNVlHbZYXqfXU7vadX7hPVWjcV
 tBXd6OpOq6uQQ4YPY/FncS1Q0soyl1GbqE4oVgo1K0dbpSHYuppU3obZhN8IarOd14A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792656759;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+6BUkTbZTNbiGMXK99tSLn2ffs2HQMhOvyKxkwxt9CQ=;
 b=Olpgs4juAHlNsWxY5043OYenRjKaqa/vWJjBS9yU0rjZXkl8f/w1NbpY55ARQbHJkHHH
 y7xwrVr79X89ceNTqCTKNaYe66fAshz9D6mzi3KOZgH1HCQq3261A6i07ifRxDkjYvxbQ
 J0kGVvnARdCJ9F2bscWx501+rQOyXIojzbyDUgX6yLpSIqMtlZwDTI7VmAlq3CcvrtjmG
 LulqchEEfw+3inmZrqBFhWu0ldMlMxuHlYT6PDBa0/Buv/p+4OwECgal/jMEAx2TumjzK
 1801RVu4qYDn9tRBB53WgUVhCH6hBCmMIdNZ3OFOT2ze7+xMCDtyLKsyDiafbU6sN9w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0D468122D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0FB09B97C; Thu, 22 Oct 2026 08:11:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 10:11:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0aef99c165ba6fb4db33efaec77c113ff03eb80d
X-Git-Newrev: 37aa996967499efc62948b93811b279abe981c1f
X-Patchwork-Hint: ignore
Message-Id: <20261022081115.B0FB09B97C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nuttcp: bump to version 8.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/37aa996967499efc62948b93811b279abe981c1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The change history is available in the header of nuttcp.c.

Drop 0001-susv3-legacy.patch: it replaced bzero()/bcopy() for uClibc
configurations without SUSv3 legacy support, but Buildroot's uClibc-ng
configuration enables UCLIBC_SUSV3_LEGACY, and 8.2.2 uses these
functions in many more places, so the patch is no longer needed.

The tarball hash is now locally computed, as the FreeBSD reference
only covered 6.1.2.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                    |   1 -
 package/nuttcp/0001-susv3-legacy.patch | 264 ---------------------------------
 package/nuttcp/nuttcp.hash             |   3 +-
 package/nuttcp/nuttcp.mk               |   2 +-
 4 files changed, 2 insertions(+), 268 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6c026da328..bdeef49192 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -651,7 +651,6 @@ package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch lib_patch.Upst
 package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/ntp/S49ntp.in lib_sysv.Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
-package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch lib_patch.Upstream
 package/octave/0001-Fix-BLAS-library-integer-size-detection.patch lib_patch.Upstream
 package/ofono/S46ofono lib_sysv.Variables
diff --git a/package/nuttcp/0001-susv3-legacy.patch b/package/nuttcp/0001-susv3-legacy.patch
deleted file mode 100644
index 9a215f8a86..0000000000
--- a/package/nuttcp/0001-susv3-legacy.patch
+++ /dev/null
@@ -1,264 +0,0 @@
-[PATCH] Replace susv3 legacy function with modern equivalents
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- nuttcp-6.1.2.c |   90 ++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 45 insertions(+), 45 deletions(-)
-
-Index: nuttcp-6.1.2/nuttcp-6.1.2.c
-===================================================================
---- nuttcp-6.1.2.orig/nuttcp-6.1.2.c
-+++ nuttcp-6.1.2/nuttcp-6.1.2.c
-@@ -1925,11 +1925,11 @@
- 	if (udp && !haverateopt)
- 		rate = DEFAULT_UDP_RATE;
- 
--	bzero((char *)&frominet, sizeof(frominet));
--	bzero((char *)&clientaddr, sizeof(clientaddr));
-+	memset((char *)&frominet, 0, sizeof(frominet));
-+	memset((char *)&clientaddr, 0, sizeof(clientaddr));
- 
- #ifdef AF_INET6
--	bzero((char *)&clientaddr6, sizeof(clientaddr6));
-+	memset((char *)&clientaddr6, 0, sizeof(clientaddr6));
- 	clientscope6 = 0;
- #endif
- 
-@@ -1985,7 +1985,7 @@
- 		}
- 
- 		while (stream_idx <= nstream) {
--			bzero(&hints, sizeof(hints));
-+			memset(&hints, 0, sizeof(hints));
- 			res[stream_idx] = NULL;
- 			if (explicitaf) hints.ai_family = af;
- 			if ((cp2 = strchr(cp1, '/'))) {
-@@ -3013,12 +3013,12 @@
- 		if ((stream_idx > 0) && skip_data)
- 			break;
- 
--		bzero((char *)&sinme[stream_idx], sizeof(sinme[stream_idx]));
--		bzero((char *)&sinhim[stream_idx], sizeof(sinhim[stream_idx]));
-+		memset((char *)&sinme[stream_idx], 0, sizeof(sinme[stream_idx]));
-+		memset((char *)&sinhim[stream_idx], 0, sizeof(sinhim[stream_idx]));
- 
- #ifdef AF_INET6
--		bzero((char *)&sinme6[stream_idx], sizeof(sinme6[stream_idx]));
--		bzero((char *)&sinhim6[stream_idx], sizeof(sinhim6[stream_idx]));
-+		memset((char *)&sinme6[stream_idx], 0, sizeof(sinme6[stream_idx]));
-+		memset((char *)&sinhim6[stream_idx], 0, sizeof(sinhim6[stream_idx]));
- #endif
- 
- 		if (((trans && !reverse) && (stream_idx > 0)) ||
-@@ -3028,15 +3028,15 @@
- 			if (client) {
- 				if (af == AF_INET) {
- 				    sinhim[stream_idx].sin_family = af;
--				    bcopy((char *)&(((struct sockaddr_in *)res[stream_idx]->ai_addr)->sin_addr),
--					  (char *)&sinhim[stream_idx].sin_addr.s_addr,
-+				    memcpy((char *)&sinhim[stream_idx].sin_addr.s_addr,
-+					  (char *)&(((struct sockaddr_in *)res[stream_idx]->ai_addr)->sin_addr),
- 					  sizeof(sinhim[stream_idx].sin_addr.s_addr));
- 				}
- #ifdef AF_INET6
- 				else if (af == AF_INET6) {
- 				    sinhim6[stream_idx].sin6_family = af;
--				    bcopy((char *)&(((struct sockaddr_in6 *)res[stream_idx]->ai_addr)->sin6_addr),
--					  (char *)&sinhim6[stream_idx].sin6_addr.s6_addr,
-+				    memcpy((char *)&sinhim6[stream_idx].sin6_addr.s6_addr,
-+					  (char *)&(((struct sockaddr_in6 *)res[stream_idx]->ai_addr)->sin6_addr),
- 					  sizeof(sinhim6[stream_idx].sin6_addr.s6_addr));
- 				    sinhim6[stream_idx].sin6_scope_id = ((struct sockaddr_in6 *)res[stream_idx]->ai_addr)->sin6_scope_id;
- 				}
-@@ -3113,8 +3113,8 @@
- 				 * to the multicast group
- 				 */
- 				if (af == AF_INET) {
--				    bcopy((char *)&sinhim[1].sin_addr.s_addr,
--					(char *)&save_sinhim.sin_addr.s_addr,
-+				    memcpy((char *)&save_sinhim.sin_addr.s_addr,
-+					(char *)&sinhim[1].sin_addr.s_addr,
- 					sizeof(struct in_addr));
- 				    if (!client && (irvers >= 50505)) {
- 					struct sockaddr_in peer;
-@@ -3124,8 +3124,8 @@
- 						      &peerlen) < 0) {
- 						err("getpeername");
- 					}
--					bcopy((char *)&peer.sin_addr.s_addr,
--					    (char *)&sinhim[1].sin_addr.s_addr,
-+					memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					    (char *)&peer.sin_addr.s_addr,
- 					    sizeof(struct in_addr));
- 				    }
- 				    else {
-@@ -3136,8 +3136,8 @@
- 							&melen) < 0) {
- 						err("getsockname");
- 					}
--					bcopy((char *)&me.sin_addr.s_addr,
--					    (char *)&sinhim[1].sin_addr.s_addr,
-+					memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					    (char *)&me.sin_addr.s_addr,
- 					    sizeof(struct in_addr));
- 				    }
- 				    sinhim[1].sin_addr.s_addr &=
-@@ -4197,13 +4197,13 @@
- 						&melen) < 0) {
- 					err("getsockname");
- 				}
--				bcopy((char *)&me.sin_addr.s_addr,
--				      (char *)&mc_group.imr_multiaddr.s_addr,
-+				memcpy((char *)&mc_group.imr_multiaddr.s_addr,
-+				      (char *)&me.sin_addr.s_addr,
- 				      sizeof(struct in_addr));
- 			}
- 			else {
--				bcopy((char *)&peer.sin_addr.s_addr,
--				      (char *)&mc_group.imr_multiaddr.s_addr,
-+				memcpy((char *)&mc_group.imr_multiaddr.s_addr,
-+				      (char *)&peer.sin_addr.s_addr,
- 				      sizeof(struct in_addr));
- 			}
- 			mc_group.imr_multiaddr.s_addr &= htonl(0xFFFFFF);
-@@ -4330,12 +4330,12 @@
- 			if(udp) {
- 				strcpy(buf, "BOD0");
- 				if (multicast) {
--				    bcopy((char *)&sinhim[1].sin_addr.s_addr,
--					  (char *)&save_mc.sin_addr.s_addr,
--					  sizeof(struct in_addr));
--				    bcopy((char *)&save_sinhim.sin_addr.s_addr,
-+				    memcpy((char *)&save_mc.sin_addr.s_addr,
- 					  (char *)&sinhim[1].sin_addr.s_addr,
- 					  sizeof(struct in_addr));
-+				    memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					  (char *)&save_sinhim.sin_addr.s_addr,
-+					  sizeof(struct in_addr));
- 				}
- 				(void)Nwrite( fd[stream_idx + 1], buf, 4 ); /* rcvr start */
- 				if (two_bod) {
-@@ -4344,8 +4344,8 @@
- 					(void)Nwrite( fd[stream_idx + 1], buf, 4 ); /* rcvr start */
- 				}
- 				if (multicast) {
--				    bcopy((char *)&save_mc.sin_addr.s_addr,
--					  (char *)&sinhim[1].sin_addr.s_addr,
-+				    memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					  (char *)&save_mc.sin_addr.s_addr,
- 					  sizeof(struct in_addr));
- 				}
- 				if (timeout)
-@@ -4361,7 +4361,7 @@
- 				fflush(stdout);
- 			}
- 			if (udplossinfo)
--				bcopy(&nbytes, buf + 24, 8);
-+				memcpy(buf + 24, &nbytes, 8);
- 			if (!udp && interval && !(format & NORETRANS) &&
- 			    ((retransinfo == 1) ||
- 			     ((retransinfo >= 2) &&
-@@ -4372,13 +4372,13 @@
- 					tmp = 0x5254524Eu;	/* "RTRN" */
- 				else
- 					tmp = 0x48525452u;	/* "HRTR" */
--				bcopy(&nretrans, buf + 24, 4);
--				bcopy(&tmp, buf + 28, 4);
-+				memcpy(buf + 24, &nretrans, 4);
-+				memcpy(buf + 28, &tmp, 4);
- 			}
- 			else {
- 				send_retrans = 0;
- 				if (!udp)
--					bzero(buf + 24, 8);
-+					memset(buf + 24, 0, 8);
- 			}
- 			if (nbuf == INT_MAX)
- 				nbuf = ULLONG_MAX;
-@@ -4423,12 +4423,12 @@
- 				nbytes += buflen;
- 				cnt = 0;
- 				if (udplossinfo)
--					bcopy(&nbytes, buf + 24, 8);
-+					memcpy(buf + 24, &nbytes, 8);
- 				if (send_retrans) {
- 					nretrans = get_retrans(
- 							fd[stream_idx + 1]);
- 					nretrans -= iretrans;
--					bcopy(&nretrans, buf + 24, 4);
-+					memcpy(buf + 24, &nretrans, 4);
- 				}
- 				stream_idx++;
- 				stream_idx = stream_idx % nstream;
-@@ -4523,8 +4523,8 @@
- 				nbytes += cnt;
- 			if(udp) {
- 				if (multicast)
--				    bcopy((char *)&save_sinhim.sin_addr.s_addr,
--					  (char *)&sinhim[1].sin_addr.s_addr,
-+				    memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					  (char *)&save_sinhim.sin_addr.s_addr,
- 					  sizeof(struct in_addr));
- 				strcpy(buf, "EOD0");
- 				(void)Nwrite( fd[stream_idx + 1], buf, 4 ); /* rcvr end */
-@@ -4532,7 +4532,7 @@
- 		} else {
- 			first_read = 1;
- 			need_swap = 0;
--			bzero(buf + 24, 8);
-+			memset(buf + 24, 0, 8);
- 			if (udp) {
- 			    ntbytesc = 0;
- 			    got_eod0 = 0;
-@@ -4584,7 +4584,7 @@
- 				     * goes off right here */
- 				    if (udplossinfo) {
- 					    if (first_read) {
--						    bcopy(buf + 24, &ntbytesc,
-+						    memcpy(&ntbytesc, buf + 24,
- 								8);
- 						    first_read = 0;
- 						    if (ntbytesc > 0x100000000ull)
-@@ -4598,7 +4598,7 @@
- 						    }
- 					    }
- 					    if (!need_swap)
--						    bcopy(buf + 24, &ntbytesc,
-+						    memcpy(&ntbytesc, buf + 24,
- 								8);
- 					    else {
- 						    cp1 = (char *)&ntbytesc;
-@@ -4627,8 +4627,8 @@
- 					    uint32_t tmp;
- 
- 					    first_read = 0;
--					    bcopy(buf + 24, &nretrans, 4);
--					    bcopy(buf + 28, &tmp, 4);
-+					    memcpy(&nretrans, buf + 24, 4);
-+					    memcpy(&tmp, buf + 28, 4);
- 					    if (tmp == 0x5254524Eu) {
- 						    /* "RTRN" */
- 						    retransinfo = 1;
-@@ -4661,7 +4661,7 @@
- 				    }
- 				    if (read_retrans) {
- 					    if (!need_swap)
--						    bcopy(buf + 24, &nretrans,
-+						    memcpy(&nretrans, buf + 24,
- 								4);
- 					    else {
- 						    cp1 = (char *)&nretrans;
-@@ -5327,10 +5327,10 @@
- 		itimer.it_interval.tv_usec = 0;
- 		setitimer(ITIMER_REAL, &itimer, 0);
- 		signal(SIGALRM, SIG_DFL);
--		bzero((char *)&frominet, sizeof(frominet));
--		bzero((char *)&clientaddr, sizeof(clientaddr));
-+		memset((char *)&frominet, 0, sizeof(frominet));
-+		memset((char *)&clientaddr, 0, sizeof(clientaddr));
- #ifdef AF_INET6
--		bzero((char *)&clientaddr6, sizeof(clientaddr));
-+		memset((char *)&clientaddr6, 0, sizeof(clientaddr));
- 		clientscope6 = 0;
- #endif
- 		cput = 0.000001;
diff --git a/package/nuttcp/nuttcp.hash b/package/nuttcp/nuttcp.hash
index c7d0148e12..a43081d632 100644
--- a/package/nuttcp/nuttcp.hash
+++ b/package/nuttcp/nuttcp.hash
@@ -1,4 +1,3 @@
-# From http://lists.freebsd.org/pipermail/freebsd-ports-bugs/2009-August/170685.html
-sha256  054e96d9d68fe917df6f25fab15c7755bdd480f6420d7d48d9194a1a52378169  nuttcp-6.1.2.tar.bz2
 # Locally computed
+sha256  7ead7a89e7aaa059d20e34042c58a198c2981cad729550d1388ddfc9036d3983  nuttcp-8.2.2.tar.bz2
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 2636f950aa..a33af9bf87 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUTTCP_VERSION = 6.1.2
+NUTTCP_VERSION = 8.2.2
 NUTTCP_SITE = http://nuttcp.net/nuttcp
 NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
 NUTTCP_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
