Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FE606A334
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FNDGE/Na;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=UAZT8bo4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60C4D80CBF;
	Thu, 12 Nov 2026 19:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ajl8ir_61hsh; Thu, 12 Nov 2026 19:15:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3BEB081545
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794510931;
	b=pVFPmUdSZsd+kERR22pdlqwTQ7V1NrM0CQ4+pYI/errK1zwmU+iaL6l71qURVLGjeImc
	 63SMkq/61rSF95MhRXUrAAWOiqg8GlqxUaZRrqidVINbF14SG2zL5BWnC6Nh5objszTPb
	 x59Z/DoRUmrkychH8g2v0vV6c32OefQHmzszYmJZJdekd0mnSyjW7gx4ELqheyr8z/iko
	 5wong/XJNwE56TY6pVuG7ErGQEm3Yb2wtma/UysoShuB96wps7kN95s+Ba1SAQd9s3Qpj
	 VLan55zMve+fHeUgXyatUPJHsa3s2j+On7TJKjQkAUaRtyQ0TQNfSFnABjif8qtA4ww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794510931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=v7KpNdm5B5JC5zpd7ouD7ToclL7fFntGJQCeB3KNB5c=;
	b=OrVOYg1ktPGFlxg0xzaNN0duttSUhK8oslG3gvz5MQ/byFXWJBh/h4kNJn9Grle0Ars4
	 kV/LQ7rthuV8q/kk8JzDmtCiCk91EkwTKoiV53E+ZBemW5pSyK8RL59QHgjJg6Dlurrfh
	 +yL+Dz22tUoc//kY8Msrui+7O7lAkLGzq0yHXyEdhlBMhzIpu2aQS2oFOpwWuM6E/ahnM
	 ttImpfx69QD65kxIxVUdc5UD/1six2GvwF02zWbctMDWBOE4PmxVrJnUT3oynizEYFbOC
	 uttYVP/DppXYlyLKzGzkyeUumy8AM2hXtIHervC6GrJ/58644hy9xZJ60m90HDbcVaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794510931;
	bh=v7KpNdm5B5JC5zpd7ouD7ToclL7fFntGJQCeB3KNB5c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FNDGE/NagkpTJH/9NVNEPbyngeBnGdEWUdS8lGN05Z+GwIS8tse3DOW7nhY7H9DCh
	 lMRkJFHBMCumwcl07eSt8O9u5SkZ1SK1Nc9j+9+2tQt8XgLHwirPnC1rtXizkNlAI7
	 h9X9jlCK02J+mVmrOOwX+AqmPi8ZcFn+aCenjVMD9B2tdJilBqhQlXA9qDp9AtuZgG
	 EXQcNmtmqvEFCkHGq4E+B/yyTUzALjkPC+uuJwEVXo1g35UOrxqpU0QoWwZxbc1Uqp
	 kuzNceTP4sUaK1mFB8H5WqmUJuRDukPc0tsTA2K92AJi4zj8hOcAZBtjG79iUa1yq9
	 Bdbs+2RzMyi2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BEB081545;
	Thu, 12 Nov 2026 19:15:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BCADAF8
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18DD260D59
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWK-nGBIBbez for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 19:15:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A148E60D53
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=UAZT8bo4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A148E60D53
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794510926;
 bh=Xmgq55AXIChSP+FrJarmzind7hSXsCkFm3LhAgGyzag=;
 h=From:To:Cc:Subject:Date:From;
 b=UAZT8bo48go3bUQs9Z4Xg90VYD/tKaUO6OkVcAJTcf9Qm/EyLAf+TT4W+llX0zua3
 wkzoLa2ScnLeybdPmmAte8MSiZ0GPrxMM6NdpqJESpyDsG50r44PnZNfTjI+tH1hLN
 pQFmX0UdKU3rnj4GeRZivSeWrfGyh/kjHMvLdEsCA6QkMBCs2+xSrdi9Q0toBah1sH
 yVoBZhKfeiXiiRDq+G0s30GbuX8h6iS3D5XWLBxqFiEiwYZB7homJAIKLAMdAyD7zF
 MI5EzoJq0XiYbkFrd4tomFQVOlunIWwV/8H2Vq4ReFEgYWVfonz+zD8lo45qu/doF+
 N7nBYi9PmUQpw==
