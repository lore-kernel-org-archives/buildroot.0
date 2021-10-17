Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C24FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 12:35:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A426125F
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 12:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03A426125F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E9A40266;
	Sun, 17 Oct 2021 12:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWDGkQXqQi7n; Sun, 17 Oct 2021 12:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396B44026D;
	Sun, 17 Oct 2021 12:35:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DAC11BF295
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 12:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CDA9606F1
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 12:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3lhsAbzE6nZ for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 12:35:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A154B606E3
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 12:35:42 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.58.44]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MFsd7-1mVEAX1NKJ-00HQfF; Sun, 17 Oct 2021 14:35:30 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex@home.lespocky.de>)
 id 1mc5Nu-00081b-Tv; Sun, 17 Oct 2021 14:35:28 +0200
Received: (nullmailer pid 8323 invoked by uid 2001);
 Sun, 17 Oct 2021 12:35:26 -0000
From: Alexander Dahl <post@lespocky.de>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 14:35:01 +0200
Message-Id: <20211017123501.8253-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Scan-Signature: b1b544abd64ee95e912de87c31e3e05c
X-Provags-ID: V03:K1:94FUfGgPPKT0mFCL39LKjzJFwzKDvwLgBx25KQ8gRLUGsTXWXOc
 i+gai1GJ5ewLvhgJKABWtWcC77IqMZ82kK3ZdPfS9vl7776O9WRe9m0Q9S8HnwTT0VmmcV4
 2cGCG5RRNG/fE9h96YqQFZBNzYBuP8YYATHK+s468A7hPdk15Qqmd4JmHsKSxfjxZkWd0jF
 sw9jCGyycs/ttq5FmSmrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mnkQYpXmgJA=:1QctUuLd8Eu6E2c37da0mk
 vmIxWq+HiI+8P4yIgkfOssWtFNe4mmeub5izCyXPTbmczbyE651WddTkz0L0R6OeDfh3v5fFV
 TGvuklurlreVkEsR7tC5yMbE4KWg7L826AF7O0yGPrPFpUmcMOXkiis1GW3K2yfoeFHDBDFJ7
 +X+zegsvzvoX9tlNLolt/w06HqHpoGv2WMvDxJRTBwa/CSsSkc4XawJKP+molq4uWnryddz59
 NVab5aXVC7CjqwKbe/6xS6njQh05dR5P2n2/qJv1fshGGSCIxYoyzGfog6IWhsLL+47ld5kRv
 nvTDOCspIQLg9ZdZlbZMnTbufgsveaRYPFZwBWffuuppAfkpMbrtMdmWLpOlg2wOomb/05pRG
 SzrvKgKiknACdQcWG+n1HuzTuCW/FCtOf/1scTqqaQTmT4SDLLItwES5JcjObaEpmpFOP/394
 hg8VI8hWKd2FKh2PUbk4IpN47/yW2F5jKNIuGmhAHK05ro6uuoz7NgX6lNIIGMBjLDLbnpRTt
 LIhAOswQv7Bq/P0hOCWasALN0Jvo/L+um6YY5zuWKHIWatmAc1urzlEFSnlK0LEFetIzzu9y0
 Z1YiQJgWeFwuPSQV8z97v6HxrohbpzncJnL6hQQHhztABBvJW3wxc56swXNhNPZM0q/Fm8nF1
 Fc6HFUgMSvDVn7uVwb2+8eA4uJi9rPjdkSqokkTLvkvfy2yh+rx8zD+Wf3HY5M2amvctjutpk
 579VQLruXENjGWfcjPntXq4/zuzdeRgU8jvuQR9Nr/a/IaOHpO1/0Muw4jg=
Subject: [Buildroot] [PATCH] package/putty: bump version to 0.76
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
Cc: Alexander Dahl <post@lespocky.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0002 fixing CVE-2021-36367 gone upstream, part of the 0.76
release.

Link: https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html
Link: https://lists.tartarus.org/pipermail/putty-announce/2021/000032.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 ...o-reject-trivial-success-of-userauth.patch | 448 ------------------
 package/putty/putty.hash                      |  10 +-
 package/putty/putty.mk                        |   5 +-
 3 files changed, 6 insertions(+), 457 deletions(-)
 delete mode 100644 package/putty/0002-New-option-to-reject-trivial-success-of-userauth.patch

