Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F054606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=grXkflo1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=eq3UrR6L
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECD50606E0;
	Fri, 23 Oct 2026 18:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqkDUuenGiDs; Fri, 23 Oct 2026 18:43:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D7D3D608E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792780996;
	b=DBnjn4nWZ7Kz8sugkz4vbzDf50X2cIxVwBj0EtFben5I7AJQsjBg+Or8EJr5jm4C2K7H
	 OWv00zzWDHm4WFOBRlkJlN1ZMCExaypOX3c/HINvFKoP1QLxQmSYxWZScdBUfdyvdEYqd
	 aKfmEbdlup2G99tEeENeWSMkf3ZaurR7YaenpFmd6mv0cVJhbhHoNrOepZQCejlaBbrB8
	 fYpS7CGCSV4n66iqlWsFyAMQCUwzgLbU2CfQg3V75i6tRLgpguewclD8XSLusQDfRfrHx
	 srfIYAmBpVlGYz8WvU0HGWMYFnOUekydaA3ddoOcNaDXVCQViz4yHwIqQ2Kx4+1G6BA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792780996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/xGeFU0ptlZUaLZReeIbSTPj/pCyrHe704eSjDzT7kc=;
	b=YEc2gZYImhzV7iqB+2fGO/r0qbBwLaRcFwReWzHTpj5m/9Re1EEt9h3UTZIhxmYSVeGp
	 mZwEr8P/ySzrCK56Hr3kgCTISMagoiKb1HCwqtv8p7VC9Zk1WdLXBxR74HEkLaUvSpNDf
	 xhbhYFGojTO/bgDgfFSY1oANDcZprrteoSav9Pmeo3SAqXdAAJigtgzFYXVWfAFGiOprM
	 C+SQPZmKbzDjsNSFwurvWRaAbAWoP0M6utZNST4K4g95v8ITaSya7MyDyDA3iL2Vjl37I
	 G/Ux5VVbpGHyDgn4g7yn4WV9a8lC4tSdorbWmczq9TUxntPG9QUcAAPSEULbTQZ583A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792780995;
	bh=/xGeFU0ptlZUaLZReeIbSTPj/pCyrHe704eSjDzT7kc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=grXkflo1EYUa039rIbZl0oKYrS9pwiRYQXLlECMT5WzbAW9OU5oMCt06wlCoFWgai
	 iDvEl34vb8FGxbIFvoPDKvPWraLVeXZ9X7GEVQwNz1a4TI5uqP1q5frBULDbe5ebzN
	 Frqyq026Ch1ncLSaTCdnXWK0vrzBQ210tL6nh04k6ZzcFNVtONixbJrWBQPKUaTYTD
	 jFo2NbdJnX5Tqy+8QijlaymOHLa7p0Xzlf6gXu06HcobrWh55U3HdZc7fWjVEDVZ3g
	 feKtmcXyLKAjun1iUuLTcM4k0QiCCkB0UM1CzYLBGM8xurGhhgBMjtAcAp9xb6P/i4
	 MudEygA6OL8eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7D3D608E6;
	Fri, 23 Oct 2026 18:43:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2FB79F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D30240059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymP5vqeO7uAQ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:43:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3FE784007C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792780991;
 b=dRk/59iqnVP3IAnlRe56qhfA63eGR596WZt9ZOk21GPAqBpHc8GQI0+EMIGcSCYf/eNo
 FNsJehhUHsEMLvCZQqa+KNOvsT276M2QZ2DbLLwvWOGS07DaC/UQfM5lAOa5HKQuPEswv
 0J7AL2U2SOnddzopEaJ7h1WHWdgG/AQBM9lHlXIy10e8bWTlE2gH8RIwdCiMxoWstgFVR
 n4icWUH8/NPNaGkwJ0YE7b818r8FeAGJD7D1WfiWdkv22BmSF3+yHMLUA0hsMV+JSQ+Z2
 eGKbQZGHUAP/qKdMEskq+IuYTww8KOUhdfxrqaPgM9TdoD3UA/fdw3TcJQZiWko3uVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792780991;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pA0yDW2zEfnjU9yhtqFvDBQRLtc0sZhjsRTLTwuZo+g=;
 b=kMfKyhY5kmVlVa5OgP8CA9smVpuE+QU3Y3gAf+D40f7FEecdEStjoYFiVK9MmAeHREo1
 o7elU9pRzdhEZ9xH0MgeOAk/5RQPJMe8sjhRVY9R7fTi7EfUCyJrDv6YkNIC9zxAq3fVL
 eiK+MmZX592kD315mjlukjFKMRY8Wokudl3FqQvT3z9sSvFvW4h/whZPrEYUa8tMFTMkN
 nipGdPs5652P4XpYXAxjFYh0p+JH7hvMtgzHvRrvhNY9L+r68H/7NUM2pjKs+pGJFKjvC
 qRXYKx4A611Egsi9XDhH9VIJJ1vAjAZUFrEyQOQWfEOWbrI1B7ZreHs2/O2FGbA4nSw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=eq3UrR6L; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eq3UrR6L
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FE784007C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:43:10 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c450ab1483cso168280566b.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792780988; x=1793385788; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pA0yDW2zEfnjU9yhtqFvDBQRLtc0sZhjsRTLTwuZo+g=;
 b=eq3UrR6Lw8wvjqebf/qU8JradRC5U4CyBPvrWj4rq7RtyUFDffnkLdGyj9Uvq4f4Yz
 LPUGS5atVF4IzdhxEbw52DJ1S0SOAwzxoFDPxEhNv3haN2DKh+0dSkIQuJbYUhkwXPkI
 zJlxZFq/Ji7qWILaX1niz9xui7tfNo2tbXrGRKX3g95V1UY7VWuDvvaBv0qaeLQY3CK4
 B/xVzAy6GjGQ645zo1j6p8kCPqqPnJAUBqyvFTd7AMEp/gCw16ug2SZZP+4Kr8UC4voK
 6YZ/DeCjzYiFQ6taxLM6hK2DStPa64jHGOwHenPwWlAS+M4DAIFq9OUErKA9KZCOkuo6
 XuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792780988; x=1793385788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pA0yDW2zEfnjU9yhtqFvDBQRLtc0sZhjsRTLTwuZo+g=;
 b=vl8r1btS8zNod+FKbBaI21lGdQ4UcAhPHeyNty0uzZhQwnH6biR79GvBeLWIsOsLn3
 P9G/pzRvKY6Luw/S67N62yEYeeAJi+HoxGoEZsWISUXf45M3rAShKh61hJ55oMxz4X2E
 WkdUIoHSqb4kEvjln38h69oI1cEdzeiD/2iv4BPc8sXkHbwPa8By43u96hwbQ+tWJTDn
 Pgfg3sxXQmNIc8Qly+ZgGntHqT+F/ANg5+C2Fb6vKx0y5yDQCBl+dCBue2W4pnbpm4xE
 fWBA0LhxLhsoW/mStQlSEd521JzxSs2Ne2szVtc2FPUQb3935ZoPQIISs6JInVuKcLVx
 sB0w==