X-KAS-Sym: v3:f51bdf72230551df:Clbr0x+vcQ+nh8vBqvFoeZstHusRJYrRDDnZznkXjRYlN
 ebf6e7/iHV/u9RUYEfS4E0HJ6KsO48+V/xEOn5+Cg7YfAAMuZXQQYhoLw9y4MTpkcyz2l8s900H
 teTo6LqQtb59w/+q6FSzp4L2qxSCANHJvRVokv3rVcpk1QnraAosmkIulJqTmlcrxPkrG+iaHfW
 TMy2RGQXSDOsYZZske4MwoIehla6vD2WGp+Ss+N70BpW/K5niNVj6AY8sac7aEyGuBTbAOp1L99
 rAeX55JwxJy1koM809WZ+qR2MB9hNg3x4WkKIZc+h9dFkHqDHChn0WJFJ9irW0BvXmZ2fX9g==:
 o+i+WrkfbvewEuFZXHumy3sy7EAZeBleCGCsgon45e8DyH5eh9af4WqcWFkkIbFuIiAe2gyRJJ1
 4ZY40+/bXvrIsEsXd8DTy1qYEKOHY/qs3PgrtkPHYgg9GAinuamZPH7hP7ZMOV9IcY794379yxl
 8HJj+rdLNXQf+Lg2FJ7XGJTkUB0SnlJ2qP5zdp0OMR1RQk46FGnn5zuYsmdOYahULB5gDO/Ly7u
 KyvqNATQV84pW43oOxgwigmHVtLbCzCp5PHFmWZ2UrNG61SMzL1ehRZBPIviNP3sI7cdhc8JBEu
 SJmpoRfA84JphHWTjcyF714VoUXkCWK3dd31gbrJvrmpgiDL8j6bXDfb7zsy468iV0dWuZ5xNjv
 IVlv+6gb+iT/g/NWIMZLlavJTOzzrdOtSq68kykjw4eapmGrIM6O4aE+mTwiJN6IrAX5YQ0/tXR
 Q6SZev5XhZbhM1nVzxwdK5NKYxcDwZiokOocvPV8Zayv79HYNy+R1GsD/0g3t7qc2xNBicprXpJ
 BS3YxCt+tLrDdUUvvui7NMzoXIMY1a8MtlmYwGpCwjSGpg2uaOyBS4heBFalhwIGG165H5orhEZ
 yz8GSi5UjLK6L41e/4c73ST15Gy7lH4MTRI+peMpEPAi/OP5hbyEHXM6QxyoCESedZiu7qft781
 Q+H4oaMCigA==
