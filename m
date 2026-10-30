Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F73606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qtvX2dH6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D342A81187;
	Fri, 30 Oct 2026 20:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNVjIfTZKwCs; Fri, 30 Oct 2026 20:06:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BEFD881186
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793390804;
	b=iXSg8cF+8laKWRb7211QIizkwKGPDUCf6oqD7JRdrpwQoxMYKGS+xRDeklDKEKT40D4J
	 CJZjr8KSgFJNYA12WD+Vf6hJImfcw8s3MGmwKiuv+cUB+iylw5XIKEGacSypPs5fqKlMM
	 CdHeCW4bFeUI/fQJTT2lgCiZc3C5B3pSqtCHUIW7mlNNqfYxtlnC2MdtQyvkUZ69r/CT3
	 fuRMyldsEQbM2xPorh5MrtYhpRt6XSfc59bjkHKmJtWFOvaU/A/jMvVGr0dNzWmJfTXeB
	 pOt7Z5K9Oqq6qrmgYA3k8m1lEbKEKBbh7cqDoMQBiwMU/sxbfiyQh1a53jDtog+e8LA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793390804;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bjCzFbMgkGomVtZ0hrSDV8Q6b8TAojyUpy4i9Dqqu6E=;
	b=XkysZUEtS/6XPnndsGwJ8u1+oXSTp06gk+LOHCeAYcblbilwrV/92VIPYKf1zAOEzpo5
	 3KKR5ppfD436lbk7DDDmxwUQ/vqP5GPlH6tpiRQv+H1WIY6gDasy+mtac5fcGWg1M7Loq
	 MlJq+wglQl5ICn6Gt+Mh1kME21pbSz5V4oOcLnkm0dHhi9eEEtTS92N9VdkCkMBNx2vvb
	 1MCOO91X6txjJHWW44/Ukc8EM7j0VUvFbIvShN28j3xTI3ccvcIiLmqkIHTyge36INXZH
	 8ilGseJ7OMJHjhnzW8DXhFJvZSzi8vA+GIBfzjGyvNsyIxlOD1j2Epac79t4f3zGvaA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793390804;
	bh=bjCzFbMgkGomVtZ0hrSDV8Q6b8TAojyUpy4i9Dqqu6E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qtvX2dH6+GYRSfOO+t8drkyIb8YqMfsoLVm5N7mqQkq9i6s6R+Ohq19MPUp648ia3
	 72mx0flNh23YaivWfAqPlIvPjHNyWT95KxTQCYtE0Knxhs9cjYWhuLl6vPWcf2cvRM
	 +pTK0/BYds3SHGLhnR65aSpJvDYImzgE/wyYt5YqCL8OwOCnhEJnYjudA+McfUmIk8
	 grYbrtndxi6BIi9pImfEJbVk5cmrV2/cGp61bTtQVgJzU6Zc66MO+y6+D0UyYOWTcU
	 3TMUF3RkRifQuNNTEH02LhbGBW4ySvr3WzHsFTseqU7Nqb0U3f5c6vlAplvopzv/wp
	 eNZw06Fgju4wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEFD881186;
	Fri, 30 Oct 2026 20:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8ED04BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7FF581194
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uF4tC8mDZCT1 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:06:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC0CA81185
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793390795;
 b=Gsls2j99evFTHFLR06NgeTGueDJO5YYHe+71F0MPsvJaah09YezXKtqg1L6pGWwQCl9c
 6p6+KRzPAIp9FYhkr97YVCxs3Iuuv86jh5EzpDmRo7EdSUf/gMjPkzEAM7kufzPsjOkS7
 fZLEwp5o2Tkm2aoQ+57ZurePvH87AUehKLJWUbFrVdnmGKLup+HYRIRB42CKCkYPggUJq
 HAVdLqr9896SP02T8uBPpU9OhOMIQlUFFODpL/l8ZccH1VggorLfhsXQBbSUDq6xqqoYv
 s1R+ewd0qBWXxRezqh7bn0sr42f8ORZ4376xTLR7P1XT0Yozvz8qeI7FOHjigeDzwVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793390795;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=53jlX17vnBIvVz37WfpSM4ix0SWuMirsRsv2Vt3cm5E=;
 b=ptQbbhcQKc21HvOQrh/CqGgg9nwFT8edHUNL8ZHtBzX0bJ6/4Mt/Axun2IfZdV9G1vuM
 XrqZIX2NGM1H0RF75hbRnqbOsxzrMsQFGB1bddu4AbeDEjrSbqtp3pCEWBOdy5tZZRrtO
 0Kok8c9d29N+MODnM/gq+9aqytQXJaHRmhGqcV1jRsLUTNNN2rKGJE45AFmjFyjPBop3E
 ezuPw9T4AlkARHzqsHVkc+HjrHOa8F/oH1BH/sJfY0QrHhPGh9556NyQOgnm4cuL59lE9
 ZaXvRfwKzTP3oh/ab7a0N0JRckJuAJtZmRriXJLI25tXgIk0OF0BYiukzP91OnS+JMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=RJEEf4jv; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC0CA81185
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1wSnii08mz-017qCf; Fri, 30
 Oct 2026 21:06:29 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:05:52 +0100
