Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C84F94CB7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 23:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3930E83E31;
	Tue, 21 Apr 2026 23:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8KkK2yhUfkT; Tue, 21 Apr 2026 23:12:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447E483E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776813176;
	bh=ZBeOsuauRkVYa2b875EXs0e0uFApNaiQI4RCOXmDiLQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VBSHcvGaFBQwX+v2r8xVgK0bkPAzUNz3HawgJNTG8DjTIvORevLesCK6cLPrdR6S0
	 69dp0ZksIMOmy55S2IGkxWGcAHNca5pw0f+RUqLKeibptB+6PJkyBnCtciQ7EZmyFV
	 1KQQbTRXbw21vXzqDhCcQD34geV001FolHfvROvVobv2NHiqSTGrbteuhD4+aHG9vP
	 UJTYwefwfm9EMZtNZUQ1wlQgUwkAaHOlqTHME+3Nkeuh1Mfe+vee0clkmZf3YoMM4R
	 3x/BHPa8xok0TXap9nYCC5Ewoy9cUS+0RW3LWyjmPpMs2aDd5kP0h5oIhwX60EzbT/
	 Mlb7MzDL329Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 447E483E3A;
	Tue, 21 Apr 2026 23:12:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED92824D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E008D41FDC
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-XjeL7qZFvf for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A9342172
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97A9342172
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29B4282206; Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 00:52:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebf313424c32fe70042d52b0578219c47d1f4c44
X-Git-Newrev: f40dacf08f322745df07f316cfb34bc7fc01dc06
X-Patchwork-Hint: ignore
Message-Id: <20260421231251.29B4282206@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/python-magic-wormhole-transit-relay: bump to version 0.5.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f40dacf08f322745df07f316cfb34bc7fc01dc06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See NEWS:
https://github.com/magic-wormhole/magic-wormhole-transit-relay/blob/0.5.0/NEWS.md

The upstream source archive name changed (dash '-' changed to
underscore '_'). This commit updates _SOURCE to reflect that change.

This commit also updates _SITE to use a stable URL which will redirect
to the package archive, to reduce future maintenance.

This package has been broken at runtime since Buildroot commit [1]
"package/python-setuptools: bump to version 82.0.0", which removed
the python module 'pkg_resources' which was deprecated. This new
version removes those usage and fixes this issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13904071794

Note: this commit fixes only the runtime invocation of transitrelay,
the complete fix for the test_python_magic_wormhole runtime test
also requires the update of python-magic-wormhole-mailbox-server.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/51365ff06379aaf6fcc9a751e8ff32ac694f3e92

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../python-magic-wormhole-transit-relay.hash                        | 4 ++--
 .../python-magic-wormhole-transit-relay.mk                          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
index 3f038728be..286f2766ae 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-transit-relay/json
-md5  73be034b4a57e9d190cfb658cbaa5fbf  magic-wormhole-transit-relay-0.4.0.tar.gz
-sha256  912d835da21b11266c77111dc9b5e5800263fc0b98f0a179962267df41819e8c  magic-wormhole-transit-relay-0.4.0.tar.gz
+md5  8305bee7b0307e485c42ac933cbc6ddd  magic_wormhole_transit_relay-0.5.0.tar.gz
+sha256  a2c2e777cafcd843a2f22f0a4b3c3bd3cae85cc2303fead1646d1763ad6d1a4a  magic_wormhole_transit_relay-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d70f6469bb210c2aa4c0dfd74f498ef5f0467a137d8296479088e7243c5884eb  LICENSE
diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
index 03a2d416db..4f83c6fc51 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.4.0
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic-wormhole-transit-relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/d0/87/cb71073e53ea7e1b6f892c52e4114caea81b887a7d34e665b15dc81d669e
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.5.0
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic_wormhole_transit_relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole_transit_relay
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