Received: from fli4l.lan.fli4l (p54a1b984.dip0.t-ipconnect.de [84.161.185.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89989A4C3AFA;
 Thu, 12 Nov 2026 20:15:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39766)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xRaGb-000000000li-3Moz;
 Thu, 12 Nov 2026 19:15:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 12 Nov 2026 20:15:26 +0100
Message-ID: <20261112191526.102111-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 18.7
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://www.postgresql.org/about/news/postgresql-187-1712-1616-1520-1425-and-19-rc-2-released-3442/

Fixes the following CVEs

CVE-2026-6460: Type confusion after ALTER ... SET DATA TYPE executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-6467: Extension script schema mishandling executes arbitrary SQL (CVSS v3.1: 7.2)
CVE-2026-14661: dblink and subscriptions can append to arbitrary files (CVSS v3.1: 8.1)
CVE-2026-16237: INSERT ... ON CONFLICT can read or modify rows despite auto-updatable view WHERE condition (CVSS v3.1: 5.4)
CVE-2026-16240: pg_basebackup can use backup manifest content as a format string (CVSS v3.1: 3.7)
CVE-2026-18447: Output parameter type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116303: Foreign key and JSON conversions bypass EXECUTE privilege on cast functions (CVSS v3.1: 3.1)
CVE-2026-116304: Parallel RECORD typmod use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116306: Composite-type change during field assignment executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116307: plperl prepared-query use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116308: dict_int reads beyond zero-length tokens (CVSS v3.1: 4.3)
CVE-2026-116309: plperl blessed-reference type confusion may execute arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116310: COPY error context uses freed field storage (CVSS v3.1: 4.3)
CVE-2026-116311: DROP OWNED can remove restrictive row security policies from non-owned tables (CVSS v3.1: 5.4)
CVE-2026-116312: MERGE can place the wrong row in a trigger transition table (CVSS v3.1: 5.4)
CVE-2026-116313: vacuumdb --missing-stats-only lets a database owner execute code as the vacuumdb user (CVSS v3.1: 7.2)
CVE-2026-116314: pg_restore executes arbitrary code due to missing non-plain archive validation (CVSS v3.1: 8.8)
CVE-2026-116315: tsvector_delete() heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116316: Security-restricted operations can create types in pg_temp, which later queries of the session find (CVSS v3.1: 8.8)
CVE-2026-116317: ts_rank_cd() heap buffer overflow may execute arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116318: pg_dump not-null constraint name allows SQL injection (CVSS v3.1: 8.8)
CVE-2026-116319: plperl reentrant return_next() use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116320: plperl array and hash conversion use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116321: Unterminated name value discloses server memory (CVSS v3.1: 4.3)
CVE-2026-116322: Pre-authentication cancel request can leak a spinlock (CVSS v3.1: 5.3)
CVE-2026-116323: pltcl reentrant result conversion use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116325: reindexdb index name quoting allows SQL injection (CVSS v3.1: 8)
CVE-2026-116326: plperl tied-object exceptions follow stale sigjmp_buf (CVSS v3.1: 8.8)
CVE-2026-116327: security_barrier analysis can expose hidden values through indirect expressions (CVSS v3.1: 4.3)
CVE-2026-116328: Generation memory context integer wraparound executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116329: Statistics import type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116330: pg_dump tar restore.sql fails to block psql command injection (CVSS v3.1: 8.8)
CVE-2026-116331: Min/max aggregate type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116332: Portal setup use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116333: Parallel B-tree array scan reads beyond array bounds (CVSS v3.1: 6.5)
CVE-2026-116335: Commutator or negator result-type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116336: REINDEX CONCURRENTLY does not block DROP INDEX during index functions (CVSS v3.1: 8.8)
CVE-2026-120139: Tuple-size integer wraparound executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120141: Materialized set-returning function type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120142: Dropped-column type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120143: Transition-table cursor use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120144: Type-cache invalidation gap executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120145: Logical replication can write to subscriber system catalogs, executing arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120146: REASSIGN OWNED bypasses role SET and CREATEDB checks (CVSS v3.1: 4.3)
CVE-2026-120147: dblink reentrant disconnect use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120148: Extended-statistics pseudo-type confusion executes arbitrary code (CVSS v3.1: 8.1)
CVE-2026-120149: FDW batch-insert mismatch executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120150: Expanded-record domain-check use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120151: plpgsql record-field type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120152: pg_show_all_settings() use-after-free discloses memory (CVSS v3.1: 4.3)
CVE-2026-120153: Extension-script substitutions allow SQL injection through object names (CVSS v3.1: 7.2)
CVE-2026-120154: INSERT ... ON CONFLICT can read rows despite row security policies (CVSS v3.1: 4.3)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/6d2523ed837dece47b9eb0a45cbc1d06b4490833

with the exception of an ICE for target
bootlin-m68k-68040-uclibc/build/postgresql-18.7/.stamp_built:
https://gitlab.com/bkuhls/buildroot/-/jobs/17975591859

 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index da6c37b519..ab03e344c7 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.6/postgresql-18.6.tar.bz2.sha256
-sha256  555610c24d53e4316da5b7d3fc25c279d96856d5e0e23ee308c328c5fa881d9f  postgresql-18.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.7/postgresql-18.7.tar.bz2.sha256
+sha256  441dfae4280cae3e0425e5f876f80559fb0731c140f1aae22b3e5a54d0411bfd  postgresql-18.7.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index d852dc0e1e..772322afd7 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.6
+POSTGRESQL_VERSION = 18.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
