Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D693CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE1EB60C1A;
	Fri,  5 Jun 2026 12:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5orXarybG4t; Fri,  5 Jun 2026 12:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C052D60BF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663154;
	bh=A5tZH8FFrOYK2Nbh31V2FCj/sVCgOnidhqUnzdIRHig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bBIO6D8+2oQYTL5jA+yJpdUbSenLO3OD0QFC9uwyfHtaB09ITa0Bo/JOJkPFgYIO9
	 q7AK8B98XXl1s3hwpZlHwtp4YCvd6/cJSpSkBs2a6oiyfQS9WwfmqjCw9QOhgtZmex
	 gpXnlgYZ8rl1YzxrGC0gmyIMjS9SEDdPFB18V3d71CQadnKlnjlI6QjtspoPr+4XYD
	 2ZXYCCzwcyCrIy/GOWtmpx1fnhCo5piORM8wGAnr6o4KbK0seWDECbs7pO54u/WB2T
	 +fZRJ5m0Ix1TjK2zAZxA32nnTJYjfop0R5tEnTIMJrZy5oS0UHo3aLEI/cyHUCGxVD
	 7SFva48P1ffTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C052D60BF2;
	Fri,  5 Jun 2026 12:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1322C3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A97D881E51
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K44Q4r_Vk1Q2 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A26581B71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A26581B71
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C44D487B36; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 14:27:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ef93b47d98a2ed0a41b6c45d769acba8a2cb2279
X-Git-Newrev: c84ebd03a5a29cbea935cff0c8673da26a94299e
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.C44D487B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openssh: patch
 various CVEs
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7883258369775031904=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7883258369775031904==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c84ebd03a5a29cbea935cff0c8673da26a94299e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Thanks to the Debian community to providing the patches. This commit
fixes the following vulnerability.

- CVE-2025-61984:
    ssh in OpenSSH before 10.1 allows control characters in usernames that
    originate from certain possibly untrusted sources, potentially leading
    to code execution when a ProxyCommand is used. The untrusted sources
    are the command line and %-sequence expansion of a configuration file.
    (A configuration file that provides a complete literal username is not
    categorized as an untrusted source.)
    https://www.cve.org/CVERecord?id=CVE-2025-61984

- CVE-2025-61985:
    ssh in OpenSSH before 10.1 allows the '\0' character in an ssh:// URI,
    potentially leading to code execution when a ProxyCommand is used.
    https://www.cve.org/CVERecord?id=CVE-2025-61985

- CVE-2026-35385:
    In OpenSSH before 10.3, a file downloaded by scp may be installed
    setuid or setgid, an outcome contrary to some users' expectations, if
    the download is performed as root with -O (legacy scp protocol) and
    without -p (preserve mode).
    https://www.cve.org/CVERecord?id=CVE-2026-35385

- CVE-2026-35386:
    In OpenSSH before 10.3, command execution can occur via shell
    metacharacters in a username within a command line. This requires a
    scenario where the username on the command line is untrusted, and also
    requires a non-default configurations of % in ssh_config.
    https://www.cve.org/CVERecord?id=CVE-2026-35386

- CVE-2026-35387:
    OpenSSH before 10.3 can use unintended ECDSA algorithms. Listing of
    any ECDSA algorithm in PubkeyAcceptedAlgorithms or
    HostbasedAcceptedAlgorithms is misinterpreted to mean all ECDSA
    algorithms.
    https://www.cve.org/CVERecord?id=CVE-2026-35387

- CVE-2026-35388:
    OpenSSH before 10.3 omits connection multiplexing confirmation for
    proxy-mode multiplexing sessions.
    https://www.cve.org/CVERecord?id=CVE-2026-35388

- CVE-2026-35414:
    OpenSSH before 10.3 mishandles the authorized_keys principals option
    in uncommon scenarios involving a principals list in conjunction with
    a Certificate Authority that makes certain use of comma characters.
    https://www.cve.org/CVERecord?id=CVE-2026-35414

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openssh/0002-CVE-2025-61984-tests.patch |  78 ++++++
 package/openssh/0003-CVE-2025-61984.patch       | 112 +++++++++
 package/openssh/0004-CVE-2025-61985.patch       |  40 +++
 package/openssh/0005-CVE-2026-35385.patch       |  36 +++
 package/openssh/0006-CVE-2026-35386-1.patch     | 318 ++++++++++++++++++++++++
 package/openssh/0007-CVE-2026-35386-2.patch     |  51 ++++
 package/openssh/0008-CVE-2026-35386-3.patch     |  25 ++
 package/openssh/0009-CVE-2026-35387.patch       | 135 ++++++++++
 package/openssh/0010-CVE-2026-35388.patch       |  39 +++
 package/openssh/0011-CVE-2026-35414.patch       |  78 ++++++
 package/openssh/openssh.mk                      |  17 ++
 11 files changed, 929 insertions(+)

