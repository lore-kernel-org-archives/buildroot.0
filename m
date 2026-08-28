Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7B7C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26714810EC;
	Fri, 28 Aug 2026 14:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTNDRrZywrh9; Fri, 28 Aug 2026 14:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927059;
	bh=vjGJUhiMSpMcx6KFvMj2PY+duqEiAFacQHFZw850kNg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BYI5MKs302iqIRNQxaSD+crCbi9R6jP0zRklhf1v32DiEzfnwacE3SjFDM1e9Z6oQ
	 UumWE8pyunXSsb+NjB6dAmjqBW9ycpB3DlsUZEcJ4ej+s4d+f2PFGmNcN8pALNx/U4
	 eCLTVbrj8/UimsNulUnCr0LL9fzvuyn6on6Lc0CNZCq9r5DxwUzU6QhQ+JdqZV9ZBb
	 sVE6nC8Zfn1So3kmTP0w0URKNkFfT3wFGlv0odUiGRhd/ch975KG9dY3A2OaE3wxzh
	 LafDM7oVMlJHZvDQZej88dhmsEsiQyoBQLKd8BhGwhJPiIz+M+5yBrqv415DEFMbQU
	 QZj0Ks9Pvxviw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 524CB810D5;
	Fri, 28 Aug 2026 14:24:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B451386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41D98407FB
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9JmmzXR12HO for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 133FA407E3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1199B921F9; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 13b42633d37d516e667abe3b4081ad67d0e99c8a
X-Git-Newrev: a6c86f85118caaec7e07188947f10fa38214e614
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.1199B921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package: udisks: add
 patches for CVE-2026-7867
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2120263527501737790=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2120263527501737790==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6c86f85118caaec7e07188947f10fa38214e614
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:
- CVE-2026-7867:
    A flaw was found in udisks2. A local attacker with an active console
    session can exploit insufficient authorization checking on the 'as-
    user' option in the org.freedesktop.UDisks2.Filesystem.Mount() D-Bus
    method. This allows the attacker to spoof the 'as-user' parameter,
    mounting filesystems on behalf of arbitrary users, including
    privileged accounts. This can lead to local privilege escalation
    through mount point injection and manipulation of the mount namespace
    visible to privileged users.
    https://www.cve.org/CVERecord?id=CVE-2026-7867

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>7
(alternative to commit 93049b2559b4e87a6d03cf8c1b0125ffeab86477)
[Titouan:
    - Add upstream, SoB, CVE tags in patches
    - Add UDISKS_IGNORE_CVES entry
    - Add CVE description in the commit message
]
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...filesystem-Separate-real-caller-identity-.patch | 252 +++++++++++++++
 ...filesystem-Rework-fstab-mount-authorizati.patch | 211 +++++++++++++
 ...filesystem-Log-real-caller-uid-for-as-use.patch |  57 ++++
 ...nutil-Pass-as-user-target-to-polkit-detai.patch |  43 +++
 ...ecurity-tests-for-as-user-mount-authoriza.patch | 351 +++++++++++++++++++++
 package/udisks/udisks.mk                           |   7 +
 6 files changed, 921 insertions(+)

