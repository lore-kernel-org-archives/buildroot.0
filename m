Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88075606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bklLexIC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AA081232;
	Sun, 25 Oct 2026 09:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1zdaAST3lWP; Sun, 25 Oct 2026 09:41:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 60AD481293
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792921263;
	b=AR3PXzaC99D8u9/cKAh0nm3d4Q8Rwl2c29kNF4vc5M+NXptWxla8qJee2XhVGpWUKpr1
	 wkTVVyj3fmzvRPPSI+vGOQAgrS999nwmdZef+zrPvjxM4Q2rJhr1od4McflXNjqwFiXUK
	 FQas5bXSRsvMUMOwh7ndaK1pFwuQ6+7i3vzy3ObD6kqTkdO1n2u/HGhgQUaj4ns38bbgY
	 4PepmEpwzxfh8Xmh0xa2D/Uuegtg8fPva0ImkAhq7del3pDnWbdpoaBUe2kEgloX3z+BM
	 V78WbZ1AQKDWGAyIejbIR4oZ+pj1uPyJLhJ5fV6hLG98zU2nSUyjUrL1lAT3IJJNw4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792921263;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xyd4ua0S+w7jiNTkWY5kxcAy6tDNwPq5RasQw2L5CrI=;
	b=lSL3f2U2LRlpD1ZOQBDGcsGQI4OchoAAixG2XLQ1c+JWcZ7Q3qqnbwS6keDtRaldqJWw
	 /B+Um4Zvi0HLEAf6eUwHZNEjBtv5cY+J3u+wssp8vF4EzM0RSsY/p7Q9T7wCgiwIJpHTa
	 4NBH4JxI2NbfBJhwov2MFGzYELkbflyNS8PjbVZ2+p7WxAkVAmdWWf3uIoPqwvTsdjh1G
	 0aSyiWgYMONPy3l4EEEnyeamQXeTq8T4pMxnH5TB9bIUCQNSicVWUKKaYhZJjpNgoD3ph
	 0Xb/EzRW7Bb8cH5Dz0RymFFPBg8Ve/yX87KtnSQoH26D1Czr9kvEIBY2kYs/zFbSCKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792921263;
	bh=Xyd4ua0S+w7jiNTkWY5kxcAy6tDNwPq5RasQw2L5CrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bklLexICS1fPjgcM5fkLy2rfHOReI/MmIIiXCs3zr5qMffTmu4wPRv3sDT9NvLrSw
	 htz9Q4bvjMdMcJfK446ZzpomoodW06I2UWYCGXPuIWPt0oIL4MAtgiLrvxIc26TvFx
	 +Nm3+RALguD7Tdih7Vg8s2XltYF4ii2S5jI4f0ZOcSRuAkiUw7KLNzjwqQgC2KSuSi
	 Gcp+yG75cvcrarMGMAYwBlkQeAdMePKONn1EPt+6pDxnDYGpIWWmUlbQSOiVHXoL9A
	 XzhMd51DtbvqKa4+IPtWk0pfK6QDNanNfKyoD4ErhpacGX0P0NI57NwWb8iPeFTY9h
	 qvh7QuyMKKwfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60AD481293;
	Sun, 25 Oct 2026 09:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABF943
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C85540515
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7G7bBpQStW7 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 09:41:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 94BCB404DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792921261;
 b=H5EeaeyEmEbGIcw8AjUl7y/vDuMi26F9vOrUKqL43IglZcg1QVnM4lhjUaPAoY7I0+Hz
 KKXgTc11AkVSZNgKH8LA6l7/c05u5K0Ea4GsPx9bIaWN6KCDQj8G5t55FFtOZnxaLMlGc
 QZofMJXD2V7miXVrFJDAzqoyiCnCZIEoAtLBWf9Rb7/wnN2n9CXNeCinRXqOnbIoTYbD7
 dO7VPsuhp0d8g2Rkw+rezpqSrK0qWwpC5dHWV4SRVTUeoXcYj3WI76N8QrB+k+sOSoFxA
 Lom3ihpCE5snauUmxqrbmgQ+G4FjBSgMMScCy+9rNFWHi3RPPJLYvQ7Ijm9DO41HWsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792921261;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=AJSGMYJqkqZb5rx0s25lC+o5QMeZ/JoeNwi3uNkqpHY=;
 b=H8Wtf2fTHAxkZ4p3sw98EWZ6Uiq1U0nAl/1l6HiotPv1XMSvvPxOEWZdI2OOBvpNajCh
 WJd45UaL7myxhUGB8eM83liWlIGZsHuGpsRsLepq9ydJ7yqcoBQYQFuk1p8l0lyC+N1uM
 ppggQT5eDt/sQ/wxtaBNODcSPb1NiQF0FHCZKQFngXOuKvKnf8O/IRkB9/ZNwIet9Viw7
 EpfMq19Un26q/GW1uT03TyUiKCIbpyDIf9Md+m40GG0+vWoUNRUu7X0unxik1Cud6W0kC
 DNbBi5C+x90z/VSrMcp+bNB6uCxTc8jdKBwKfqtGqIcky7kR3PxBvzCeFy1iOYQ1qUQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JLh+SgIN; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94BCB404DD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:40:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so19972525e9.2
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 02:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792921257; x=1793526057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=AJSGMYJqkqZb5rx0s25lC+o5QMeZ/JoeNwi3uNkqpHY=;
 b=WvaDysBocuIzsEbjhnnXBRFoLNcxB3T9o4sJ9D4V1K7iLaw2Cl0b8oYhCaC2rog962
 vJ8zb8mpCNqiXKdaG1aNoWYCHDQdp085kJVl7OncNfyb0U2qIa2pO4icA7z+UV3SBHd4
 wLnkR4IzEXE6S9K12njwoOhOT3J5nMa3kNC1Kv1nl7EEDo8qnhpeV9WC4t9WAokVc6QK
 4XWK2IOlZlzYV+ItwHgXOtI/Ku0f8sCtZvxcgAj3bblr/A6kKCI5AQaQPY3ALzJFV4jL
 r3wwmJfJqBkoGogbmXLJfy+Szq0V1GbUNzafyRKIP+crzgYRpLoIs48idakQwiRr+OsN
 UxFQ==
