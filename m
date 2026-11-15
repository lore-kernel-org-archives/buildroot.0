Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF01606A31A
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PpRHra0i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=HTlyglVZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE499810B3;
	Sun, 15 Nov 2026 08:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbFShUiLtcZd; Sun, 15 Nov 2026 08:23:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 04799810AE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794730982;
	b=W5x1lUYGqARZhT8qXc9xwAWXJvIb/3iULJe4bUIgmPFaffTAViGrW9MYRRQtlAnJTiff
	 EEciH/+upGamCTCvFpZccJQJnpCmnVcSDdlDNT89+owN51bV2k2q/wrxWfz2q4uF0/9eD
	 VeNOMHgwwU/KYjYoCk0ZQp4k98QgwwvsFFEfxFNQ6UYSddOgdaCDUMr901dvNxyoUAB4Y
	 063zFZMGc9ci3Odb9iue9TEwOv5RWIcBlD5S663CWjO3xqwGHuzNBpKUxN4pvQkxEuSOM
	 laVef6hPTmxH7nGW+HQANI4ILlLbjNGKOY4cob2O2mmDCNjJHLvE1y1tohUI32AZ4zQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794730982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kyOC7yUevv/S056326w19vKA1QVV0oWUV4peW0ROfCQ=;
	b=EbHzdInoV/z2j9HAJJ2gSTwGbc1X06qrzr7Y2iUpB7bJcAJ81jYuwa2qN22zbYlIDMTD
	 wSoYqH8rOrqx9uJ6DxAyYRqFknR4VoFgO+R6k7gp16uHwdt8YmSXdc4OuLKctcY+AIQS9
	 sYBPmTCOOjbhtjh39DKiiZ96Lyg/PsExkfC+Jgs4j0KM5P+SAN+Cb95gbN0F5AYx5RBUw
	 VpnEIq5hGJICBcZkZjinZ+nq64hFt1V8REkkxflecRR8GHS9lIW95O5YmFr0FrhZbSLFO
	 QDUM14Zhu0ctdAypDcd9jVFoOPok8aM2Asn0JosZFmHkVGc+lv7I0TplxOPsSI5NGbg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794730982;
	bh=kyOC7yUevv/S056326w19vKA1QVV0oWUV4peW0ROfCQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PpRHra0i6KdJ+kUOQ94loRpPJTJK6Is0Qvz8sHa8MYaNgTV6AETAtfzWUfqT9fv/8
	 3YwS4FsUL7XupGaNnvIc0ZYce749GiPUe1Dm5utL0io/I1KIznT/1rtCZ6KuiQEtc+
	 4bFHp6FTge22dbvDm9X9jNcsWa15VD5sEXnyUJi0gqvn2WvzN8Uw0P/R3e9ZAZWRKi
	 3lyECnO3A7Nk9bElG9aaKpfU0ayGJreLGETYTuiwPZtWM72lhFAn0vUjKqHxubWn8M
	 Yqc50LVapSRSawjlRotWwixsrjQvpYzJMdoCFFxHi6Ys//0a26T6IvjM52K5oY27gi
	 bgn07KxqE801A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04799810AE;
	Sun, 15 Nov 2026 08:23:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E3082E5
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16E4A40079
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXOaJ829-BQz for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 08:22:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3B75A40061
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HTlyglVZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B75A40061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794730975;
 bh=+wbnzSbaZD3wALZNYio117UcIoSmyYaLx/+CROWe080=;
 h=From:To:Cc:Subject:Date:From;
 b=HTlyglVZYQVSqAcOgYulQHoh8mwm3Ttp59NMbyTTarsA/4LbJxd2kckf+NXynNzxZ
 O4gPrggQ/JryBRbRZWV2vApKqkzHGft7M9G1BT5kt5UtNrAP/IaVvBuSXo+sDmeiJC
 r84bLpUwWJiRXeqPd8CtbZc3tsiRzjp/t0v/0E/ez/ILP2TMxzmV1hkS+qJ3QyhA4+
 sYxhBdudidqvDzYOJjfzEcnKyRVyKkVYXrXNawnKuokBIHVR8RyFMZeMSAklvwlGWZ
 bJuuNdOaBcRBHY+DA1ZhhfxtKJ9LtwaGSgyr/gRyPmFbhaJMpx7bzFxduwhFc4DgVR
 7cf1D/sZ2TaIw==