X-Gm-Message-State: AFq9FYLvJ1p4m0UQ6v7hrsWPnszzMn0TIIfDHV94dXaMopXBy4tm4aoq
 g4bWJ3aJAYeUBUoBtJ5ePtgajD0IwL2ySdjJc10rVv9Kc1hFNcvIzQLIXPmtvA==
X-Gm-Gg: AYBFou0PqvE0gglPy0mJceugtUcYnL977ocoJdpGlYeSdlMtc83Lo+JFuiq+LznlaBv
 j0Gwzzi99RkqdEPXu5dQy+uVVFCk4r0He1eEV1tn585OwJsjZfyg6+Efz2KkPQZSS1RidD+H6Gl
 kZzSX5dAsQLnLT7lh6UoP2LHnNGG7kagDSGC3pX7uRVcdYWBY4RKDKTDiUcMcO3yKh/SO7CLiwA
 X6EG6EOtrqvVAWGPjdNV/mPZokUJp5PrlIeYgyjR3avzyCw1Pbc2sv9tNtVU/l8MNCfKLM6t3T/
 4FvpJG0KXRzBD96L4D43htpRbUiuPMooAgGZhKueIqfHVIh5/kr4OoB90DV4U71AJoUpLy3/G+f
 m5LO/lXFcF2tCKUb4zHRxHTzIysjVQPTqL22ZUOkxwnwM7S88ymikAOZIdYk2TXskFIMR47ez6K
 FMpQhGgJCTHv3QS8EOdrLVG7ceLAS2rHhLOTJZPzUsqO9p/mog7KjzrZXqNW7MY+Vvf3Sv+7/fX
 7iARRtrpho7hJ1KF6NH77EXpcpVoznLmzulTQQl2MDJxLiwDg1AsBtFWwtRxUbx46f7r98OxQVZ
 29d8wkCEXJhtnbBFECa2JqSS5ElSBMIw4Gk=
X-Received: by 2002:a17:906:f59d:b0:c25:2688:8212 with SMTP id
 a640c23a62f3a-c46a8a74cc7mr477175966b.0.1792780988013; 
 Fri, 23 Oct 2026 11:43:08 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46b8824718sm31622066b.12.2026.10.23.11.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:43:07 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 20:43:06 +0200
