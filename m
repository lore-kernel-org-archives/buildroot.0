Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA7606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TcwqDqEb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DC081544;
	Fri, 23 Oct 2026 12:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id kiv9kieBDpFb; Fri, 23 Oct 2026 12:32:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 37E548150C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758747;
	b=NfXfIG2urFRM4ibgF+Q5zbtgjd4AKsOcF+xSNyt0LrYBSUy2XgQzINGeqKzZ0aP/UUXp
	 gnAGERty5PsZeUry1LcdEKKJVYAjs1sPKLo9yLrlNMXBp/XG+2MC5XRg0wyWYwupDqHFF
	 8NwzkURQrXfIiVDYSzraGjT+yvpjEId/8gJd/qKzkYWnG/BNzUhzERZxmHffrhnM3SYBa
	 UDofWizmjvO9ga6uP0VVjIBJrJuqmToSnwxmsPo5ypAIwLANqBMbCx+p8iK6vk5enApGO
	 HHeeLz5F1Wm4Eqw5TJ3dbHvYxmu+HViQl974R8Owt2qBfTDlClGpEo4lqrImAaSi5bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=V157zh1SXd7DtW6ExMBLp+BJbG1iscG2bOd7VN8yWU0=;
	b=Hi80B7XVZUNisS14TNKmmULbQm5iClN8odE1Acsz6p2fou0bbFRgmYu6le8YrsDSp/0Z
	 opXR/Zl1T5w6285qa5cH5jCAqGPlCTVR0ISxynmAPsxYG8FKnncOSYeRRYlYJZQd73zgr
	 oXL3Ka0HogWCbuebqukn8C3W0yGAlBWqHgEonqTZ2ZY1QJAl2Hr9psyx3/evSHWXapF0w
	 G7f0bbGYTLEma051305vkc7OVKhKqXdzhwc9X/gHY9XO+wMPleRO/PNLf+939p/icw/Uk
	 6fTT3fCDsitwKnFKLWDs+REWdqEosX53F2xWsG+z5LctMqFLQqaql3AN9CvK4FpqRXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758747;
	bh=V157zh1SXd7DtW6ExMBLp+BJbG1iscG2bOd7VN8yWU0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TcwqDqEba5589v6y4jXMpdFjaj5SOAXidjQ6oOrh+OJ+AZhjNE+Y/72OenLu24akr
	 Hk3KvHj2wwWmQRK+5ZlKo35PaYVuIeXNtTotFwSPynwNedJIdnLyLsBmtQ7/foHIj7
	 bBolu9qViUYN3CjpILqWs7GeSIY6IvkrK2L0vdWix3usyAO08K0mwsqS6HD+iOY6ev
	 FifZgMro4kTYgSNvCmNLeotgqcgybPg2YT9YIMaH5t5/wWjBltO90m0Qk0ypvIYzHW
	 9LciJopSBeUG9Ji66qImVjBumgWpnOn4dN48fTFRd8Z4XCmrl9WDAZ+OUfVnLELNog
	 jW03BJEQhxaBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37E548150C;
	Fri, 23 Oct 2026 12:32:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8142CB02
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66ADB40119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JKAAzlxqv0i for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C82BF401D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=GbXwmGsSDZ7Xef/RgkOgFS4un/ShcnMSsXhuNVgHLujp+b+ylXSeDWlU18ZrzW8ibI0Z
 OhGs+m2FP6EGSq3GderTVh/2DOkx5f0GrLVzEzPgw7jMm3qUvOZBRLN78tWZR3XikuX37
 gJA674cqPDWzJpTCeJj/Wj7LnWw9zfhjtQTowpJcxhtPHsTcJkFD9RRLdWRlImtt9Wf2S
 eTQOKKE+mPNk9JZ7z64vl+OETL83bT9jimpE0Y1Z4jNg1eY8ge6IWLStFjNVU7xp6q54L
 qHj7rHvRz8Y0hbQbvTOR8r99bXdqaiHLlqYc1cjYJtGSvnAta54rfv9sgZpCSu40Mzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h6xO5lOGrAUuJ4evjSQMjsNpe9PQBCcbmSdxx6ormMc=;
 b=cpitF8TOSoMMpfLWXmHFgwtPxtPzMmo0pHQIXOBzbu2gDZM7dWgGcFix+8P4BPPdlW4a
 gRcTh2Xrhed4Ae0M557eC6Qt4uBV2N8L8LaT9HhKtokULdKwrHT/hJA6LPO9naWDQbU2l
 Y60RuvqeMwesN+x8KGraZ57T0zYmaesDXbrro2IPQ19IWFRtFtdsNCqhxlYsSQzVyb9bX
 UtCeZIHRMvPFFjk58CQUdiX4wxyAPRB/CBtuU//GO6ibs0/arpteYm7SxI6w7w8+P9SpX
 qlkEkXr7f0XhCpJLayhiAbUHFasCXhsEdwTJnpP9uYbNVqwTVW/n3msdRV7aohd4cnw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C82BF401D2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 497069C66A; Fri, 23 Oct 2026 12:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:25 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a8f2764312114b446e87f5a6d2394536884335be
X-Git-Newrev: b16898fb478c215ecc82bd6d0967cbba2d2ac3f4
X-Patchwork-Hint: ignore
Message-Id: <20261023123042.497069C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libtpms: fix typo
 in HOST_LIBTPMS_CONF_OPTS
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
Content-Type: multipart/mixed; boundary="===============5559309208576232895=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5559309208576232895==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b16898fb478c215ecc82bd6d0967cbba2d2ac3f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

--with-... arguments need two dashes.

Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448 ("package/libtpms: add host package")
Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc7f3bc1fd5d4c564539c4f7796eb60a8ffef8df)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libtpms/libtpms.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 7bc69a50d6..0ece84ae04 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -13,6 +13,6 @@ LIBTPMS_INSTALL_STAGING = YES
 # Required because a plain Git clone is used:
 HOST_LIBTPMS_AUTORECONF = YES
 HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
-HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
+HOST_LIBTPMS_CONF_OPTS = --with-openssl --with-tpm2
 
 $(eval $(host-autotools-package))

--===============5559309208576232895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5559309208576232895==--
