Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB9606A32C
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QHPPA7z7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 575B580DCE;
	Sun,  1 Nov 2026 17:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2xiDSObT9pY; Sun,  1 Nov 2026 17:07:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79A2580D6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552863;
	b=e9S/br4ElOc5ow2vnJeH3+kQB5XtjsFHEq9TV2T0XcEZD8mON96I+2te+ASVfMzq72RH
	 XN9TAD+hPvCUfcAJkIfgglkWxDFuRAazJcC1r5JIfu2sV+4lw4BM6aijow3hiwbFg+ziJ
	 s9pyLteNc4gPNOFZ8MS750U4+XF8m2coEiF1Q2Ym8LqXZw+CP1DfPLYCCKeFpJgEIddb3
	 xf3zr05mtb3nv11jOOj0MIw2tAky6Qpp2LSYpYaoFp7Gc3hI7aku/wdyFiPvbQd14vRy+
	 elDnZ0WcAtkDJuLGHppts967MQlMnVis+777Yc95HVm/4qqMsb9tDuDGS+t/VWLakfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F0In6SmnAIF3wctbPtKwdPfbZjrglTAOk5ekVLMaxDU=;
	b=LE4fuGGgoQ++w7/cDi2fG1LpTYxkvXc4pEdbOVUtfXvDZ/f6lYhLd0YJgmNCJm2bknFe
	 ySkGT/1YYXgeKfTkg8ZwMQ/ijMdvcaXyQzNQFZCZ1lSlT3JHVZLBlEQsidxyKt7/tXs10
	 ldyZu2sKyDt9EIejOsLhFPsRqniqI1peqAbsvbWvN7yh3+9oVkmCN7Am9hZ1zAOUMJvhx
	 Sgb27pSh3itYcsow6WiTcaqjaeNDgMEE4pdx0K0zMowNFyFUpctN4A+QhoW0ZnuOi8rTd
	 7FgJqRTc5+32CEXd03Ikpdgbn7R5g1WvQxyft9lSHj1MwGwmxuIFLoEUguw+k6FO5ew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552863;
	bh=F0In6SmnAIF3wctbPtKwdPfbZjrglTAOk5ekVLMaxDU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QHPPA7z79He0nHq2KuHFNqISIZeQG2WoZoHHEgBVB+ARRpmbSUsGv4ODzH2lAavAQ
	 5qzuc2jDmWcLp1IcOkjfVgVqoMqK3L3CXnzAS57Yy5aRCUYkr+Lr2SkAoyuZzpfUVP
	 qi7L50m/gpiw4OeWhFqzt0HuHmRkbhi3/IkO8hlbqVY23ny90Ct31at3JjnAO0XRmF
	 CjybOK8pI5oK3ReyUX7An+2abf2PtVpCh6x0AihYrraRUEpsVHeotv37mvmjRVKaaq
	 yWvIr1lc04qafCTB0nSZrutx+Is6wknSQKbcLz1Ju8wHjm3gB02o3AP3Y0wYDae2Hl
	 JENHyN73vAcLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79A2580D6E;
	Sun,  1 Nov 2026 17:07:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4354CEF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37E8180D47
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hg_EQUFAjZ4E for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D63C80D5B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552838;
 b=VGQGSgBwpk4ctKWDPahrIIyclKjUUKQx/tlfwKYG/OM5xZKfDQA3SwYK/0wtlRBRV0rx
 QkCQnWLGRNfSDyj7GhGOj5vJwwkTtIJf+zKLR3P7oRZcbJ8vlgGFc241Q6KNDWg7D2e+M
 SM6jEPcH2SZ0kBzAdUm173+ulsWiXTFPX1g0CCzvDWJy/c+o2F7hNQryQJ0MSbp4eqXQ1
 d5mfcNQ6LjfUFHYTDgcsdjb9CQeHcviGuAmq9FZLQI5Jp7jAIPboBlexAB+5Msiao1BoL
 +XY2lG/u6nrmwJhvH1ZWpT01jWaJXBGvkkz86IOqLDRubc0Y4GsVOmwji2sUrqTnoPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552838;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7I3r2BNV3AJG3MbyN5FgYnvbbMFdSp41w3jnIuKi4ZU=;
 b=fNc47ONcxJMJ7XbiLa6KBWDkYRiaQlM+8p/nvkXZfwf4qfdiHi2ihhX64WntXji+6sbq
 NSDZy8/ECnY2jrHqXJ84nBlYaHN+1BBJgZsrJu4k6pK4q10obQaEKvZ33ra6ZexR+NR9L
 H1h9n3dSN4M8+A4LzXA1jsJQJTVH7IK6n3RWyT16f8/5pFroy4ztC/s4GosG3MtuoZ4af
 sqUCitfLQ1RbvTYwhwkhj9Jp8ZS8zu8os+xmn06fsidzJd3YjqpJuMOOav2gNYeg4KDH1
 83WDcVWY9ueQXPnLZMPgkLhZPs8VD2V+g42roeE2VwaFXOGS1by6/wbvfLT1tXtVSuw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D63C80D5B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CED9B9D4FA; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6680751acecb8ec8e3826f525f425c823e757a7e
X-Git-Newrev: d2fb76dbc2134cf9b54f9af368eb329997d3e3e9
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.CED9B9D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-settings: bump to
 version 2.16.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2fb76dbc2134cf9b54f9af368eb329997d3e3e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 4ed74fb707..2cec53fc8f 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  c31750bce5209a37412ce332e0b31975  pydantic_settings-2.16.1.tar.gz
-sha256  aff602a1886338c2df3d1e958e2193a8dc33cec75b91f202e83fd98484b4b0da  pydantic_settings-2.16.1.tar.gz
+md5  67010dabd98141ee3ed3173baf9e2bf8  pydantic_settings-2.16.2.tar.gz
+sha256  3dc08ffabed2bbd5dc2dd55ead7b78b4e4c5cd776aecd04310db5f1224caaf46  pydantic_settings-2.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 1d5766dffd..c35db1d675 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.1
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.2
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/05/ca/7817b4bf0c4b15c6a6ab8cdf4cb96c268335a8ca2f525de93b6ebe4c7d28
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/d0/31/21d21e0e38a8f5f7a7f0cde22820117b6d17d6bc36f348129527f915d7f4
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
