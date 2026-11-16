Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524C606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ap8BFZLs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D60DE406A3;
	Mon, 16 Nov 2026 14:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXufaF6RGyHH; Mon, 16 Nov 2026 14:32:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CCF76406A5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839567;
	b=YI/v67ZFUdiZ/Tn1zSE3mQb1gZjONXUEvrPPqgBKANL0vtVDamVKIUWHUlGFAp13HImr
	 Ea46LEPsSJG1ML2qqSYQtsBPwyvxEcFdy5TmYmW6w/p5wZMsZ5uP2/7FQfn6zIeO4/Vx3
	 tywCK/dFJkQxshVk95SnyMZy1sHB72R4Yew90k31IY4UM1Dxgp5h4C6yxCCDcjJxtQCUG
	 LpII1eq8be+NdLqVn6jIbRGN4VMG7PznoohVPS/mUPMk+QnYJ2y0NaU92RRvFvaCKGpLJ
	 B556XXxKqKDsBGbbLEwrfS0BboxyrZ/79bejTDZN9S+zXK38/CNSazyRl9680Y7gWgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4Tlf/+I0+OrqRZx6L0RFnYi3dj6yNN4xRXUFcnVaIqw=;
	b=s+3yUCoE1pkE5T4Ya8c8v5uNoVMhcrSoYpj+BdGMY94cqEbUgRPExBV9ipVQuiUapyVH
	 V0Tbmwnxg6D7vIIRo3T3AMyl9x/XjsLKsZ4eHPJsw3ZGeRJk0F464GoT4abJVyBlop9XK
	 btf5fLFeJk4X4tpLrnL/Ew6Cdp/H6MGBQ0XXHj6UbURle7rBtsAtlRAOcUbt16DaW8QO6
	 nLBCm6ZyoY11FjddDMqZOIO/d9g2BxYH7m9zT220M2f/3kwucmksVzu784Wm8XHJdoAdF
	 mY59I5BY/GMcRZ4jvA2CExIHP1ndraOmgTBWzm8H31p2HWbXHJlO948+008Sd8JaPew==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839567;
	bh=4Tlf/+I0+OrqRZx6L0RFnYi3dj6yNN4xRXUFcnVaIqw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Ap8BFZLsk5HucBDongr9zhZuj0gVptDMhDNymOHLJ1u9kWO86GxwseuZe97MVnwpM
	 XeWFmcxbL/nHfW8LLKg7u09Rgy67zVAxJ7ugW1HnMpfNEqUxwo6tqdpS3qNqy6p76x
	 BcVaKA6gO7aEHvnWRRUrIp2nMTH6EWCIe3BbUrOJrBWcR+VAfiW33WpmxS5vL8rWph
	 Jn9wjisMnYZvdk6k0vJemmjlwZjwa6Dl4JQTydBZMhi321fZPOv+CsRl2gQVKh7sMw
	 mZhVBTMQCZSXE4feQa9dh3gsWSm6YlCxFbesTnlYPKSSkNrdxT4mZOkUzu/dU5j8V5
	 fMS39/wlXOkrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF76406A5;
	Mon, 16 Nov 2026 14:32:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D76B728C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDB0380E75
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EigRBNQ5Iowe for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:32:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 748B880E49
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 748B880E49
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:32:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4ba013938d7so37563545e9.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 06:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794839562; x=1795444362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h78rf08FyGoo/G2BONTkDkHd6qGhdDBTNn9K/2CFuoQ=;
 b=eDlX1+mBL1SvLHvmDKTXWnwUTtH9lWSqxvMc+qxCwYWWfhQFbVIB4oPGJ2YlZ7lUM+
 F8ow6ePPqNvseX5l6QU+Gg48G3iXotYcKu3UaRRNmniSvuK5CTc8SDFCOEhLbv2J8wyb
 jp5TGItMs/2Sm4gGRTgAc2S4MkB5faF69tGLdxIvksRPs1osLMRkkXsei8eV8tFe0Zrv
 ALxw4MOV07NGl3qm2feL4gLOkIkUhA7LtqjDJWLaccQSF1GxA5AArVFM3d8lDMUJ7xe5
 Nv+K9b/uWlS07owie/+EI/Vvj9Iw99ABH+j/cyl1TSAEXB7l6SDyqe58yNfOdZZo1iuz
 ciSA==
X-Gm-Message-State: APuU4Z//xnzVcCs66es22Gyqi94jeWQgG4+UL6iYzHIqzW/E3vDETPl7
 Q/RL7TijUBvICf+33Q2p354Xfa7Oi96OpTrU3SnPPO9fj2S3AaT0lw7bDRBOXC1E8l02VJymd1C
 ICP74
