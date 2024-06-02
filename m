Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380EAC27C44
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E6C8427A;
	Sun,  2 Jun 2024 20:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZfa-xQANa7K; Sun,  2 Jun 2024 20:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27315831DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27315831DE;
	Sun,  2 Jun 2024 20:40:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 115DB1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D71E82125
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nE-eOwP-SoDY for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3149881F35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3149881F35
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3149881F35
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so5604395e9.3
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360796; x=1717965596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XBg0tJuCCNo1trYv8S+Tw75wDfPJ6miHlYtvJOdCBWI=;
 b=JFiyqE5G9U48vbIXsRGeJ2qKAtGvxffuQnxqQoacIrP/HSeoa05Yt39c4e9IGVPyGW
 KzvFL/96BzJ9xiDOcmIHZg+DEtU0gcYBUXyflYWkpB2lZrbv+LUMSg8I0/t7DgspanMY
 flWMO03dW/y+3s4zJRrljSRP2vYU0FQNZwzOtJzqNBFgDLVtm94JGiHQnH9Ps7Q8N4Mb
 3r+heGX+BRz5G7jRMlXxxmsIJhNX6ei+sJZDToN6YT/n6SYlzsuH+x2h8kmlYxa9lKfG
 QrSyGn6w782G7D/jF3nwVPHRuCODV/1DCsQ6zPXUlhtGrqmYp/G5aza6ABjn2mEFCLEY
 0nCg==
X-Gm-Message-State: AOJu0YxW8l9bklsNb+NkWyGQV0JjV52r1BuldEMK7Qwf9mmHBa4tqHXb
 0T6tySARxX9ANjXk8Uj2PYwBteO+fY+QbeY5b5nR9f7YS8vWFpmXYPLsOw==
X-Google-Smtp-Source: AGHT+IGcbwD5DygyCDTb/PWTtGPPNZSUdez41XYnDSD9tJggoVoceNbnzzTg0pNK5h3NT4ivfGiBng==
X-Received: by 2002:a05:600c:190b:b0:41f:e2c5:6618 with SMTP id
 5b1f17b1804b1-4212e0a5330mr58370525e9.32.1717360795944; 
 Sun, 02 Jun 2024 13:39:55 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:43 +0200
Message-ID: <67fe8d11d9a23c02bd07b66cbd385363b89f7a5c.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360796; x=1717965596; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBg0tJuCCNo1trYv8S+Tw75wDfPJ6miHlYtvJOdCBWI=;
 b=NhVgiqjC8wZQIZmQU7HkRYett9guihN5+BBzIb5pgqe9WZcIyOkd/mCjGCe4yUIGTl
 Vuc+PkcQg2Tgm7XPX7Yfa0rbTDiPdhahMrfAmBqkaNHyKfb/oA8p7PRW/rH/11+sSsNH
 ASlRun1qsKGjzl/ataRjQvU+6RbqijDTUnLtA5rmYA1qXwG4eLDrTHT4581TPwBBdtpI
 230yNORlcWqDs7TqlC6ATEhPLNnVex0ReRMerYd51ofqr+Szlr1nyeb5JQXNpZzvQRs4
 oKoeyj+i+AejJi4L/hcRNxam84CGgdhqD06UZpYwpgp3PLUKWgkBMuNTpdrpMLRRp4C/
 +Pgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NhVgiqjC
Subject: [Buildroot] [PATCH 07/16] support/download: pass post-process
 options to post-process helper
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we have no explicit, dedicated way to pass information to the
download post-process scripts, even though we do already need to pass
the path to the manifest when it is not the default, which we do with an
environment variable.

We'll soon need to be able to pass additional information to
post-process scripts, like instructing cargo to not use a lock file when
the package is not locked.

Extend the dl-wrapper with a new option with an argument, where the
argument will be passed as-is to the post-process script.

We explicitly do not document this new variable, as it is expected to
only be used in our package infrastructures (although there is currently
exactly one package that will directly need it, and we hope to drop that
in the future).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk      | 1 +
 support/download/dl-wrapper | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8f1e6dc8e5..edeaa1348d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -186,6 +186,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 		$(call DOWNLOAD, \
 			$($(PKG)_MAIN_DOWNLOAD), \
 			$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)) \
+			$(patsubst %,-P '%',$($(PKG)_DOWNLOAD_POST_PROCESS_OPTS)) \
 		) \
 	)
 	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 67a9718d9d..40d6fde44c 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -22,10 +22,10 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 main() {
     local OPT OPTARG
     local backend output large_file recurse quiet rc
-    local -a uris hfiles backend_opts
+    local -a uris hfiles backend_opts post_process_opts
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
+    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:P:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -39,6 +39,7 @@ main() {
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
         p)  post_process="${OPTARG}";;
+        P)  post_process_opts+=( "${OPTARG}" );;
         q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
@@ -148,7 +149,8 @@ main() {
         if [ -n "${post_process}" ] ; then
             if ! "${OLDPWD}/support/download/${post_process}-post-process" \
                     -o "${tmpf}" \
-                    -n "${raw_base_name}"
+                    -n "${raw_base_name}" \
+                    "${post_process_opts[@]}"
             then
                 # cd back to keep path coherence
                 cd "${OLDPWD}"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
