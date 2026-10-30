Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93723606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fhR2tPWU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C8160AB3;
	Fri, 30 Oct 2026 20:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3liVTOPIVL8; Fri, 30 Oct 2026 20:06:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 400B360AD9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793390799;
	b=ik8iVfx5QrVIJWYLIMoz0+90WpL0ZDsVsBPUcmpL8kFS0sacmkxJhKsVUMRx0WKW/LbA
	 gt/65xu52vaxIL7TfjtImv0qva0WR9tDDcy1/D0bdqhYo4O4Pua2O+ikbjoAH8JvX4acb
	 6JqfvUA9GtJMid9DprU2nWbpcH2mYNaqLJRfyq8t/2TyttzPzwfpZEAGtYgcEOAlVPMly
	 MOTLTQ3XxXMsL6UVEk12N4eImA5x7RlvVWjw1wOmRD1rptgPXEEit5aJ/gK+cXyu1Wqjk
	 Xpxb52vhX2vI/2M2jKPqMGRw/KDg03d7BhzVV0gxwLA2PKz+shRvI9bFZzwoQ6HTjAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793390799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PX07w7VhRDjw8Z67AdEc0L9mSh6hFb6F3D2QluM+bu8=;
	b=f7Dfdv40CUU7CqZHzAu1Lfv/EQuvOzw3Pm9yarvuliNJUeNr+TT/n10EC6wRO512O4BK
	 16xSuqM+WP/JTiADCV7uHopDAuwpHAJWRTD352hn3B2Ldcfkm1UIh758IMN0FKevob0hA
	 HP4ksgVURoaPoBQuX+DxiqpskXERy/WRRqhAJR4D7rbUchmuaVfAxCHdPZZ9geQZUfRxF
	 BGiiRoRRmXGbkjQBdbwGtknWVu8n2Q1lCyybUOzzg6bB9e6MdkBbh/qpXZLz0PNE03xsi
	 4LdIA8IFRZ4o9mINHcky7EHXnMOX9KjqefPot/P4d8Lq/WjpegDaNOCpCf4TVS412UA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793390799;
	bh=PX07w7VhRDjw8Z67AdEc0L9mSh6hFb6F3D2QluM+bu8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fhR2tPWUAugijnEMMB93n158FMakHbizDXtwCKGawj/Ljrt6znvmFlO2C7sh8vOat
	 ZG6oerxEjCvohvGdnmCzVEzyTAAHPccmVTghdz7h0bwoU4ia1IqZVvlYTYfAMi4Erq
	 Wgq3LDmbruy2e2VnAVHAA+SHERqHmX+V2eOlKasmZmGaG5UKDsdcVTgNSUP7zUHHXj
	 phKSgdTXED/88PsVGO0EhuRasmsHhkbDYWtlChVV6IoG/9dB5sULsAasrob9ww4xdR
	 rkgAD9F2Ku9fXD87zp7BDWc6BBMeA8JmOFGSlWPCV5aygPN/2Ttl61RI7DueHAfB2P
	 hQ0GWKjNnV4Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 400B360AD9;
	Fri, 30 Oct 2026 20:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6F50712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3B8740AB8
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmEcbX3nhD2C for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:06:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C5C9A40AF3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793390791;
 b=gSKo0nvMoOWGIjknQj8f3p/P1aRQ9j+vnb9wxVi56mKmLhHzhPCvVDMQw+6z2dv++qqU
 PA38ItX4Gx5S3E55J+l7LTztUo2Mrbn5rC4WqP1AVYdX14xf1xd5cfmRXqm+ElIB5teZK
 hu8XFVVjK2Kt7mya2zc7gL6D5nmjY5VQN5lVV7m2YKD89y2zd02PdxvEcRd08GgRBoEq9
 nn5k5+1lQHUUhNTJB8PvXiLMgTmrdIN+uKlJIwADtMQLzGBvdSCA/CW7MDAFfcZkt3U7t
 HNzDl1YpJnUnUnkDHVPvOG89mARNRIg1buhrr7y6iIoLIQdluC1CIkuSBGtpYlchh5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793390791;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=YrQvZbeQsMs/uffhaFrNboptmPpL/x8agyoQD/taMrQ=;
 b=RXv0SEohHWZ1IdaqgJwT5fbw7S7x7nL35v2lKnCTpFGVF1RUPphZ+BGqDktMj5Qb7Tng
 1kpMpSGY61+7E9SgMF3+TTzKvZBvaVVdDDdKgqGGuuWZ/l8R5qwpCA+jrSA6W91pYGtuT
 w1P7kDCdbdFPGor9nRIUzOQP3QFBJrRaTWh6u+8Gtn0kVkkCOedkbLo0wNrY5C6W/VHM2
 hw7tbvMvZXAo77q8ljW77iiKMfUpzClvC3y+vgm48Kn75Z+DkjB3eIgTcZ+rRg7lQVOES
 ggamFJeS4lynhWQGMId0QL/XJ9rPeg6ij7Z0qBlOL/Q+OYUjG7BC0vpoIZ27MZGOzPQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hJsBMltH; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5C9A40AF3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUmD-1xFySS2uDv-00CyOB; Fri, 30
 Oct 2026 21:06:27 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:05:51 +0100
