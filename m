Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86544C021B6
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 14:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D15982145;
	Fri, 21 Feb 2025 14:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDStL01UfO4w; Fri, 21 Feb 2025 14:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A53B282151
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A53B282151;
	Fri, 21 Feb 2025 14:03:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E35D194
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6287760767
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nQbvpOWHAZ7 for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 14:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35FF46061E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35FF46061E
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:03:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21AE2876FE; Fri, 21 Feb 2025 14:03:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Feb 2025 14:06:41 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 651e8731a7d917e7aea997dea92c1f66bf229a6c
X-Git-Newrev: 4ed78586e8859dd1f299c45de9637e184e783b8a
X-Patchwork-Hint: ignore
Message-Id: <20250221140315.21AE2876FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/gnutls: security
 bump to version 3.8.9
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ed78586e8859dd1f299c45de9637e184e783b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes the following vulnerability:

** libgnutls: Fix potential DoS in handling certificates with numerous name
   constraints, as a follow-up of CVE-2024-12133 in libtasn1. The
   bundled copy of libtasn1 has also been updated to the latest 4.20.0
   release to complete the fix.  Reported by Bing Shi (#1553).
   [GNUTLS-SA-2025-02-07, CVSS: medium] [CVE-2024-12243]

For more details, see the release announcement:
https://lists.gnupg.org/pipermail/gnutls-help/2025-February/004875.html

Update the license info for a move/rename of license files and a slight
rewording.  The license clarification is now in README.md so also add that:

https://gitlab.com/gnutls/gnutls/-/commit/a8727cdb076287d0a2098ba49d76899b4e70160e
https://gitlab.com/gnutls/gnutls/-/commit/75f5ea80738156b81de30ae9b482a69cf4e77e9d

Drop now upstreamed
0001-groups-represent-hybrid-groups-with-an-array-of-IDs.patch:

https://gitlab.com/gnutls/gnutls/-/commit/9cc9d5556d258d23a399abfe45715773e719d134

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2461b340778c860654c4b6e1cd075842fd9cd717)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...resent-hybrid-groups-with-an-array-of-IDs.patch | 798 ---------------------
 package/gnutls/gnutls.hash                         |   9 +-
 package/gnutls/gnutls.mk                           |   6 +-
 3 files changed, 8 insertions(+), 805 deletions(-)

