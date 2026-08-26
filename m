Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4802DC61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F368B80ADC;
	Wed, 26 Aug 2026 20:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrO1OchuRQ4i; Wed, 26 Aug 2026 20:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787777406;
	bh=vZPMtKzXNvj+0PRAImpBRWnZxAdRnO0fPuwLKHpXqbs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wgj9hKaiOQwHovtVw7vAy4CDo0U0QZFJyZHf1AxhXWnmSfX92iVRmKatd8BiDzpo6
	 IDDhODvnmNUTs3L15RTDyPyWqt8b012onuR63Dqx/GoHNJnNuVQt7NHiYSI5T8cvC3
	 4+TERIWuzLhD7do5BD4opHkD7Lvrw2eiFTVPN6L8ZuGOXCJnUBeCnZBdH/31+EMD91
	 pC1MC5p8LhpSI9atIcNLFn83kzSQsJO6Esx+eCwVt8KBbXHDy56wEa6w09a2Ukb1mH
	 VNolg5CvLiMsEofkTeO8VXV5dmWMhvwg/839s3gWXkWboAh/HGlonP3WMOs4WXm7pR
	 ILeVQQORtztrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1420180AE8;
	Wed, 26 Aug 2026 20:50:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 801F2323
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65A5A80AE8
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeOfq-6PZqSx for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A184B80ADC
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:50:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F4C59205D; Wed, 26 Aug 2026 20:49:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 22:44:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02d8a41f0958f452570952f333cdf884f24f5723
X-Git-Newrev: d0619dfc6bb21e6b43fe75b19ee164521a59367e
X-Patchwork-Hint: ignore
Message-Id: <20260826204907.6F4C59205D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: security bump to v1.25.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0619dfc6bb21e6b43fe75b19ee164521a59367e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the changelog:

- https://nlnetlabs.nl/projects/unbound/download/#unbound-1-25-2

It fixes the following vulnerabilities:

- CVE-2026-14586: Assertion in libngtcp2 when under pressure in high
  concurrency DNS-over-QUIC environments.
- CVE-2026-32665: Remote DNS-over-QUIC denial of service due to
  `quic-size` budget bypass.
- CVE-2026-40691: Packet of death for DNSCrypt over TCP.
- CVE-2026-41637 Degradation of resolution service from improperly
  accounted client-terminated DNS-over-QUIC queries.
- CVE-2026-42955: Extra fix for CVE-2026-40622 to also clamp the TTL of
  A/AAAA records disallowing a one-time 'ghost domain' delegation
  renewal via glue records.
- CVE-2026-44621: Libunbound applications configured with
  'unwanted-reply-threshold' could eventually be abruptly terminated.
- CVE-2026-44687: Off-by-one error in 'harden-below-nxdomain' logic can
  shadow a stub/forward zone by a legitimate parent's NXDOMAIN.
- CVE-2026-44690: Cross-zone wildcard cache poisoning via RRSIG.labels
  manipulation.
- CVE-2026-46582: A wildcard replay, as another piece of data, triggers
  poisoning in the serve expired reply path.
- CVE-2026-50045: 'max-global-quota' reset by DNSSEC validation
  restarts.
- CVE-2026-50046: Possible heap use-after-free in an error path when a
  DoT forwarded query is jostled out.
- CVE-2026-50243: 'response-ip'/'rpz' can rewrite BOGUS answers instead
  of returning SERVFAIL.
- CVE-2026-50248: BOGUS configured primary hostname accepted for XFR in
  auth/rpz zones.
- CVE-2026-50251: Attacker supplied `0.0.0.0`/`::` glue triggers
  defensive full-cache flush.
- CVE-2026-50252: Possible cache poisoning attack by mapping source port
  population per thread.
- CVE-2026-52863: Memory corruption could lead to crash and denial of
  service.
- CVE-2026-54478: DNS Cookie bypass when combined with proxy-protocol
  use.
- CVE-2026-55708: Privacy/configuration issue when adding local data in
  views through 'unbound-control'.
- CVE-2026-55717: 'serve-expired-client-timeout' and 'response-ip' CNAME
  redirect could lead to a crash.
- CVE-2026-55973: 'dns-error-reporting: yes' leads to stack buffer
  overflow.
- CVE-2026-55990: Packet of death for a DNSCrypt misconfigured Unbound.
- CVE-2026-55991: Remote DNS-over-QUIC (DoQ) flow-control assertion
  failure in libngtcp2.
- CVE-2026-56416: Possible heap buffer overflow when validator
  canonicalizes RDATA that contains domain name.
- CVE-2026-56444: Degradation of resolution service when
  'discard-timeout' and 'serve-expired-client-timeout' are combined in
  unusual configuration.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 46b88900e6..85724ca243 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  0fe8b6277b0959cfd17562debac0aa5f71e0b02dc4ffa9c60271c583edab586f  unbound-1.25.1.tar.gz
+sha256  0d92275c703d5f5f8baba3dab22117dd8c29b495588a5c229768ed6581566600  unbound-1.25.2.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index fab6e67455..46fca5e2d2 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.25.1
+UNBOUND_VERSION = 1.25.2
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