diff --git a/package/openssh/0002-CVE-2025-61984-tests.patch b/package/openssh/0002-CVE-2025-61984-tests.patch
new file mode 100644
index 0000000000..4dce752890
--- /dev/null
+++ b/package/openssh/0002-CVE-2025-61984-tests.patch
@@ -0,0 +1,78 @@
+From f17eedbd2398f00fbb96170b60c8d2895318223e Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 03:04:44 +0000
+Subject: Add more username validity checks
+
+[cjwatson: Reduced from a more extensive upstream change, since OpenSSH
+< 10.0 doesn't support %-expansion of usernames.]
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2025-61984-tests.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=f64701ca25795548a61614d0b13391d6dfa7f38c
+CVE: CVE-2025-61984
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ regress/percent.sh | 37 +++++++++++++++++++++++++++++++++++--
+ 1 file changed, 35 insertions(+), 2 deletions(-)
+
+diff --git a/regress/percent.sh b/regress/percent.sh
+index 3dfa8d2df..6b9c492b0 100644
+--- a/regress/percent.sh
++++ b/regress/percent.sh
+@@ -29,6 +29,20 @@ trial()
+ 		    somehost true
+ 		got=`cat $OBJ/actual`
+ 		;;
++	user)
++		got=`${SSH} -F $OBJ/ssh_proxy -o $opt="$arg" -G \
++		    remuser@somehost | awk '$1=="'$opt'"{print $2}'`
++		;;
++	user-l)
++		# Also test ssh -l
++		got=`${SSH} -F $OBJ/ssh_proxy -l "$arg" -G \
++		    somehost | awk '$1=="'user'"{print $2}'`
++		;;
++	user-at)
++		# Also test user@host
++		got=`${SSH} -F $OBJ/ssh_proxy -G "$arg@somehost" | \
++		    awk '$1=="'user'"{print $2}'`
++		;;
+ 	userknownhostsfile)
+ 		# Move the userknownhosts file to what the expansion says,
+ 		# make sure ssh works then put it back.
+@@ -107,11 +121,11 @@ done
+ 
+ # Subset of above since we don't expand shell-style variables on anything that
+ # runs a command because the shell will expand those.
++FOO=bar
++export FOO
+ for i in controlpath identityagent forwardagent localforward remoteforward \
+     userknownhostsfile; do
+ 	verbose $tid $i dollar
+-	FOO=bar
+-	export FOO
+ 	trial $i '${FOO}' $FOO
+ done
+ 
+@@ -122,3 +136,22 @@ for i in controlpath identityagent forwardagent; do
+ 	trial $i '~' $HOME/
+ 	trial $i '~/.ssh' $HOME/.ssh
+ done
++
++# These should be not be expanded but rejected for containing shell characters.
++verbose $tid user-l noenv
++${SSH} -F $OBJ/ssh_proxy -l '${FOO}' -G somehost && fail "user-l expanded env"
++verbose $tid user-at noenv
++${SSH} -F $OBJ/ssh_proxy -G '${FOO}@somehost' && fail "user-at expanded env"
++
++FOO=`printf 'x\ay'`
++export FOO
++
++# These should be rejected as containing control characters.
++verbose $tid user-l badchar
++${SSH} -F $OBJ/ssh_proxy -l "${FOO}" -G somehost && fail "user-l expanded env"
++verbose $tid user-at badchar
++${SSH} -F $OBJ/ssh_proxy -G "${FOO}@somehost" && fail "user-at expanded env"
++
++# Literal control characters in config is acceptable
++verbose $tid user control-literal
++trial user "$FOO" "$FOO"
diff --git a/package/openssh/0003-CVE-2025-61984.patch b/package/openssh/0003-CVE-2025-61984.patch
new file mode 100644
index 0000000000..d3c909127a
--- /dev/null
+++ b/package/openssh/0003-CVE-2025-61984.patch
@@ -0,0 +1,112 @@
+From 8d3eae0cb6c443f5b3747aedde770fbeee7317f9 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:29:09 +0000
+Subject: Refuse usernames that include control characters
+
+Since OpenSSH 9.6, all usernames have been subject to validity checking.
+This change tightens the validity checks by refusing usernames that
+include control characters; these can cause surprises when supplied
+adversarially.
+
+This change also relaxes the validity checks in one small way: usernames
+supplied via the configuration file as literals are not subject to these
+validity checks. This allows usernames that contain arbitrary characters
+to be used, but only via configuration files. This is done on the basis
+that ssh's configuration is trusted.
+
+Pointed out by David Leadbeater, ok deraadt@
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2025-61984.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=35d5917652106aede47621bb3f64044604164043
+CVE: CVE-2025-61984
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ssh.c | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+ 
+diff --git a/ssh.c b/ssh.c
+index 48d93ddf2..9c49f98a8 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -649,6 +649,8 @@ valid_ruser(const char *s)
+ 	if (*s == '-')
+ 		return 0;
+ 	for (i = 0; s[i] != 0; i++) {
++		if (iscntrl((u_char)s[i]))
++			return 0;
+ 		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
+ 			return 0;
+ 		/* Disallow '-' after whitespace */
+@@ -671,6 +673,7 @@ main(int ac, char **av)
+ 	int i, r, opt, exit_status, use_syslog, direct, timeout_ms;
+ 	int was_addr, config_test = 0, opt_terminated = 0, want_final_pass = 0;
+ 	char *p, *cp, *line, *argv0, *logfile;
++	int user_on_commandline = 0, user_was_default = 0;
+ 	char cname[NI_MAXHOST], thishost[NI_MAXHOST];
+ 	struct stat st;
+ 	struct passwd *pw;
+@@ -1016,8 +1019,10 @@ main(int ac, char **av)
+ 			}
+ 			break;
+ 		case 'l':
+-			if (options.user == NULL)
++			if (options.user == NULL) {
+ 				options.user = optarg;
++				user_on_commandline = 1;
++			}
+ 			break;
+ 
+ 		case 'L':
+@@ -1120,6 +1125,7 @@ main(int ac, char **av)
+ 			if (options.user == NULL) {
+ 				options.user = tuser;
+ 				tuser = NULL;
++				user_on_commandline = 1;
+ 			}
+ 			free(tuser);
+ 			if (options.port == -1 && tport != -1)
+@@ -1134,6 +1140,7 @@ main(int ac, char **av)
+ 				if (options.user == NULL) {
+ 					options.user = p;
+ 					p = NULL;
++					user_on_commandline = 1;
+ 				}
+ 				*cp++ = '\0';
+ 				host = xstrdup(cp);
+@@ -1288,8 +1295,10 @@ main(int ac, char **av)
+ 	if (fill_default_options(&options) != 0)
+ 		cleanup_exit(255);
+ 
+-	if (options.user == NULL)
++	if (options.user == NULL) {
++		user_was_default = 1;
+ 		options.user = xstrdup(pw->pw_name);
++	}
+ 
+ 	/*
+ 	 * If ProxyJump option specified, then construct a ProxyCommand now.
+@@ -1430,11 +1439,22 @@ main(int ac, char **av)
+ 	    options.host_key_alias : options.host_arg);
+ 	cinfo->host_arg = xstrdup(options.host_arg);
+ 	cinfo->remhost = xstrdup(host);
+-	cinfo->remuser = xstrdup(options.user);
+ 	cinfo->homedir = xstrdup(pw->pw_dir);
+ 	cinfo->locuser = xstrdup(pw->pw_name);
+ 	cinfo->jmphost = xstrdup(options.jump_host == NULL ?
+ 	    "" : options.jump_host);
++
++	/*
++	 * Usernames specified on the commandline must be validated.
++	 * Conversely, usernames from getpwnam(3) or specified as literals
++	 * via configuration (i.e. not expanded) are not subject to validation.
++	 */
++	if (user_on_commandline && !valid_ruser(options.user))
++		fatal("remote username contains invalid characters");
++
++	/* Store it and calculate hash. */
++	cinfo->remuser = xstrdup(options.user);
++
+ 	cinfo->conn_hash_hex = ssh_connection_hash(cinfo->thishost,
+ 	    cinfo->remhost, cinfo->portstr, cinfo->remuser, cinfo->jmphost);
+ 
+
diff --git a/package/openssh/0004-CVE-2025-61985.patch b/package/openssh/0004-CVE-2025-61985.patch
new file mode 100644
index 0000000000..e565f038bc
--- /dev/null
+++ b/package/openssh/0004-CVE-2025-61985.patch
@@ -0,0 +1,40 @@
+From 2ada375659b2c3d1f85739bc1ceaefb9f9128600 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:30:06 +0000
+Subject: upstream: don't allow \0 characters in url-encoded strings.
+
+Suggested by David Leadbeater, ok deraadt@
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2025-61985.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=43b3bff47bb029f2299bacb6a36057981b39fdb0
+CVE: CVE-2025-61985
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ misc.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/misc.c b/misc.c
+index 36e72f5b5..a50119446 100644
+--- a/misc.c
++++ b/misc.c
+@@ -990,7 +990,7 @@ urldecode(const char *src)
+ 	size_t srclen;
+ 
+ 	if ((srclen = strlen(src)) >= SIZE_MAX)
+-		fatal_f("input too large");
++		return NULL;
+ 	ret = xmalloc(srclen + 1);
+ 	for (dst = ret; *src != '\0'; src++) {
+ 		switch (*src) {
+@@ -998,9 +998,10 @@ urldecode(const char *src)
+ 			*dst++ = ' ';
+ 			break;
+ 		case '%':
++			/* note: don't allow \0 characters */
+ 			if (!isxdigit((unsigned char)src[1]) ||
+ 			    !isxdigit((unsigned char)src[2]) ||
+-			    (ch = hexchar(src + 1)) == -1) {
++			    (ch = hexchar(src + 1)) == -1 || ch == 0) {
+ 				free(ret);
+ 				return NULL;
+ 			}
diff --git a/package/openssh/0005-CVE-2026-35385.patch b/package/openssh/0005-CVE-2026-35385.patch
new file mode 100644
index 0000000000..f6dc367aa0
--- /dev/null
+++ b/package/openssh/0005-CVE-2026-35385.patch
@@ -0,0 +1,36 @@
+From d0d5ee1547b4fc7a3b355d15262f272682465a2f Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:42:16 +0000
+Subject: upstream: when downloading files as root in legacy (-O) mode and
+
+without the -p (preserve modes) flag set, clear setuid/setgid bits from
+downloaded files as one might expect.
+
+AFAIK this bug dates back to the original Berkeley rcp program.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2026-35385.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=487e8ac146f7d6616f65c125d5edb210519b833a
+CVE: CVE-2026-35385
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ scp.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/scp.c b/scp.c
+index df590c4e3..77c854002 100644
+--- a/scp.c
++++ b/scp.c
+@@ -1684,8 +1684,10 @@ sink(int argc, char **argv, const char *src)
+ 
+ 	setimes = targisdir = 0;
+ 	mask = umask(0);
+-	if (!pflag)
++	if (!pflag) {
++		mask |= 07000;
+ 		(void) umask(mask);
++	}
+ 	if (argc != 1) {
+ 		run_err("ambiguous target");
+ 		exit(1);
diff --git a/package/openssh/0006-CVE-2026-35386-1.patch b/package/openssh/0006-CVE-2026-35386-1.patch
new file mode 100644
index 0000000000..7a4546b115
--- /dev/null
+++ b/package/openssh/0006-CVE-2026-35386-1.patch
@@ -0,0 +1,318 @@
+From 03dbf03cf10c5ea273d909caefa3a105824a9ea0 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 30 Mar 2026 07:18:24 +0000
+Subject: upstream: apply the same validity rules to usernames and hostnames
+
+set for ProxyJump/-J on the commandline as we do for destination user/host
+names.
+
+Specifically, they are no longer allowed to contain most characters
+that have special meaning for common shells. Special characters are
+still allowed in ProxyJump commands that are specified in the config
+files.
+
+This _reduces_ the chance that shell characters from a hostile -J
+option from ending up in a shell execution context.
+
+Don't pass untrusted stuff to the ssh commandline, it's not intended
+to be a security boundary. We try to make it safe where we can, but
+we can't make guarantees, because we can't know the parsing rules
+and special characters for all the shells in the world, nor can we
+know what the user does with this data in their ssh_config wrt
+percent expansion, LocalCommand, match exec, etc.
+
+While I'm in there, make ProxyJump and ProxyCommand first-match-wins
+between each other.
+
+reported by rabbit; ok dtucker@
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2026-35386-1.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=0a0ef4515361143cad21afa072319823854c1cf6
+CVE: CVE-2026-35386
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ readconf.c | 124 +++++++++++++++++++++++++++++++++++++----------------
+ readconf.h |   4 +-
+ ssh.c      |  48 +++------------------
+ 3 files changed, 95 insertions(+), 81 deletions(-)
+
+diff --git a/readconf.c b/readconf.c
+index 2db9cb6ae..a6e8303ff 100644
+--- a/readconf.c
++++ b/readconf.c
+@@ -1483,9 +1483,6 @@ parse_char_array:
+ 
+ 	case oProxyCommand:
+ 		charptr = &options->proxy_command;
+-		/* Ignore ProxyCommand if ProxyJump already specified */
+-		if (options->jump_host != NULL)
+-			charptr = &options->jump_host; /* Skip below */
+ parse_command:
+ 		if (str == NULL) {
+ 			error("%.200s line %d: Missing argument.",
+@@ -1506,7 +1503,7 @@ parse_command:
+ 		}
+ 		len = strspn(str, WHITESPACE "=");
+ 		/* XXX use argv? */
+-		if (parse_jump(str + len, options, *activep) == -1) {
++		if (parse_jump(str + len, options, cmdline, *activep) == -1) {
+ 			error("%.200s line %d: Invalid ProxyJump \"%s\"",
+ 			    filename, linenum, str + len);
+ 			goto out;
+@@ -3298,65 +3295,116 @@ parse_forward(struct Forward *fwd, const char *fwdspec, int dynamicfwd, int remo
+ }
+ 
+ int
+-parse_jump(const char *s, Options *o, int active)
++ssh_valid_hostname(const char *s)
+ {
+-	char *orig, *sdup, *cp;
+-	char *host = NULL, *user = NULL;
+-	int r, ret = -1, port = -1, first;
++	size_t i;
+ 
+-	active &= o->proxy_command == NULL && o->jump_host == NULL;
++	if (*s == '-')
++		return 0;
++	for (i = 0; s[i] != 0; i++) {
++		if (strchr("'`\"$\\;&<>|(){},", s[i]) != NULL ||
++		    isspace((u_char)s[i]) || iscntrl((u_char)s[i]))
++			return 0;
++	}
++	return 1;
++}
+ 
+-	orig = sdup = xstrdup(s);
++int
++ssh_valid_ruser(const char *s)
++{
++	size_t i;
+ 
+-	/* Remove comment and trailing whitespace */
++	if (*s == '-')
++		return 0;
++	for (i = 0; s[i] != 0; i++) {
++		if (iscntrl((u_char)s[i]))
++			return 0;
++		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
++			return 0;
++		/* Disallow '-' after whitespace */
++		if (isspace((u_char)s[i]) && s[i + 1] == '-')
++			return 0;
++		/* Disallow \ in last position */
++		if (s[i] == '\\' && s[i + 1] == '\0')
++			return 0;
++	}
++	return 1;
++}
++
++int
++parse_jump(const char *s, Options *o, int strict, int active)
++{
++	char *orig = NULL, *sdup = NULL, *cp;
++	char *tmp_user = NULL, *tmp_host = NULL, *host = NULL, *user = NULL;
++	int r, ret = -1, tmp_port = -1, port = -1, first = 1;
++
++	if (strcasecmp(s, "none") == 0) {
++		if (active && o->jump_host == NULL) {
++			o->jump_host = xstrdup("none");
++			o->jump_port = 0;
++		}
++		return 0;
++	}
++
++	orig = xstrdup(s);
+ 	if ((cp = strchr(orig, '#')) != NULL)
+ 		*cp = '\0';
+ 	rtrim(orig);
+ 
+-	first = active;
++	active &= o->proxy_command == NULL && o->jump_host == NULL;
++	sdup = xstrdup(orig);
+ 	do {
+-		if (strcasecmp(s, "none") == 0)
+-			break;
++		/* Work backwards through string */
+ 		if ((cp = strrchr(sdup, ',')) == NULL)
+ 			cp = sdup; /* last */
+ 		else
+ 			*cp++ = '\0';
+ 
++		r = parse_ssh_uri(cp, &tmp_user, &tmp_host, &tmp_port);
++		if (r == -1 || (r == 1 && parse_user_host_port(cp,
++		    &tmp_user, &tmp_host, &tmp_port) != 0))
++			goto out; /* error already logged */
++		if (strict) {
++			if (!ssh_valid_hostname(tmp_host)) {
++				error_f("invalid hostname \"%s\"", tmp_host);
++				goto out;
++			}
++			if (tmp_user != NULL && !ssh_valid_ruser(tmp_user)) {
++				error_f("invalid username \"%s\"", tmp_user);
++				goto out;
++			}
++		}
+ 		if (first) {
+-			/* First argument and configuration is active */
+-			r = parse_ssh_uri(cp, &user, &host, &port);
+-			if (r == -1 || (r == 1 &&
+-			    parse_user_host_port(cp, &user, &host, &port) != 0))
+-				goto out;
+-		} else {
+-			/* Subsequent argument or inactive configuration */
+-			r = parse_ssh_uri(cp, NULL, NULL, NULL);
+-			if (r == -1 || (r == 1 &&
+-			    parse_user_host_port(cp, NULL, NULL, NULL) != 0))
+-				goto out;
++			user = tmp_user;
++			host = tmp_host;
++			port = tmp_port;
++			tmp_user = tmp_host = NULL; /* transferred */
+ 		}
+ 		first = 0; /* only check syntax for subsequent hosts */
++		free(tmp_user);
++		free(tmp_host);
++		tmp_user = tmp_host = NULL;
++		tmp_port = -1;
+ 	} while (cp != sdup);
++
+ 	/* success */
+ 	if (active) {
+-		if (strcasecmp(s, "none") == 0) {
+-			o->jump_host = xstrdup("none");
+-			o->jump_port = 0;
+-		} else {
+-			o->jump_user = user;
+-			o->jump_host = host;
+-			o->jump_port = port;
+-			o->proxy_command = xstrdup("none");
+-			user = host = NULL;
+-			if ((cp = strrchr(s, ',')) != NULL && cp != s) {
+-				o->jump_extra = xstrdup(s);
+-				o->jump_extra[cp - s] = '\0';
+-			}
++		o->jump_user = user;
++		o->jump_host = host;
++		o->jump_port = port;
++		o->proxy_command = xstrdup("none");
++		user = host = NULL; /* transferred */
++		if (orig != NULL && (cp = strrchr(orig, ',')) != NULL) {
++			o->jump_extra = xstrdup(orig);
++			o->jump_extra[cp - orig] = '\0';
+ 		}
+ 	}
+ 	ret = 0;
+  out:
+ 	free(orig);
++	free(sdup);
++	free(tmp_user);
++	free(tmp_host);
+ 	free(user);
+ 	free(host);
+ 	return ret;
+diff --git a/readconf.h b/readconf.h
+index d0eb92362..591b641cb 100644
+--- a/readconf.h
++++ b/readconf.h
+@@ -243,7 +243,9 @@ int	 process_config_line(Options *, struct passwd *, const char *,
+ int	 read_config_file(const char *, struct passwd *, const char *,
+     const char *, Options *, int, int *);
+ int	 parse_forward(struct Forward *, const char *, int, int);
+-int	 parse_jump(const char *, Options *, int);
++int	 ssh_valid_hostname(const char *);
++int	 ssh_valid_ruser(const char *);
++int	 parse_jump(const char *, Options *, int, int);
+ int	 parse_ssh_uri(const char *, char **, char **, int *);
+ int	 default_ssh_port(void);
+ int	 option_clear_or_none(const char *);
+diff --git a/ssh.c b/ssh.c
+index a0371839b..e5ec18a73 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -626,43 +626,6 @@ ssh_conn_info_free(struct ssh_conn_info *cinfo)
+ 	free(cinfo);
+ }
+ 
+-static int
+-valid_hostname(const char *s)
+-{
+-	size_t i;
+-
+-	if (*s == '-')
+-		return 0;
+-	for (i = 0; s[i] != 0; i++) {
+-		if (strchr("'`\"$\\;&<>|(){}", s[i]) != NULL ||
+-		    isspace((u_char)s[i]) || iscntrl((u_char)s[i]))
+-			return 0;
+-	}
+-	return 1;
+-}
+-
+-static int
+-valid_ruser(const char *s)
+-{
+-	size_t i;
+-
+-	if (*s == '-')
+-		return 0;
+-	for (i = 0; s[i] != 0; i++) {
+-		if (iscntrl((u_char)s[i]))
+-			return 0;
+-		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
+-			return 0;
+-		/* Disallow '-' after whitespace */
+-		if (isspace((u_char)s[i]) && s[i + 1] == '-')
+-			return 0;
+-		/* Disallow \ in last position */
+-		if (s[i] == '\\' && s[i + 1] == '\0')
+-			return 0;
+-	}
+-	return 1;
+-}
+-
+ /*
+  * Main program for the ssh client.
+  */
+@@ -908,9 +871,9 @@ main(int ac, char **av)
+ 			}
+ 			if (options.proxy_command != NULL)
+ 				fatal("Cannot specify -J with ProxyCommand");
+-			if (parse_jump(optarg, &options, 1) == -1)
++			if (parse_jump(optarg, &options, 1, 1) == -1)
++
+ 				fatal("Invalid -J argument");
+-			options.proxy_command = xstrdup("none");
+ 			break;
+ 		case 't':
+ 			if (options.request_tty == REQUEST_TTY_YES)
+@@ -1160,10 +1123,8 @@ main(int ac, char **av)
+ 	if (!host)
+ 		usage();
+ 
+-	if (!valid_hostname(host))
++	if (!ssh_valid_hostname(host))
+ 		fatal("hostname contains invalid characters");
+-	if (options.user != NULL && !valid_ruser(options.user))
+-		fatal("remote username contains invalid characters");
+ 	options.host_arg = xstrdup(host);
+ 
+ 	/* Initialize the command to execute on remote host. */
+@@ -1326,7 +1287,8 @@ main(int ac, char **av)
+ 			sshbin = "ssh";
+ 
+ 		/* Consistency check */
+-		if (options.proxy_command != NULL)
++		if (options.proxy_command != NULL &&
++		    strcasecmp(options.proxy_command, "none") != 0)
+ 			fatal("inconsistent options: ProxyCommand+ProxyJump");
+ 		/* Never use FD passing for ProxyJump */
+ 		options.proxy_use_fdpass = 0;
+@@ -1449,7 +1411,7 @@ main(int ac, char **av)
+ 	 * Conversely, usernames from getpwnam(3) or specified as literals
+ 	 * via configuration (i.e. not expanded) are not subject to validation.
+ 	 */
+-	if (user_on_commandline && !valid_ruser(options.user))
++	if (user_on_commandline && !ssh_valid_ruser(options.user))
+ 		fatal("remote username contains invalid characters");
+ 
+ 	/* Store it and calculate hash. */
diff --git a/package/openssh/0007-CVE-2026-35386-2.patch b/package/openssh/0007-CVE-2026-35386-2.patch
new file mode 100644
index 0000000000..68396e7eb2
--- /dev/null
+++ b/package/openssh/0007-CVE-2026-35386-2.patch
@@ -0,0 +1,51 @@
+From d0b61d082621d45bf19f0aa04e9bbbc7e47e8f88 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:50:55 +0000
+Subject: upstream: move username validity check for usernames specified on
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+the commandline to earlier in main(), specifically before some contexts where
+a username with shell characters might be expanded by a %u directive in
+ssh_config.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We continue to recommend against using untrusted input on
+the SSH commandline. Mitigations like this are not 100%
+guarantees of safety because we can't control every
+combination of user shell and configuration where they are
+used.
+
+Reported by Florian Kohnhäuser
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2026-35386-2.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=76685c9b09a66435cd2ad8373246adf1c53976d3
+CVE: CVE-2026-35386
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ssh.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/ssh.c b/ssh.c
+index e5ec18a73..ac06bbe74 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -1123,8 +1123,15 @@ main(int ac, char **av)
+ 	if (!host)
+ 		usage();
+ 
++	/*
++	 * Validate commandline-specified values that end up in %tokens
++	 * before they are used in config parsing.
++	 */
++	if (options.user != NULL && !ssh_valid_ruser(options.user))
++		fatal("remote username contains invalid characters");
+ 	if (!ssh_valid_hostname(host))
+ 		fatal("hostname contains invalid characters");
++
+ 	options.host_arg = xstrdup(host);
+ 
+ 	/* Initialize the command to execute on remote host. */
diff --git a/package/openssh/0008-CVE-2026-35386-3.patch b/package/openssh/0008-CVE-2026-35386-3.patch
new file mode 100644
index 0000000000..7e30f8d3c5
--- /dev/null
+++ b/package/openssh/0008-CVE-2026-35386-3.patch
@@ -0,0 +1,25 @@
+From 7a182a79ead6b39b0450059e07ffb2ce02ebd323 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:52:15 +0000
+Subject: upstream: adapt to username validity check change
+
+OpenBSD-Regress-ID: d22c66ca60f0d934a75e6ca752c4c11b9f4a5324
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2026-35386-3.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=5aa09926fbf050d484a79717fadec8360c5c5645
+CVE: CVE-2026-35386
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ regress/percent.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regress/percent.sh b/regress/percent.sh
+index 6b9c492b0..93fa4e17d 100644
+--- a/regress/percent.sh
++++ b/regress/percent.sh
+@@ -154,4 +154,4 @@ ${SSH} -F $OBJ/ssh_proxy -G "${FOO}@somehost" && fail "user-at expanded env"
+ 
+ # Literal control characters in config is acceptable
+ verbose $tid user control-literal
+-trial user "$FOO" "$FOO"
++#trial user "$FOO" "$FOO"
diff --git a/package/openssh/0009-CVE-2026-35387.patch b/package/openssh/0009-CVE-2026-35387.patch
new file mode 100644
index 0000000000..d521998318
--- /dev/null
+++ b/package/openssh/0009-CVE-2026-35387.patch
@@ -0,0 +1,135 @@
+From 42a8064f37b82f65d3124eddafd078850132354a Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:48:13 +0000
+Subject: upstream: correctly match ECDSA signature algorithms against
+
+algorithm allowlists: HostKeyAlgorithms, PubkeyAcceptedAlgorithms and
+HostbasedAcceptedAlgorithms.
+
+Previously, if any ECDSA type (say "ecdsa-sha2-nistp521") was
+present in one of these lists, then all ECDSA algorithms would
+be permitted.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
+
+[cjwatson: Committed upstream together with apparently-unrelated changes
+for CVE-2026-35414.  I've split them into separate patches for clarity.]
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2026-35387.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=fd1c7e131f331942d20f42f31e79912d570081fa
+CVE: CVE-2026-35387
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ auth2-hostbased.c |  7 ++++---
+ auth2-pubkey.c    |  7 ++++---
+ sshconnect2.c     | 26 +++++++++++++++++---------
+ 3 files changed, 25 insertions(+), 15 deletions(-)
+
+diff --git a/auth2-hostbased.c b/auth2-hostbased.c
+index eb21479a0..742bda567 100644
+--- a/auth2-hostbased.c
++++ b/auth2-hostbased.c
+@@ -96,9 +96,10 @@ userauth_hostbased(struct ssh *ssh, const char *method)
+ 		error_f("cannot decode key: %s", pkalg);
+ 		goto done;
+ 	}
+-	if (key->type != pktype) {
+-		error_f("type mismatch for decoded key "
+-		    "(received %d, expected %d)", key->type, pktype);
++	if (key->type != pktype || (sshkey_type_plain(pktype) == KEY_ECDSA &&
++	    sshkey_ecdsa_nid_from_name(pkalg) != key->ecdsa_nid)) {
++		error_f("key type mismatch for decoded key "
++		    "(received %s, expected %s)", sshkey_ssh_name(key), pkalg);
+ 		goto done;
+ 	}
+ 	if (match_pattern_list(pkalg, options.hostbased_accepted_algos, 0) != 1) {
+diff --git a/auth2-pubkey.c b/auth2-pubkey.c
+index aa24fda05..60cf30c17 100644
+--- a/auth2-pubkey.c
++++ b/auth2-pubkey.c
+@@ -149,9 +149,10 @@ userauth_pubkey(struct ssh *ssh, const char *method)
+ 		error_f("cannot decode key: %s", pkalg);
+ 		goto done;
+ 	}
+-	if (key->type != pktype) {
+-		error_f("type mismatch for decoded key "
+-		    "(received %d, expected %d)", key->type, pktype);
++	if (key->type != pktype || (sshkey_type_plain(pktype) == KEY_ECDSA &&
++	    sshkey_ecdsa_nid_from_name(pkalg) != key->ecdsa_nid)) {
++		error_f("key type mismatch for decoded key "
++		    "(received %s, expected %s)", sshkey_ssh_name(key), pkalg);
+ 		goto done;
+ 	}
+ 	if (auth2_key_already_used(authctxt, key)) {
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 99ca84292..fa2625983 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -89,6 +89,7 @@ extern Options options;
+ static char *xxx_host;
+ static struct sockaddr *xxx_hostaddr;
+ static const struct ssh_conn_info *xxx_conn_info;
++static int key_type_allowed(struct sshkey *, const char *);
+ 
+ static int
+ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+@@ -98,6 +99,10 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 	if ((r = sshkey_check_rsa_length(hostkey,
+ 	    options.required_rsa_size)) != 0)
+ 		fatal_r(r, "Bad server host key");
++	if (!key_type_allowed(hostkey, options.hostkeyalgorithms)) {
++		fatal("Server host key %s not in HostKeyAlgorithms",
++		    sshkey_ssh_name(hostkey));
++	}
+ 	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
+ 	    xxx_conn_info) != 0)
+ 		fatal("Host key verification failed.");
+@@ -1698,34 +1603,37 @@ load_identity_file(Identity *id)
+ }
+ 
+ static int
+-key_type_allowed_by_config(struct sshkey *key)
++key_type_allowed(struct sshkey *key, const char *allowlist)
+ {
+-	if (match_pattern_list(sshkey_ssh_name(key),
+-	    options.pubkey_accepted_algos, 0) == 1)
++	if (match_pattern_list(sshkey_ssh_name(key), allowlist, 0) == 1)
+ 		return 1;
+ 
+ 	/* RSA keys/certs might be allowed by alternate signature types */
+ 	switch (key->type) {
+ 	case KEY_RSA:
+-		if (match_pattern_list("rsa-sha2-512",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		if (match_pattern_list("rsa-sha2-512", allowlist, 0) == 1)
+ 			return 1;
+-		if (match_pattern_list("rsa-sha2-256",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		if (match_pattern_list("rsa-sha2-256", allowlist, 0) == 1)
+ 			return 1;
+ 		break;
+ 	case KEY_RSA_CERT:
+ 		if (match_pattern_list("rsa-sha2-512-cert-v01@openssh.com",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		    allowlist, 0) == 1)
+ 			return 1;
+ 		if (match_pattern_list("rsa-sha2-256-cert-v01@openssh.com",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		    allowlist, 0) == 1)
+ 			return 1;
+ 		break;
+ 	}
+ 	return 0;
+ }
+ 
++static int
++key_type_allowed_by_config(struct sshkey *key)
++{
++	return key_type_allowed(key, options.pubkey_accepted_algos);
++}
++
+ /* obtain a list of keys from the agent */
+ static int
+ get_agent_identities(struct ssh *ssh, int *agent_fdp,
diff --git a/package/openssh/0010-CVE-2026-35388.patch b/package/openssh/0010-CVE-2026-35388.patch
new file mode 100644
index 0000000000..73f1d5df68
--- /dev/null
+++ b/package/openssh/0010-CVE-2026-35388.patch
@@ -0,0 +1,39 @@
+From 684fbae02b8e85e5f14e978201a3d5b68686d0fd Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:39:57 +0000
+Subject: upstream: add missing askpass check when using
+
+ControlMaster=ask/autoask and "ssh -O proxy ..."; reported by Michalis
+Vasileiadis
+
+OpenBSD-Commit-ID: 8dd7b9b96534e9a8726916b96d36bed466d3836a
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2026-35388.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=c805b97b67c774e0bf922ffb29dfbcda9d7b5add
+CVE: CVE-2026-35388
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mux.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/mux.c b/mux.c
+index e7580ac74..bda4015f4 100644
+--- a/mux.c
++++ b/mux.c
+@@ -1137,6 +1137,16 @@ mux_master_process_proxy(struct ssh *ssh, u_int rid,
+ 
+ 	debug_f("channel %d: proxy request", c->self);
+ 
++	if (options.control_master == SSHCTL_MASTER_ASK ||
++	    options.control_master == SSHCTL_MASTER_AUTO_ASK) {
++		if (!ask_permission("Allow multiplex proxy connection?")) {
++			debug2_f("proxy refused by user");
++			reply_error(reply, MUX_S_PERMISSION_DENIED, rid,
++			    "Permission denied");
++			return 0;
++		}
++	}
++
+ 	c->mux_rcb = channel_proxy_downstream;
+ 	if ((r = sshbuf_put_u32(reply, MUX_S_PROXY)) != 0 ||
+ 	    (r = sshbuf_put_u32(reply, rid)) != 0)
diff --git a/package/openssh/0011-CVE-2026-35414.patch b/package/openssh/0011-CVE-2026-35414.patch
new file mode 100644
index 0000000000..b4bbdc4479
--- /dev/null
+++ b/package/openssh/0011-CVE-2026-35414.patch
@@ -0,0 +1,78 @@
+From f5daf40e6bcb932a72665c7df03ab4b5e4950e3b Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:48:13 +0000
+Subject: sshd(8): fix inappropriate matching of authorized_keys principals
+
+When matching an authorized_keys principals="" option against a list of
+principals in a certificate, an incorrect algorithm was used that could
+allow inappropriate matching in cases where a principal name in the
+certificate contains a comma character. Exploitation of the condition
+requires an authorized_keys principals="" option that lists more than
+one principal *and* a CA that will issue a certificate that encodes more
+than one of these principal names separated by a comma (typical CAs
+strongly constrain which principal names they will place in a
+certificate). This condition only applies to user- trusted CA keys in
+authorized_keys, the main certificate authentication path
+(TrustedUserCAKeys/AuthorizedPrincipalsFile) is not affected.
+
+Reported by Vladimir Tokarev.
+
+OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
+
+[cjwatson: Committed upstream together with apparently-unrelated changes
+for CVE-2026-35387.  I've split them into separate patches for clarity.]
+
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/bookworm/debian/patches/CVE-2026-35414.patch
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=fd1c7e131f331942d20f42f31e79912d570081fa
+CVE: CVE-2026-35414
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ auth2-pubkeyfile.c | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/auth2-pubkeyfile.c b/auth2-pubkeyfile.c
+index 0cfacac35..6b757e55b 100644
+--- a/auth2-pubkeyfile.c
++++ b/auth2-pubkeyfile.c
+@@ -50,6 +50,7 @@
+ #include "authfile.h"
+ #include "match.h"
+ #include "ssherr.h"
++#include "xmalloc.h"
+ 
+ int
+ auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
+@@ -146,20 +147,23 @@ auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
+ static int
+ match_principals_option(const char *principal_list, struct sshkey_cert *cert)
+ {
+-	char *result;
++	char *list, *olist, *entry;
+ 	u_int i;
+ 
+-	/* XXX percent_expand() sequences for authorized_principals? */
+-
+-	for (i = 0; i < cert->nprincipals; i++) {
+-		if ((result = match_list(cert->principals[i],
+-		    principal_list, NULL)) != NULL) {
+-			debug3("matched principal from key options \"%.100s\"",
+-			    result);
+-			free(result);
+-			return 1;
++	olist = list = xstrdup(principal_list);
++	for (;;) {
++		if ((entry = strsep(&list, ",")) == NULL || *entry == '\0')
++			break;
++		for (i = 0; i < cert->nprincipals; i++) {
++			if (strcmp(entry, cert->principals[i]) == 0) {
++				debug3("matched principal from key i"
++				    "options \"%.100s\"", entry);
++				free(olist);
++				return 1;
++			}
+ 		}
+ 	}
++	free(olist);
+ 	return 0;
+ }
+ 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f0c542df23..a7f13429f2 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -15,6 +15,23 @@ OPENSSH_LICENSE_FILES = LICENCE
 
 # 0001-fix-logic-error-in-disableforwarding-option.patch
 OPENSSH_IGNORE_CVES += CVE-2025-32728
+# 0002-CVE-2025-61984-tests.patch
+# 0003-CVE-2025-61984.patch
+OPENSSH_IGNORE_CVES += CVE-2025-61984
+# 0004-CVE-2025-61985.patch
+OPENSSH_IGNORE_CVES += CVE-2025-61985
+# 0005-CVE-2026-35385.patch
+OPENSSH_IGNORE_CVES += CVE-2026-35385
+# 0006-CVE-2026-35386-1.patch
+# 0007-CVE-2026-35386-2.patch
+# 0008-CVE-2026-35386-3.patch
+OPENSSH_IGNORE_CVES += CVE-2026-35386
+# 0009-CVE-2026-35387.patch
+OPENSSH_IGNORE_CVES += CVE-2026-35387
+# 0010-CVE-2026-35388.patch
+OPENSSH_IGNORE_CVES += CVE-2026-35388
+# 0011-CVE-2026-35414.patch
+OPENSSH_IGNORE_CVES += CVE-2026-35414
 
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \

--===============7883258369775031904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7883258369775031904==--
