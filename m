Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563CB107BCE9
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2653E40E67;
	Fri, 13 Mar 2026 21:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTM6YUsXDvLI; Fri, 13 Mar 2026 21:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5305340E6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773437156;
	bh=DGInEEzLhulVhW8OR/CJjRh0oA1B9/uIiwBffpljKLk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H3xOUgJC7OUTMhvclCzkgWlcKdKH4G6GiHF/sy8UDkPdka6ZzLD/5rm6esC1nRNEl
	 6YN2bp5o7q14mH6OWq62DVfaS5Fij1Be1Rfm4lSC6Hgm8E6s+m0OGzmr7qQLYIadwV
	 BwfQLSPWHLUcyZNnVxTDlJWOeQ9Y/Mh16J2vw3MGrHOUEal6+KkOQpdf4YzVR1WJKc
	 SbGmdF8f3jq7WtJQn2l6DFs1i2Iaw7m0nNGPfoCMZ6BARlxrwNjXzCK+u9+/gjEX/b
	 zV1gqTLVCF87UAHWPnkFBDn5vh+MYDYjk3V5VnUbdOQA7wLkm/6qpwREQ/DVK6mQow
	 P2FSJehRhl/OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5305340E6D;
	Fri, 13 Mar 2026 21:25:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BB63787
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61AC081C46
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9quhNPLHFa2x for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A56AE81C40
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A56AE81C40
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CABD687039; Fri, 13 Mar 2026 21:25:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 22:12:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 244e4283a918d775c3dff17b03a532658c0f7f4a
X-Git-Newrev: 72e068001bf88b075abbe230b9ad1b7240c4754b
X-Patchwork-Hint: ignore
Message-Id: <20260313212553.CABD687039@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/br2-external: fix remaining
 shellcheck errors
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72e068001bf88b075abbe230b9ad1b7240c4754b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Boring changes: either do what shellcheck suggested, or comment why we
don't want to fix the code.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore          |  1 -
 support/scripts/br2-external | 11 ++++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3ce5f08ba3..a9e9d21da9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1068,7 +1068,6 @@ support/libtool/buildroot-libtool-v2.4.4.patch lib_patch.ApplyOrder lib_patch.Up
 support/libtool/buildroot-libtool-v2.4.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
 support/misc/relocate-sdk.sh Shellcheck
 support/scripts/apply-patches.sh Shellcheck
-support/scripts/br2-external Shellcheck
 support/scripts/check-bin-arch Shellcheck
 support/scripts/check-host-rpath Shellcheck
 support/scripts/expunge-gconv-modules Shellcheck
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 6d4fc1a791..474feaded7 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -34,6 +34,7 @@ main() {
         error "Cannot create output directory '%s'\n" "${outputdir}"
     fi
 
+    # shellcheck disable=SC2068  # We do want to split on spaces
     do_validate "${outputdir}" ${@//:/ }
     do_mk "${outputdir}"
     do_kconfig "${outputdir}"
@@ -71,7 +72,7 @@ do_validate_one() {
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
     fi
-    if [ ! -r "${br2_ext}" -o ! -x "${br2_ext}" ]; then
+    if [ ! -r "${br2_ext}" ] || [ ! -x "${br2_ext}" ]; then
         error "'%s': permission denied\n" "${br2_ext}"
     fi
     if [ ! -f "${br2_ext}/external.desc" ]; then
@@ -106,9 +107,9 @@ do_validate_one() {
     br2_ext="$( cd "${br2_ext}"; pwd )"
     br2_ver="$( support/scripts/setlocalversion "${br2_ext}" )"
     BR2_EXT_NAMES+=( "${br2_name}" )
-    eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
-    eval BR2_EXT_VERS_${br2_name}="\"\${br2_ver}\""
-    eval BR2_EXT_DESCS_${br2_name}="\"\${br2_desc:-\${br2_name}}\""
+    eval "BR2_EXT_PATHS_${br2_name}=\"\${br2_ext}\""
+    eval "BR2_EXT_VERS_${br2_name}=\"\${br2_ver}\""
+    eval "BR2_EXT_DESCS_${br2_name}=\"\${br2_desc:-\${br2_name}}\""
 }
 
 # Generate the .mk snippet that defines makefile variables
@@ -272,7 +273,7 @@ do_kconfig() {
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
 }
 
+# shellcheck disable=SC2059  # fmt *is* a format
 error() { local fmt="${1}"; shift; printf "BR2_EXTERNAL_ERROR = ${fmt}" "${@}"; exit 1; }
 
-my_name="${0##*/}"
 main "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