Message-ID: <20261030200552.779306-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030200552.779306-1-fiona.klute@gmx.de>
References: <20261030200552.779306-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:n2xQkBSo+RA2F8hhSrbTxVgj1AREtPjPUx/weJq0HX3kao1O9/Q
 9WneJvynkSDImiPVC4WyfqhWEPKiHpNioUOeS1knL2Go4ATSwM6LRNRFjZHm4g5oLdpbRKx
 4C4c33WEktYuMhDRnGuZPragrfQt4J7UZgWztMBzulgI9vqz3nlA9lPO/8q0pxYnB1lbU6T
 Qy0eXYsBMf4QnqgCOgHQw==
UI-OutboundReport: notjunk:1;M01:P0:6TZ9CuDmIdI=;VYdB7rKyVEt4BVETnUo4yxYBPZ+
 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
 RG+xK9wL+7EOdefoNSuYtjbHp8njUvXJ+aSw==
Subject: [Buildroot] [PATCH 5/5] package/systemd: bump version to 262.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Changes relevant for packaging:
* Systemd now requires binutils >= 2.35 to build. All versions
  packaged in Buildroot meet this requirement, but external toolchains
  with very old binutils might not work any more.
* Meson options for static/multicall builds have changed. Buildroot
  does not support static builds of systemd, so the options are
  disabled.
* systemd-tmpfiles now rejects lines with non-empty arguments if the
  type does not use any
  argument. package/skeleton-init-systemd/legacy.conf follows the
  requirement.

New/changed options:
* "build-static" is disabled, see above
* "dlopen-tests" is disabled
* "fallback-default-target" set to default
* "hostname-wordlist" set to false to disable installing word lists
  for autogenerated hostnames
* "standalone-binaries" changed from boolean to string (list of
  binaries), set to empty
* "systemd-multicall-binary" is disabled, see above
* "var-log-mode" (permissions for /var/log) set to default

Please see the upstream NEWS file for other changes [1].

[1] https://github.com/systemd/systemd/blob/v262.1/NEWS

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/systemd.hash |  2 +-
 package/systemd/systemd.mk   | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 495d32c2a3..176d67cc9a 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  2f78c37c6592dd34b95cca86793f1b8c5b073db35681ef80ea16a73c0c297a9e  systemd-261.4.tar.gz
+sha256  100fc873b848b9b0297d8a705e8e2ed326256c8483d9960ee1ffe264c8a5c3e3  systemd-262.1.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 389b668477..a1ce0b6f26 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 261.4
+SYSTEMD_VERSION = 262.1
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -66,6 +66,7 @@ SYSTEMD_PROVIDES = libudev udev
 SYSTEMD_CONF_OPTS = \
 	-Dagetty-path=/usr/bin/agetty \
 	-Dbpf-framework=disabled \
+	-Dbuild-static=false \
 	-Dcompat-sysv-interfaces=false \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
@@ -73,8 +74,11 @@ SYSTEMD_CONF_OPTS = \
 	-Ddefault-compression='auto' \
 	-Ddefault-locale='C.UTF-8' \
 	-Ddefault-user-shell=/bin/sh \
+	-Ddlopen-tests=false \
+	-Dfallback-default-target=graphical.target \
 	-Dfirst-boot-full-preset=false \
 	-Dfuzz-tests=false \
+	-Dhostname-wordlist=false \
 	-Didn=true \
 	-Dima=false \
 	-Dimds=disabled \
@@ -101,17 +105,20 @@ SYSTEMD_CONF_OPTS = \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Dsetfont-path=/usr/bin/setfont \
 	-Dsplit-bin=true \
+	-Dstandalone-binaries= \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dswapoff-path=/usr/sbin/swapoff \
 	-Dswapon-path=/usr/sbin/swapon \
 	-Dsysinstall=false \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
+	-Dsystemd-multicall-binary=false \
 	-Dsysupdated=disabled \
 	-Dtests=false \
 	-Dtmpfiles=true \
 	-Dukify=disabled \
 	-Dumount-path=/usr/bin/umount \
+	-Dvar-log-mode=0755 \
 	-Dvcs-tag=false \
 	-Dvmlinux-h=disabled \
 	-Dxenctrl=disabled
@@ -904,6 +911,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dbinfmt=false \
 	-Dbootloader=disabled \
 	-Dbpf-framework=disabled \
+	-Dbuild-static=false \
 	-Dbzip2=disabled \
 	-Dcompat-sysv-interfaces=false \
 	-Dcoredump=false \
@@ -911,9 +919,11 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
 	-Ddbus=disabled \
+	-Ddlopen-tests=false \
 	-Defi=false \
 	-Delfutils=disabled \
 	-Denvironment-d=false \
+	-Dfallback-default-target=graphical.target \
 	-Dfdisk=disabled \
 	-Dfirstboot=false \
 	-Dfuzz-tests=false \
@@ -923,6 +933,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dgshadow=false \
 	-Dhibernate=false \
 	-Dhomed=disabled \
+	-Dhostname-wordlist=false \
 	-Dhostnamed=false \
 	-Dhtml=disabled \
 	-Dhwdb=true \
@@ -980,9 +991,11 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dselinux=disabled \
 	-Dsmack=false \
 	-Dsplit-bin=true \
+	-Dstandalone-binaries= \
 	-Dstoragetm=false \
 	-Dsysext=false \
 	-Dsysinstall=false \
+	-Dsystemd-multicall-binary=false \
 	-Dsysupdate=disabled \
 	-Dsysupdated=disabled \
 	-Dsysusers=false \
@@ -994,6 +1007,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dukify=enabled \
 	-Duserdb=false \
 	-Dutmp=false \
+	-Dvar-log-mode=0755 \
 	-Dvconsole=false \
 	-Dvcs-tag=false \
 	-Dvmlinux-h=disabled \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
