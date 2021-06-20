Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89E1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:09:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A14E60D07
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A14E60D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23B2C403FF;
	Tue,  3 Aug 2021 23:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QNGB47m6fnB; Tue,  3 Aug 2021 23:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9351404E0;
	Tue,  3 Aug 2021 23:09:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0E01BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5129A4066D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEHSOXrKnBmQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D3240634
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 137938674F; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 14:37:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 05eb8e396f59c455f48fc80b12bf49c05a49e85b
X-Git-Newrev: 49df5080079e7e6fc7330e91f249004d018c4c9b
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.137938674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/docker-engine: bump
 version to 20.10.7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=49df5080079e7e6fc7330e91f249004d018c4c9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstreamed patch fix-port-forwarding-with-ipv6.

Upstream commit: d29a55c6c344a536089d6b1bcd92be9cdea20641

Signed-off-by: Christian Stewart <christian@paral.in>
Tested-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...1-fix-port-forwarding-with-ipv6.disable-1.patch | 74 ----------------------
 package/docker-engine/docker-engine.hash           |  2 +-
 package/docker-engine/docker-engine.mk             |  2 +-
 3 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch b/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch
deleted file mode 100644
index c5161ef0db..0000000000
--- a/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 7b9c2905883df5171fda10a364a81b8c6176c8e2 Mon Sep 17 00:00:00 2001
-From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
-Date: Mon, 26 Apr 2021 15:28:40 +0900
-Subject: [PATCH] fix port forwarding with ipv6.disable=1
-
-Make `docker run -p 80:80` functional again on environments with kernel boot parameter `ipv6.disable=1`.
-
-Fix moby/moby issue 42288
-
-Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
-[Upstream: https://github.com/moby/libnetwork/pull/2635,
-           https://github.com/moby/moby/pull/42322]
-[Rework path/drop test for docker-engine]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 35 insertions(+), 0 deletion(-)
-
-diff --git a/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go b/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
-index 946130ec..17bf36f9 100644
---- a/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
-+++ b/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
-@@ -5,6 +5,7 @@ import (
- 	"errors"
- 	"fmt"
- 	"net"
-+	"sync"
- 
- 	"github.com/docker/libnetwork/types"
- 	"github.com/ishidawataru/sctp"
-@@ -50,6 +51,13 @@ func (n *bridgeNetwork) allocatePortsInternal(bindings []types.PortBinding, cont
- 			bs = append(bs, bIPv4)
- 		}
- 
-+		// skip adding implicit v6 addr, when the kernel was booted with `ipv6.disable=1`
-+		// https://github.com/moby/moby/issues/42288
-+		isV6Binding := c.HostIP != nil && c.HostIP.To4() == nil
-+		if !isV6Binding && !IsV6Listenable() {
-+			continue
-+		}
-+
- 		// Allocate IPv6 Port mappings
- 		// If the container has no IPv6 address, allow proxying host IPv6 traffic to it
- 		// by setting up the binding with the IPv4 interface if the userland proxy is enabled
-@@ -211,3 +219,26 @@ func (n *bridgeNetwork) releasePort(bnd types.PortBinding) error {
- 
- 	return portmapper.Unmap(host)
- }
-+
-+var (
-+	v6ListenableCached bool
-+	v6ListenableOnce   sync.Once
-+)
-+
-+// IsV6Listenable returns true when `[::1]:0` is listenable.
-+// IsV6Listenable returns false mostly when the kernel was booted with `ipv6.disable=1` option.
-+func IsV6Listenable() bool {
-+	v6ListenableOnce.Do(func() {
-+		ln, err := net.Listen("tcp6", "[::1]:0")
-+		if err != nil {
-+			// When the kernel was booted with `ipv6.disable=1`,
-+			// we get err "listen tcp6 [::1]:0: socket: address family not supported by protocol"
-+			// https://github.com/moby/moby/issues/42288
-+			logrus.Debugf("port_mapping: v6Listenable=false (%v)", err)
-+		} else {
-+			v6ListenableCached = true
-+			ln.Close()
-+		}
-+	})
-+	return v6ListenableCached
-+}
--- 
-2.20.1
-
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6c55b9a9b9..d07ca33307 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fd7f5571b1f64f26b5ca520a3e1fefb33c190f3732b931051c23a76bdba5000e  docker-engine-20.10.6.tar.gz
+sha256  b80142035de46904605fb7b8f18075cd94154f8c3d67ff346ea554d1e9d579b9  docker-engine-20.10.7.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 10ecbf603a..372717775b 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.6
+DOCKER_ENGINE_VERSION = 20.10.7
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