Message-ID: <20261030200552.779306-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030200552.779306-1-fiona.klute@gmx.de>
References: <20261030200552.779306-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1BG3+01l0fS7IUDog1VqMcmL1HqM8pVzp5IYGM5q1zHQ0DrEQVW
 0j9m8Vv3G6d6wVNA0xsu0hs4IkCPP/Qky2lrtso/TF7N5PFZgA96MnfwCRU4s6Ub2fh9cdK
 faUDtv/ujkrdAV6LZ1iFRav8vcz9mN0lEtw6ijoAtRXQ7HrinxubdpUkIM4n33dXFUjg+Nx
 XGHm33Km7kL6bfEN62tTw==
UI-OutboundReport: notjunk:1;M01:P0:rEteLPwZgNs=;zoFyZ+dMSLLWbccm+rANsGqSmfE
 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
Subject: [Buildroot] [PATCH 4/5] package/systemd: bump version to 261.4
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

This version adds an IMDS (Cloud "Instance Metadata Service")
subsystem, to recognize running in VMs provided by certain cloud
providers and provide information on the instance. This is left
disabled. The user "systemd-imds" defined in the new
sysusers.d/systemd-imds.conf.in source file is only needed if IMDS is
enabled.

Excerpts from NEWS possibly relevant for other package builds and post
scripts:
* "libsystemd is no longer guaranteed to be linked against libm. [...]
  Consumers that rely on libsystemd transitively pulling in libm
  should link against it themselves." [1]
* "Individual binaries now also embed the dlopen ELF metadata note
  (https://uapi-group.org/specifications/specs/elf_dlopen_metadata/)
  for their dlopen() dependencies, which allows packaging tools to
  reliably discover the set of optional dependencies of a binary,
  [...]" [2]

New options:
* "sysinstall" enables a textual installer/setup tool, disabled
* "imds" enables/disables the new IMDS subsystem, disabled
* "imds-network" has no effect with imds disabled, leave unset
* "systemd-imds-uid" is left unset like other fixed uid options

Please see the upstream NEWS file for other changes [3].

[1] https://github.com/systemd/systemd/blob/v261.4/NEWS#L100-L110
[2] https://github.com/systemd/systemd/blob/v261.4/NEWS#L604-L608
[3] https://github.com/systemd/systemd/blob/v261.4/NEWS

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 76825c36d5..495d32c2a3 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  46f00bb99c02e295cfda58b2fe9c7eac67a06d2ea5895aa80580c718ca3da71d  systemd-260.6.tar.gz
+sha256  2f78c37c6592dd34b95cca86793f1b8c5b073db35681ef80ea16a73c0c297a9e  systemd-261.4.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7e95e098ff..389b668477 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 260.6
+SYSTEMD_VERSION = 261.4
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -77,6 +77,7 @@ SYSTEMD_CONF_OPTS = \
 	-Dfuzz-tests=false \
 	-Didn=true \
 	-Dima=false \
+	-Dimds=disabled \
 	-Dinstall-tests=false \
 	-Dipe=false \
 	-Djournal-storage-default=persistent \
@@ -103,6 +104,7 @@ SYSTEMD_CONF_OPTS = \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dswapoff-path=/usr/sbin/swapoff \
 	-Dswapon-path=/usr/sbin/swapon \
+	-Dsysinstall=false \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysupdated=disabled \
@@ -926,6 +928,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhwdb=true \
 	-Didn=false \
 	-Dima=false \
+	-Dimds=disabled \
 	-Dimportd=disabled \
 	-Dinitrd=false \
 	-Dinstall-tests=false \
@@ -979,6 +982,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsplit-bin=true \
 	-Dstoragetm=false \
 	-Dsysext=false \
+	-Dsysinstall=false \
 	-Dsysupdate=disabled \
 	-Dsysupdated=disabled \
 	-Dsysusers=false \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