X-Gm-Gg: AYBFou3iSGBORWj081e3E/To1oddyK5MyJROxZcOfXjJlCYYJkel6ErHGTxOqTBs0DB
 vbvG92eiLvJh9lLlW70b4jXprysVBkYTqMyYR8jn5s6/9TFy3hNt57LA28SIc/lpi134NXePaTg
 Sc4dBDshUiMM00754KJSYNzPBEoH8aeFm4B5BXRYCo8sEI4OT5ODm8AMVdmqjpfHYdjlp0lZapX
 +albGZlFzg3X6jNeqy+9n8AfWw1bCRwpMDZnP8I8NQNTTgGvyP4np3PSmwRKcGPTRIRrsxxUPQM
 uC+Uz5XsWed6P+5ERk7171CwVRlfy9dO9W6349CuKi34eANDzy3kkkLrcmXPvZHOPZ4C5k1pEVm
 i9MSTeXhplwF83fCV4iQKnPIx5bdAKjFyG6ObUa4axN9JjP46cxJOc2E+dhUgQGMFg4aUWY+PSs
 zmWEgJ2rBUDMWQlLEG+IX4OOFCNA3qfbq4F9mmKJy7TjhLKGdmEUacLHRr1XXkiX2IcExMPyETQ
 4y0yfOgRUoijQ2+y3wyk1SM8OzoVXrYMPDVTM1VQVbWHaYtKzDpltwecMVJcQkHBCiQefBgq3bF
 0q8M82240nhUnF87dRvO5g==
X-Received: by 2002:a05:600d:3:b0:4a1:ddaa:571e with SMTP id
 5b1f17b1804b1-4bb55a50eacmr187230205e9.15.1794839562157; 
 Mon, 16 Nov 2026 06:32:42 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c609c602dsm22065410f8f.46.2026.11.16.06.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 06:32:41 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Nov 2026 15:32:40 +0100
Message-ID: <20261116143240.968418-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/{glibc,
 localedef}: security bump version
 2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following vulenerabilities:

- CVE-2026-84243:

    The gettext family of functions in the GNU C Library version 2.0 and
    later accept LANGUAGE environment variable entries that contain '/' or
    that are equal to "..", unless the program is setuid or setgid
    (AT_SECURE).  An attacker who can set LANGUAGE in the environment of a
    program that uses gettext can make it load a message catalog (.mo
    file) from an arbitrary location in the file system.  A crafted .mo
    file can crash the program through out-of-range offsets, or supply
    translations whose format directives do not match the arguments passed
    by the program.  That causes undefined behaviour in the printf family
    of functions and may allow arbitrary code execution with the
    privileges of the program.  The safety of message catalogs relies on
    them being installed in trusted, read-only locations, and the
    directory traversal bypasses this.  The fix for CVE-2014-0475 rejects
    ".." path components in locale names passed to setlocale or taken from
    the LC_ALL, LC_* and LANG environment variables.  gettext reads
    LANGUAGE directly and appends each colon-separated entry to the
    message catalog directory, so that fix did not cover LANGUAGE.
    LANGUAGE is only used when the LC_MESSAGES locale is not "C",
    "C.<encoding>" or "POSIX", so the attacker must also be able to select
    another installed locale, for example through LANG or LC_ALL.
    Exploitation also requires that the attacker can place the crafted
    file in a location readable by the target program, and that the
    environment crosses a trust boundary without the program running as
    AT_SECURE.  An example is an SSH server that accepts LANGUAGE and LANG
    from clients through the AcceptEnv directive and restricts an account
    to a forced command; the attacker may use this to escape the
    restriction.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-84243
 - https://gitlab.com/gnutools/glibc/-/commit/bbdd55995f66a155ac043a49a8084e2414f96cde

- CVE-2026-100290:
    The regcomp and regexec functions in the GNU C Library version 2.3 to
    version 2.44 may read freed memory and free the same heap block twice
    when a memory allocation fails while a regular expression is compiled
    or matched.  The re_dfa_add_node (the NFA node table) and
    build_range_exp (bracket ranges) grow several arrays with consecutive
    realloc calls and store the new pointers only after all of them
    succeed.  When a later call fails, the pattern buffer keeps pointers
    to blocks that were already freed, and the error cleanup frees them
    again.  In regexec, the back-reference cache (match_ctx_add_entry)
    frees its array when a realloc fails but keeps the pointer, which is
    freed again on the error path.  An attacker does not need to supply a
    crafted regular expression: patterns large enough to grow these arrays
    are common.  The failure has to hit a specific allocation, though, so
    the issue can only be reached when the system is already under memory
    pressure.  An attacker who supplies the pattern or the subject string
    has little control over which allocation fails, so the expected impact
    is a crash of the process.  This issue affects all architectures and
    ABIs supported by the GNU C Library.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-100290
 - https://gitlab.com/gnutools/glibc/-/commit/92b93a3bc26c9f56e8347bc47ec047f9639fc6da

(alternative to commit 43f47f795cee1422416b4f7c7d1fa46cdf54acd5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 8 +++++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 5e7549cc42..21c70b6612 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  8b3bbb074671878413901ece2b757b6196f07953f2205ba95ec1a6f79b799790  glibc-2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d-git4.tar.gz
+sha256  8b3bbb074671878413901ece2b757b6196f07953f2205ba95ec1a6f79b799790  2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0c702cc1d4..3ed1fc1e46 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
+GLIBC_VERSION = 2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -87,6 +87,12 @@ GLIBC_IGNORE_CVES += CVE-2026-77117
 # Fixed by glibc-2.41-158-gec116a0fbedcc860631e525e70b409cf295f27da
 GLIBC_IGNORE_CVES += CVE-2026-80489
 
+# Fixed by 2.41-173-gbbdd55995f66a155ac043a49a8084e2414f96cde
+GLIBC_IGNORE_CVES += CVE-2026-84243
+
+# Fixed by 2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da
+GLIBC_IGNORE_CVES += CVE-2026-100290
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index a4b871ccc7..9467ae1b85 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
+LOCALEDEF_VERSION = 2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
