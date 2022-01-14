Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4286C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 10:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B7968136E;
	Fri, 14 Jan 2022 10:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnJ52eFfsP5Y; Fri, 14 Jan 2022 10:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5D1812F5;
	Fri, 14 Jan 2022 10:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5F8A1BF37A
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1FC240990
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfRnos9869HM for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 10:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95F5340902
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 10:12:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r28so14782112wrc.3
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 02:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeqFBybkIHxgtEwp9qBKbpA8ke+FzEQ5Z+3fEgHcN7k=;
 b=hdpXIBpPBUnF/EMvQf5yx4ttZxmrgWAYBPGWi2teKTVIm9kAv2BNwflRAm1Yotr/60
 XzUQ5imsSaQJFdsuUwC2Qt0I5oxGXa61wACkofzML/+y2A/zEId6KBg5htl6bXd7YhVw
 Wj7FiEAbqWnj3JurZSQD3p8P4/efLENqreODdEOqDDlA8Xsu+ZZdFcnEkZKhC2rcVTtt
 U9plIVHIGsDj50v96/o9wevuKa4FeOafFKc8TDfgYiIZwcz70bCrzwK0oY76Uf4WpEae
 CPKePaf/lXWuwn1ycYasPonyXWEp8CdwyBwlmLsROoBWqY/pjR9tRf40A+y1AZgCba2D
 zQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeqFBybkIHxgtEwp9qBKbpA8ke+FzEQ5Z+3fEgHcN7k=;
 b=wfes+nhDE4x8oyKaJ/JRpTLCkGhdnjskfIHFw9S3zyTOE5heea8zyveAYhV893sZRR
 l1r3NiJdW2OlF8TzVdEocBXV62ID9OnGp/7eWTNt+3HQJ5myjKk3VGfm9zQxjOuqBfwk
 YvwcuM+O1iamM5yei/Nh73Nk2MdPnwdt9LxJ+G9RxkWjzBI/kKJWKfVZKl4CK9E1ppxe
 Xm+QauZtJzstMut96Dw4aWG0eQoMNVLBqJ7WON6hQ7ReBU7E0YVH4mqiCbdmV2k7qJjQ
 oK2rnG2ekKznxQAr1+ngWGiaTF1SCUZGPAeRgWFKrRseYdlAjVujs1w0xoQcIvirejXw
 0b5Q==
X-Gm-Message-State: AOAM532hVA7xpz/La68RqD5JnphxR5UCUl5RtfWoH7lqbDoNGfoU0Dr+
 Viuxu1HqCDu7uUEZlUtmSVGztAGA9jdErg==
X-Google-Smtp-Source: ABdhPJxJEXJJo8VB8G+lbcTjTkZmkP5BGGdtl1Sc0n1ixpnGEYTbcuZ9AfbL5Zq8tEcpYmVTph2+Uw==
X-Received: by 2002:a5d:6dc6:: with SMTP id d6mr7184961wrz.458.1642155173778; 
 Fri, 14 Jan 2022 02:12:53 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id i15sm133853wry.99.2022.01.14.02.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 02:12:53 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 11:12:45 +0100
Message-Id: <20220114101247.342256-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/scripts/mkusers: allow option for
 system uid/gid
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some software decides based on uid/gid whether a user is a
system or normal/human user, with differnt behaviour for those
flavors (example journald [2]).

So adding logic to create system-users is necessary, we take
the now common ranges from [1].

This extends the mkusers script to allow -2 for uid/gid,
this argument will take an identifier from the system range.

System/user ranges are added as variables, and the argument
for user/system uid was added as variable aswell.
Thus some magic constants could be removed, some further
occurences of -1 were replaced with equivalent logic.

[1] - https://systemd.io/UIDS-GIDS/
[2] - https://www.freedesktop.org/software/systemd/man/journald.conf.html

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 support/scripts/mkusers | 57 +++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index d00ba33823..9d8295e8a3 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -8,6 +8,15 @@ MIN_UID=1000
 MAX_UID=1999
 MIN_GID=1000
 MAX_GID=1999
+# use names from /etc/adduser.conf
+FIRST_SYSTEM_UID=100
+LAST_SYSTEM_UID=999
+FIRST_SYSTEM_GID=100
+LAST_SYSTEM_GID=999
+# argument to automatically crease system/user id
+AUTO_SYSTEM_ID=-2
+AUTO_USER_ID=-1
+
 # No more is configurable below this point
 #----------------------------------------------------------------------------
 
