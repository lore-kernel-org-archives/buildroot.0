Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B8F606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iZO3U2L6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB22C406EC;
	Sat, 24 Oct 2026 21:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cr6Kx_xbXHr; Sat, 24 Oct 2026 21:02:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B2F0B406E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875763;
	b=jCl2H6v/OnHUR4nFusr7lPBSdz+eOICD+0Ag/yh7ZbKdUBDwT7qrOswzyWZVxPuxfDxt
	 UcXVk/QoZsIgaKXGLiOg8ZmJOoBcjyF/rc5QAuadOU9ZspabfjA1gVMmCq4GYfN9idCAr
	 KYs2L4IP/d6UgwEeWYTiyWdKytzI8WKoS+om2fQQPvDm0bS6qREzGKhmEBukM5aq1x/9o
	 isZuG2lEuTEkSRZbSAFLQLU+/6LvvNDfhzD32EfsOZSlMYEQniwoKBOUhBBdwHZK1N30z
	 iwGJHBvtYJMyn3ptRtoZpHwd295PwGaBHmR52tUV4FL+6zg+fiJxTk2NixUdXoHxO6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875763;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PQwZEWWvbLgeLnJFt1YzHOl3WJYHHJIJVRtGBEBiLVs=;
	b=AqJuIRSpKdnRckR9hWYMzbjPAGvoasylY9AOmD//klVPKRRTGvFzHS7VQeuz1WUtBBmx
	 djeIkqHRP3WCjA9OW1nth0CMauR7UAaggxciR+4TeoVCS+HqnEiyAa3SV9D0t9w5pj42Q
	 Dvx74V1oOZw9CjN32BV48iKIhQxT77DTp4m272bzlyz6636OgQe5ED3SESDMz15sUM3cL
	 GXg9OQ3Pa7u1cd6oKS6OQfkj5HKpYdLdCaHcysIOSapvJlVv3Fduawx30aCI5aIQ/ZdtZ
	 X4rj4p/IkdrS0K8XQvqvwANc5vj3agaOHztkOJPYeaPzTv+sS7BSt2oH39GfYYvviMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875763;
	bh=PQwZEWWvbLgeLnJFt1YzHOl3WJYHHJIJVRtGBEBiLVs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iZO3U2L6crOByq/oidMQzaLl5DGp8n4hnzhG1U8Mk4p2kR9qsW3B1MwSw3Q2Q9HAg
	 m5AKwJxhgEpPd+10uDoXb+qMXUgP/eJNDhPkU/O4XHodIA//gQK/4TA79jJGXR4CtG
	 G3n3Bg5QJM3TOb5dJSReICW+A79cX4IQ/gzpVjazcLnWE6LBvEGsUg+uNhB7dxJPYB
	 6RgWDTlCq1K5aWgUJU6iCotATIDqtCGrjWZ8KS6JDdke++Y/ZYpcCCNVtJrPTLf16Q
	 Q5r3lUMI438d1mxUigZP83HJqNHLtg/2fmKakFNwCPmQV4oqDZu89RoVTK+I8PTwzj
	 1VPPycpC6qY+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F0B406E5;
	Sat, 24 Oct 2026 21:02:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CEC42F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3303380E28
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfiLpCzRnsUg for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:02:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 75B9780E37
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875758;
 b=ARHM2LGGQkDKUBAp9AqgBzZn3R49anO34w2c6p8YEUjXIoB+18UvQ6qKK3EZH1pw3moi
 HyN0QyR2xUThMGqYAbCqnxXgbQN3TNjXuOfJn7MBko10jQXNwf0mjeFrt4LYBqbkuFGIq
 XzJHMwqPwhUOayn29aIg677txXo30xRdt7TTRyTdCWWUlmcVSX4JiBegIOpbNP2ngEW2t
 FaGN6fTRwzaELyg611fTLV0DrgnQtj3nfIrk4xv39nZ9P9OAG8RZooxK4AH/Yh0oC7J+y
 K2pMTkpy7s0igPxDrcCvpcNSzgWY4q+e71toU2oS4KdnWqASMMAz9QHB3+v90bUBACw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875758;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dw9jr3WvvSsXfbSG2FqR/697qkj7n0VUUzMbzMGMH0o=;
 b=DVKUengJzEKrQcX0J/8fKYEmXhgFvtwX703WqBmGCE2u0vu4R7lPMNNyK/7bsyGahgWy
 cWJauLlUvaZ7bKTTr/SU5cyW0Gjxqd823jl2tezKZtiC/ULf9n/2jyrVxX2wmMquCP555
 p16b8u2V0aBsdUFZR9L8hlJbbLB5ki79a+JIiamvwS96ywE/S0KSB2wB80zyRyY+N0R+9
 9vAUd9sNy9/CqOth21OoOpeBPPGHHcXYQdjZkOAamE3UM82V3gwMuvI4F8Z6LAo4bIvQP
 xXF3wwixvsDFq8M3yivg7Dhmg7kGZD9WAMUDnFBD6hHCACN5pX1FCgOgsbxuRCTA4tg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75B9780E37
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E43E9CCB7; Sat, 24 Oct 2026 21:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:58:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 729ecacededc0e0a366d1292f1d9e5128fb58f6c
X-Git-Newrev: 0df4a5bd4775926d1b4c421a4d0bb2dfceb80584
X-Patchwork-Hint: ignore
Message-Id: <20261024210113.4E43E9CCB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: fix build with
 bootlin-aarch64-glibc-old
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
Content-Type: multipart/mixed; boundary="===============5617831945666874787=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5617831945666874787==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0df4a5bd4775926d1b4c421a4d0bb2dfceb80584
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes a build error detected by the Gitlab pipelines which was
introduced by upstream commit
https://github.com/nmap/nmap/commit/8ef3ed1471eca613f1d43f602932d2c99d6e2e7c
that was first release in version 7.991. Buildroot bumped the package to
this version with commit 0691aac1de75377b3dd8d36965ab4a128d5e9cb1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../nmap/0003-traceroute.cc-include-cstddef.patch  | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/package/nmap/0003-traceroute.cc-include-cstddef.patch b/package/nmap/0003-traceroute.cc-include-cstddef.patch
new file mode 100644
index 0000000000..8008b3fa76
--- /dev/null
+++ b/package/nmap/0003-traceroute.cc-include-cstddef.patch
@@ -0,0 +1,82 @@
+From 445573b27f3997b7eae456e849f003f18de5349e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 6 Sep 2026 11:41:29 +0200
+Subject: [PATCH] traceroute.cc: include cstddef
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Adding this include fixes a build error seen with an old buildroot
+toolchain based on gcc-6.3.0/glibc-2.25:
+
+traceroute.cc: In function ‘bool parse_encapsulated_reply(const u8*, unsigned int, Reply*)’:
+traceroute.cc:1084:24: error: expected primary-expression before ‘struct’
+     if (len < offsetof(struct icmp, icmp_id) + 2)
+                        ^~~~~~
+In file included from struct_ip.h:56:0,
+                 from traceroute.cc:113:
+traceroute.cc:1084:37: error: ‘icmp_hun’ was not declared in this scope
+     if (len < offsetof(struct icmp, icmp_id) + 2)
+                                     ^
+traceroute.cc:1084:44: error: ‘offsetof’ was not declared in this scope
+     if (len < offsetof(struct icmp, icmp_id) + 2)
+                                            ^
+traceroute.cc:1091:52: error: expected primary-expression before ‘struct’
+     if (len < sizeof(struct icmpv6_hdr) + offsetof(struct icmpv6_msg_echo, icmpv6_seq) + 2)
+                                                    ^~~~~~
+traceroute.cc:1091:76: error: ‘icmpv6_seq’ was not declared in this scope
+     if (len < sizeof(struct icmpv6_hdr) + offsetof(struct icmpv6_msg_echo, icmpv6_seq) + 2)
+                                                                            ^~~~~~~~~~
+traceroute.cc:1091:86: error: ‘offsetof’ was not declared in this scope
+     if (len < sizeof(struct icmpv6_hdr) + offsetof(struct icmpv6_msg_echo, icmpv6_seq) + 2)
+                                                                                      ^
+traceroute.cc:1098:24: error: expected primary-expression before ‘struct’
+     if (len < offsetof(struct tcp_hdr, th_sport) + 2) return false;
+                        ^~~~~~
+traceroute.cc:1098:40: error: ‘th_sport’ was not declared in this scope
+     if (len < offsetof(struct tcp_hdr, th_sport) + 2) return false;
+                                        ^~~~~~~~
+traceroute.cc:1098:48: error: ‘offsetof’ was not declared in this scope
+     if (len < offsetof(struct tcp_hdr, th_sport) + 2) return false;
+                                                ^
+traceroute.cc:1102:24: error: expected primary-expression before ‘struct’
+     if (len < offsetof(struct udp_hdr, uh_sport) + 2) return false;
+                        ^~~~~~
+traceroute.cc:1102:40: error: ‘uh_sport’ was not declared in this scope
+     if (len < offsetof(struct udp_hdr, uh_sport) + 2) return false;
+                                        ^~~~~~~~
+traceroute.cc:1102:48: error: ‘offsetof’ was not declared in this scope
+     if (len < offsetof(struct udp_hdr, uh_sport) + 2) return false;
+                                                ^
+traceroute.cc:1106:24: error: expected primary-expression before ‘struct’
+     if (len < offsetof(struct sctp_hdr, sh_sport) + 2) return false;
+                        ^~~~~~
+traceroute.cc:1106:41: error: ‘sh_sport’ was not declared in this scope
+     if (len < offsetof(struct sctp_hdr, sh_sport) + 2) return false;
+                                         ^~~~~~~~
+traceroute.cc:1106:49: error: ‘offsetof’ was not declared in this scope
+     if (len < offsetof(struct sctp_hdr, sh_sport) + 2) return false;
+                                                 ^
+
+Upstream: https://github.com/nmap/nmap/pull/3473
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ traceroute.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/traceroute.cc b/traceroute.cc
+index 231de10fc..5b040ce2d 100644
+--- a/traceroute.cc
++++ b/traceroute.cc
+@@ -122,6 +122,7 @@ individually.
+ #include <dnet.h>
+ 
+ #include <algorithm>
++#include <cstddef>
+ #include <list>
+ #include <map>
+ #include <set>
+-- 
+2.47.3
+

--===============5617831945666874787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5617831945666874787==--
