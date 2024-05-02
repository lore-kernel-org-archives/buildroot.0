Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C63DC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 09:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F8D8234C;
	Thu,  2 May 2024 09:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbS1S6P1Kktp; Thu,  2 May 2024 09:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E87C28146C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E87C28146C;
	Thu,  2 May 2024 09:09:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3EB21BF863
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 09:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDF8D60829
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 09:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzpvNw5F7umF for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 09:09:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4862060725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4862060725
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4862060725
 for <buildroot@buildroot.org>; Thu,  2 May 2024 09:09:51 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso9219364a12.2
 for <buildroot@buildroot.org>; Thu, 02 May 2024 02:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714640989; x=1715245789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExyApp9g7DjZ36XC43wSdGQvgnXLfGj8KUz8Tum+1ys=;
 b=cXk6EgqMzHU2B3ab9OhDO7IUoLU/a2TF2NR0GorVF5TY7a/hDi3eTeW0+lN3TflgID
 FHC/PpeeP5VmffZXdnWLMYn0E1bdhAjdwS3Wp7Vbq87I3B37w/d7oAHcovG83rZD67yL
 f4lFB7XKYQyCODN16FghLntaCY1b3xD1EBtO9wEX88mdVhgIkS9tzH02SGXnWY2ktPH0
 3gKvKSrb0dPVylEWcijzlfqPzvpZ9cGFas+MqRT9hsjRj2LOuA11yEdBu5dwkZHizc1c
 Sy1glecL5fClenhSbrocZdTvCMM6N9Y/4vK69JlTEKSyC931FJTrNIB3EbsDxUTseBQ5
 qm8w==
X-Gm-Message-State: AOJu0YzeTVaRfgk1QMzRpTUM9ks11Dwb6eOXZeXHK5nOskp136V23f2e
 N6N/6ChqbSQzk+XN7ktxvXzj7jKgo+TWiSr2jvLpcfhXpPailhp0s4RsetEEtkG7nVSZZQjeFl9
 DtM8=
X-Google-Smtp-Source: AGHT+IH/vfa4ZrGtbjZIhM4su/aX3xADaLDdN2pSNOYY3Tu0D0W6AQuukgbNLdalnDCwKwuH41fZhg==
X-Received: by 2002:a50:ab57:0:b0:572:9a52:6696 with SMTP id
 t23-20020a50ab57000000b005729a526696mr2975158edc.12.1714640989020; 
 Thu, 02 May 2024 02:09:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([176.201.29.159]) by smtp.gmail.com with ESMTPSA id
 c17-20020a50f611000000b00572b239c79esm311542edn.31.2024.05.02.02.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 02:09:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 May 2024 11:09:39 +0200
Message-ID: <20240502090939.748610-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1714640989; x=1715245789;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ExyApp9g7DjZ36XC43wSdGQvgnXLfGj8KUz8Tum+1ys=;
 b=XxL2Hff9oqlPWbqe0pOr6giEjiIsGLTLJVH6ggvx2fyzYhgYGY9o70Sj8fljMKT0Kk
 T/xAqboQm5qm8C0xEeDrR+O5mIqSBY1E+tV28kWXdwGB8BMKD2mtfFfxqFDkqbhdz3pT
 BD2nMp/iXnKlXH1mm2JeV24FQLp04slQVDHew=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XxL2Hff9
Subject: [Buildroot] [RFC PATCH 1/1] support/scripts/apply-patches.sh: set
 the maximum fuzz factor to 1
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch was created as a fix to a problem that occurred during the
compilation of QEMU:

>>> qemu 8.1.1 Patching

Applying 0001-tests-fp-disable-fp-bench-build-by-default.patch using patch:
patching file tests/fp/meson.build
Hunk #1 succeeded at 138 with fuzz 2 (offset -502 lines).

Applying 0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch using patch:
patching file softmmu/qemu-seccomp.c

Applying 0004-tracing-install-trace-events-file-only-if-necessary.patch using patch:
patching file trace/meson.build

With the bump to version 8.1.1, the patch that disabled the compilation
of the fp-bench test does not report any errors, even though the patch
itself is no longer applicable. The only noticeable message is:

"Hunk #1 succeeded at 138 with fuzz 2 (offset -502 lines)."

As reported by the patch man page:

"With context diffs, and to a lesser extent with normal diffs, patch can
detect when the line numbers mentioned in the patch are incorrect, and
attempts to find the correct place to apply each hunk of the patch.
As a first guess, it takes the line number mentioned for the hunk, plus
or minus any offset used in applying the previous hunk. If that is not
the correct place, patch scans both forwards and backwards for a set of
lines matching the context given in the hunk. First patch looks for a
place where all lines of the context match. If no such place is found,
and it's a context diff, and the maximum fuzz factor is set to 1 or more,
then another scan takes place ignoring the first and last line of
context. If that fails, and the maximum fuzz factor is set to 2 or more,
the first two and last two lines of context are ignored, and another
scan is made. The default maximum fuzz factor is 2.

If the hunk is installed at a different line from the line number
specified in the diff, you are told the offset. A single large offset
may indicate that a hunk was installed in the wrong place. You are also
told if a fuzz factor was used to make the match, in which case you
should also be slightly suspicious."

By setting the maximum fuzz factor to 1, we reduce the possibility that
patches which cannot be applied are incorrectly reported as valid.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 support/scripts/apply-patches.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 6da83f6826e9..999384cbbd5b 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -114,7 +114,7 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | patch -F1 -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