@@ -136,9 +145,9 @@ check_user_validity() {
         fail "invalid username '%s\n'" "${username}"
     fi
 
-    if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then
+    if [ ${gid} -lt -2 -o ${gid} -eq 0 ]; then
         fail "invalid gid '%d' for '%s'\n" ${gid} "${username}"
-    elif [ ${gid} -ne -1 ]; then
+    elif [ ${gid} -ge 0 ]; then
         # check the gid is not already used for another group
         if [ -n "${_group}" -a "${_group}" != "${group}" ]; then
             fail "gid '%d' for '%s' is already used by group '%s'\n" \
@@ -162,9 +171,9 @@ check_user_validity() {
         fi
     fi
 
-    if [ ${uid} -lt -1 -o ${uid} -eq 0 ]; then
+    if [ ${uid} -lt -2 -o ${uid} -eq 0 ]; then
         fail "invalid uid '%d' for '%s'\n" ${uid} "${username}"
-    elif [ ${uid} -ne -1 ]; then
+    elif [ ${uid} -ge 0 ]; then
         # check the uid is not already used for another user
         if [ -n "${_username}" -a "${_username}" != "${username}" ]; then
             fail "uid '%d' for '%s' already used by user '%s'\n" \
@@ -198,16 +207,18 @@ check_user_validity() {
 #   - not already used by a group
 generate_gid() {
     local group="${1}"
+    local mingid="${2:-$MIN_UID}"
+    local maxgid="${3:-$MAX_UID}"
     local gid
 
     gid="$( get_gid "${group}" )"
     if [ -z "${gid}" ]; then
-        for(( gid=MIN_GID; gid<=MAX_GID; gid++ )); do
+        for(( gid=mingid; gid<=maxgid; gid++ )); do
             if [ -z "$( get_group "${gid}" )" ]; then
                 break
             fi
         done
-        if [ ${gid} -gt ${MAX_GID} ]; then
+        if [ ${gid} -gt ${maxgid} ]; then
             fail "can not allocate a GID for group '%s'\n" "${group}"
         fi
     fi
@@ -222,8 +233,12 @@ add_one_group() {
     local members
 
     # Generate a new GID if needed
-    if [ ${gid} -eq -1 ]; then
-        gid="$( generate_gid "${group}" )"
+    if [ ${gid} -lt 0 ]; then
+        if [ ${gid} -eq ${AUTO_USER_ID} ]; then
+            gid="$( generate_gid "${group}" )"
+        else
+            gid="$( generate_gid "${group}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
+        fi
     fi
 
     members=$(get_members "$group")
@@ -247,16 +262,19 @@ add_one_group() {
 #   - not already used by a user
 generate_uid() {
     local username="${1}"
+    local minuid="${2:-$MIN_UID}"
+    local maxuid="${3:-$MAX_UID}"
+
     local uid
 
     uid="$( get_uid "${username}" )"
     if [ -z "${uid}" ]; then
-        for(( uid=MIN_UID; uid<=MAX_UID; uid++ )); do
+        for(( uid=minuid; uid<=maxuid; uid++ )); do
             if [ -z "$( get_username "${uid}" )" ]; then
                 break
             fi
         done
-        if [ ${uid} -gt ${MAX_UID} ]; then
+        if [ ${uid} -gt ${maxuid} ]; then
             fail "can not allocate a UID for user '%s'\n" "${username}"
         fi
     fi
@@ -307,8 +325,13 @@ add_one_user() {
     check_user_validity "${username}" "${uid}" "${group}" "${gid}"
 
     # Generate a new UID if needed
-    if [ ${uid} -eq -1 ]; then
-        uid="$( generate_uid "${username}" )"
+    if [ ${uid} -lt 0 ]; then
+        if [ ${uid} -eq ${AUTO_USER_ID} ]; then
+            uid="$( generate_uid "${username}" )"
+        else
+            uid="$( generate_uid "${username}" $FIRST_SYSTEM_UID $LAST_SYSTEM_UID )"
+
+        fi
     fi
 
     # Remove any previous instance of this user
@@ -384,8 +407,8 @@ main() {
         ENTRIES+=( "${line}" )
     done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
-    # We first create groups whose gid is not -1, and then we create groups
-    # whose gid is -1 (automatic), so that, if a group is defined both with
+    # We first create groups whose gid is positive, and then we create groups
+    # whose gid is automatic, so that, if a group is defined both with
     # a specified gid and an automatic gid, we ensure the specified gid is
     # used, rather than a different automatic gid is computed.
 
@@ -399,7 +422,7 @@ main() {
     # Then, create all the main groups which gid *is* automatic
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
-        [ ${gid} -eq -1 ] || continue    # Non-automatic gid
+        [ ${gid} -lt 0 ] || continue    # Non-automatic gid
         add_one_group "${group}" "${gid}"
     done
 
@@ -410,7 +433,7 @@ main() {
         read username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
             for g in ${groups//,/ }; do
-                add_one_group "${g}" -1
+                add_one_group "${g}" ${AUTO_USER_ID}
             done
         fi
     done
@@ -433,7 +456,7 @@ main() {
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
-        [ ${uid} -eq -1        ] || continue # Non-automatic uid
+        [ ${uid} -lt 0        ] || continue # Non-automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
     done
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
