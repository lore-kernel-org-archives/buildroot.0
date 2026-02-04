Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5289BE9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 279B5610CB;
	Wed,  4 Feb 2026 17:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShVsihrogO-O; Wed,  4 Feb 2026 17:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D627661319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224992;
	bh=ZdBxvvW8VRrmp2TXUBetGZBdzyhn9BHsOWpvpxnIg1E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XXFUzpmTc1C9UVov2j1a8rgmWGYNc6Np6KXgcNqkeRm0vKNmoC+dWKMMRTmVRgCnV
	 BYaiO42eqcZ1To6/ngSZfkYFha1wXnHY8AVJwL3pJd5vhFwy+yw59OPyke9ivIpzOb
	 zai9fuz8/jybtZM7ySSsJUpwVNBW4/Mct/Bjg14iumgB5t6PUXVLAPeNvHQZT4fDZ6
	 od7eMsPJWn5dyEV2ny64MMSxtpMmfw1yrDNGWRrXnI1q2c51EdwpYHtOjSN5o3Siy1
	 XymYfYNgkwEF4YcvMS4H3ZV/AJ7mpzBt48ZbhtuMZfHZdLuTfcTuRQESBkz/s/yma4
	 nKUo49IK39qyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D627661319;
	Wed,  4 Feb 2026 17:09:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3D4AF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F746405A9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNcNqQMSX30w for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6427240591
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6427240591
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58D278697C; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:37:46 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6bc63d08a7e6bccf5b20d656cdb65d51fb323c06
X-Git-Newrev: 56c6c0fb933fa8c0247209cd8bcba4bc7426166e
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.58D278697C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/go: security bump
 to version 1.25.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56c6c0fb933fa8c0247209cd8bcba4bc7426166e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes the following vulnerabilities:

- CVE-2025-61728: archive/zip: denial of service when parsing arbitrary ZIP
  archives

  archive/zip used a super-linear file name indexing algorithm that is
  invoked the first time a file in an archive is opened.  This can lead to a
  denial of service when consuming a maliciously constructed ZIP archive.

- CVE-2025-61726: net/http: memory exhaustion in Request.ParseForm

  When parsing a URL-encoded form net/http may allocate an unexpected amount
  of memory when provided a large number of key-value pairs.  This can
  result in a denial of service due to memory exhaustion.

- CVE-2025-68121: crypto/tls: Config.Clone copies automatically generated
  session ticket keys, session resumption does not account for the
  expiration of full certificate chain

  The Config.Clone methods allows cloning a Config which has already been
  passed to a TLS function, allowing it to be mutated and reused.

  If Config.SessionTicketKey has not been set, and
  Config.SetSessionTicketKeys has not been called, crypto/tls will generate
  random session ticket keys and automatically rotate them.  Config.Clone
  would copy these automatically generated keys into the returned Config,
  meaning that the two Configs would share session ticket keys, allowing
  sessions created using one Config could be used to resume sessions with
  the other Config.  This can allow clients to resume sessions even though
  the Config may be configured such that they should not be able to do so.

- CVE-2025-61731: cmd/go: unexpected code execution when invoking toolchain

  The Go toolchain supports multiple VCS which are used retrieving modules
  and embedding build information into binaries.

  On systems with Mercurial installed (hg) downloading modules (e.g.  via go
  get or go mod download) from non-standard sources (e.g.  custom domains)
  can cause unexpected code execution due to how external VCS commands are
  constructed.

  On systems with Git installed, downloading and building modules with
  malicious version strings could allow an attacker to write to arbitrary
  files on the system the user has access to.  This can only be triggered by
  explicitly providing the malicious version strings to the toolchain, and
  does not affect usage of @latest or bare module paths.

  The toolchain now uses safer VCS options to prevent misinterpretation of
  untrusted inputs.  In addition, the toolchain now disallows module version
  strings prefixed with a "-" or "/" character.

- CVE-2025-61730: crypto/tls: handshake messages may be processed at the
  incorrect encryption level

  During the TLS 1.3 handshake if multiple messages are sent in records that
  span encryption level boundaries (for instance the Client Hello and
  Encrypted Extensions messages), the subsequent messages may be processed
  before the encryption level changes.  This can cause some minor
  information disclosure if a network-local attacker can inject messages
  during the handshake.

For details, see the announcement:
https://groups.google.com/g/golang-announce/c/Vd2tYVM8eUc

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 22137df16bb03900f2801a7b4c2f2cf6c8574760)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 7c689f9144..6134ec5f75 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f  go1.25.5.src.tar.gz
-sha256  db908a86e888574ed3432355ba5372ad3ef2c0821ba9b91ceaa0f6634620c40c  go1.25.5.linux-386.tar.gz
-sha256  9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b  go1.25.5.linux-amd64.tar.gz
-sha256  b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9  go1.25.5.linux-arm64.tar.gz
-sha256  0b27e3dec8d04899d6941586d2aa2721c3dee67c739c1fc1b528188f3f6e8ab5  go1.25.5.linux-armv6l.tar.gz
-sha256  f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4  go1.25.5.linux-ppc64le.tar.gz
-sha256  a5d0a72b0dfd57f9c2c0cdd8b7e0f401e0afb9e8c304d3410f9b0982ce0953da  go1.25.5.linux-s390x.tar.gz
+sha256  58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059  go1.25.6.src.tar.gz
+sha256  59fe62eee3cca65332acef3ebe9b6ff3272467e0a08bf7f68f96334902bf23b9  go1.25.6.linux-386.tar.gz
+sha256  f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a  go1.25.6.linux-amd64.tar.gz
+sha256  738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5  go1.25.6.linux-arm64.tar.gz
+sha256  679f0e70b27c637116791e3c98afbf8c954deb2cd336364944d014f8e440e2ae  go1.25.6.linux-armv6l.tar.gz
+sha256  bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73  go1.25.6.linux-ppc64le.tar.gz
+sha256  3d97cc5670a0da9cb177037782129f0bf499ecb47abc40488248548abd2c2c35  go1.25.6.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index c932baf018..91e5fbf347 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.5
+GO_VERSION = 1.25.6
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