Message-Id: <20261023184306.2419659-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023184306.2419659-1-yegorslists@googlemail.com>
References: <20261023184306.2419659-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libical: bump to version 4.0.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Grzegorz Blach <grzegorz@blach.pl>, Thomas Perale <thomas.perale@mind.be>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libical 4 is a new major version that is neither source nor binary
compatible with 3.x, see the migration guide:
https://github.com/libical/libical/blob/v4.0.7/docs/MigrationGuide_to_4.md

The in-tree users have been checked:
- asterisk builds fine as is (including res_calendar_icalendar);
- bluez5_utils needs version 5.87 for libical 4 support, as
  libical.pc no longer links libicalvcal.

Build system changes:
- most CMake options got a LIBICAL_ prefix, the old names being
  deprecated: switch to the new names;
- SHARED_ONLY has been removed: use LIBICAL_STATIC=OFF instead;
- the new LIBICAL_JAVA_BINDINGS option defaults to ON and makes the
  configure step fail when JNI is not found: disable it.

The license files have moved to the LICENSES/ directory (the LGPL-2.1
text only changed in formatting). Also list the BSD-3-Clause license
of the new icaldate code and the MIT-like license of libicalvcal, which
was already used in 3.x but not declared.

Release notes:
https://github.com/libical/libical/blob/v4.0.7/CHANGELOG.md

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libical/libical.hash |  9 ++++++---
 package/libical/libical.mk   | 26 +++++++++++++++-----------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/package/libical/libical.hash b/package/libical/libical.hash
index 4c47c9347b..40063dece3 100644
--- a/package/libical/libical.hash
+++ b/package/libical/libical.hash
@@ -1,4 +1,7 @@
 # Locally computed:
-sha256  e73de92f5a6ce84c1b00306446b290a2b08cdf0a80988eca0a2c9d5c3510b4c2  libical-3.0.20.tar.gz
-sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE.MPL2.txt
-sha256  051753f11d7bb731d178eb3a972560f65a1dbc8f207b166a1c7c090e5d85f582  LICENSE.LGPL21.txt
+sha256  47c05bc96e41416578cf1803bb2ba3f8d292cb17d5ac2fca539dee922bae8a94  libical-4.0.7.tar.gz
+sha256  fe5ebb1ff742efb28112295d0f021c7b0171dbb3cbe27cd1dd1a628fefd3b4bd  LICENSE.txt
+sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSES/MPL-2.0.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
+sha256  3cf06aba3588c41c514f6946bb2d757b413ff6491647d474800f55edca75dcb4  LICENSES/BSD-3-Clause.txt
+sha256  87e24cc49b33d9d5e2819cdb390cfb7dcaa1fdf8d320782fdd5d6cdd0ee5585a  LICENSES/LicenseRef-APPLEMIT.txt
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index 56489b4e98..a8e6418352 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -4,25 +4,29 @@
 #
 ################################################################################
 
-LIBICAL_VERSION = 3.0.20
+LIBICAL_VERSION = 4.0.7
 LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
-LIBICAL_LICENSE = MPL-2.0 or LGPL-2.1
-LIBICAL_LICENSE_FILES = LICENSE.MPL2.txt LICENSE.LGPL21.txt
+LIBICAL_LICENSE = MPL-2.0 or LGPL-2.1, BSD-3-Clause (icaldate), MIT-like (libicalvcal)
+LIBICAL_LICENSE_FILES = \
+	LICENSE.txt \
+	LICENSES/MPL-2.0.txt \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/LicenseRef-APPLEMIT.txt
 LIBICAL_CPE_ID_VALID = YES
 LIBICAL_DEPENDENCIES = host-perl
 
 LIBICAL_CONF_OPTS = \
-	-DGOBJECT_INTROSPECTION=OFF \
-	-DICAL_BUILD_DOCS=OFF \
-	-DICAL_GLIB=OFF \
+	-DLIBICAL_BUILD_DOCS=OFF \
 	-DLIBICAL_BUILD_EXAMPLES=OFF \
 	-DLIBICAL_BUILD_TESTING=OFF \
-	-DWITH_CXX_BINDINGS=OFF
-# building without this option is broken, it is used by
-# Gentoo/alpinelinux as well
-LIBICAL_CONF_OPTS += -DSHARED_ONLY=ON
+	-DLIBICAL_CXX_BINDINGS=OFF \
+	-DLIBICAL_GLIB=OFF \
+	-DLIBICAL_GOBJECT_INTROSPECTION=OFF \
+	-DLIBICAL_JAVA_BINDINGS=OFF \
+	-DLIBICAL_STATIC=OFF
 # never build time zone info, always use system's tzinfo
-LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=OFF
+LIBICAL_CONF_OPTS += -DLIBICAL_ENABLE_BUILTIN_TZDATA=OFF
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
