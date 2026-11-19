Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AF5606A326
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VOAvMjRJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=R5Pr59Fn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E5260D5C;
	Thu, 19 Nov 2026 18:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzXXXH2jrP5Z; Thu, 19 Nov 2026 18:46:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 697B460D8E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795113965;
	b=f9VXAKpgw1D2wheGkmuUYo4mv7Y+w7EMNypjMFjdfIeWNtwaj1rcgwfKFWxUIMqvm7CS
	 qVRDgM+pmuePypkxrp628N0WVoFuY9JhVEif+SjvA/G/yWlndUrXNQV3nsuDTyhMtVyiS
	 2kcOPVxIlL+DNQ8yBCiWZSRsiptv+G977MkdgrpL3NP2RTTntcs5AyBoL5NjrU//ncIWO
	 5KZZi4kCK0jPeoEUg+VhwluzPWil5kht8MnOA0SndGb1DTY+XPGshP/9EOgvusFT5BgKC
	 9jnfEHVQv6TClxuWRHdHwKXVJfOAE1O1soffw0ouz1m7FTcDIldaINRJrZMmW2wX07g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795113965;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SCjzOAsZCI3WVO87xPFM9X9M/O7FudLNK+hMylrwLX8=;
	b=cV7pm3TyeCHJmANgNzNE98FrxpFnlJK6KuTBZ3ymYoCE41CNpmZ56A508Kfw3VYlMJAm
	 EoljTY4LtM3LegeR/owaV8SHpx/L4GhsSsCZ52FQ2GuuwTZLus8LVTPk+DrHaatPN5Smc
	 iW3F2m296k8peuzLIpG+0sadygqSVPKNX37GcLZPVl2IGpmBI0yMHZ0X16VczoF2miES5
	 IBXBfv4N2i4/H6X29l0SVCWX3nwRnSUsMBgikyfG6px38MkuwS1NJ6BIZcw7NWssM2Bt9
	 R9HtPBndYR3j5qVzQDlBFOQuumfOzxbB+T805GJS67vN6wGE8Vwf+e1E3DbmYrn/Jbw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795113965;
	bh=SCjzOAsZCI3WVO87xPFM9X9M/O7FudLNK+hMylrwLX8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VOAvMjRJJ2xxiUG9wyBv+1g7Vj1SFQ9V9XETJyhfKFgj1ZekhE7KvxVC0qiJm7Xnh
	 1ghzZKQsgk0O2Tq+cW0TBUPaMe2PWxbulzOTMkRcuzXgZmb4ogUWAzdJiyhzJJpIs4
	 y8IZr9+pHs3Ph62ob4FGVsR9Odp3TaniOBaDd5TcmfXt0wUpGMATtkk44HZBjHYUG6
	 DYSNE8DJf9Ttnbt1/Mq4xyKEpPFRysiKFwe9n1MEYasqKkI3v26kjLWq1wbGyNqWPd
	 gNmcYKyGsUOBDebhwb2gFYpAIo1I3eNklv+rijcOsl6z8n/fljfIfCR35oTBcpBp9F
	 lScxLrPMvD6yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 697B460D8E;
	Thu, 19 Nov 2026 18:46:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CB9A22B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 18:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E69B814A1
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 18:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AT0Vc8QitjL0 for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 18:46:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5E1D1814A0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=R5Pr59Fn
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E1D1814A0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 18:46:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=R5Pr59Fn88NKuAxup43/kUQ+gCn6gLPZAuRE4ImE92luOxVN3O63gNLqD44ljLMoVXq/GB36WIcaH/cjvScnLDff+RSLTItpBY7kJhUVBjC4FI638wpP2cLxHGrwWB+i4bnrtq05+wju3jxtOYk1zj+RLvrY8DjUEO4GDEboiyanoB1WsBaFv2uWdA22X3aEy2vCxi7SsXXJlLgpGVsO+0H4DuIPYnkMpQwyFmRP7Z+ufxP8pdL4xkx5JyysMFX86xntWK0QQul4Vmw/KNQsqwMVkPhohVCHLEXiO8TevLYSwrt3ZUX5t6fGJ+rdLZ/xxIn+c+LD1YYCjdGBva8u2g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=dPuGN5q8UbeMQUz1vCtoR3FTJZC4qFWXOdfdVEjsm1o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1657999812; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Nov 2026 18:45:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xU78k-00000002joo-1DQz;
 Thu, 19 Nov 2026 19:45:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 19:45:39 +0100
Message-ID: <20261119184541.652770-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH-NEXT] Makefile: support config fragments for the
 Buildroot configuration
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We have had the merge_config.sh config fragments script for many years and
logic in the kconfig infrastructure to handle them, but so far no builtin
logic to use config fragments for the Buildroot configuration itself, so add
logic to apply config fragments from .config files stored under configs/,
similar to how it is done for the Linux kernel or U-Boot.