X-KAS-Sym: v3:f51bdf72230551df:HkQyKNzaFhy2OF6q4EdEPIwIse7Ff40dC+6yGu5vbE0Be
 nTzqvVEac6/BMcdYml2Rlq6j10wsjM87vTScU2ZjG6GeHWxSQTlVExr5qkDSXZKlk9JyPEibVV/
 0j5uZRZXUDWjA7m71008bimz5PHE/ZApbKah2OwdcV4oXTI10UJoAdgX4xxZU3mj/7lIJlUEscU
 OVIQEbZkUcHK0RkqpX1Dfyr/CsHK4+7VleURxIVT8Pq3mLTc1kLMV3sDz7hf/wPr65+Fk7QuPTW
 3CWsafe3fO/alHcrMhl9QvuJat+2QZ19o9sWuE49kqYyfPr5Q3SF6DO3jTrYQXM9Hn0yIzwQ==:
 KbARqacm+3Spi6LCDbJkzkGK2gFCzLkL9jDdwT3skXO1feeCKCbso/orYC57bNttWmqfvHGOUmI
 poVCVJHM1HzuvE8YrX7C4iy4itOQD5DPHchZzs63pD/Wkdnl1nad8zxQ3uDlFFJd7jikbVE7VvI
 RyVVwvk0fItXiWQL1r4/1BvZwstmPdEOu24vvTk8fPG20BpKFSpLSPdO6A5eQkFd9O43KoEJ+YO
 mXqwIsK+AbH1YJ7LP6CNcs/Ze3LesDf4SRRvIU6d0zB9+iGL/bFckWhbf8VK44O8VGOQKxwNeRJ
 W/d/hbv/JaEyJBeerlbYujQHjimXjpJjtJZOoIUgqrPNhumAIcdQzcEDjwGGfzt6aGzTrTzX11U
 ajCzPt5JH66ein+lsRGmgRMAzTnr3L4EzRm5+IB8N+Pf3zvhshDUInEI5uBxHMlHmXGXPolCAaD
 s1uRtgJE4R3ExGq7GT3lx1qDvy5cqNDG4YrfQB7mQwW4eEl1QsRAnGfHzpaJu/0/3DhWRDAToIL
 KuCQ3PR19UNYxBjG+ltjUoN0qXo+kcttc5+CW2WoiGkAOuIiT9nvaJ47abwf9og1m7dozXbSlwE
 m3CXbpRA9+nLGXkcBQf2M0AMBi6HuAIdlhtMfl0eCsm8mDdGN927a24rqoM8tYrMbMq9UTVI4nx
 +1Oqn+ZVSiDGSVw/ajPJSXNayow==
Received: from fli4l.lan.fli4l (p54a1b069.dip0.t-ipconnect.de [84.161.176.105])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E4CAA4C434D;
 Sun, 15 Nov 2026 09:22:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34016)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xSVVn-000000003eo-1OIG;
 Sun, 15 Nov 2026 08:22:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 Nov 2026 09:22:54 +0100
Message-ID: <20261115082255.32679-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/2] package/wayland-protocols: bump version to
 1.50
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This bump is needed for the upcoming bump of mesa3d to 26.3.0:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/347b5c45fd2bba731a514861af15851ec7fee65e

Release notes of version 1.49:
https://lore.freedesktop.org/wayland-devel/Sb0TL9RxdBgNMuAKZmlfhbXVQoqGTjMaoqWmu6S_JBcYNv7Aw82KvaXX5zHaBpjfl7aF9nzz1hSgtYxQalwMUTiOpritlvtoo_Q-wQCX9EU=@emersion.fr/

Diff for version 1.50:
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/compare/1.49...1.50?from_project_id=2891

No release notes were released for version 1.50 so the tarball hashes
needed to be computed locally.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 2b29785dde..8a64d95445 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lore.freedesktop.org/wayland-devel/ac0NAPBFafhcgzE3@gmail.com/
-sha256  398036ac0eb6484982ddbde7ff86848d753231f9cdeeae983f06b52946625aa1  wayland-protocols-1.48.tar.xz
-sha512  24950c6181f576f8926e2631a3f017986f809cd4fe8efe6fc8e4d872e98aacabb9eb79877371fb5def1fc78027c8e1e1e25bb98d455c22624a810707be0b2c24  wayland-protocols-1.48.tar.xz
+# Locally computed
+sha256  4460c20cfcf68b994a5ee206ed15fc19ad312f16c96075186e83b0e3f4aa48a5  wayland-protocols-1.50.tar.xz
+sha512  12cdc1c1d45e547f4216445f8f21a58cf3979bcf291ebc0270eda716af2fa39e482eb37c88edce9768a299b8da832421ef3cac64eb3abd5b2230a5d5f488f171  wayland-protocols-1.50.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 5ef8990066..ee7b3fff57 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.48
+WAYLAND_PROTOCOLS_VERSION = 1.50
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
