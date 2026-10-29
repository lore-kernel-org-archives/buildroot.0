Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADDA606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P2R1OO1R
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86C2760DC3;
	Fri, 30 Oct 2026 14:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESTVgOoDGFfW; Fri, 30 Oct 2026 14:20:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9314D60DBC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370041;
	b=rF5o2+SJ0eck2whDGiOmRrxPerWxjUef1NtFHB1IUGamKo0jW76+JDdkUMcbwDVHKZaa
	 eYGsID263NKWOj/7Ztn9fFwQY8iWJ3SJ9QzPg4APWJou6INIhjF4V1k+oFv/4Yuv1Ycin
	 HQ/hNVjFk/5hAz44vnHtznXmKQ4XPa7q61jX9g7M/I4vIz/Vy8eS6jVa0Vnmpa6OZQOS5
	 KL4os11gzVZ95jVrRHXWh3gCIKzzZ37ltCPT3O4SmOenXHIe0QSgYJB760CXsaiAE8b+B
	 8VxgOh++gi3J08M0v11uyc6EVJJvMwb9l3mVR2hyzyPtyayoSJO+UkG/N36a5udQQZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=nZdu+8N5XIHUwVacO+r1eWAgLaMD3ZZBuEHHrsGmoIo=;
	b=UbiP7pT2mSo+CQk/uR+TDuBgBh5Jg9aXU+Fc08Uv2IgSVAXXbNTCATWdy+CzrRrIPMZj
	 Os05HtYKQGJv9U2trDy/zZ+6rYszlMWmrBp74yHFs1aHEeEBl7O319aSgYpxxj6P37kGC
	 AOZnP+EQrhjNSgcrxXz9PhgUbV+Xz2wzmKZJmwdyB0BbPadkWCKwaKWqlgwPlKm8V7E67
	 4ft2BQgFwlTftvkQBHfxFCNhOQZfgThWsmdnh2sdoV8I7GXD6d6S87PBDkan6HG0c3kwk
	 OTk+hByw//+mZmkDrngStGpOywMNPdBJraJ+3wOeENjPfpXHQqUGoTF4ribvAnb6H2g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370041;
	bh=nZdu+8N5XIHUwVacO+r1eWAgLaMD3ZZBuEHHrsGmoIo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P2R1OO1ReUEZJlIkbBEJ2Xx0XLV873+p1IoD1g/4t67B3B+M27Kh6n0UWzFgUJiCJ
	 ocgDXiS4VYW4LHv4VEKlK2h2QvT8D8Eq1D9NMxDlz8mhlxhRNOueW9JWpvMtqopfYM
	 Wfu/7d/M2oMEQBN8BKdGjuINeOv+LCnt4EH7xwai0lgYcVPAHMzB9hxydcGrxhP82T
	 M5ak56gIoGLeI6Or/Y0R+AImy/AUy1JvAi5R9s8zQW36tBMt/Zof+8oK9h6uVFqzs5
	 apYxKy1xAS+y/uGG7+OEATTGIvsCcJeaSOhzzVryfgx6gqzxqjfinDRvwaP4bCjIFe
	 2Jfmh89dZYUOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9314D60DBC;
	Fri, 30 Oct 2026 14:20:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A14D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 819BD81334
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWW1WMmOwIIO for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C6AF6812F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=NB9tANqq8Xs+3848gSZ/RCinNwiaFLFb/KKGs9HqxJzL9IW/S+7CxowGzRe0sNPHF7cp
 HW/iU9qHpdz+3N2FtYoELtBC/2hoHZpkPHqDF/taDyOvxGRAxHREfC8qsPEQLrPB+A9FZ
 P4CZuSfA9bBpqMeyNOCHGs6Pqqfzteij+z2ugOlItbldEB6sqUKofrSVyYzYVYyHqCJ1i
 SRgtLFVgP5hb8PJT6vEkdldAH/uUglug0/ACo0XtQJ8KJmIHt9wnTIs4nIDgZidAgvOXH
 D2NAG3tfOErwQGe8Ome7i3UjVkbmrANjbH5ZW/rYF+yDvMtBEISDSmtki/p/wWcok+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DYpVvRT4pjpnwhltw7A118fAj1kq2Y6rb2wdJOwCoLs=;
 b=CVQIbP0dawRa+vh06OG6jw/qZoMDHS3tBd3PmDxnm9DCrmBGFfGacnmirvGi9XC4xKke
 g72dgqpRmr5wy0KVN7sViuncN11DXTiVRqM0Mo+7/VJdPaP/wCV1nOmP/6JwXmTpJlSP2
 TkiIjGfks786+FNEEvAI2jCZMYXP8Tco7lRa9f8ZBLsasT3hEixE5BvkkfdYF190jkbL2
 AMtEZsECLCCyk+xdc0Nr4mKJm6DkXt0OcPWbcfeAUjV1iIOf5w6Kl7gpP2SejQ9CdpVmI
 BQ5uJD7ICA6MMzTl9JbSLtl6Ev8c0dkK4jMdLXpHmwKD8GaveS2J8992JeCoZqX/4VA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6AF6812F1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D77DB9D389; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: dc432cf1cd07d81ac5c12e1f24bb7e2610c1d3b4