E.G. given a config fragment:

  cat debug.config
  BR2_PACKAGE_DROPBEAR=y

Then running:

  make raspberrypi_defconfig debug.config

Would configure Buildroot for the Raspberry Pi and then apply the config
fragment in debug.config on top to enable dropbear.

Add logic similar to what we have for defconfigs to look for config
fragments in Buildroot and any br2-external trees and also add a "make
list-fragments" make target, similar to how we have "make list-defconfigs"
for listing the available fragments and mention it in the manual.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                                      | 47 +++++++++++++++++++
 .../manual/customize-directory-structure.adoc |  1 +
 docs/manual/customize-outside-br.adoc         |  8 ++++
 3 files changed, 56 insertions(+)

diff --git a/Makefile b/Makefile
index 8077ee1834..0493e1b21a 100644
--- a/Makefile
+++ b/Makefile
@@ -1052,6 +1052,22 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$${defconfig} \
 		$< --defconfig=$${defconfig} $(CONFIG_CONFIG_IN)
 
+# needed to ensure below rule isn't triggered by the BR2_CONFIG include above
+$(BR2_CONFIG): ;
+
+%.config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+	@config=$(or \
+		$(firstword \
+			$(foreach d, \
+				$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)), \
+				$(wildcard $(d)/configs/$@) \
+			) \
+		), \
+		$(error "Can't find $@") \
+	); \
+	CONFIG_="" $(TOPDIR)/support/kconfig/merge_config.sh -m \
+		-O $(dir $(BR2_CONFIG)) $(BR2_CONFIG) $${config}
+
 update-defconfig: savedefconfig
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
@@ -1214,6 +1230,7 @@ help:
 	@echo '  graph-depends          - generate graph of the dependency tree'
 	@echo '  graph-size             - generate stats of the filesystem size'
 	@echo '  list-defconfigs        - list all defconfigs (pre-configured minimal systems)'
+	@echo '  list-fragments         - list all config fragments'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
@@ -1264,6 +1281,36 @@ list-defconfigs:
 		$(call list-defconfigs,$(BR2_EXTERNAL_$(name)_PATH),\
 			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
 
+# List the config fragment files
+# $(1): base directory
+# $(2): br2-external name, empty for bundled
+define list-fragments
+	@first=true; \
+	for config in $$([ -d $(1)/configs ] && find $(1)/configs -name '*.config' |sort); do \
+		[ -f "$${config}" ] || continue; \
+		if $${first}; then \
+			if [ "$(2)" ]; then \
+				printf 'External config fragments in "%s":\n' "$(call qstrip,$(2))"; \
+			else \
+				printf "Built-in config fragments:\n"; \
+			fi; \
+			first=false; \
+		fi; \
+		config="$${config#$(1)/configs/}"; \
+		printf "  %-35s - Configure for %s\n" "$${config}" "$${config%.config}"; \
+	done; \
+	$${first} || printf "\n"
+endef
+
+# We iterate over BR2_EXTERNAL_NAMES rather than BR2_EXTERNAL_DIRS,
+# because we want to display the name of the br2-external tree.
+.PHONY: list-fragments
+list-fragments:
+	$(call list-fragments,$(TOPDIR))
+	$(foreach name,$(BR2_EXTERNAL_NAMES),\
+		$(call list-fragments,$(BR2_EXTERNAL_$(name)_PATH),\
+			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
+
 release: OUT = buildroot-$(BR2_VERSION)
 
 # Create release tarballs. We need to fiddle a bit to add the generated
diff --git a/docs/manual/customize-directory-structure.adoc b/docs/manual/customize-directory-structure.adoc
index aab225811b..963e7a59ae 100644
--- a/docs/manual/customize-directory-structure.adoc
+++ b/docs/manual/customize-directory-structure.adoc
@@ -36,6 +36,7 @@ to you.
 |
 +-- configs/
 |   +-- <boardname>_defconfig
+|   +-- <tweak>.config (if config fragment are used)
 |
 +-- package/
 |   +-- <company>/
diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 8a76f3a998..d8937888ba 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -182,6 +182,14 @@ normal +make <name>_defconfig+ command. They will be visible in the
 'make list-defconfigs' output, below an +External configs+ label that
 contains the name of the br2-external tree they are defined in.
 
+Likewise, config fragments can also be stored in the +configs+
+subdirectory of the br2-external tree. Buildroot will automatically
+show them in the output of +make list-fragments+ and allow them to be
+loaded with the normal +make <name>.config+ command. They will be
+visible in the 'make list-fragments' output, below an +External
+configs+ label that contains the name of the br2-external tree they
+are defined in.
+
 .Note:
 If a defconfig file is present in more than one br2-external tree, then
 the one from the last br2-external tree is used. It is thus possible
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