diff --git a/package/gnutls/0001-groups-represent-hybrid-groups-with-an-array-of-IDs.patch b/package/gnutls/0001-groups-represent-hybrid-groups-with-an-array-of-IDs.patch
deleted file mode 100644
index 8462d77281..0000000000
--- a/package/gnutls/0001-groups-represent-hybrid-groups-with-an-array-of-IDs.patch
+++ /dev/null
@@ -1,798 +0,0 @@
-From 5ed597eb28c408c5968e6dfb839880ba5fa17ba1 Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Fri, 6 Dec 2024 09:53:18 +0900
-Subject: [PATCH] groups: represent hybrid groups with an array of IDs
-
-Previously, the supported_groups array contained externally defined
-elements, which is legitimate in C99 but caused error with Clang:
-
-  groups.c:93:2: error: initializer element is not a compile-time constant
-          group_x25519,
-          ^~~~~~~~~~~~
-
-This reworks the array definition of indirection through group
-IDs (gnutls_group_t, i.e., integer).
-
-This also makes pqc-hybrid-kx test more exhaustive.
-
-Signed-off-by: Daiki Ueno <ueno@gnu.org>
-Upstream: https://gitlab.com/gnutls/gnutls/-/commit/9cc9d5556d258d23a399abfe45715773e719d134
-Signed-off-by: Brandon Maier <brandon.maier@collins.com>
----
- lib/algorithms.h                |   7 ++
- lib/algorithms/groups.c         | 161 ++++++++++++++++++++------------
- lib/ext/key_share.c             |  81 ++++++++++++----
- lib/ext/supported_groups.c      |  45 +++++----
- lib/gnutls_int.h                |   8 +-
- lib/includes/gnutls/gnutls.h.in |   4 +-
- lib/priority.c                  |  25 ++---
- lib/session.c                   |   6 +-
- tests/pqc-hybrid-kx.sh          | 101 +++++++++++++++++---
- 9 files changed, 315 insertions(+), 123 deletions(-)
-
-diff --git a/lib/algorithms.h b/lib/algorithms.h
-index 2e1b694c6..c4af571ce 100644
---- a/lib/algorithms.h
-+++ b/lib/algorithms.h
-@@ -55,6 +55,9 @@
- #define IS_KEM(x) \
- 	(((x) == GNUTLS_PK_MLKEM768) || ((x) == GNUTLS_PK_EXP_KYBER768))
- 
-+
-+#define IS_GROUP_HYBRID(group) ((group)->ids[0] != GNUTLS_GROUP_INVALID)
-+
- #define SIG_SEM_PRE_TLS12 (1 << 1)
- #define SIG_SEM_TLS13 (1 << 2)
- #define SIG_SEM_DEFAULT (SIG_SEM_PRE_TLS12 | SIG_SEM_TLS13)
-@@ -493,6 +496,10 @@ const gnutls_group_entry_st *_gnutls_tls_id_to_group(unsigned num);
- const gnutls_group_entry_st *_gnutls_id_to_group(unsigned id);
- gnutls_group_t _gnutls_group_get_id(const char *name);
- 
-+int _gnutls_group_expand(
-+	const gnutls_group_entry_st *group,
-+	const gnutls_group_entry_st *subgroups[MAX_HYBRID_GROUPS + 1]);
-+
- gnutls_ecc_curve_t _gnutls_ecc_bits_to_curve(gnutls_pk_algorithm_t pk,
- 					     int bits);
- #define MAX_ECC_CURVE_SIZE 66
-diff --git a/lib/algorithms/groups.c b/lib/algorithms/groups.c
-index 88d0cf630..2fbe7b8ec 100644
---- a/lib/algorithms/groups.c
-+++ b/lib/algorithms/groups.c
-@@ -30,30 +30,6 @@
- /* Supported ECC curves
-  */
- 
--#ifdef HAVE_LIBOQS
--static const gnutls_group_entry_st group_mlkem768 = {
--	.name = "MLKEM768",
--	.id = GNUTLS_GROUP_INVALID,
--	.curve = GNUTLS_ECC_CURVE_INVALID,
--	.pk = GNUTLS_PK_MLKEM768,
--};
--
--static const gnutls_group_entry_st group_kyber768 = {
--	.name = "KYBER768",
--	.id = GNUTLS_GROUP_INVALID,
--	.curve = GNUTLS_ECC_CURVE_INVALID,
--	.pk = GNUTLS_PK_EXP_KYBER768,
--};
--#endif
--
--static const gnutls_group_entry_st group_x25519 = {
--	.name = "X25519",
--	.id = GNUTLS_GROUP_X25519,
--	.curve = GNUTLS_ECC_CURVE_X25519,
--	.tls_id = 29,
--	.pk = GNUTLS_PK_ECDH_X25519,
--};
--
- static const gnutls_group_entry_st supported_groups[] = {
- 	{
- 		.name = "SECP192R1",
-@@ -90,7 +66,13 @@ static const gnutls_group_entry_st supported_groups[] = {
- 		.tls_id = 25,
- 		.pk = GNUTLS_PK_ECDSA,
- 	},
--	group_x25519,
-+	{
-+		.name = "X25519",
-+		.id = GNUTLS_GROUP_X25519,
-+		.curve = GNUTLS_ECC_CURVE_X25519,
-+		.tls_id = 29,
-+		.pk = GNUTLS_PK_ECDH_X25519,
-+	},
- #ifdef ENABLE_GOST
- 	/* draft-smyshlyaev-tls12-gost-suites-06, Section 6 */
- 	{
-@@ -191,24 +173,33 @@ static const gnutls_group_entry_st supported_groups[] = {
- 	  .tls_id = 0x104 },
- #endif
- #ifdef HAVE_LIBOQS
-+	{
-+		.name = "MLKEM768",
-+		.id = GNUTLS_GROUP_EXP_MLKEM768,
-+		.pk = GNUTLS_PK_MLKEM768,
-+		/* absense of .tls_id means that this group alone cannot be used in TLS */
-+	},
-+	{
-+		.name = "KYBER768",
-+		.id = GNUTLS_GROUP_EXP_KYBER768,
-+		.pk = GNUTLS_PK_EXP_KYBER768,
-+		/* absense of .tls_id means that this group alone cannot be used in TLS */
-+	},
- 	{ .name = "SECP256R1-MLKEM768",
- 	  .id = GNUTLS_GROUP_EXP_SECP256R1_MLKEM768,
--	  .curve = GNUTLS_ECC_CURVE_SECP256R1,
--	  .pk = GNUTLS_PK_ECDSA,
--	  .tls_id = 0x11EB,
--	  .next = &group_mlkem768 },
-+	  .ids = { GNUTLS_GROUP_SECP256R1, GNUTLS_GROUP_EXP_MLKEM768,
-+		   GNUTLS_GROUP_INVALID },
-+	  .tls_id = 0x11EB },
- 	{ .name = "X25519-MLKEM768",
- 	  .id = GNUTLS_GROUP_EXP_X25519_MLKEM768,
--	  .curve = GNUTLS_ECC_CURVE_INVALID,
--	  .pk = GNUTLS_PK_MLKEM768,
--	  .tls_id = 0x11EC,
--	  .next = &group_x25519 },
-+	  .ids = { GNUTLS_GROUP_EXP_MLKEM768, GNUTLS_GROUP_X25519,
-+		   GNUTLS_GROUP_INVALID },
-+	  .tls_id = 0x11EC },
- 	{ .name = "X25519-KYBER768",
- 	  .id = GNUTLS_GROUP_EXP_X25519_KYBER768,
--	  .curve = GNUTLS_ECC_CURVE_X25519,
--	  .pk = GNUTLS_PK_ECDH_X25519,
--	  .tls_id = 0x6399,
--	  .next = &group_kyber768 },
-+	  .ids = { GNUTLS_GROUP_X25519, GNUTLS_GROUP_EXP_KYBER768,
-+		   GNUTLS_GROUP_INVALID },
-+	  .tls_id = 0x6399 },
- #endif
- 	{ 0, 0, 0 }
- };
-@@ -221,14 +212,46 @@ static const gnutls_group_entry_st supported_groups[] = {
- 		}                                                  \
- 	}
- 
-+static inline const gnutls_group_entry_st *group_to_entry(gnutls_group_t group)
-+{
-+	if (group == 0)
-+		return NULL;
-+
-+	GNUTLS_GROUP_LOOP(if (p->id == group) { return p; });
-+
-+	return NULL;
-+}
-+
-+static inline bool
-+group_is_supported_standalone(const gnutls_group_entry_st *group)
-+{
-+	return group->pk != 0 && _gnutls_pk_exists(group->pk) &&
-+	       (group->curve == 0 ||
-+		_gnutls_ecc_curve_is_supported(group->curve));
-+}
-+
-+static inline bool group_is_supported(const gnutls_group_entry_st *group)
-+{
-+	if (!IS_GROUP_HYBRID(group))
-+		return group_is_supported_standalone(group);
-+
-+	for (size_t i = 0;
-+	     i < MAX_HYBRID_GROUPS && group->ids[i] != GNUTLS_GROUP_INVALID;
-+	     i++) {
-+		const gnutls_group_entry_st *p = group_to_entry(group->ids[i]);
-+		if (!p || !group_is_supported_standalone(p))
-+			return false;
-+	}
-+
-+	return true;
-+}
-+
- /* Returns the TLS id of the given curve
-  */
- const gnutls_group_entry_st *_gnutls_tls_id_to_group(unsigned num)
- {
- 	GNUTLS_GROUP_LOOP(
--		if (p->tls_id == num &&
--		    (p->curve == 0 ||
--		     _gnutls_ecc_curve_is_supported(p->curve))) { return p; });
-+		if (p->tls_id == num && group_is_supported(p)) { return p; });
- 
- 	return NULL;
- }
-@@ -239,10 +262,7 @@ const gnutls_group_entry_st *_gnutls_id_to_group(unsigned id)
- 		return NULL;
- 
- 	GNUTLS_GROUP_LOOP(
--		if (p->id == id && (p->curve == 0 ||
--				    _gnutls_ecc_curve_is_supported(p->curve))) {
--			return p;
--		});
-+		if (p->id == id && group_is_supported(p)) { return p; });
- 
- 	return NULL;
- }
-@@ -261,27 +281,17 @@ const gnutls_group_entry_st *_gnutls_id_to_group(unsigned id)
-  **/
- const gnutls_group_t *gnutls_group_list(void)
- {
--	static gnutls_group_t groups[MAX_ALGOS] = { 0 };
-+	static gnutls_group_t groups[MAX_ALGOS + 1] = { 0 };
- 
- 	if (groups[0] == 0) {
--		int i = 0;
-+		size_t i = 0;
- 
--		const gnutls_group_entry_st *p;
--
--		for (p = supported_groups; p->name != NULL; p++) {
--			const gnutls_group_entry_st *pp;
--
--			for (pp = p; pp != NULL; pp = pp->next) {
--				if ((pp->curve != 0 &&
--				     !_gnutls_ecc_curve_is_supported(
--					     pp->curve)) ||
--				    (pp->pk != 0 && !_gnutls_pk_exists(pp->pk)))
--					break;
--			}
--			if (pp == NULL)
-+		for (const gnutls_group_entry_st *p = supported_groups;
-+		     p->name != NULL; p++) {
-+			if (group_is_supported(p))
- 				groups[i++] = p->id;
- 		}
--		groups[i++] = 0;
-+		groups[i++] = GNUTLS_GROUP_INVALID;
- 	}
- 
- 	return groups;
-@@ -344,3 +354,34 @@ const char *gnutls_group_get_name(gnutls_group_t group)
- 
- 	return NULL;
- }
-+
-+/* Expand GROUP into hybrid SUBGROUPS if any, otherwise an array
-+ * containing the GROUP itself. The result will be written to
-+ * SUBGROUPS, which will be NUL-terminated.
-+ */
-+int _gnutls_group_expand(
-+	const gnutls_group_entry_st *group,
-+	const gnutls_group_entry_st *subgroups[MAX_HYBRID_GROUPS + 1])
-+{
-+	size_t pos = 0;
-+
-+	if (IS_GROUP_HYBRID(group)) {
-+		for (size_t i = 0; i < MAX_HYBRID_GROUPS &&
-+				   group->ids[i] != GNUTLS_GROUP_INVALID;
-+		     i++) {
-+			const gnutls_group_entry_st *p =
-+				group_to_entry(group->ids[i]);
-+			/* This shouldn't happen, as GROUP is assumed
-+			 * to be supported before calling this
-+			 * function. */
-+			if (unlikely(!p))
-+				return gnutls_assert_val(
-+					GNUTLS_E_INTERNAL_ERROR);
-+			subgroups[pos++] = p;
-+		}
-+	} else {
-+		subgroups[pos++] = group;
-+	}
-+	subgroups[pos] = NULL;
-+	return 0;
-+}
-diff --git a/lib/ext/key_share.c b/lib/ext/key_share.c
-index 574521157..8fbe2d2bd 100644
---- a/lib/ext/key_share.c
-+++ b/lib/ext/key_share.c
-@@ -232,6 +232,9 @@ static int client_gen_key_share(gnutls_session_t session,
- 				gnutls_buffer_st *extdata)
- {
- 	unsigned int length_pos;
-+	const gnutls_group_entry_st *groups[MAX_HYBRID_GROUPS + 1] = {
-+		NULL,
-+	};
- 	int ret;
- 
- 	_gnutls_handshake_log("EXT[%p]: sending key share for %s\n", session,
-@@ -247,8 +250,12 @@ static int client_gen_key_share(gnutls_session_t session,
- 	if (ret < 0)
- 		return gnutls_assert_val(ret);
- 
--	for (const gnutls_group_entry_st *p = group; p != NULL; p = p->next) {
--		ret = client_gen_key_share_single(session, p, extdata);
-+	ret = _gnutls_group_expand(group, groups);
-+	if (ret < 0)
-+		return gnutls_assert_val(ret);
-+
-+	for (size_t i = 0; groups[i]; i++) {
-+		ret = client_gen_key_share_single(session, groups[i], extdata);
- 		if (ret < 0)
- 			return gnutls_assert_val(ret);
- 	}
-@@ -345,6 +352,9 @@ static int server_gen_key_share(gnutls_session_t session,
- 				gnutls_buffer_st *extdata)
- {
- 	unsigned int length_pos;
-+	const gnutls_group_entry_st *groups[MAX_HYBRID_GROUPS + 1] = {
-+		NULL,
-+	};
- 	int ret;
- 
- 	_gnutls_handshake_log("EXT[%p]: sending key share for %s\n", session,
-@@ -360,8 +370,12 @@ static int server_gen_key_share(gnutls_session_t session,
- 	if (ret < 0)
- 		return gnutls_assert_val(ret);
- 
--	for (const gnutls_group_entry_st *p = group; p != NULL; p = p->next) {
--		ret = server_gen_key_share_single(session, p, extdata);
-+	ret = _gnutls_group_expand(group, groups);
-+	if (ret < 0)
-+		return gnutls_assert_val(ret);
-+
-+	for (size_t i = 0; groups[i]; i++) {
-+		ret = server_gen_key_share_single(session, groups[i], extdata);
- 		if (ret < 0)
- 			return gnutls_assert_val(ret);
- 	}
-@@ -594,13 +608,19 @@ static int server_use_key_share(gnutls_session_t session,
- 				const uint8_t *data, size_t data_size)
- {
- 	gnutls_buffer_st buffer;
-+	const gnutls_group_entry_st *groups[MAX_HYBRID_GROUPS + 1] = {
-+		NULL,
-+	};
-+	int ret;
- 
- 	_gnutls_ro_buffer_init(&buffer, data, data_size);
- 
--	for (const gnutls_group_entry_st *p = group; p != NULL; p = p->next) {
--		int ret;
-+	ret = _gnutls_group_expand(group, groups);
-+	if (ret < 0)
-+		return gnutls_assert_val(ret);
- 
--		ret = server_use_key_share_single(session, p, &buffer);
-+	for (size_t i = 0; groups[i]; i++) {
-+		ret = server_use_key_share_single(session, groups[i], &buffer);
- 		if (ret < 0)
- 			return gnutls_assert_val(ret);
- 	}
-@@ -775,13 +795,19 @@ static int client_use_key_share(gnutls_session_t session,
- 				const uint8_t *data, size_t data_size)
- {
- 	gnutls_buffer_st buffer;
-+	const gnutls_group_entry_st *groups[MAX_HYBRID_GROUPS + 1] = {
-+		NULL,
-+	};
-+	int ret;
- 
- 	_gnutls_ro_buffer_init(&buffer, data, data_size);
- 
--	for (const gnutls_group_entry_st *p = group; p != NULL; p = p->next) {
--		int ret;
-+	ret = _gnutls_group_expand(group, groups);
-+	if (ret < 0)
-+		return gnutls_assert_val(ret);
- 
--		ret = client_use_key_share_single(session, p, &buffer);
-+	for (size_t i = 0; groups[i]; i++) {
-+		ret = client_use_key_share_single(session, groups[i], &buffer);
- 		if (ret < 0)
- 			return gnutls_assert_val(ret);
- 	}
-@@ -958,18 +984,39 @@ static int key_share_recv_params(gnutls_session_t session, const uint8_t *data,
- 	return 0;
- }
- 
-+static inline bool pk_types_overlap_single(const gnutls_group_entry_st *a,
-+					   const gnutls_group_entry_st *b)
-+{
-+	return a->pk == b->pk || (IS_ECDHX(a->pk) && IS_ECDHX(b->pk)) ||
-+	       (IS_KEM(a->pk) && IS_KEM(b->pk));
-+}
-+
- static inline bool pk_types_overlap(const gnutls_group_entry_st *a,
- 				    const gnutls_group_entry_st *b)
- {
--	const gnutls_group_entry_st *pa;
-+	const gnutls_group_entry_st *sa[MAX_HYBRID_GROUPS + 1] = {
-+		NULL,
-+	};
-+	const gnutls_group_entry_st *sb[MAX_HYBRID_GROUPS + 1] = {
-+		NULL,
-+	};
-+	int ret;
-+
-+	ret = _gnutls_group_expand(a, sa);
-+	if (ret < 0) {
-+		gnutls_assert();
-+		return false;
-+	}
- 
--	for (pa = a; pa != NULL; pa = pa->next) {
--		const gnutls_group_entry_st *pb;
-+	ret = _gnutls_group_expand(b, sb);
-+	if (ret < 0) {
-+		gnutls_assert();
-+		return false;
-+	}
- 
--		for (pb = b; pb != NULL; pb = pb->next) {
--			if (pa->pk == pb->pk ||
--			    (IS_ECDHX(pa->pk) && IS_ECDHX(pb->pk)) ||
--			    (IS_KEM(pa->pk) && IS_KEM(pb->pk)))
-+	for (size_t i = 0; sa[i]; i++) {
-+		for (size_t j = 0; sb[j]; j++) {
-+			if (pk_types_overlap_single(sa[i], sb[j]))
- 				return true;
- 		}
- 	}
-diff --git a/lib/ext/supported_groups.c b/lib/ext/supported_groups.c
-index 254ec4882..4c31d2f8f 100644
---- a/lib/ext/supported_groups.c
-+++ b/lib/ext/supported_groups.c
-@@ -106,9 +106,9 @@ static int _gnutls_supported_groups_recv_params(gnutls_session_t session,
- 	unsigned min_dh;
- 	unsigned j;
- 	int serv_ec_idx, serv_dh_idx,
--		serv_kem_idx; /* index in server's priority listing */
-+		serv_hybrid_idx; /* index in server's priority listing */
- 	int cli_ec_pos, cli_dh_pos,
--		cli_kem_pos; /* position in listing sent by client */
-+		cli_hybrid_pos; /* position in listing sent by client */
- 
- 	if (session->security_parameters.entity == GNUTLS_CLIENT) {
- 		/* A client shouldn't receive this extension in TLS1.2. It is
-@@ -134,8 +134,8 @@ static int _gnutls_supported_groups_recv_params(gnutls_session_t session,
- 		/* we figure what is the minimum DH allowed for this session, if any */
- 		min_dh = get_min_dh(session);
- 
--		serv_ec_idx = serv_dh_idx = serv_kem_idx = -1;
--		cli_ec_pos = cli_dh_pos = cli_kem_pos = -1;
-+		serv_ec_idx = serv_dh_idx = serv_hybrid_idx = -1;
-+		cli_ec_pos = cli_dh_pos = cli_hybrid_pos = -1;
- 
- 		/* This extension is being processed prior to a ciphersuite being selected,
- 		 * so we cannot rely on ciphersuite information. */
-@@ -180,14 +180,15 @@ static int _gnutls_supported_groups_recv_params(gnutls_session_t session,
- 								break;
- 							serv_ec_idx = j;
- 							cli_ec_pos = i;
--						} else if (IS_KEM(group->pk)) {
--							if (serv_kem_idx !=
-+						} else if (IS_GROUP_HYBRID(
-+								   group)) {
-+							if (serv_hybrid_idx !=
- 								    -1 &&
- 							    (int)j >
--								    serv_kem_idx)
-+								    serv_hybrid_idx)
- 								break;
--							serv_kem_idx = j;
--							cli_kem_pos = i;
-+							serv_hybrid_idx = j;
-+							cli_hybrid_pos = i;
- 						}
- 					} else {
- 						if (group->pk == GNUTLS_PK_DH) {
-@@ -200,11 +201,13 @@ static int _gnutls_supported_groups_recv_params(gnutls_session_t session,
- 								break;
- 							cli_ec_pos = i;
- 							serv_ec_idx = j;
--						} else if (IS_KEM(group->pk)) {
--							if (cli_kem_pos != -1)
-+						} else if (IS_GROUP_HYBRID(
-+								   group)) {
-+							if (cli_hybrid_pos !=
-+							    -1)
- 								break;
--							cli_kem_pos = i;
--							serv_kem_idx = j;
-+							cli_hybrid_pos = i;
-+							serv_hybrid_idx = j;
- 						}
- 					}
- 					break;
-@@ -212,7 +215,7 @@ static int _gnutls_supported_groups_recv_params(gnutls_session_t session,
- 			}
- 		}
- 
--		/* serv_{dh,ec,kem}_idx contain the index of the groups we want to use.
-+		/* serv_{dh,ec,hybrid}_idx contain the index of the groups we want to use.
- 		 */
- 		if (serv_dh_idx != -1) {
- 			session->internals.cand_dh_group =
-@@ -236,18 +239,20 @@ static int _gnutls_supported_groups_recv_params(gnutls_session_t session,
- 			}
- 		}
- 
--		/* KEM can only be used in TLS 1.3, where no separation from
--		 * ECDH and DH, and thus only cand_group is set here.
-+		/* PQC hybrid key exchange groups can only be used in
-+		 * TLS 1.3, where no distinction between ECDH and DH
-+		 * in the group definitions, and thus only cand_group
-+		 * is set here.
- 		 */
--		if (serv_kem_idx != -1) {
-+		if (serv_hybrid_idx != -1) {
- 			if (session->internals.cand_group == NULL ||
- 			    (session->internals.priorities->server_precedence &&
--			     serv_kem_idx < MIN(serv_ec_idx, serv_dh_idx)) ||
-+			     serv_hybrid_idx < MIN(serv_ec_idx, serv_dh_idx)) ||
- 			    (!session->internals.priorities->server_precedence &&
--			     cli_kem_pos < MIN(cli_ec_pos, cli_dh_pos))) {
-+			     cli_hybrid_pos < MIN(cli_ec_pos, cli_dh_pos))) {
- 				session->internals.cand_group =
- 					session->internals.priorities->groups
--						.entry[serv_kem_idx];
-+						.entry[serv_hybrid_idx];
- 			}
- 		}
- 
-diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
-index fb2cacb54..01ef59729 100644
---- a/lib/gnutls_int.h
-+++ b/lib/gnutls_int.h
-@@ -756,6 +756,8 @@ typedef struct gnutls_cipher_suite_entry_st {
- 	gnutls_mac_algorithm_t prf;
- } gnutls_cipher_suite_entry_st;
- 
-+#define MAX_HYBRID_GROUPS 2
-+
- typedef struct gnutls_group_entry_st {
- 	const char *name;
- 	gnutls_group_t id;
-@@ -765,8 +767,12 @@ typedef struct gnutls_group_entry_st {
- 	const unsigned *q_bits;
- 	gnutls_ecc_curve_t curve;
- 	gnutls_pk_algorithm_t pk;
-+	gnutls_group_t ids[MAX_HYBRID_GROUPS + 1]; /* IDs of subgroups
-+						    * comprising a
-+						    * hybrid group,
-+						    * terminated with
-+						    * GNUTLS_GROUP_INVALID */
- 	unsigned tls_id; /* The RFC4492 namedCurve ID or TLS 1.3 group ID */
--	const struct gnutls_group_entry_st *next;
- } gnutls_group_entry_st;
- 
- #define GNUTLS_MAC_FLAG_PREIMAGE_INSECURE \
-diff --git a/lib/includes/gnutls/gnutls.h.in b/lib/includes/gnutls/gnutls.h.in
-index 8b3bb5213..1e44fdd91 100644
---- a/lib/includes/gnutls/gnutls.h.in
-+++ b/lib/includes/gnutls/gnutls.h.in
-@@ -1147,8 +1147,10 @@ typedef enum {
- 	GNUTLS_GROUP_EXP_X25519_KYBER768 = 512,
- 	GNUTLS_GROUP_EXP_SECP256R1_MLKEM768 = 513,
- 	GNUTLS_GROUP_EXP_X25519_MLKEM768 = 514,
-+	GNUTLS_GROUP_EXP_KYBER768 = 515,
-+	GNUTLS_GROUP_EXP_MLKEM768 = 516,
- 	GNUTLS_GROUP_EXP_MIN = GNUTLS_GROUP_EXP_X25519_KYBER768,
--	GNUTLS_GROUP_EXP_MAX = GNUTLS_GROUP_EXP_X25519_MLKEM768
-+	GNUTLS_GROUP_EXP_MAX = GNUTLS_GROUP_EXP_MLKEM768
- } gnutls_group_t;
- 
- /* macros to allow specifying a specific curve in gnutls_privkey_generate()
-diff --git a/lib/priority.c b/lib/priority.c
-index ac4ff2d8c..479dbccd6 100644
---- a/lib/priority.c
-+++ b/lib/priority.c
-@@ -2566,7 +2566,7 @@ static void add_dh(gnutls_priority_t priority_cache)
- 	}
- }
- 
--static void add_kem(gnutls_priority_t priority_cache)
-+static void add_hybrid(gnutls_priority_t priority_cache)
- {
- 	const gnutls_group_entry_st *ge;
- 	unsigned i;
-@@ -2579,7 +2579,7 @@ static void add_kem(gnutls_priority_t priority_cache)
- 			    sizeof(priority_cache->groups.entry) /
- 				    sizeof(priority_cache->groups.entry[0])) {
- 			/* do not add groups which do not correspond to enabled ciphersuites */
--			if (!IS_KEM(ge->pk))
-+			if (!IS_GROUP_HYBRID(ge))
- 				continue;
- 			priority_cache->groups
- 				.entry[priority_cache->groups.size++] = ge;
-@@ -2598,7 +2598,7 @@ static int set_ciphersuite_list(gnutls_priority_t priority_cache)
- 	const gnutls_sign_entry_st *se;
- 	unsigned have_ec = 0;
- 	unsigned have_dh = 0;
--	unsigned have_kem = 0;
-+	unsigned have_hybrid = 0;
- 	unsigned tls_sig_sem = 0;
- 	const version_entry_st *tlsmax = NULL, *vers;
- 	const version_entry_st *dtlsmax = NULL;
-@@ -2807,9 +2807,9 @@ static int set_ciphersuite_list(gnutls_priority_t priority_cache)
- 			priority_cache->cs.entry[priority_cache->cs.size++] =
- 				ce;
- 
--			if (!have_kem) {
--				have_kem = 1;
--				add_kem(priority_cache);
-+			if (!have_hybrid) {
-+				have_hybrid = 1;
-+				add_hybrid(priority_cache);
- 			}
- 		}
- 	}
-@@ -2851,8 +2851,8 @@ static int set_ciphersuite_list(gnutls_priority_t priority_cache)
- 		}
- 	}
- 
--	if (have_tls13 && (!have_ec || !have_dh || !have_kem)) {
--		/* scan groups to determine have_{ec,dh,kem} */
-+	if (have_tls13 && (!have_ec || !have_dh || !have_hybrid)) {
-+		/* scan groups to determine have_{ec,dh,hybrid} */
- 		for (i = 0; i < priority_cache->_supported_ecc.num_priorities;
- 		     i++) {
- 			const gnutls_group_entry_st *ge;
-@@ -2865,12 +2865,13 @@ static int set_ciphersuite_list(gnutls_priority_t priority_cache)
- 				} else if (ge->prime && !have_dh) {
- 					add_dh(priority_cache);
- 					have_dh = 1;
--				} else if (IS_KEM(ge->pk) && !have_kem) {
--					add_kem(priority_cache);
--					have_kem = 1;
-+				} else if (IS_GROUP_HYBRID(ge) &&
-+					   !have_hybrid) {
-+					add_hybrid(priority_cache);
-+					have_hybrid = 1;
- 				}
- 
--				if (have_dh && have_ec && have_kem)
-+				if (have_dh && have_ec && have_hybrid)
- 					break;
- 			}
- 		}
-diff --git a/lib/session.c b/lib/session.c
-index a9049a464..7fcbe4fb4 100644
---- a/lib/session.c
-+++ b/lib/session.c
-@@ -415,7 +415,11 @@ char *gnutls_session_get_desc(gnutls_session_t session)
- 				snprintf(kx_name, sizeof(kx_name), "(PSK)");
- 			}
- 		} else if (group && sign_str) {
--			if (group->curve)
-+			if (IS_GROUP_HYBRID(group))
-+				snprintf(kx_name, sizeof(kx_name),
-+					 "(HYBRID-%s)-(%s)", group_name,
-+					 sign_str);
-+			else if (group->curve)
- 				snprintf(kx_name, sizeof(kx_name),
- 					 "(ECDHE-%s)-(%s)", group_name,
- 					 sign_str);
-diff --git a/tests/pqc-hybrid-kx.sh b/tests/pqc-hybrid-kx.sh
-index da936cf04..4984cd4b4 100644
---- a/tests/pqc-hybrid-kx.sh
-+++ b/tests/pqc-hybrid-kx.sh
-@@ -33,34 +33,113 @@
- 
- . "${srcdir}/scripts/common.sh"
- 
-+# First check any mismatch in the gnutls-cli --list
- if ! "${CLI}" --list | grep '^Groups: .*GROUP-X25519-KYBER768.*' >/dev/null; then
-     if "${CLI}" --list | grep '^Public Key Systems: .*KYBER768.*' >/dev/null; then
--	fail "KYBER768 is in Public Key Systems, while GROUP-X25519-KYBER768 is NOT in Groups"
-+	fail '' 'KYBER768 is in Public Key Systems, while GROUP-X25519-KYBER768 is NOT in Groups'
-     fi
--    exit 77
- else
-     if ! "${CLI}" --list | grep '^Public Key Systems: .*KYBER768.*' >/dev/null; then
--	fail "KYBER768 is NOT in Public Key Systems, while GROUP-X25519-KYBER768 is in Groups"
-+	fail '' 'KYBER768 is NOT in Public Key Systems, while GROUP-X25519-KYBER768 is in Groups'
-+    fi
-+fi
-+
-+if ! "${CLI}" --list | grep '^Groups: .*GROUP-\(SECP256R1\|X25519\)-MLKEM768.*' >/dev/null; then
-+    if "${CLI}" --list | grep '^Public Key Systems: .*ML-KEM-768.*' >/dev/null; then
-+	fail '' 'ML-KEM-768 is in Public Key Systems, while GROUP-SECP256R1-MLKEM768 or GROUP-X25519-MLKEM768 is NOT in Groups'
-+    fi
-+else
-+    if ! "${CLI}" --list | grep '^Public Key Systems: .*ML-KEM-768.*' >/dev/null; then
-+	fail '' 'ML-KEM-768 is NOT in Public Key Systems, while GROUP-SECP256R1-MLKEM768 or GROUP-X25519-MLKEM768 is in Groups'
-     fi
- fi
- 
-+# If none of those hybrid groups is supported, skip the test
-+if ! "${CLI}" --list | grep '^Groups: .*GROUP-\(X25519-KYBER768\|SECP256R1-MLKEM768\|X25519-MLKEM768\).*' >/dev/null; then
-+    exit 77
-+fi
-+
- testdir=`create_testdir pqc-hybrid-kx`
- 
- KEY="$srcdir/../doc/credentials/x509/key-ecc.pem"
- CERT="$srcdir/../doc/credentials/x509/cert-ecc.pem"
- CACERT="$srcdir/../doc/credentials/x509/ca.pem"
- 
--eval "${GETPORT}"
--launch_server --echo --priority NORMAL:-GROUP-ALL:+GROUP-X25519-KYBER768 --x509keyfile="$KEY" --x509certfile="$CERT"
--PID=$!
--wait_server ${PID}
-+# Test all supported hybrid groups
-+for group in X25519-KYBER768 SECP256R1-MLKEM768 X25519-MLKEM768; do
-+    if ! "${CLI}" --list | grep "^Groups: .*GROUP-$group.*" >/dev/null; then
-+	echo "$group is not supported, skipping" >&2
-+	continue
-+    fi
-+
-+    eval "${GETPORT}"
-+    launch_server --echo --priority "NORMAL:-GROUP-ALL:+GROUP-$group" --x509keyfile="$KEY" --x509certfile="$CERT"
-+    PID=$!
-+    wait_server ${PID}
-+
-+    ${VALGRIND} "${CLI}" -p "${PORT}" localhost --priority "NORMAL:-GROUP-ALL:+GROUP-$group" --x509cafile="$CACERT" --logfile="$testdir/cli.log" </dev/null
-+    kill ${PID}
-+    wait
-+
-+    grep -- "- Description: (TLS1.3-X.509)-(HYBRID-$group)-(ECDSA-SECP256R1-SHA256)-(AES-256-GCM)" "$testdir/cli.log" || { echo "unexpected handshake description"; cat "$testdir/cli.log"; exit 1; }
-+done
-+
-+# KEM based groups cannot be used standalone
-+for group in KYBER768 MLKEM768; do
-+    if ! "${CLI}" --list | grep "^Groups: .*GROUP-$group.*" >/dev/null; then
-+	"$group is not supported, skipping"
-+	continue
-+    fi
-+
-+    eval "${GETPORT}"
-+    launch_server --echo --priority "NORMAL:-GROUP-ALL:+GROUP-$group" --x509keyfile="$KEY" --x509certfile="$CERT"
-+    PID=$!
-+    wait_server ${PID}
-+
-+    ${VALGRIND} "${CLI}" -p "${PORT}" localhost --priority "NORMAL:-GROUP-ALL:+GROUP-$group" --x509cafile="$CACERT" --logfile="$testdir/cli.log" </dev/null
-+    rc=$?
-+    kill ${PID}
-+    wait
-+
-+    if test $rc -eq 0; then
-+	fail '' 'Handshake succeeded with a standalone KEM group'
-+    fi
-+done
-+
-+# Check if disabling a curve will also disables hybrid groups with it
-+cat <<_EOF_ > "$testdir/test.config"
-+[overrides]
-+
-+disabled-curve = x25519
-+_EOF_
-+
-+for group in X25519-KYBER768 SECP256R1-MLKEM768 X25519-MLKEM768; do
-+    if ! "${CLI}" --list | grep "^Groups: .*GROUP-$group.*" >/dev/null; then
-+	echo "$group is not supported, skipping" >&2
-+	continue
-+    fi
- 
--${VALGRIND} "${CLI}" -p "${PORT}" localhost --priority NORMAL:-GROUP-ALL:+GROUP-X25519-KYBER768 --x509cafile="$CACERT" --logfile="$testdir/cli.log" </dev/null
-+    eval "${GETPORT}"
-+    GNUTLS_SYSTEM_PRIORITY_FILE="$testdir/test.config" launch_server --echo --priority "NORMAL:-GROUP-ALL:+GROUP-$group" --x509keyfile="$KEY" --x509certfile="$CERT"
-+    PID=$!
-+    wait_server ${PID}
- 
--kill ${PID}
--wait
-+    ${VALGRIND} "${CLI}" -p "${PORT}" localhost --priority "NORMAL:-GROUP-ALL:+GROUP-$group" --x509cafile="$CACERT" --logfile="$testdir/cli.log" </dev/null
-+    rc=$?
-+    kill ${PID}
-+    wait
- 
--grep -- '- Description: (TLS1.3-X.509)-(ECDHE-X25519-KYBER768)-(ECDSA-SECP256R1-SHA256)-(AES-256-GCM)' "$testdir/cli.log" || { echo "unexpected handshake description"; exit 1; }
-+    case "$group" in
-+	X25519*)
-+	    if test $rc -eq 0; then
-+		fail '' 'Handshake succeeded with a hybrid group with X25519'
-+	    fi
-+	    ;;
-+	*)
-+	    grep -- "- Description: (TLS1.3-X.509)-(HYBRID-$group)-(ECDSA-SECP256R1-SHA256)-(AES-256-GCM)" "$testdir/cli.log" || { echo "unexpected handshake description"; cat "$testdir/cli.log"; exit 1; }
-+	    ;;
-+    esac
-+done
- 
- rm -rf "$testdir"
- exit 0
--- 
-2.47.1
-
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 6712d1f6ef..dcfe201f3d 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.8.tar.xz.sig
-sha256  ac4f020e583880b51380ed226e59033244bc536cad2623f2e26f5afa2939d8fb  gnutls-3.8.8.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.9.tar.xz.sig
+sha256  69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed  gnutls-3.8.9.tar.xz
 # Locally calculated
-sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
+sha256  5e4aca90e8e08e47558dfd21e2a42251a139242b0016a06708739eeb8f0da60c  README.md
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index a977093bd5..e71e411cf0 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,11 +6,11 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
+GNUTLS_LICENSE_FILES = COPYING.LESSERv2 README.md
 
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 libunistring nettle
 GNUTLS_CPE_ID_VENDOR = gnu
@@ -70,7 +70,7 @@ HOST_GNUTLS_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
 GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
-GNUTLS_LICENSE_FILES += doc/COPYING
+GNUTLS_LICENSE_FILES += COPYING
 GNUTLS_CONF_OPTS += --enable-openssl-compatibility
 else
 GNUTLS_CONF_OPTS += --disable-openssl-compatibility
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