diff --git a/package/udisks/0001-udiskslinuxfilesystem-Separate-real-caller-identity-.patch b/package/udisks/0001-udiskslinuxfilesystem-Separate-real-caller-identity-.patch
new file mode 100644
index 0000000000..9c490ae86c
--- /dev/null
+++ b/package/udisks/0001-udiskslinuxfilesystem-Separate-real-caller-identity-.patch
@@ -0,0 +1,252 @@
+From 2d97818f41fbeb645fbb7b0373ed448bd26503f6 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Tue, 28 Apr 2026 19:10:09 +0200
+Subject: [PATCH] udiskslinuxfilesystem: Separate real caller identity from
+ as-user target
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the 'as-user' option is specified in Filesystem.Mount(), the code
+previously overwrote caller_uid/caller_gid with the target user's identity.
+This meant downstream functions received a uid they believed was the
+D-Bus caller's, but was actually the target's.
+
+Introduce effective_uid/effective_gid/effective_user_name to hold the
+as-user target identity (or the caller's identity when as-user is not
+set). The real D-Bus caller identity is now always resolved into
+caller_uid/caller_gid and used for authorization-related decisions
+(setup_by_user, on_user_seat checks), while effective_* is used for
+mount point calculation, run_as_uid/run_as_gid, and state tracking.
+
+Reported-by: Azizcan Daştan <azizcan.dastan5@gmail.com>
+Reported-by: Özlem Ozan <oozan1725@gmail.com>
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 397eea88d58f77f6e02d537c4c961201b9245943)
+---
+CVE: CVE-2026-7867
+Upstream: https://github.com/storaged-project/udisks/commit/2d97818f41fbeb645fbb7b0373ed448bd26503f6
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/udiskslinuxfilesystem.c | 93 +++++++++++++++++++++----------------
+ 1 file changed, 53 insertions(+), 40 deletions(-)
+
+diff --git a/src/udiskslinuxfilesystem.c b/src/udiskslinuxfilesystem.c
+index 9f4880ad..ebdd2e05 100644
+--- a/src/udiskslinuxfilesystem.c
++++ b/src/udiskslinuxfilesystem.c
+@@ -905,7 +905,8 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+                     UDisksObject          *object,
+                     uid_t                  caller_uid,
+                     gid_t                  caller_gid,
+-                    gboolean               mount_other_user,
++                    uid_t                  effective_uid,
++                    gid_t                  effective_gid,
+                     const gchar           *mount_point_to_use,
+                     const gchar           *fstab_mount_options,
+                     GDBusMethodInvocation *invocation,
+@@ -936,7 +937,7 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+        * will be replaced by the name of the drive/device in question
+        */
+       message = N_("Authentication is required to mount $(drive)");
+-      if (mount_other_user)
++      if (caller_uid != effective_uid)
+         {
+           action_id = "org.freedesktop.udisks2.filesystem-mount-other-user";
+         }
+@@ -981,14 +982,14 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+       job = udisks_daemon_launch_simple_job (daemon,
+                                              UDISKS_OBJECT (object),
+                                              "filesystem-mount",
+-                                             mount_fstab_as_root ? 0 : caller_uid,
++                                             mount_fstab_as_root ? 0 : effective_uid,
+                                              NULL /* cancellable */);
+ 
+       /* XXX: using run_as_uid for root doesn't work even if the caller is already root */
+-      if (!mount_fstab_as_root && caller_uid != 0)
++      if (!mount_fstab_as_root && effective_uid != 0)
+         {
+-          BDExtraArg uid_arg = { g_strdup ("run_as_uid"), g_strdup_printf ("%d", caller_uid) };
+-          BDExtraArg gid_arg = { g_strdup ("run_as_gid"), g_strdup_printf ("%d", caller_gid) };
++          BDExtraArg uid_arg = { g_strdup ("run_as_uid"), g_strdup_printf ("%d", effective_uid) };
++          BDExtraArg gid_arg = { g_strdup ("run_as_gid"), g_strdup_printf ("%d", effective_gid) };
+           const BDExtraArg *extra_args[3] = { &uid_arg, &gid_arg, NULL };
+ 
+           success = bd_fs_mount (NULL, mount_point_to_use, NULL, NULL, extra_args, &error);
+@@ -1066,8 +1067,9 @@ handle_mount_dynamic (UDisksDaemon          *daemon,
+                       UDisksObject          *object,
+                       uid_t                  caller_uid,
+                       gid_t                  caller_gid,
+-                      const gchar           *caller_user_name,
+-                      gboolean               mount_other_user,
++                      uid_t                  effective_uid,
++                      gid_t                  effective_gid,
++                      const gchar           *effective_user_name,
+                       gchar                **mount_point_to_use,
+                       gboolean              *mpoint_persistent,
+                       GDBusMethodInvocation *invocation,
+@@ -1127,7 +1129,7 @@ handle_mount_dynamic (UDisksDaemon          *daemon,
+    * will be replaced by the name of the drive/device in question
+    */
+   message = N_("Authentication is required to mount $(drive)");
+-  if (mount_other_user)
++  if (caller_uid != effective_uid)
+     {
+       action_id = "org.freedesktop.udisks2.filesystem-mount-other-user";
+     }
+@@ -1161,9 +1163,9 @@ handle_mount_dynamic (UDisksDaemon          *daemon,
+   /* Calculate mount point (guaranteed to be valid UTF-8) */
+   *mount_point_to_use = calculate_mount_point (daemon,
+                                                block,
+-                                               caller_uid,
+-                                               caller_gid,
+-                                               caller_user_name,
++                                               effective_uid,
++                                               effective_gid,
++                                               effective_user_name,
+                                                fs_type_to_use,
+                                                mpoint_persistent,
+                                                &error);
+@@ -1178,7 +1180,7 @@ handle_mount_dynamic (UDisksDaemon          *daemon,
+   /* Calculate mount options (guaranteed to be valid UTF-8) */
+   mount_options = udisks_linux_calculate_mount_options (daemon,
+                                                         block,
+-                                                        caller_uid,
++                                                        effective_uid,
+                                                         fs_signature,
+                                                         fs_type_to_use,
+                                                         options,
+@@ -1258,14 +1260,16 @@ handle_mount (UDisksFilesystem      *filesystem,
+   UDisksBlock *block;
+   UDisksDaemon *daemon;
+   UDisksState *state = NULL;
+-  gchar *opt_as_user = NULL;
++  const gchar *opt_as_user = NULL;
+   uid_t caller_uid;
+   gid_t caller_gid;
++  uid_t effective_uid = 0;
++  gid_t effective_gid = 0;
++  gchar *effective_user_name = NULL;
+   const gchar * const *existing_mount_points;
+   gchar *mount_point_to_use = NULL;
+   gboolean mpoint_persistent = TRUE;
+   gchar *fstab_mount_options = NULL;
+-  gchar *caller_user_name = NULL;
+   GError *error = NULL;
+   gboolean system_managed = FALSE;
+   gchar *device = NULL;
+@@ -1323,35 +1327,42 @@ handle_mount (UDisksFilesystem      *filesystem,
+       goto out;
+     }
+ 
++  /* Always resolve the real D-Bus caller identity */
++  if (!udisks_daemon_util_get_caller_uid_sync (daemon,
++                                               invocation,
++                                               NULL /* GCancellable */,
++                                               &caller_uid,
++                                               &error))
++    {
++      g_dbus_method_invocation_return_gerror (invocation, error);
++      g_clear_error (&error);
++      goto out;
++    }
++
++  if (!udisks_daemon_util_get_user_info (caller_uid,
++                                         &caller_gid,
++                                         opt_as_user ? NULL : &effective_user_name,
++                                         &error))
++    {
++      g_dbus_method_invocation_return_gerror (invocation, error);
++      g_clear_error (&error);
++      goto out;
++    }
++
+   if (opt_as_user)
+     {
+-      if (!udisks_daemon_util_get_user_info_by_name (opt_as_user, &caller_uid, &caller_gid, &error))
++      if (!udisks_daemon_util_get_user_info_by_name (opt_as_user, &effective_uid, &effective_gid, &error))
+         {
+           g_dbus_method_invocation_return_gerror (invocation, error);
+           g_clear_error (&error);
+           goto out;
+         }
+-      caller_user_name = g_strdup (opt_as_user);
++      effective_user_name = g_strdup (opt_as_user);
+     }
+   else
+     {
+-      if (!udisks_daemon_util_get_caller_uid_sync (daemon,
+-                                                   invocation,
+-                                                   NULL /* GCancellable */,
+-                                                   &caller_uid,
+-                                                   &error))
+-        {
+-          g_dbus_method_invocation_return_gerror (invocation, error);
+-          g_clear_error (&error);
+-          goto out;
+-        }
+-
+-      if (!udisks_daemon_util_get_user_info (caller_uid, &caller_gid, &caller_user_name, &error))
+-        {
+-          g_dbus_method_invocation_return_gerror (invocation, error);
+-          g_clear_error (&error);
+-          goto out;
+-        }
++      effective_uid = caller_uid;
++      effective_gid = caller_gid;
+     }
+ 
+   /* Mount it */
+@@ -1361,7 +1372,8 @@ handle_mount (UDisksFilesystem      *filesystem,
+                                object,
+                                caller_uid,
+                                caller_gid,
+-                               opt_as_user != NULL,
++                               effective_uid,
++                               effective_gid,
+                                mount_point_to_use,
+                                fstab_mount_options,
+                                invocation,
+@@ -1374,8 +1386,9 @@ handle_mount (UDisksFilesystem      *filesystem,
+                                  object,
+                                  caller_uid,
+                                  caller_gid,
+-                                 caller_user_name,
+-                                 opt_as_user != NULL,
++                                 effective_uid,
++                                 effective_gid,
++                                 effective_user_name,
+                                  &mount_point_to_use,
+                                  &mpoint_persistent,
+                                  invocation,
+@@ -1387,7 +1400,7 @@ handle_mount (UDisksFilesystem      *filesystem,
+   udisks_state_add_mounted_fs (state,
+                                mount_point_to_use,
+                                udisks_block_get_device_number (block),
+-                               caller_uid,
++                               effective_uid,
+                                system_managed,
+                                system_managed ? FALSE : mpoint_persistent);
+ 
+@@ -1395,7 +1408,7 @@ handle_mount (UDisksFilesystem      *filesystem,
+                  device,
+                  system_managed ? " (system)" : "",
+                  mount_point_to_use,
+-                 caller_uid);
++                 effective_uid);
+ 
+   udisks_linux_block_object_trigger_uevent_sync (UDISKS_LINUX_BLOCK_OBJECT (object),
+                                                  UDISKS_DEFAULT_WAIT_TIMEOUT);
+@@ -1409,7 +1422,7 @@ handle_mount (UDisksFilesystem      *filesystem,
+     udisks_state_check (state);
+   g_free (mount_point_to_use);
+   g_free (fstab_mount_options);
+-  g_free (caller_user_name);
++  g_free (effective_user_name);
+   g_free (device);
+   g_clear_object (&object);
+ 
+-- 
+2.54.0
+
diff --git a/package/udisks/0002-udiskslinuxfilesystem-Rework-fstab-mount-authorizati.patch b/package/udisks/0002-udiskslinuxfilesystem-Rework-fstab-mount-authorizati.patch
new file mode 100644
index 0000000000..d0b51e7a54
--- /dev/null
+++ b/package/udisks/0002-udiskslinuxfilesystem-Rework-fstab-mount-authorizati.patch
@@ -0,0 +1,211 @@
+From 0050f51d40e468f6a3197ccdc77b5bd59c923a37 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Tue, 28 Apr 2026 19:29:14 +0200
+Subject: [PATCH] udiskslinuxfilesystem: Rework fstab mount authorization
+ for as-user
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The polkit authorization logic in handle_mount_fstab() had two problems
+when 'as-user' was combined with fstab entries containing 'user',
+'users' or 'x-udisks-auth' mount options:
+
+1. The 'filesystem-mount-other-user' polkit check was inside the code
+   block that is skipped when 'user'/'users'/'x-udisks-auth' options
+   are present, allowing an unprivileged caller to mount on behalf of
+   another user without any authorization.
+
+2. When 'user' or 'users' fstab options were present and the initial
+   mount attempt failed with a permission error, the code would fall
+   back to mounting as root. This fallback should only be available
+   when 'x-udisks-auth' is explicitly specified.
+
+Restructure the authorization flow so that:
+ - The 'filesystem-mount-other-user' check is evaluated first,
+   independently of fstab mount options, and is always enforced
+   when caller_uid != effective_uid.
+ - The root fallback on BD_FS_ERROR_AUTH is gated on 'x-udisks-auth'
+   being present, not just any of the user-level mount options.
+ - When root uses 'as-user' without 'user'/'users' fstab options,
+   the root fallback is implicitly enabled.
+ - Regular polkit checks (filesystem-mount, mount-system,
+   mount-other-seat) only apply for same-user mounts without
+   'user'/'users'/'x-udisks-auth'.
+
+Update the D-Bus API documentation to reflect the new behavior.
+
+Reported-by: Azizcan Daştan <azizcan.dastan5@gmail.com>
+Reported-by: Özlem Ozan <oozan1725@gmail.com>
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 68108081aa9049cf3bb2fb0044cb4de83f962390)
+---
+CVE: CVE-2026-7867
+Upstream: https://github.com/storaged-project/udisks/commit/0050f51d40e468f6a3197ccdc77b5bd59c923a37
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ data/org.freedesktop.UDisks2.xml | 24 ++++++-----
+ src/udiskslinuxfilesystem.c      | 73 ++++++++++++++++++++++++--------
+ 2 files changed, 70 insertions(+), 27 deletions(-)
+
+diff --git a/data/org.freedesktop.UDisks2.xml b/data/org.freedesktop.UDisks2.xml
+index 53194c70..f7201adc 100644
+--- a/data/org.freedesktop.UDisks2.xml
++++ b/data/org.freedesktop.UDisks2.xml
+@@ -2654,7 +2654,8 @@
+         filesystem is mounted on behalf of the specified user instead
+         of the calling one. This has usually an effect on the returned
+         @mount_path and it also allows that user to unmount the
+-        filesystem later. This option expects a user name, not a UID.
++        filesystem later. This option expects a user name, not a UID
++        and always performs an authorization check.
+ 
+         If the device in question is referenced in the
+         <filename>/etc/fstab</filename> file, the
+@@ -2662,15 +2663,18 @@
+         and the given options or filesystem type given in @options are
+         ignored.
+ 
+-        If <literal>x-udisks-auth</literal> is specified as an option
+-        for the device in the <filename>/etc/fstab</filename> file,
+-        then the <command>mount</command> command is run as the
+-        calling user, without performing any authorization check
+-        mentioned above. If this fails because of insufficient
+-        permissions, an authorization check is performed (which
+-        typically results in the user having to authenticate as an
+-        administrator). If authorized, the <command>mount</command>
+-        command is then run as root.
++        If <literal>x-udisks-auth</literal>, <literal>user</literal> or
++        <literal>users</literal> are specified as options for the
++        device in the <filename>/etc/fstab</filename> file, then the
++        <command>mount</command> command is run as the calling user
++        (or the effective user of the <parameter>as-user</parameter>
++        option respectively), without performing any authorization check
++        mentioned above. If this fails because of insufficient permissions
++        and <literal>x-udisks-auth</literal> is specified, an
++        authorization check is performed (which typically results in
++        the user having to authenticate as an administrator). If
++        authorized, the <command>mount</command> command is then run
++        as root.
+ 
+         The filesystem should be unmounted using the
+         org.freedesktop.UDisks2.Filesystem.Unmount() method.
+diff --git a/src/udiskslinuxfilesystem.c b/src/udiskslinuxfilesystem.c
+index ebdd2e05..eb2a3f21 100644
+--- a/src/udiskslinuxfilesystem.c
++++ b/src/udiskslinuxfilesystem.c
+@@ -918,30 +918,60 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+   const gchar *message = NULL;
+   gboolean success = FALSE;
+   gboolean mount_fstab_as_root = FALSE;
++  gboolean x_udisks_auth = FALSE;
++  gboolean user_mount = FALSE;
+   UDisksBaseJob *job = NULL;
+   GError *error = NULL;
+ 
+   block = udisks_object_peek_block (object);
+   device = udisks_block_get_device (block);
+ 
+-  if (!has_option (fstab_mount_options, "x-udisks-auth") &&
+-      !has_option (fstab_mount_options, "user") &&
+-      !has_option (fstab_mount_options, "users"))
++  x_udisks_auth = has_option (fstab_mount_options, "x-udisks-auth");
++  user_mount = x_udisks_auth ||
++               has_option (fstab_mount_options, "user") ||
++               has_option (fstab_mount_options, "users");
++
++  /* 'as-user' rules:
++   *  - when caller is root:
++   *    - if 'user'/'users' present, do not fall back to mounting as root, unless 'x-udisks-auth' is specified
++   *    - if 'user'/'users' not present, try as effective user first and allow fallback to mounting as root (implies 'x-udisks-auth')
++   *  - when caller is unprivileged:
++   *    - always require polkit auth to prevent identity spoofing
++   *    - do not fall back to mounting as root, unless 'x-udisks-auth' is specified
++   *    - if neither 'user'/'users'/'x-udisks-auth' present, failure is expected by nature (unless 'as-user=root')
++   *
++   * general fstab mounting rules:
++   *  - when caller is root, mount as root, allow anything
++   *  - when caller is unprivileged:
++   *    - if 'user'/'users' present, do not fall back to mounting as root, unless 'x-udisks-auth' is specified
++   *    - if only 'x-udisks-auth' present, mount as user and fall back to mounting as root if not successful
++   *    - if neither 'user'/'users'/'x-udisks-auth' present, require polkit auth and mount as root
++   *
++   * Further assumptions:
++   *  - when 'user'/'users' not present and mounting as unprivileged, this typically fails but it is still beneficial to try that e.g. for FUSE mounts
++   *  - assuming libblockdev mount error code mapping works reliably (for the BD_FS_ERROR_AUTH check)
++   */
++
++  if (caller_uid != effective_uid)
++    {
++      /* Always require authorization when mounting on behalf of another user,
++       * regardless of fstab mount options.
++       */
++      action_id = "org.freedesktop.udisks2.filesystem-mount-other-user";
++
++      /* When 'user'/'users' not present and the caller is root, allow
++       * fallback mounting as root.
++       */
++      if (caller_uid == 0 && !user_mount)
++        x_udisks_auth = TRUE;
++    }
++  else
++  if (!user_mount)
+     {
+       mount_fstab_as_root = TRUE;
++
+       action_id = "org.freedesktop.udisks2.filesystem-mount";
+-      /* Translators: Shown in authentication dialog when the user
+-       * requests mounting a filesystem.
+-       *
+-       * Do not translate $(drive), it's a placeholder and
+-       * will be replaced by the name of the drive/device in question
+-       */
+-      message = N_("Authentication is required to mount $(drive)");
+-      if (caller_uid != effective_uid)
+-        {
+-          action_id = "org.freedesktop.udisks2.filesystem-mount-other-user";
+-        }
+-      else if (!udisks_daemon_util_setup_by_user (daemon, object, caller_uid))
++      if (!udisks_daemon_util_setup_by_user (daemon, object, caller_uid))
+         {
+           if (udisks_block_get_hint_system (block))
+             {
+@@ -952,7 +982,17 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+               action_id = "org.freedesktop.udisks2.filesystem-mount-other-seat";
+             }
+         }
++    }
+ 
++  if (action_id)
++    {
++      /* Translators: Shown in authentication dialog when the user
++       * requests mounting a filesystem.
++       *
++       * Do not translate $(drive), it's a placeholder and
++       * will be replaced by the name of the drive/device in question
++       */
++      message = N_("Authentication is required to mount $(drive)");
+       if (!udisks_daemon_util_check_authorization_sync (daemon,
+                                                         object,
+                                                         action_id,
+@@ -962,7 +1002,6 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+         return FALSE;
+     }
+ 
+-
+   if (!g_file_test (mount_point_to_use, G_FILE_TEST_IS_DIR))
+     {
+       if (g_mkdir_with_parents (mount_point_to_use, 0755) != 0)
+@@ -1011,7 +1050,7 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+ 
+       if (!success)
+         {
+-          if (!mount_fstab_as_root && g_error_matches (error, BD_FS_ERROR, BD_FS_ERROR_AUTH))
++          if (!mount_fstab_as_root && g_error_matches (error, BD_FS_ERROR, BD_FS_ERROR_AUTH) && x_udisks_auth)
+             {
+               g_clear_error (&error);
+               action_id = "org.freedesktop.udisks2.filesystem-fstab";
+-- 
+2.54.0
+
diff --git a/package/udisks/0003-udiskslinuxfilesystem-Log-real-caller-uid-for-as-use.patch b/package/udisks/0003-udiskslinuxfilesystem-Log-real-caller-uid-for-as-use.patch
new file mode 100644
index 0000000000..db63d97c9b
--- /dev/null
+++ b/package/udisks/0003-udiskslinuxfilesystem-Log-real-caller-uid-for-as-use.patch
@@ -0,0 +1,57 @@
+From 132ebab4a196f7fbd01fa28283627b2227eb399b Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Sun, 3 May 2026 14:00:01 +0200
+Subject: [PATCH] udiskslinuxfilesystem: Log real caller uid for as-user
+ mounts
+
+When a mount is performed with the as-user option targeting a different
+user, log both the effective (target) uid and the real caller uid to
+provide an audit trail of who authorized the operation.
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 98e5a76c155640d155280cdb642791f00def736a)
+---
+CVE: CVE-2026-7867
+Upstream: https://github.com/storaged-project/udisks/commit/132ebab4a196f7fbd01fa28283627b2227eb399b
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/udiskslinuxfilesystem.c | 22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/src/udiskslinuxfilesystem.c b/src/udiskslinuxfilesystem.c
+index eb2a3f21..5e2508cc 100644
+--- a/src/udiskslinuxfilesystem.c
++++ b/src/udiskslinuxfilesystem.c
+@@ -1443,11 +1443,23 @@ handle_mount (UDisksFilesystem      *filesystem,
+                                system_managed,
+                                system_managed ? FALSE : mpoint_persistent);
+ 
+-  udisks_notice ("Mounted %s%s at %s on behalf of uid %u",
+-                 device,
+-                 system_managed ? " (system)" : "",
+-                 mount_point_to_use,
+-                 effective_uid);
++  if (effective_uid != caller_uid)
++    {
++      udisks_notice ("Mounted %s%s at %s on behalf of uid %u (requested by uid %u)",
++                     device,
++                     system_managed ? " (system)" : "",
++                     mount_point_to_use,
++                     effective_uid,
++                     caller_uid);
++    }
++  else
++    {
++      udisks_notice ("Mounted %s%s at %s on behalf of uid %u",
++                     device,
++                     system_managed ? " (system)" : "",
++                     mount_point_to_use,
++                     effective_uid);
++    }
+ 
+   udisks_linux_block_object_trigger_uevent_sync (UDISKS_LINUX_BLOCK_OBJECT (object),
+                                                  UDISKS_DEFAULT_WAIT_TIMEOUT);
+-- 
+2.54.0
+
diff --git a/package/udisks/0004-udisksdaemonutil-Pass-as-user-target-to-polkit-detai.patch b/package/udisks/0004-udisksdaemonutil-Pass-as-user-target-to-polkit-detai.patch
new file mode 100644
index 0000000000..b7a51944f6
--- /dev/null
+++ b/package/udisks/0004-udisksdaemonutil-Pass-as-user-target-to-polkit-detai.patch
@@ -0,0 +1,43 @@
+From 3b016cc881b1d3c3d843ec13e35102beaaac7023 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Tue, 28 Apr 2026 19:10:38 +0200
+Subject: [PATCH] udisksdaemonutil: Pass as-user target to polkit details
+
+When the 'as-user' D-Bus method option is present, propagate the
+target username to polkit details as 'mount.as-user'. This allows
+polkit rules to make fine-grained authorization decisions based on
+who the mount is being performed for.
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 681d58a76f6aaa5045eb43e665c65f497d35b810)
+---
+CVE: CVE-2026-7867
+Upstream: https://github.com/storaged-project/udisks/commit/3b016cc881b1d3c3d843ec13e35102beaaac7023
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/udisksdaemonutil.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/udisksdaemonutil.c b/src/udisksdaemonutil.c
+index 3db92f58..36e3184b 100644
+--- a/src/udisksdaemonutil.c
++++ b/src/udisksdaemonutil.c
+@@ -797,6 +797,14 @@ udisks_daemon_util_check_authorization_sync_with_error (UDisksDaemon           *
+   polkit_details_insert (details, "polkit.message", message);
+   polkit_details_insert (details, "polkit.gettext_domain", "udisks2");
+ 
++  if (options != NULL &&
++      g_strcmp0 (action_id, "org.freedesktop.udisks2.filesystem-mount-other-user") == 0)
++    {
++      const gchar *as_user = NULL;
++      g_variant_lookup (options, "as-user", "&s", &as_user);
++      _safe_polkit_details_insert (details, "mount.as-user", as_user);
++    }
++
+   /* Find drive associated with the block device, if any */
+   if (object != NULL)
+     {
+-- 
+2.54.0
+
diff --git a/package/udisks/0005-tests-Add-security-tests-for-as-user-mount-authoriza.patch b/package/udisks/0005-tests-Add-security-tests-for-as-user-mount-authoriza.patch
new file mode 100644
index 0000000000..abd180688a
--- /dev/null
+++ b/package/udisks/0005-tests-Add-security-tests-for-as-user-mount-authoriza.patch
@@ -0,0 +1,351 @@
+From 36231768dde088c8b4d4796ff2d311d089d84052 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Wed, 29 Apr 2026 16:36:45 +0200
+Subject: [PATCH] tests: Add security tests for as-user mount authorization
+
+Add tests verifying that an unprivileged D-Bus caller cannot exploit
+the 'as-user' option in Filesystem.Mount() to mount on behalf of
+another user without polkit authorization. Use a dedicated
+'udisks_test_target' user instead of 'nobody' to avoid OS-level
+special treatment of system users that could mask real behavior.
+
+Dynamic mount tests (in UdisksFSTestCase, inherited by all FS types):
+- test_mount_as_user_denied: as-user=<another_user> is denied
+- test_mount_as_user_root_denied: as-user=root is denied
+- test_mount_as_user_self: as-user=<self> behaves like plain mount
+
+Fstab mount tests (in NonPOSIXTestCase, inherited by VFAT/EXFAT):
+- test_mount_fstab_{users,user,x-udisks-auth}_as_user_denied:
+  fstab entries that normally allow unprivileged mounting must still
+  require authorization when as-user is specified
+- test_mount_fstab_{users,user,x-udisks-auth}_as_root_denied:
+  same but with as-user=root
+- test_mount_fstab_defaults_as_user_from_root: root can mount
+  fstab 'defaults' device with as-user targeting a non-root user
+- test_mount_fstab_defaults_as_user_denied: unprivileged user
+  cannot mount fstab 'defaults' device with as-user
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 5ec20c9d5719ead510d800bc3eb5a731e5712f39)
+---
+CVE: CVE-2026-7867
+Upstream: https://github.com/storaged-project/udisks/commit/36231768dde088c8b4d4796ff2d311d089d84052
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/tests/dbus-tests/test_80_filesystem.py | 278 +++++++++++++++++++++
+ 1 file changed, 278 insertions(+)
+
+diff --git a/src/tests/dbus-tests/test_80_filesystem.py b/src/tests/dbus-tests/test_80_filesystem.py
+index 1f375ac6..03336512 100644
+--- a/src/tests/dbus-tests/test_80_filesystem.py
++++ b/src/tests/dbus-tests/test_80_filesystem.py
+@@ -30,6 +30,8 @@ class UdisksFSTestCase(udiskstestcase.UdisksTestCase):
+     _can_query_size = False
+ 
+     username = 'udisks_test_user'
++    # a separate target user used for 'as-user' mount tests
++    target_username = 'udisks_test_target'
+ 
+     requested_plugins = BlockDev.plugin_specs_from_names(("fs",))
+ 
+@@ -1037,6 +1039,174 @@ class UdisksFSTestCase(udiskstestcase.UdisksTestCase):
+         pipe.send([True, ''])
+         pipe.close()
+ 
++    def _mount_with_as_user_fail(self, pipe, uid, gid, device, target_user):
++        """ Try to mount @device as user with given @uid and @gid using the
++            'as-user' option set to @target_user. This is expected to fail
++            with a NotAuthorized error.
++        """
++        os.setresgid(gid, gid, gid)
++        os.setresuid(uid, uid, uid)
++
++        try:
++            safe_dbus.call_sync(self.iface_prefix,
++                                self.path_prefix + '/block_devices/' + os.path.basename(device),
++                                self.iface_prefix + '.Filesystem',
++                                'Mount',
++                                GLib.Variant('(a{sv})', ({'as-user': GLib.Variant('s', target_user)},)))
++        except Exception as e:
++            msg = str(e)
++            if 'org.freedesktop.UDisks2.Error.NotAuthorized' in msg and \
++               'Not authorized to perform operation' in msg:
++                pipe.send([True, ''])
++                pipe.close()
++                return
++            else:
++                pipe.send([False, 'Mount DBus call failed with unexpected exception: %s' % msg])
++                pipe.close()
++                return
++
++        pipe.send([False, 'Mount with as-user=%s unexpectedly succeeded for uid %d' % (target_user, uid)])
++        pipe.close()
++
++    def _test_mount_as_user_denied(self, target_user):
++        """ Test that an unprivileged user cannot use as-user to mount on
++            behalf of @target_user without polkit authorization.
++        """
++        self._check_can_create()
++
++        if not self._can_mount:
++            self.skipTest('Cannot mount %s filesystem' % self._fs_signature)
++
++        disk = self.get_object('/block_devices/' + os.path.basename(self.vdevs[0]))
++        self.assertIsNotNone(disk)
++
++        disk.Format(self._fs_signature, self.no_options, dbus_interface=self.iface_prefix + '.Block')
++        self.addCleanup(self.wipe_fs, self.vdevs[0])
++        self.addCleanup(self.try_unmount, self.vdevs[0])
++
++        self.addCleanup(self._remove_user, self.username)
++        uid, gid = self._add_user(self.username)
++
++        if target_user != 'root':
++            self.addCleanup(self._remove_user, target_user)
++            self._add_user(target_user)
++
++        parent_conn, child_conn = Pipe()
++        proc = Process(target=self._mount_with_as_user_fail,
++                       args=(child_conn, int(uid), int(gid), self.vdevs[0], target_user))
++        proc.start()
++        res = parent_conn.recv()
++        parent_conn.close()
++        proc.join()
++
++        if not res[0]:
++            self.fail(res[1])
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_as_user_denied(self):
++        """ Test that an unprivileged user cannot use as-user to mount on
++            behalf of another user without authorization.
++        """
++        self._test_mount_as_user_denied(self.target_username)
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_as_user_root_denied(self):
++        """ Test that an unprivileged user cannot use as-user=root to mount
++            without authorization.
++        """
++        self._test_mount_as_user_denied('root')
++
++    def _mount_as_user_result(self, pipe, uid, gid, device, options):
++        """ Try to mount @device as user with given @uid and @gid using
++            the given @options dict. Returns [True, error_string] on D-Bus
++            error or [True, ''] on success.
++        """
++        os.setresgid(gid, gid, gid)
++        os.setresuid(uid, uid, uid)
++
++        try:
++            safe_dbus.call_sync(self.iface_prefix,
++                                self.path_prefix + '/block_devices/' + os.path.basename(device),
++                                self.iface_prefix + '.Filesystem',
++                                'Mount',
++                                GLib.Variant('(a{sv})', (options,)))
++        except Exception as e:
++            pipe.send([True, str(e)])
++            pipe.close()
++            return
++
++        pipe.send([True, ''])
++        pipe.close()
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_as_user_self(self):
++        """ Test that as-user targeting the caller's own username behaves
++            identically to mounting without as-user (no extra mount-other-user
++            authorization required).
++        """
++        self._check_can_create()
++
++        if not self._can_mount:
++            self.skipTest('Cannot mount %s filesystem' % self._fs_signature)
++
++        disk = self.get_object('/block_devices/' + os.path.basename(self.vdevs[0]))
++        self.assertIsNotNone(disk)
++
++        disk.Format(self._fs_signature, self.no_options, dbus_interface=self.iface_prefix + '.Block')
++        self.addCleanup(self.wipe_fs, self.vdevs[0])
++        self.addCleanup(self.try_unmount, self.vdevs[0])
++
++        self.addCleanup(self._remove_user, self.username)
++        uid, gid = self._add_user(self.username)
++
++        # first try a plain mount without as-user
++        parent_conn, child_conn = Pipe()
++        proc = Process(target=self._mount_as_user_result,
++                       args=(child_conn, int(uid), int(gid), self.vdevs[0], {}))
++        proc.start()
++        res_plain = parent_conn.recv()
++        parent_conn.close()
++        proc.join()
++
++        self.assertTrue(res_plain[0])
++        plain_error = res_plain[1]
++
++        # unmount if the plain mount succeeded
++        if not plain_error:
++            self.try_unmount(self.vdevs[0])
++
++        # now try with as-user=<self>
++        parent_conn, child_conn = Pipe()
++        proc = Process(target=self._mount_as_user_result,
++                       args=(child_conn, int(uid), int(gid), self.vdevs[0],
++                             {'as-user': GLib.Variant('s', self.username)}))
++        proc.start()
++        res_as_user = parent_conn.recv()
++        parent_conn.close()
++        proc.join()
++
++        self.assertTrue(res_as_user[0])
++        as_user_error = res_as_user[1]
++
++        if not plain_error and not as_user_error:
++            return
++        if plain_error and as_user_error:
++            # extract the GDBus error name (e.g. 'org.freedesktop.UDisks2.Error.NotAuthorizedCanObtain')
++            dbus_err_re = re.compile(r'GDBus\.Error:([\w.]+):')
++            plain_match = dbus_err_re.search(plain_error)
++            as_user_match = dbus_err_re.search(as_user_error)
++            plain_err_name = plain_match.group(1) if plain_match else plain_error
++            as_user_err_name = as_user_match.group(1) if as_user_match else as_user_error
++            self.assertEqual(plain_err_name, as_user_err_name,
++                             'as-user=<self> produced a different error than plain mount: '
++                             'plain=%s, as-user=%s' % (plain_error, as_user_error))
++            return
++
++        if plain_error:
++            self.fail('Plain mount failed (%s) but as-user=<self> succeeded' % plain_error)
++        else:
++            self.fail('Plain mount succeeded but as-user=<self> failed: %s' % as_user_error)
++
+     @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
+     def test_mount_as_user(self):
+         """ Test mounting a filesystem on behalf of a different user."""
+@@ -1550,6 +1720,108 @@ class NonPOSIXTestCase(UdisksFSTestCase):
+             self.fail(res[1])
+ 
+ 
++    def _test_mount_fstab_as_user_denied(self, fstab_options, target_user):
++        """ Test that an unprivileged user cannot use 'as-user' option to mount
++            a device listed in /etc/fstab with @fstab_options on behalf of
++            @target_user without polkit authorization.
++        """
++        disk = self.get_object('/block_devices/' + os.path.basename(self.vdevs[0]))
++        self.assertIsNotNone(disk)
++
++        self.addCleanup(self._remove_user, self.username)
++        uid, gid = self._add_user(self.username)
++
++        if target_user != 'root':
++            self.addCleanup(self._remove_user, target_user)
++            self._add_user(target_user)
++
++        self.addCleanup(self.try_unmount, self.vdevs[0])
++        self._prepare_mount_test(disk, True, fstab_options)
++
++        parent_conn, child_conn = Pipe()
++        proc = Process(target=self._mount_with_as_user_fail,
++                       args=(child_conn, int(uid), int(gid), self.vdevs[0], target_user))
++        proc.start()
++        res = parent_conn.recv()
++        parent_conn.close()
++        proc.join()
++
++        if not res[0]:
++            self.fail(res[1])
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_as_user_denied(self):
++        """ Test that user cannot use as-user to mount fstab 'users' device
++            on behalf of another user without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('users', self.target_username)
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_user_as_user_denied(self):
++        """ Test that user cannot use as-user to mount fstab 'user' device
++            on behalf of another user without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('user', self.target_username)
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_x_udisks_auth_as_user_denied(self):
++        """ Test that user cannot use as-user to mount fstab 'x-udisks-auth'
++            device on behalf of another user without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('x-udisks-auth', self.target_username)
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_as_root_denied(self):
++        """ Test that user cannot use as-user=root to mount fstab 'users'
++            device without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('users', 'root')
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_user_as_root_denied(self):
++        """ Test that user cannot use as-user=root to mount fstab 'user'
++            device without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('user', 'root')
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_x_udisks_auth_as_root_denied(self):
++        """ Test that user cannot use as-user=root to mount fstab
++            'x-udisks-auth' device without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('x-udisks-auth', 'root')
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_defaults_as_user_from_root(self):
++        """ Test that root can mount a device listed in /etc/fstab with
++            'defaults' (no 'user', 'users' or 'x-udisks-auth' options)
++            using the 'as-user' option targeting a non-root user.
++        """
++        disk = self.get_object('/block_devices/' + os.path.basename(self.vdevs[0]))
++        self.assertIsNotNone(disk)
++
++        self.addCleanup(self._remove_user, self.target_username)
++        self._add_user(self.target_username)
++
++        self.addCleanup(self.try_unmount, self.vdevs[0])
++        self._prepare_mount_test(disk, True, 'defaults')
++
++        d = dbus.Dictionary(signature='sv')
++        d['as-user'] = self.target_username
++        mnt_path = disk.Mount(d, dbus_interface=self.iface_prefix + '.Filesystem')
++        self.assertIsNotNone(mnt_path)
++        self.assertTrue(os.path.ismount(mnt_path))
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_defaults_as_user_denied(self):
++        """ Test that an unprivileged user cannot use 'as-user' option to
++            mount a device listed in /etc/fstab with 'defaults' (no 'user',
++            'users' or 'x-udisks-auth') on behalf of another user without
++            polkit authorization.
++        """
++        self._test_mount_fstab_as_user_denied('defaults', self.target_username)
++
++
+ class VFATTestCase(NonPOSIXTestCase):
+     _fs_signature = 'vfat'
+     _can_mount = True
+@@ -1691,6 +1963,12 @@ class UDFTestCase(UdisksFSTestCase):
+     def test_mount_fstab_complex_label_bad(self):
+         super(UDFTestCase, self).test_mount_fstab_complex_label_bad()
+ 
++    def test_mount_as_user_denied(self):
++        self.skipTest('Skipping as-user authorization test for UDF')
++
++    def test_mount_as_user_root_denied(self):
++        self.skipTest('Skipping as-user authorization test for UDF')
++
+ 
+ class FailsystemTestCase(UdisksFSTestCase):
+     # test that not supported operations fail 'nicely'
+-- 
+2.54.0
+
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 515797f39a..a77f693881 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -39,6 +39,13 @@ UDISKS_CONF_OPTS = \
 	--disable-vdo \
 	--disable-zram
 
+# 0001-udiskslinuxfilesystem-Separate-real-caller-identity-.patch
+# 0002-udiskslinuxfilesystem-Rework-fstab-mount-authorizati.patch
+# 0003-udiskslinuxfilesystem-Log-real-caller-uid-for-as-use.patch
+# 0004-udisksdaemonutil-Pass-as-user-target-to-polkit-detai.patch
+# 0005-tests-Add-security-tests-for-as-user-mount-authoriza.patch
+UDISKS_IGNORE_CVES += CVE-2026-7867
+
 ifeq ($(BR2_PACKAGE_UDISKS_FHS_MEDIA),y)
 UDISKS_CONF_OPTS += --enable-fhs-media
 else

--===============2120263527501737790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2120263527501737790==--
