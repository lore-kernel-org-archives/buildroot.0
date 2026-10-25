Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF329606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gU7czXrn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C63E481567;
	Sun, 25 Oct 2026 09:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5X7HE_RTNYV; Sun, 25 Oct 2026 09:51:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D4886815C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792921880;
	b=BpmPV/wt8/titvoXaLHDDkaDlhcAVmX1neTtjyn/2f7PtUxvIBEnrevdefRzWeGM6d/u
	 U8665w8fwn8qm5QLQhxwmL+GWXPzb51PBPvTIyAFCQ/l+FYp1d+zs6NPGFMdGy2juH9dd
	 fsVpehXrJGqVWPlEIkBR1IXEfb2WQzCvDqGt3DqwWHYIybXnt2mThnx7lHb4bpoCO56Xu
	 epR9zRFWyPBCd5+mrm3iRRr7nD8MKr6sXhXf3tBkJ404JC3perzfk7Q6rAA/itMZYEqoo
	 CiNZKJ0HfpL4Tk3Jiw8nVZCzzJCAzpbq+kDMyxCoOBU4Dez5tB1vbNP/IeSSGpRTytw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792921880;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x60ymnaZqXZ1YhprdEXc84YYvR9H9IcJfsYtvWvpv0M=;
	b=GljK5uMw+NZhCEofDw9H3djaj9531sYN1mmoMg7mIKsxnHbZTS62TFgKZ/Yy2xuDE1OO
	 wOfLIBD59LwqAgrCtrBzYFNNbS+rTFWggJ+Ql/7b9GgLo1pDCMJJr2IpP4YJ4+WgKa8tC
	 if8YcQ/Ur8udazzl3Ao7X/fODPZHMM+um73G77zIzNG9ti7103UihNwgfHvvGYi7l3Uiy
	 T7b/DuSz2H/cHB/BEHdtojaCTQn0DOYoIkGiE4KatoxAYkaV+4XaHIshAZOEJ2szfuZVs
	 BbihpoIUwt04LPuj15oMsKSV7M82OScQERbuMl2j7t6Y7hjqhMyh9LSxZbYdUs27uqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792921879;
	bh=x60ymnaZqXZ1YhprdEXc84YYvR9H9IcJfsYtvWvpv0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gU7czXrnuPevbg4DiDDLh0MnGJ0asPYT3CCoMPuIkVYktPdMewQj/NOmJhukKIs3c
	 wT++mRDe1Z2UCiIj0wgBa4sbvV+cKMur6s5krTSCD137X1ZJ0VFMUZinXrfWf+//1x
	 kLH8CIOJGKj90ajItVDDKtwr/FCfviQol/8aqu9l51cDDEwx9tdpyq+5V/tBweIdpB
	 N76grwE5KoAkKkI1QAP+KE+thRfNKp9u85vzqRVVK1DL0BvwWlXVpPP/P3wnqhwcmy
	 soHg8sImKqWc+s3HuuHAjwuayQIZl+KlizcUgQI/V/EoiRlhM1jJSMKtMmMeg3yhOr
	 pUCrecISNWJQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4886815C5;
	Sun, 25 Oct 2026 09:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE6C62C7
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4677815C5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8ZbtWdvZuEX for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 09:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AD3BC81567
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792921876;
 b=Wxwr5Zxa8oL7eSL0uvfU1RO9Grs0leIsePvMRoMfGEg0kJkJDA2vni2xpVeufFTpdep+
 av+741i/R7foG6dXibXr4dCEyfLQ9QN0lw6KPuSEsRF8X/gQ/I14QvLlAOexlbFDwsY5u
 7Ot9dlhycO+0cFeQdhO7sdOTgHjghhO8HkcrlrKZQnPVsXZVGTog9lUGaiKAjqkTLXpvy
 E6+YwfLYxGKx1XjYTegMMMoDJowZOzLxKlJ82slwES3tI/rUdY01cZHUnamI14dkFKym0
 b3IwIgJyrNZ8PFSGUAKSKNehXt2e3ZPTGRpym4q2VYHN+BCDrEuxzi/iZn/liMoK+DQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792921876;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=02pXCIDmj/wEx3ZAZmm8l2HRR6cjYnHjLB4ixhhF7x4=;
 b=Xdxhj0A5+qH5VV95je9iI8hSAtbT7N5dFlVTr8NtzWkrBu06QfQ7kktvkWLJetuN/0ih
 0A2lMPao5W1wygMvfmcidV00/eRkCeXtNoFIBkg6mPKXvgeC8KhpSi5ErJEKPwyBIYGqH
 xKGWBQmNw5JO8w1Edbz+7DKIxujWSMuJW0ka5Ti/QpuiVsViAN2Vw9t6ELIe9KZ1Qa46o
 4K1Ov8cjSQqZ202G9jWxrhZyKzZ2b9X7L6NfFvuXRdjrtORPBXyQTanhRLrntYa5UZhii
 9E87xfb/4kBsnfdMXgdZfjfGZCJOiIOHcF3PaRsLVKmb5y+IHPxrUaZqPwob99+xwYw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD3BC81567
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35F119CDF5; Sun, 25 Oct 2026 09:49:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 10:48:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 728ea9f901a32146aa7eebc6b2d746764f41abb7
X-Git-Newrev: 304f0c7a4e4ae791081f83a12aa54ba6e5620e39
X-Patchwork-Hint: ignore
Message-Id: <20261025094951.35F119CDF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: security bump to 1.34.9
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/304f0c7a4e4ae791081f83a12aa54ba6e5620e39
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
