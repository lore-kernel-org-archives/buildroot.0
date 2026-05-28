Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5A1CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E66941F9E;
	Fri, 29 May 2026 08:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSazHlkIzq_Q; Fri, 29 May 2026 08:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C60F141FA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043184;
	bh=VrGjJZLwaSKyG0oXe1NMBYZfaokjvIVi+Oz5rr/5Izg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M4NzM0FtB2LmqwpZoH8Qwd6C1XZVWkWxTuGXvwS5Xh0Hi/c9e3fxUgTJM0ftqckSu
	 /h5HJQ9oJCyGhyf5rmsyibTZrEQnU7pu+xTBMaVvtTGxZTIoaexvYe9czl5Bc3BmbM
	 pJne+AdaLP5FSHATlxcRTPzEKZ3jh7SHWpsFdlRY2K4Tvmellg4yrruc00jzAtjAv7
	 YMIOm7X3NRyvjXj5k74957VuCXA3DlA5ENYhn7D9Vn4LQz+7q28DFIF5Fzkp76Ayf5
	 os0EOdoECTLRKaKWNkBU2QlyoLQcDEBvWm0hFdH+0FBeqKHr6KdRikoj00JUGKb9c8
	 fbDU+QANIuGRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C60F141FA1;
	Fri, 29 May 2026 08:26:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 128EF28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3223041FA8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Rlh5xQd5h5O for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B643141F85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B643141F85
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56046870C6; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:49:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b262cd01bb72a6a289dbedb0ff518cbcd58ab41b
X-Git-Newrev: 789c75925881c4f9276dc5fa371982d9a238fe49
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.56046870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/putty: patch
 CVE-2026-4885{0, 1, 2}
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
Content-Type: multipart/mixed; boundary="===============7214311855076107884=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7214311855076107884==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/789c75925881c4f9276dc5fa371982d9a238fe49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-48850:
    PuTTY 0.72 before 0.84 has a double free in RSA KEX.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-48850

- CVE-2026-48851:
    PuTTY 0.77 before 0.84 uses a copy of the PuTTY icon as a trust
    indication for TELNET data but the trust status is not cleared between
    proxy authentication and the main session.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-48851

- CVE-2026-48852:
    PuTTY 0.71 before 0.84 has an assertion failure in ECDSA signature
    verification.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-48852

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/putty/0002-CVE-2026-48850.patch |  53 ++++++++++++++++
 package/putty/0003-CVE-2026-48851.patch | 108 ++++++++++++++++++++++++++++++++
 package/putty/0004-CVE-2026-48852.patch |  90 ++++++++++++++++++++++++++
 package/putty/putty.mk                  |   7 +++
 4 files changed, 258 insertions(+)