X-Git-Newrev: 88d8cff680506435dbfe807c3261d14142c48b38
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.D77DB9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/c-ares: security
 bump to 1.34.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2257029719570605106=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2257029719570605106==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88d8cff680506435dbfe807c3261d14142c48b38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This align with the version of python-pycares bumped in [1].

See the release notes:

- https://github.com/c-ares/c-ares/releases#release-v1.34.9
- https://github.com/c-ares/c-ares/releases#release-v1.34.8
- https://github.com/c-ares/c-ares/releases#release-v1.34.7

This fixes the following vulnerabilities:

- CVE-2026-33630 - GHSA-6wfj-rwm7-3542: Use-after-free / double-free in
  c-ares' query-completion handling, remotely triggerable via
  ares_getaddrinfo() over TCP.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-6wfj-rwm7-3542

- GHSA-pjmc-gx33-gc76: CPU-exhaustion denial of service via unbounded
  DNS name compression pointer chains.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-pjmc-gx33-gc76

- GHSA-jv8r-gqr9-68wj: Memory-amplification denial of service via
  unvalidated DNS header record counts. Please see
  https://github.com/c-ares/c-ares/security/advisories/GHSA-jv8r-gqr9-68wj

- GHSA-wpr3-8q3r-4q8c: Memory corruption when an application cancels its
  lookups after a connection failure.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-wpr3-8q3r-4q8c

- GHSA-fqh5-3x7m-wp44: A DNS reply that arrived from a different server
  than the one queried could be accepted.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-fqh5-3x7m-wp44

- GHSA-97vq-4mxv-7vhm: Use-after-free of a lookup after shutting down a
  failed connection.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-97vq-4mxv-7vhm

- GHSA-rf6g-ww74-97qh: Use-after-free when an application cancels
  lookups from a callback, or shuts a channel down.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-rf6g-ww74-97qh

- GHSA-mw23-pfg6-2x9r: Use-after-free of a connection after the
  socket-state callback returns.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-mw23-pfg6-2x9r

- GHSA-v33j-65h4-4ch8: Use-after-free when an application cancels
  lookups from a server-state callback.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-v33j-65h4-4ch8

- GHSA-pj7p-v3cw-hq66: Use-after-free of a server record when an
  application changes its DNS servers from a callback.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-pj7p-v3cw-hq66

- GHSA-grv7-fq5q-9vfc: Use-after-free of a cached DNS answer while the
  application is still reading it.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-grv7-fq5q-9vfc

- GHSA-ph6c-3cvx-mq6v: Buffer overflow when ares_dup() or
  ares_save_options() runs while another thread changes the servers.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-ph6c-3cvx-mq6v

- GHSA-cfcv-8v2j-qj6r: Uninitialized memory returned for a numeric IPv6
  name with a prefix length.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-cfcv-8v2j-qj6r

- GHSA-wrgc-prmw-27xh: The query cache could return an answer obtained
  using different EDNS options.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-wrgc-prmw-27xh

[1] 728ea9f901 package/python-pycares: bump to version 5.2.1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 304f0c7a4e4ae791081f83a12aa54ba6e5620e39)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 7bf4163e55..8459c18393 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5  c-ares-1.34.6.tar.gz
+sha256  9364b70a12eb59a06830fb488d9357f90100dff0d98b23ea3593a183d43e6f2f  c-ares-1.34.9.tar.gz
 
 # Hash for license file
 sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 1653b16c28..b977c3a122 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.34.6
+C_ARES_VERSION = 1.34.9
 C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v$(C_ARES_VERSION)
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom

--===============2257029719570605106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2257029719570605106==--
