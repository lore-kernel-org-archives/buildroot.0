Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00A2E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F1C60EF3;
	Thu, 19 Feb 2026 17:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-SQdIynmGc3; Thu, 19 Feb 2026 17:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D6C860F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521859;
	bh=CNj0KUY/nDCAZ2M9OV89GoixlLSN2dH7naMNGCpF3Ds=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mJymkA1HfZvTtL8ygY3whJ6ga9aAK+cB52vtRHAWF9yWtsCnheCzd1j1X2eUavnK3
	 kMYbb+3ZSErQZyc/MiXhfsK+p/NJFDzIcSZK3Z9sHJrC44dlT3IObixqPjliMNc3b6
	 bWW3MSNX2nqAR30jTz65mHV8IDvig68dxbbYxOPG0nI6FkJOZDZJIkhO0s7kUvjyCK
	 OU4dPazgtrzVofG7Gd6XtWJlHzdothclKeC62tnZl8W9quMeNCqnri0Qb8WA9GtTZk
	 B1e5lR9Z7tAH+nrvDGkDaCHNec0M9Yfw3pJAzAvU/XOswEqRExUe5Hj//9Iua29mye
	 AvLcvqp7k3jJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D6C860F26;
	Thu, 19 Feb 2026 17:24:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B72C339E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C8D960A4F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExRRleLJLzg7 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82AD660874
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82AD660874
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7100987046; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:07:39 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: dedc4383f701046bb600a6b45b0e8864c46e7cc7
X-Git-Newrev: 169122a3979deb8432c93acac47af5d8a81823a7
X-Patchwork-Hint: ignore
Message-Id: <20260219172413.7100987046@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/go: security bump
 to version 1.25.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/169122a3979deb8432c93acac47af5d8a81823a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes the following vulnerabilities:

CVE-2025-61732: cmd/cgo: remove user-content from doc strings in cgo ASTs

A discrepancy between how Go and C/C++ comments were parsed allowed for code
smuggling into the resulting cgo binary.

To prevent this behavior, the cgo compiler will no longer parse
user-provided doc comments.

CVE-2025-68121: crypto/tls: unexpected session resumption when using
Config.GetConfigForClient

Config.GetConfigForClient is documented to use the original Config's session
ticket keys unless explicitly overridden.  This can cause unexpected
behavior if the returned Config modifies authentication parameters, like
ClientCAs: a connection initially established with the parent (or a sibling)
Config can be resumed, bypassing the modified authentication requirements.

If ClientAuth is VerifyClientCertIfGiven or RequireAndVerifyClientCert (on
the server) or InsecureSkipVerify is false (on the client), crypto/tls now
checks that the root of the previously-verified chain is still in
ClientCAs/RootCAs when resuming a connection.

Go 1.26 Release Candidate 2, Go 1.25.6, and Go 1.24.12 had fixed a similar
issue related to session ticket keys being implicitly shared by
Config.Clone.  Since this fix is broader, the Config.Clone behavior change
has been reverted.

Note that VerifyPeerCertificate still behaves as documented: it does not
apply to resumed connections.  Applications that use
Config.GetConfigForClient or Config.Clone and do not wish to blindly resume
connections established with the original Config must use VerifyConnection
instead (or SetSessionTicketKeys or SessionTicketsDisabled).

For more details, see the announcement:
https://groups.google.com/g/golang-announce/c/K09ubi9FQFk

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f56dc6b1221ed0792e94cad1a96c51cb75f60b0b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6134ec5f75..9a9a5a571a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059  go1.25.6.src.tar.gz
-sha256  59fe62eee3cca65332acef3ebe9b6ff3272467e0a08bf7f68f96334902bf23b9  go1.25.6.linux-386.tar.gz
-sha256  f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a  go1.25.6.linux-amd64.tar.gz
-sha256  738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5  go1.25.6.linux-arm64.tar.gz
-sha256  679f0e70b27c637116791e3c98afbf8c954deb2cd336364944d014f8e440e2ae  go1.25.6.linux-armv6l.tar.gz
-sha256  bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73  go1.25.6.linux-ppc64le.tar.gz
-sha256  3d97cc5670a0da9cb177037782129f0bf499ecb47abc40488248548abd2c2c35  go1.25.6.linux-s390x.tar.gz
+sha256  178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a  go1.25.7.src.tar.gz
+sha256  2866517e9ca81e6a2e85a930e9b11bc8a05cfeb2fc6dc6cb2765e7fb3c14b715  go1.25.7.linux-386.tar.gz
+sha256  12e6d6a191091ae27dc31f6efc630e3a3b8ba409baf3573d955b196fdf086005  go1.25.7.linux-amd64.tar.gz
+sha256  ba611a53534135a81067240eff9508cd7e256c560edd5d8c2fef54f083c07129  go1.25.7.linux-arm64.tar.gz
+sha256  1ba07e0eb86b839e72467f4b5c7a5597d07f30bcf5563c951410454f7cda5266  go1.25.7.linux-armv6l.tar.gz
+sha256  42124c0edc92464e2b37b2d7fcd3658f0c47ebd6a098732415a522be8cb88e3f  go1.25.7.linux-ppc64le.tar.gz
+sha256  c6b77facf666dc68195ecab05dbf0ebb4e755b2a8b7734c759880557f1c29b0c  go1.25.7.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 91e5fbf347..a9c7d1ddc6 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.6
+GO_VERSION = 1.25.7
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