diff --git a/package/putty/0002-CVE-2026-48850.patch b/package/putty/0002-CVE-2026-48850.patch
new file mode 100644
index 0000000000..1c7b378f1d
--- /dev/null
+++ b/package/putty/0002-CVE-2026-48850.patch
@@ -0,0 +1,53 @@
+From ba3ed53e0bf6682f89940bc2c3e83da6b1524024 Mon Sep 17 00:00:00 2001
+From: Simon Tatham <anakin@pobox.com>
+Date: Thu, 14 May 2026 18:15:56 +0100
+Subject: [PATCH] Don't call sfree after ssh_rsakex_freekey.
+
+ssh_rsakex_freekey(), given an RSAKey structure, calls freersakey() to
+free all the pieces dangling off it, and then finally frees the RSAKey
+itself. So calling ssh_rsakex_freekey() and _then_ sfree() is a double
+free.
+
+Upstream: https://git.tartarus.org/?p=simon/putty.git;a=commitdiff;h=ba3ed53e0bf6682f89940bc2c3e83da6b1524024
+CVE: CVE-2026-48850
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ssh/kex2-server.c | 4 +---
+ ssh/transport2.c  | 4 +---
+ 2 files changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/ssh/kex2-server.c b/ssh/kex2-server.c
+index 570d7750..8c3dc2f4 100644
+--- a/ssh/kex2-server.c
++++ b/ssh/kex2-server.c
+@@ -321,10 +321,8 @@ void ssh2kex_coroutine(struct ssh2_transport_state *s, bool *aborted)
+         put_mp_ssh2(s->kex_shared_secret, K);
+         mp_free(K);
+ 
+-        if (s->rsa_kex_key_needs_freeing) {
++        if (s->rsa_kex_key_needs_freeing)
+             ssh_rsakex_freekey(s->rsa_kex_key);
+-            sfree(s->rsa_kex_key);
+-        }
+         s->rsa_kex_key = NULL;
+         s->rsa_kex_key_needs_freeing = false;
+ 
+diff --git a/ssh/transport2.c b/ssh/transport2.c
+index 64f40560..60a99c29 100644
+--- a/ssh/transport2.c
++++ b/ssh/transport2.c
+@@ -251,10 +251,8 @@ static void ssh2_transport_free(PacketProtocolLayer *ppl)
+     if (s->kex_shared_secret) strbuf_free(s->kex_shared_secret);
+     if (s->dh_ctx)
+         dh_cleanup(s->dh_ctx);
+-    if (s->rsa_kex_key_needs_freeing) {
++    if (s->rsa_kex_key_needs_freeing)
+         ssh_rsakex_freekey(s->rsa_kex_key);
+-        sfree(s->rsa_kex_key);
+-    }
+     if (s->ecdh_key)
+         ecdh_key_free(s->ecdh_key);
+     if (s->exhash)
+-- 
+2.54.0
+
diff --git a/package/putty/0003-CVE-2026-48851.patch b/package/putty/0003-CVE-2026-48851.patch
new file mode 100644
index 0000000000..1985369061
--- /dev/null
+++ b/package/putty/0003-CVE-2026-48851.patch
@@ -0,0 +1,108 @@
+From 64712be3cbc4a02bda4a92ca97e8d4f294abbe9a Mon Sep 17 00:00:00 2001
+From: Simon Tatham <anakin@pobox.com>
+Date: Thu, 27 Feb 2025 12:51:18 +0000
+Subject: [PATCH] Non-SSH backends: delay setting trust status to false.
+
+A user reported recently that if you connect to a Telnet server via a
+proxy that requires authentication, and enter the auth details
+manually in the PuTTY terminal window, then the entire Telnet session
+is shown with trust sigils to its left.
+
+This happens because telnet.c calls seat_set_trust_status(false) as
+soon as it's called new_connection() to make the Socket. But the
+interactive proxy authentication dialogue hasn't happened yet, at that
+point. So the proxy resets the trust status to true and asks for a
+username and password, and then nothing ever resets it to false,
+because telnet.c thought it had already done that.
+
+The solution is to defer the Telnet backend's change of trust status
+to when we get the notification that the socket is properly connected,
+which arrives via plug_log(PLUGLOG_CONNECT_SUCCESS).
+
+The same bug occurs in raw.c and supdup.c, but not in rlogin.c,
+because Rlogin has an initial authentication exchange known to the
+protocol, and already delays resetting the trust status until after
+that has concluded.
+
+Upstream: https://git.tartarus.org/?p=simon/putty.git;a=commitdiff;h=64712be3cbc4a02bda4a92ca97e8d4f294abbe9a
+CVE: CVE-2026-48851
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ otherbackends/raw.c    | 6 +++---
+ otherbackends/supdup.c | 4 +++-
+ otherbackends/telnet.c | 6 +++---
+ 3 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/otherbackends/raw.c b/otherbackends/raw.c
+index 9fc5e4c8..01c776e2 100644
+--- a/otherbackends/raw.c
++++ b/otherbackends/raw.c
+@@ -46,6 +46,9 @@ static void raw_log(Plug *plug, Socket *s, PlugLogType type, SockAddr *addr,
+         raw->socket_connected = true;
+         if (raw->ldisc)
+             ldisc_check_sendok(raw->ldisc);
++
++        /* No local authentication phase in this protocol */
++        seat_set_trust_status(raw->seat, false);
+     }
+ }
+ 
+@@ -209,9 +212,6 @@ static char *raw_init(const BackendVtable *vt, Seat *seat,
+     if ((err = sk_socket_error(raw->s)) != NULL)
+         return dupstr(err);
+ 
+-    /* No local authentication phase in this protocol */
+-    seat_set_trust_status(raw->seat, false);
+-
+     loghost = conf_get_str(conf, CONF_loghost);
+     if (*loghost) {
+         char *colon;
+diff --git a/otherbackends/supdup.c b/otherbackends/supdup.c
+index f9680f30..8f814797 100644
+--- a/otherbackends/supdup.c
++++ b/otherbackends/supdup.c
+@@ -570,6 +570,9 @@ static void supdup_log(Plug *plug, Socket *s, PlugLogType type, SockAddr *addr,
+         supdup->socket_connected = true;
+         if (supdup->ldisc)
+             ldisc_check_sendok(supdup->ldisc);
++
++        /* No local authentication phase in this protocol */
++        seat_set_trust_status(supdup->seat, false);
+     }
+ }
+ 
+@@ -812,7 +815,6 @@ static char *supdup_init(const BackendVtable *x, Seat *seat,
+      * We next expect a connection message followed by %TDNOP from the server
+      */
+     supdup->state = CONNECTING;
+-    seat_set_trust_status(supdup->seat, false);
+ 
+     /* Make sure the terminal is in UTF-8 mode. */
+     c_write(supdup, (unsigned char *)utf8, strlen(utf8));
+diff --git a/otherbackends/telnet.c b/otherbackends/telnet.c
+index 2f12722c..7f1e4977 100644
+--- a/otherbackends/telnet.c
++++ b/otherbackends/telnet.c
+@@ -632,6 +632,9 @@ static void telnet_log(Plug *plug, Socket *s, PlugLogType type, SockAddr *addr,
+         telnet->socket_connected = true;
+         if (telnet->ldisc)
+             ldisc_check_sendok(telnet->ldisc);
++
++        /* No local authentication phase in this protocol */
++        seat_set_trust_status(telnet->seat, false);
+     }
+ }
+ 
+@@ -782,9 +785,6 @@ static char *telnet_init(const BackendVtable *vt, Seat *seat,
+     if ((err = sk_socket_error(telnet->s)) != NULL)
+         return dupstr(err);
+ 
+-    /* No local authentication phase in this protocol */
+-    seat_set_trust_status(telnet->seat, false);
+-
+     telnet->pinger = pinger_new(telnet->conf, &telnet->backend);
+ 
+     /*
+-- 
+2.54.0
+
diff --git a/package/putty/0004-CVE-2026-48852.patch b/package/putty/0004-CVE-2026-48852.patch
new file mode 100644
index 0000000000..34cbb986ac
--- /dev/null
+++ b/package/putty/0004-CVE-2026-48852.patch
@@ -0,0 +1,90 @@
+From 65b8f37c34cd80680693e813e0081cdafaf58324 Mon Sep 17 00:00:00 2001
+From: Simon Tatham <anakin@pobox.com>
+Date: Sat, 28 Mar 2026 19:25:24 +0000
+Subject: [PATCH] Remove bogus assertion in ecc_weierstrass_add.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The comment next to the assertion says that it's checking for either
+identical inputs or mutually inverse ones: that is, input curve points
+with the same affine x-coordinate. But in that case we should have
+checked lambda_n, the _numerator_ of the slope of the line through the
+input points. Instead we were accidentally checking lambda_d, the
+denominator.
+
+ecc_weierstrass_add_general gets this right: it checks lambda_n to
+decide whether to use the output of the unequal-point addition formula
+or the doubling formula.
+
+The obvious fix is to replace the assertion with one checking
+lambda_n. But that doesn't work, because it's possible during
+legitimate operation to cause a call to ecc_weierstrass_add that would
+fail the fixed version of the assertion! Because of constant-time
+considerations, every time ecc_weierstrass_multiply consumes a bit of
+the exponent, it calculates both of two possible outputs of that
+iteration step, and then selects between them. And sometimes one of
+those outputs _does_ involve passing mutually inverse values to
+ecc_weierstrass_add. That's harmless if the result of that calculation
+is thrown away by the caller – except that it's not harmless if you
+fail an assertion and crash before getting back _to_ the caller!
+
+(With the current style of exponentiation loop, the case that would
+fail the 'right' assertion involves raising a point P to its own order
+minus 1, because we're consuming the exponent from the MSB downwards,
+so at every stage we choose between P^(2k) and P^(2k+1). But switching
+to the LSB-upwards style of repeatedly squaring to make P^{2^n} and
+conditionally multiplying in each of those, you'd still have the same
+failure, just in a different place – the failing case would involve
+raising P to the power of its own order with the leading 1 bit
+removed.)
+
+So that's why we can't replace the bogus assertion with a better one.
+Instead, the only thing to do is remove the assertion completely, and
+rely on callers to have already checked that exponents are in
+range (hence the precautionary fix in ecdsa_public in the previous
+commit).
+
+What about triggering the _actual_ wrong assertion? Guido Vranken
+reported this issue and included a test case that demonstrates that
+it's possible to trigger the bug deliberately. His example case is a
+P256 curve point P such that 10P and 11P have the same y-coordinate,
+and therefore trying to compute 21P will add those values together and
+fail the previous assertion. Worse, it's easy to construct a malicious
+P256 public key and signature such that attempting to verify that
+signature provokes the same crash – no matter what the message is. So
+this is a DoS vector for an on-path attacker, who can make PuTTY crash
+by substituting this fixed P256 key and signature in the cleartext
+initial key exchange of any SSH connection.
+
+(Only a DoS, though: PuTTY is always compiled with assertions enabled,
+so it won't do anything _worse_ than crash with an unhelpful message.)
+
+Upstream: https://git.tartarus.org/?p=simon/putty.git;a=commitdiff;h=65b8f37c34cd80680693e813e0081cdafaf58324
+CVE: CVE-2026-48852
+[thomas: backport and remove tests]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ crypto/ecc-arithmetic.c |  6 ------
+ 1 files changed, 6 deletions(-)
+
+diff --git a/crypto/ecc-arithmetic.c b/crypto/ecc-arithmetic.c
+index ed2abf39..23695369 100644
+--- a/crypto/ecc-arithmetic.c
++++ b/crypto/ecc-arithmetic.c
+@@ -308,12 +308,6 @@ WeierstrassPoint *ecc_weierstrass_add(WeierstrassPoint *P, WeierstrassPoint *Q)
+     ecc_weierstrass_add_prologue(
+         P, Q, &Px, &Py, &Qx, &denom, &lambda_n, &lambda_d);
+ 
+-    /* Never expect to have received two mutually inverse inputs, or
+-     * two identical ones (which would make this a doubling). In other
+-     * words, the two input x-coordinates (after putting over a common
+-     * denominator) should never have been equal. */
+-    assert(!mp_eq_integer(lambda_n, 0));
+-
+     /* Now go to the common epilogue code. */
+     ecc_weierstrass_epilogue(Px, Qx, Py, denom, lambda_n, lambda_d, S);
+ 
+-- 
+2.54.0
+
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 617518e647..c061c02a96 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -12,6 +12,13 @@ PUTTY_CPE_ID_VENDOR = putty
 PUTTY_DEPENDENCIES = host-pkgconf
 PUTTY_CONF_OPTS = -DPUTTY_GSSAPI=OFF
 
+# 0002-CVE-2026-48850.patch
+PUTTY_IGNORE_CVES += CVE-2026-48850
+# 0003-CVE-2026-48851.patch
+PUTTY_IGNORE_CVES += CVE-2026-48851
+# 0004-CVE-2026-48852.patch
+PUTTY_IGNORE_CVES += CVE-2026-48852
+
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 PUTTY_DEPENDENCIES += libgtk3
 else ifeq ($(BR2_PACKAGE_LIBGTK2),y)

--===============7214311855076107884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7214311855076107884==--
