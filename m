Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CC7CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 10:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F63404C1;
	Wed,  8 Oct 2025 10:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xv4M8ARCwx6i; Wed,  8 Oct 2025 10:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB61404B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB61404B8;
	Wed,  8 Oct 2025 10:16:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F12119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC4E4810E0
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYdwIFHH9D0z for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 10:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8572080F66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8572080F66
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8572080F66
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.21.12]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1uB7b232fL-00uCOy; Wed, 08
 Oct 2025 12:16:15 +0200
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 12:15:27 +0200
Message-ID: <20251008101535.51154-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:jfBQMGGXMzDQgUTXGeaUgaTJhGBO8T5S7L+JfOdvyDvU7/Y735j
 TaajGFPOEDGP0/4nXazJJbajLZb017Xqh6XiaMgRNQfynU3nH7Wjt6743Fp6X7iYYBbF8MQ
 o/bQOlL7iynFekObZZiAMntMShLQjwSNAUVJs48rIKMEYS+sNkPAdoGCoHpJQ292Mra1uIw
 ZlTZK3nQgVRa0ep9QfeaA==
UI-OutboundReport: notjunk:1;M01:P0:Mpbk1mGCSL4=;3fcFcnsldZc1JrdVkGohPbfxLyH
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1759918575; x=1760523375; i=fiona.klute@gmx.de;
 bh=EKjVgxuG0dIvykkK7/8UdQvPGrRdheLaG1DqeSFcZXU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BeqWgmxPTolBnLPJuAADA+XzuFUF9NbrAnUyLTKeirz34+bAoQQD2FChMn3+0AV1
 oHYDJ5ceg6OCMhHqEHm6ngghvVZ93Se/biFqRJoHVijFZyPdFxqi82OpLH+aWgUOr
 wQ7TIAcCXSQj05gE5j8a+mbkIXjkUoyRGmnRc1Vflo2K4Ec3I24AyIiHYcyQrf+Gi
 htpSdkEYFOUQbN/y7F1bIFmM6uRXMjpOCGuUvdkq5IHKm91J4giOyVpMWbZ+J4cAI
 diVfx2hYkCdkfme/4pj7WiyvrvMlNVNu4zPC3kxUnYKfsz/8GRVUQgZLgAYUZykl9
 s5G11wIWA40WcfimGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BeqWgmxP
Subject: [Buildroot] [PATCH 1/3] package/audit/S02auditd: fix SELinux label
 issues
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

"mkdir -Z" tries to create the directory with the default type context
and does not accept any parameter, leading to mkdir creating a
directory by the name of "system_u:object_r:auditd_log_t" (or failing
to, with a read-only rootfs). Use "--context=" instead to specify the
context.

Letting start-stop-daemon create the auditd PID file leads to an
incorrect label, with type "initrc_runtime_t" instead of
"auditd_runtime_t", which would prevent auditd from writing or
deleting it. Auditd manages its own PID file and daemonizes by
default, so simply drop the --background and --make-pidfile options
from start-stop-daemon.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/audit/S02auditd | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index f32f01714e..97c43bc66f 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -18,13 +18,13 @@ start(){
 	# the directory with SELinux permissions if possible
 	if command -v selabel_lookup >/dev/null 2>&1; then
 		audit_log_selable="$(selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3)"
-		mkdir -p /var/log/audit -Z "${audit_log_selable}"
+		mkdir -p --context="${audit_log_selable}" /var/log/audit
 	else
 		mkdir -p /var/log/audit
 	fi
 
-	start-stop-daemon --start --background --make-pidfile \
-		--pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
+	start-stop-daemon --start --pidfile "${PIDFILE}" \
+		--exec "/usr/sbin/${DAEMON}"
 	status=$?
 	if [ "${status}" -eq 0 ]; then
 		# Load the default rules
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
