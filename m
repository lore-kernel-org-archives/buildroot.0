Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AED7EE3F39
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 22:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1881F41C24;
	Tue, 12 Sep 2023 22:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1881F41C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usRKICWDVIuP; Tue, 12 Sep 2023 22:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA34941BA3;
	Tue, 12 Sep 2023 22:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA34941BA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 745121BF831
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E57060E6F
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E57060E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jylTsISNREln for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 22:15:57 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A50060B1F
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 22:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A50060B1F
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31c73c21113so5828874f8f.1
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 15:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694556956; x=1695161756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VfCvfdSDm1S2YltOsK9uJjJHvFGSBpqE/AUzugshkoQ=;
 b=s4DVQjfNsONZ8Wst1TXh7CCo4GUxA6qQ1miTNslO+bt5+pyhnUiHC0qV692q1h1tZq
 9tD/mzl2sTrqjBS0lWIXp9vyumB/0cIq+404ii2Q2aEw/HGbJ+a3mzEiJAtJpNkm9zjA
 07du5/7RdqIh66yrYvzxPokSQer1RXUzaBYEptHimPsIBbcjPP/Cy6Waqjg1k7e9bjFV
 rYpsCM4PZffiAmlYzf3tiSXfr+3OQ+kLQ0Y0iuLi93gKL7ZA+BivMsE1oDSqar++Dqq9
 ovbmInNrbBwWoYyJuWafhKLTre/+6fmSf/EtRbDxZ0sHZz8tv7hm3YZSyDkQw1QwGz2B
 2zxQ==
X-Gm-Message-State: AOJu0Yy6c1x1AV0kwRLXH28Inu4swAnbOqWXIACDCfieNFREBmLvhuPa
 y+NA91BdVUQf1uHy5m387xv3rP0J7/Y=
X-Google-Smtp-Source: AGHT+IFEjbHjUof57fp1IZEFnheXvKvy+EKgXtRBRik2nBvowRnY9CgAZqhiTuK+vv6GCCySJQZ86w==
X-Received: by 2002:adf:f4c4:0:b0:319:52da:8f0b with SMTP id
 h4-20020adff4c4000000b0031952da8f0bmr684459wrp.17.1694556955548; 
 Tue, 12 Sep 2023 15:15:55 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:d377:8b3f:c881:5464])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d67c7000000b0031423a8f4f7sm13901170wrw.56.2023.09.12.15.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 15:15:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 00:15:51 +0200
Message-Id: <37efd0eb722d848b20c769d4273af70997c87b33.1694556946.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694556946.git.yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694556956; x=1695161756; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfCvfdSDm1S2YltOsK9uJjJHvFGSBpqE/AUzugshkoQ=;
 b=ZLviUsIfLIPsN5fB9Twr64mN44TQLhuijSRTnhq3V3qkQgy8Dh2bRy+3NMrJQAzRbS
 30JpjhaySC4rr3xwAEdgW9SWLH5swGyQcHQAv8ptl2tzeFm8R1JNWg9A0iHHs/zQd6xc
 GCE9LvkIdW2fJvq5tGn4PiWw+segxJDREfcDRJ9D4JDtP83xM1zhgoyfbJlY5QI46BBA
 lZIs8a8y/KwTY/tFCNB3xah2QfSzwjbZ5P0LJutc9h4b3b7hGIOgTJrfsnN+t+VHTMDO
 zjoZ16o2G+dUPXvU7yzMCkiQsDDeVBfrQIJv6PZsOdRAy3yJGmhESdnk36DRzmPAXCjB
 ARJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZLviUsIf
Subject: [Buildroot] [PATCH 4/5] support/download/git: fix shellcheck errors
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The quoting around the expansion of ${relative_dir} was indeed incorrect
since it was introduced back in 8fe9894f655f (suport/download: fix git
wrapper with submodules on older git versions): it is in fact already
quoted as part of the whole sed expression.

${GIT} can contain more than one item, but we don't care about splitting
on spaces when we just print it for debug, so we can just quote it
rather than add an exception.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore  | 1 -
 support/download/git | 9 +++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f34df29bfc..19d004a555 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1618,7 +1618,6 @@ support/download/check-hash Shellcheck
 support/download/cvs Shellcheck
 support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
-support/download/git Shellcheck
 support/download/go-post-process Shellcheck
 support/download/hg Shellcheck
 support/download/scp Shellcheck
diff --git a/support/download/git b/support/download/git
index 729c553f8f..6654d98a00 100755
--- a/support/download/git
+++ b/support/download/git
@@ -21,6 +21,7 @@ set -e
 # Environment:
 #   GIT      : the git command to call
 
+# shellcheck disable=SC1090 # Only provides mk_tar_gz()
 . "${0%/*}/helpers"
 
 # Save our path and options in case we need to call ourselves again
@@ -83,12 +84,13 @@ set -E
 # being expanded a second time (in case there are spaces in them)
 _git() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' GIT_DIR="${git_cache}/.git" ${GIT} "${@}"; printf '\n'
+        printf '%s ' GIT_DIR="${git_cache}/.git" "${GIT}" "${@}"; printf '\n'
     fi
     _plain_git "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_git() {
+    # shellcheck disable=SC2086 # We want word-splitting for GIT
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
@@ -174,6 +176,7 @@ fi
 # the working copy as well as the repository, which means submodules
 # will not be cached for older versions.
 #
+# shellcheck disable=SC2016 # Will be expanded by git-foreach
 cmd='printf "Deregistering submodule \"%s\"\n" "${path}" && cd .. && rm -rf "${path##*/}"'
 _git submodule --quiet foreach "'${cmd}'"
 
@@ -200,11 +203,12 @@ if [ ${recurse} -eq 1 ]; then
     # that the archives are reproducible across a wider range of git
     # versions. However, we can't do that if git is too old and uses
     # full repositories for submodules.
+    # shellcheck disable=SC2016 # Will be expanded by git-foreach
     cmd='printf "%s\n" "${path}/"'
     for module_dir in $( _plain_git submodule --quiet foreach "'${cmd}'" ); do
         [ -f "${module_dir}/.git" ] || continue
         relative_dir="$( sed -r -e 's,/+,/,g; s,[^/]+/,../,g' <<<"${module_dir}" )"
-        sed -r -i -e "s:^gitdir\: $(pwd)/:gitdir\: "${relative_dir}":" "${module_dir}/.git"
+        sed -r -i -e "s:^gitdir\: $(pwd)/:gitdir\: ${relative_dir}:" "${module_dir}/.git"
     done
 fi
 
@@ -214,6 +218,7 @@ if [ ${large_file} -eq 1 ]; then
     _git lfs fetch
     _git lfs checkout
     # If there are also submodules, recurse into them,
+    # shellcheck disable=SC2086 # We want word-splitting for GIT
     if [ ${recurse} -eq 1 ]; then
         _git submodule foreach --recursive ${GIT} lfs install --local
         _git submodule foreach --recursive ${GIT} lfs fetch
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