diff --git a/package/putty/0002-New-option-to-reject-trivial-success-of-userauth.patch b/package/putty/0002-New-option-to-reject-trivial-success-of-userauth.patch
deleted file mode 100644
index 83b93a346c..0000000000
--- a/package/putty/0002-New-option-to-reject-trivial-success-of-userauth.patch
+++ /dev/null
@@ -1,448 +0,0 @@
-From 1dc5659aa62848f0aeb5de7bd3839fecc7debefa Mon Sep 17 00:00:00 2001
-From: Simon Tatham <anakin@pobox.com>
-Date: Sat, 19 Jun 2021 15:39:15 +0100
-Subject: [PATCH] New option to reject 'trivial' success of userauth.
-
-Suggested by Manfred Kaiser, who also wrote most of this patch
-(although outlying parts, like documentation and SSH-1 support, are by
-me).
-
-This is a second line of defence against the kind of spoofing attacks
-in which a malicious or compromised SSH server rushes the client
-through the userauth phase of SSH without actually requiring any auth
-inputs (passwords or signatures or whatever), and then at the start of
-the connection phase it presents something like a spoof prompt,
-intended to be taken for part of userauth by the user but in fact with
-some more sinister purpose.
-
-Our existing line of defence against this is the trust sigil system,
-and as far as I know, that's still working. This option allows a bit of
-extra defence in depth: if you don't expect your SSH server to
-trivially accept authentication in the first place, then enabling this
-option will cause PuTTY to disconnect if it unexpectedly does so,
-without the user having to spot the presence or absence of a fiddly
-little sigil anywhere.
-
-Several types of authentication count as 'trivial'. The obvious one is
-the SSH-2 "none" method, which clients always try first so that the
-failure message will tell them what else they can try, and which a
-server can instead accept in order to authenticate you unconditionally.
-But there are two other ways to do it that we know of: one is to run
-keyboard-interactive authentication and send an empty INFO_REQUEST
-packet containing no actual prompts for the user, and another even
-weirder one is to send USERAUTH_SUCCESS in response to the user's
-preliminary *offer* of a public key (instead of sending the usual PK_OK
-to request an actual signature from the key).
-
-This new option detects all of those, by clearing the 'is_trivial_auth'
-flag only when we send some kind of substantive authentication response
-(be it a password, a k-i prompt response, a signature, or a GSSAPI
-token). So even if there's a further path through the userauth maze we
-haven't spotted, that somehow avoids sending anything substantive, this
-strategy should still pick it up.
-
-(cherry picked from commit 5f5c710cf3704737e24ffceb2c918e412a2a674f)
-
-[Retrieved from:
-https://git.tartarus.org/?p=simon/putty.git;a=commit;h=1dc5659aa62848f0aeb5de7bd3839fecc7debefa]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cmdline.c          |  8 ++++++++
- config.c           |  4 ++++
- doc/config.but     | 43 +++++++++++++++++++++++++++++++++++++++++++
- pscp.c             |  2 ++
- psftp.c            |  2 ++
- putty.h            |  1 +
- settings.c         |  2 ++
- ssh.c              |  4 +++-
- ssh1login.c        | 14 +++++++++++++-
- ssh2userauth.c     | 20 ++++++++++++++++----
- sshppl.h           |  2 +-
- unix/uxplink.c     |  2 ++
- windows/winhelp.h  |  1 +
- windows/winplink.c |  2 ++
- 14 files changed, 100 insertions(+), 7 deletions(-)
-
-diff --git a/cmdline.c b/cmdline.c
-index 7ea5cacc..62d65e19 100644
---- a/cmdline.c
-+++ b/cmdline.c
-@@ -598,6 +598,14 @@ int cmdline_process_param(const char *p, char *value,
-         SAVEABLE(0);
-         conf_set_bool(conf, CONF_tryagent, false);
-     }
-+
-+    if (!strcmp(p, "-no-trivial-auth")) {
-+        RETURN(1);
-+        UNAVAILABLE_IN(TOOLTYPE_NONNETWORK);
-+        SAVEABLE(0);
-+        conf_set_bool(conf, CONF_ssh_no_trivial_userauth, true);
-+    }
-+
-     if (!strcmp(p, "-share")) {
-         RETURN(1);
-         UNAVAILABLE_IN(TOOLTYPE_NONNETWORK);
-diff --git a/config.c b/config.c
-index ca808511..b8348530 100644
---- a/config.c
-+++ b/config.c
-@@ -2772,6 +2772,10 @@ void setup_config_box(struct controlbox *b, bool midsession,
-                           HELPCTX(ssh_auth_bypass),
-                           conf_checkbox_handler,
-                           I(CONF_ssh_no_userauth));
-+            ctrl_checkbox(s, "Disconnect if authentication succeeds trivially",
-+                          'n', HELPCTX(ssh_no_trivial_userauth),
-+                          conf_checkbox_handler,
-+                          I(CONF_ssh_no_trivial_userauth));
- 
-             s = ctrl_getset(b, "Connection/SSH/Auth", "methods",
-                             "Authentication methods");
-diff --git a/doc/config.but b/doc/config.but
-index a00ae476..77313282 100644
---- a/doc/config.but
-+++ b/doc/config.but
-@@ -2623,6 +2623,49 @@ interact with them.)
- This option only affects SSH-2 connections. SSH-1 connections always
- require an authentication step.
- 
-+\S{config-ssh-notrivialauth} \q{Disconnect if authentication succeeds
-+trivially}
-+
-+This option causes PuTTY to abandon an SSH session and disconnect from
-+the server, if the server accepted authentication without ever having
-+asked for any kind of password or signature or token.
-+
-+This might be used as a security measure. There are some forms of
-+attack against an SSH client user which work by terminating the SSH
-+authentication stage early, and then doing something in the main part
-+of the SSH session which \e{looks} like part of the authentication,
-+but isn't really.
-+
-+For example, instead of demanding a signature from your public key,
-+for which PuTTY would ask for your key's passphrase, a compromised or
-+malicious server might allow you to log in with no signature or
-+password at all, and then print a message that \e{imitates} PuTTY's
-+request for your passphrase, in the hope that you would type it in.
-+(In fact, the passphrase for your public key should not be sent to any
-+server.)
-+
-+PuTTY's main defence against attacks of this type is the \q{trust
-+sigil} system: messages in the PuTTY window that are truly originated
-+by PuTTY itself are shown next to a small copy of the PuTTY icon,
-+which the server cannot fake when it tries to imitate the same message
-+using terminal output.
-+
-+However, if you think you might be at risk of this kind of thing
-+anyway (if you don't watch closely for the trust sigils, or if you
-+think you're at extra risk of one of your servers being malicious),
-+then you could enable this option as an extra defence. Then, if the
-+server tries any of these attacks involving letting you through the
-+authentication stage, PuTTY will disconnect from the server before it
-+can send a follow-up fake prompt or other type of attack.
-+
-+On the other hand, some servers \e{legitimately} let you through the
-+SSH authentication phase trivially, either because they are genuinely
-+public, or because the important authentication step happens during
-+the terminal session. (An example might be an SSH server that connects
-+you directly to the terminal login prompt of a legacy mainframe.) So
-+enabling this option might cause some kinds of session to stop
-+working. It's up to you.
-+
- \S{config-ssh-tryagent} \q{Attempt authentication using Pageant}
- 
- If this option is enabled, then PuTTY will look for Pageant (the SSH
-diff --git a/pscp.c b/pscp.c
-index 0bfda92d..a11d1e18 100644
---- a/pscp.c
-+++ b/pscp.c
-@@ -2203,6 +2203,8 @@ static void usage(void)
-     printf("  -i key    private key file for user authentication\n");
-     printf("  -noagent  disable use of Pageant\n");
-     printf("  -agent    enable use of Pageant\n");
-+    printf("  -no-trivial-auth\n");
-+    printf("            disconnect if SSH authentication succeeds trivially\n");
-     printf("  -hostkey keyid\n");
-     printf("            manually specify a host key (may be repeated)\n");
-     printf("  -batch    disable all interactive prompts\n");
-diff --git a/psftp.c b/psftp.c
-index 40cb73f5..c4b5374b 100644
---- a/psftp.c
-+++ b/psftp.c
-@@ -2538,6 +2538,8 @@ static void usage(void)
-     printf("  -i key    private key file for user authentication\n");
-     printf("  -noagent  disable use of Pageant\n");
-     printf("  -agent    enable use of Pageant\n");
-+    printf("  -no-trivial-auth\n");
-+    printf("            disconnect if SSH authentication succeeds trivially\n");
-     printf("  -hostkey keyid\n");
-     printf("            manually specify a host key (may be repeated)\n");
-     printf("  -batch    disable all interactive prompts\n");
-diff --git a/putty.h b/putty.h
-index ef6f7a37..7789f217 100644
---- a/putty.h
-+++ b/putty.h
-@@ -1428,6 +1428,7 @@ NORETURN void cleanup_exit(int);
-     X(INT, NONE, sshprot) \
-     X(BOOL, NONE, ssh2_des_cbc) /* "des-cbc" unrecommended SSH-2 cipher */ \
-     X(BOOL, NONE, ssh_no_userauth) /* bypass "ssh-userauth" (SSH-2 only) */ \
-+    X(BOOL, NONE, ssh_no_trivial_userauth) /* disable trivial types of auth */ \
-     X(BOOL, NONE, ssh_show_banner) /* show USERAUTH_BANNERs (SSH-2 only) */ \
-     X(BOOL, NONE, try_tis_auth) \
-     X(BOOL, NONE, try_ki_auth) \
-diff --git a/settings.c b/settings.c
-index 547af0dc..32a53c54 100644
---- a/settings.c
-+++ b/settings.c
-@@ -609,6 +609,7 @@ void save_open_settings(settings_w *sesskey, Conf *conf)
- #endif
-     write_setting_s(sesskey, "RekeyBytes", conf_get_str(conf, CONF_ssh_rekey_data));
-     write_setting_b(sesskey, "SshNoAuth", conf_get_bool(conf, CONF_ssh_no_userauth));
-+    write_setting_b(sesskey, "SshNoTrivialAuth", conf_get_bool(conf, CONF_ssh_no_trivial_userauth));
-     write_setting_b(sesskey, "SshBanner", conf_get_bool(conf, CONF_ssh_show_banner));
-     write_setting_b(sesskey, "AuthTIS", conf_get_bool(conf, CONF_try_tis_auth));
-     write_setting_b(sesskey, "AuthKI", conf_get_bool(conf, CONF_try_ki_auth));
-@@ -1025,6 +1026,7 @@ void load_open_settings(settings_r *sesskey, Conf *conf)
-     gpps(sesskey, "LogHost", "", conf, CONF_loghost);
-     gppb(sesskey, "SSH2DES", false, conf, CONF_ssh2_des_cbc);
-     gppb(sesskey, "SshNoAuth", false, conf, CONF_ssh_no_userauth);
-+    gppb(sesskey, "SshNoTrivialAuth", false, conf, CONF_ssh_no_trivial_userauth);
-     gppb(sesskey, "SshBanner", true, conf, CONF_ssh_show_banner);
-     gppb(sesskey, "AuthTIS", false, conf, CONF_try_tis_auth);
-     gppb(sesskey, "AuthKI", true, conf, CONF_try_ki_auth);
-diff --git a/ssh.c b/ssh.c
-index 00a516ea..91e7e869 100644
---- a/ssh.c
-+++ b/ssh.c
-@@ -254,7 +254,9 @@ static void ssh_got_ssh_version(struct ssh_version_receiver *rcv,
-                     connection_layer, ssh->savedhost, ssh->fullhostname,
-                     conf_get_filename(ssh->conf, CONF_keyfile),
-                     conf_get_bool(ssh->conf, CONF_ssh_show_banner),
--                    conf_get_bool(ssh->conf, CONF_tryagent), username,
-+                    conf_get_bool(ssh->conf, CONF_tryagent),
-+                    conf_get_bool(ssh->conf, CONF_ssh_no_trivial_userauth),
-+                    username,
-                     conf_get_bool(ssh->conf, CONF_change_username),
-                     conf_get_bool(ssh->conf, CONF_try_ki_auth),
- #ifndef NO_GSSAPI
-diff --git a/ssh1login.c b/ssh1login.c
-index 8486cbf0..519838d7 100644
---- a/ssh1login.c
-+++ b/ssh1login.c
-@@ -27,7 +27,7 @@ struct ssh1_login_state {
- 
-     char *savedhost;
-     int savedport;
--    bool try_agent_auth;
-+    bool try_agent_auth, is_trivial_auth;
- 
-     int remote_protoflags;
-     int local_protoflags;
-@@ -105,6 +105,8 @@ PacketProtocolLayer *ssh1_login_new(
-     s->savedhost = dupstr(host);
-     s->savedport = port;
-     s->successor_layer = successor_layer;
-+    s->is_trivial_auth = true;
-+
-     return &s->ppl;
- }
- 
-@@ -645,6 +647,7 @@ static void ssh1_login_process_queue(PacketProtocolLayer *ppl)
-                                 s->ppl.bpp, SSH1_CMSG_AUTH_RSA_RESPONSE);
-                             put_data(pkt, ret + 5, 16);
-                             pq_push(s->ppl.out_pq, pkt);
-+                            s->is_trivial_auth = false;
-                             crMaybeWaitUntilV(
-                                 (pktin = ssh1_login_pop(s))
-                                 != NULL);
-@@ -814,6 +817,7 @@ static void ssh1_login_process_queue(PacketProtocolLayer *ppl)
-                         s->ppl.bpp, SSH1_CMSG_AUTH_RSA_RESPONSE);
-                     put_data(pkt, buffer, 16);
-                     pq_push(s->ppl.out_pq, pkt);
-+                    s->is_trivial_auth = false;
- 
-                     mp_free(challenge);
-                     mp_free(response);
-@@ -1105,6 +1109,7 @@ static void ssh1_login_process_queue(PacketProtocolLayer *ppl)
-             put_stringz(pkt, prompt_get_result_ref(s->cur_prompt->prompts[0]));
-             pq_push(s->ppl.out_pq, pkt);
-         }
-+        s->is_trivial_auth = false;
-         ppl_logevent("Sent password");
-         free_prompts(s->cur_prompt);
-         s->cur_prompt = NULL;
-@@ -1121,6 +1126,13 @@ static void ssh1_login_process_queue(PacketProtocolLayer *ppl)
-         }
-     }
- 
-+    if (conf_get_bool(s->conf, CONF_ssh_no_trivial_userauth) &&
-+        s->is_trivial_auth) {
-+        ssh_proto_error(s->ppl.ssh, "Authentication was trivial! "
-+                        "Abandoning session as specified in configuration.");
-+        return;
-+    }
-+
-     ppl_logevent("Authentication successful");
- 
-     if (conf_get_bool(s->conf, CONF_compression)) {
-diff --git a/ssh2userauth.c b/ssh2userauth.c
-index 01243baf..451d5abe 100644
---- a/ssh2userauth.c
-+++ b/ssh2userauth.c
-@@ -28,7 +28,7 @@ struct ssh2_userauth_state {
- 
-     PacketProtocolLayer *transport_layer, *successor_layer;
-     Filename *keyfile;
--    bool show_banner, tryagent, change_username;
-+    bool show_banner, tryagent, notrivialauth, change_username;
-     char *hostname, *fullhostname;
-     char *default_username;
-     bool try_ki_auth, try_gssapi_auth, try_gssapi_kex_auth, gssapi_fwd;
-@@ -82,6 +82,7 @@ struct ssh2_userauth_state {
-     int len;
-     PktOut *pktout;
-     bool want_user_input;
-+    bool is_trivial_auth;
- 
-     agent_pending_query *auth_agent_query;
-     bufchain banner;
-@@ -134,7 +135,7 @@ static const PacketProtocolLayerVtable ssh2_userauth_vtable = {
- PacketProtocolLayer *ssh2_userauth_new(
-     PacketProtocolLayer *successor_layer,
-     const char *hostname, const char *fullhostname,
--    Filename *keyfile, bool show_banner, bool tryagent,
-+    Filename *keyfile, bool show_banner, bool tryagent, bool notrivialauth,
-     const char *default_username, bool change_username,
-     bool try_ki_auth, bool try_gssapi_auth, bool try_gssapi_kex_auth,
-     bool gssapi_fwd, struct ssh_connection_shared_gss_state *shgss)
-@@ -149,6 +150,7 @@ PacketProtocolLayer *ssh2_userauth_new(
-     s->keyfile = filename_copy(keyfile);
-     s->show_banner = show_banner;
-     s->tryagent = tryagent;
-+    s->notrivialauth = notrivialauth;
-     s->default_username = dupstr(default_username);
-     s->change_username = change_username;
-     s->try_ki_auth = try_ki_auth;
-@@ -157,6 +159,7 @@ PacketProtocolLayer *ssh2_userauth_new(
-     s->gssapi_fwd = gssapi_fwd;
-     s->shgss = shgss;
-     s->last_methods_string = strbuf_new();
-+    s->is_trivial_auth = true;
-     bufchain_init(&s->banner);
-     bufchain_sink_init(&s->banner_bs, &s->banner);
- 
-@@ -818,6 +821,7 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-                                 sigblob);
-                             pq_push(s->ppl.out_pq, s->pktout);
-                             s->type = AUTH_TYPE_PUBLICKEY;
-+                            s->is_trivial_auth = false;
-                         } else {
-                             ppl_logevent("Pageant refused signing request");
-                             ppl_printf("Pageant failed to "
-@@ -1038,6 +1042,7 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-                     ssh_key_free(key->key);
-                     sfree(key->comment);
-                     sfree(key);
-+                    s->is_trivial_auth = false;
-                 }
- 
- #ifndef NO_GSSAPI
-@@ -1169,6 +1174,7 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-                      * no longer says CONTINUE_NEEDED
-                      */
-                     if (s->gss_sndtok.length != 0) {
-+                        s->is_trivial_auth = false;
-                         s->pktout =
-                             ssh_bpp_new_pktout(
-                                 s->ppl.bpp, SSH2_MSG_USERAUTH_GSSAPI_TOKEN);
-@@ -1288,7 +1294,6 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-                  * Loop while the server continues to send INFO_REQUESTs.
-                  */
-                 while (pktin->type == SSH2_MSG_USERAUTH_INFO_REQUEST) {
--
-                     ptrlen name, inst;
-                     strbuf *sb;
- 
-@@ -1308,6 +1313,7 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-                      */
-                     s->num_prompts = get_uint32(pktin);
-                     for (uint32_t i = 0; i < s->num_prompts; i++) {
-+                        s->is_trivial_auth = false;
-                         ptrlen prompt = get_string(pktin);
-                         bool echo = get_bool(pktin);
- 
-@@ -1472,7 +1478,7 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-                 pq_push_front(s->ppl.in_pq, pktin);
- 
-             } else if (s->can_passwd) {
--
-+                s->is_trivial_auth = false;
-                 /*
-                  * Plain old password authentication.
-                  */
-@@ -1731,6 +1737,12 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-     }
- 
-   userauth_success:
-+    if (s->notrivialauth && s->is_trivial_auth) {
-+        ssh_proto_error(s->ppl.ssh, "Authentication was trivial! "
-+                        "Abandoning session as specified in configuration.");
-+        return;
-+    }
-+
-     /*
-      * We've just received USERAUTH_SUCCESS, and we haven't sent
-      * any packets since. Signal the transport layer to consider
-diff --git a/sshppl.h b/sshppl.h
-index b339d67c..2c1dbf42 100644
---- a/sshppl.h
-+++ b/sshppl.h
-@@ -116,7 +116,7 @@ PacketProtocolLayer *ssh2_transport_new(
- PacketProtocolLayer *ssh2_userauth_new(
-     PacketProtocolLayer *successor_layer,
-     const char *hostname, const char *fullhostname,
--    Filename *keyfile, bool show_banner, bool tryagent,
-+    Filename *keyfile, bool show_banner, bool tryagent, bool notrivialauth,
-     const char *default_username, bool change_username,
-     bool try_ki_auth,
-     bool try_gssapi_auth, bool try_gssapi_kex_auth,
-diff --git a/unix/uxplink.c b/unix/uxplink.c
-index 3e2a9b6b..240783f4 100644
---- a/unix/uxplink.c
-+++ b/unix/uxplink.c
-@@ -527,6 +527,8 @@ static void usage(void)
-     printf("  -i key    private key file for user authentication\n");
-     printf("  -noagent  disable use of Pageant\n");
-     printf("  -agent    enable use of Pageant\n");
-+    printf("  -no-trivial-auth\n");
-+    printf("            disconnect if SSH authentication succeeds trivially\n");
-     printf("  -noshare  disable use of connection sharing\n");
-     printf("  -share    enable use of connection sharing\n");
-     printf("  -hostkey keyid\n");
-diff --git a/windows/winhelp.h b/windows/winhelp.h
-index ae5a7a7f..9011df45 100644
---- a/windows/winhelp.h
-+++ b/windows/winhelp.h
-@@ -111,6 +111,7 @@
- #define WINHELP_CTX_ssh_kex_repeat "config-ssh-kex-rekey"
- #define WINHELP_CTX_ssh_kex_manual_hostkeys "config-ssh-kex-manual-hostkeys"
- #define WINHELP_CTX_ssh_auth_bypass "config-ssh-noauth"
-+#define WINHELP_CTX_ssh_no_trivial_userauth "config-ssh-notrivialauth"
- #define WINHELP_CTX_ssh_auth_banner "config-ssh-banner"
- #define WINHELP_CTX_ssh_auth_privkey "config-ssh-privkey"
- #define WINHELP_CTX_ssh_auth_agentfwd "config-ssh-agentfwd"
-diff --git a/windows/winplink.c b/windows/winplink.c
-index 9bda0712..58d43e6d 100644
---- a/windows/winplink.c
-+++ b/windows/winplink.c
-@@ -149,6 +149,8 @@ static void usage(void)
-     printf("  -i key    private key file for user authentication\n");
-     printf("  -noagent  disable use of Pageant\n");
-     printf("  -agent    enable use of Pageant\n");
-+    printf("  -no-trivial-auth\n");
-+    printf("            disconnect if SSH authentication succeeds trivially\n");
-     printf("  -noshare  disable use of connection sharing\n");
-     printf("  -share    enable use of connection sharing\n");
-     printf("  -hostkey keyid\n");
--- 
-2.20.1
-
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 8974aaac5e..861d45cb76 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,8 +1,8 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.75/{md5,sha1,sha256,sha512}sums
-md5  fae57a9ab209f303cc9e9f83eecaa27c  putty-0.75.tar.gz
-sha1  cdb976811a35eed67c5a2c588908b08edf6e3e1d  putty-0.75.tar.gz
-sha256  d3173b037eddbe9349abe978101277b4ba9f9959e25dedd44f87e7b85cc8f9f5  putty-0.75.tar.gz
-sha512  3dbc15485008a98daf60236061253e66b94a6e5da123fc84c5f0ac006c84e17c70fe748987677775e3b54a12297eb826cccf70a4fc039b633bc2d512938b3028  putty-0.75.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.76/{md5,sha1,sha256,sha512}sums
+md5  9d22f8c56c1eaa1c0af3098438f25908  putty-0.76.tar.gz
+sha1  de09f50aee330eb05ad0cb81b970d0cc8e5c9b25  putty-0.76.tar.gz
+sha256  547cd97a8daa87ef71037fab0773bceb54a8abccb2f825a49ef8eba5e045713f  putty-0.76.tar.gz
+sha512  4576b359593928c6eba923f2d7b66ac0f2cf00e0c217cdbbb124471c3b35feb090e623847bfc507a4ef106cb3067aac47419e241b11dd8bf4ae554061fa93c25  putty-0.76.tar.gz
 
 # Locally calculated
 sha256  3f3e870dd3d0867d79370b1d433602c60bb91b59de04e5d8f2a149b788530d53  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index a1c588a382..e57a78be96 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.75
+PUTTY_VERSION = 0.76
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
 PUTTY_CONF_OPTS = --disable-gtktest
 
-# 0002-New-option-to-reject-trivial-success-of-userauth.patch
-PUTTY_IGNORE_CVES += CVE-2021-36367
-
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_CONF_OPTS += --with-gtk=2
 PUTTY_DEPENDENCIES += libgtk2

base-commit: 55ae6b59d48dd75f4e432b63e5b8a4655b76305c
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