X-Gm-Message-State: AFq9FYKAMXiAr57reixSpKl/PMImdE7AE5QaPida8d1GpPEZMG0yyOTH
 x594K8dWYX9U07bKg205H82oYKQt00hO4OuEM52cwXDI3sDmixDI9eTUG8SbLCvS//XQXdIRS7z
 4VjHQ
X-Gm-Gg: AYBFou233Uj/EAKki9IWrgevJOcac2LKD4AM3a047sQxRGqbk2kWhIENy+pGY+GoLpU
 GdeBJk7AyzlFKNy/cqsLWNmhOfZ5dI+7UEw9yByHeYSQRsQSn7SaAPcJ8j9beZ203a4YtT0q1lt
 EXvNJyP3gKTBH0n8HlER8DxOT4dr0HGlqCqByTYWswYTLcBzOEq0A271u7ccq0liRQWh6o5d39t
 q6dtWHmf5wmsPV1xl825ZIrIcZxXtzC7zEUsoAJzSXE+kUOO+tktlEVH1KJqJ2iR9Ixsx3/gVN8
 woVqW8huw+QMv5zfyp3OwjqTSYHhy/QvP88Ns05pylOPjAIWQ6JBtN7vjKfrzqFkMMtTmJ3v2yV
 rsmUy12C63XTgFeFsjyKjgfnVj6jfBjhZv+3UfCnN1EYNa+++W/VrZsa8HO6RaHVB/sA5aCt/C5
 PTXC+fRt0AEyp0vEzRA+QNdG4NwQbKEKW8523xfbThxArzf5S9x2PtshVB/UXibt11jlZHLWd1L
 YJnF+3KYOb6JGIyzMSiPzgEilU9e/PjuxbqGHRZJIpI02Ty
X-Received: by 2002:a05:600c:4745:b0:4a1:da58:1ee with SMTP id
 5b1f17b1804b1-4a35acbe714mr69268135e9.31.1792921257416; 
 Sun, 25 Oct 2026 02:40:57 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a574088sm99759515e9.9.2026.10.25.02.40.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 02:40:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 10:40:56 +0100
Message-ID: <20261025094056.71854-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/c-ares: security bump to 1.34.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
