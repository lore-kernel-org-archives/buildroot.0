Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3E7C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:44:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A7460E52
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31A7460E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0DA140517;
	Thu,  5 Aug 2021 19:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnp01zuULPHV; Thu,  5 Aug 2021 19:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0FE440526;
	Thu,  5 Aug 2021 19:44:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDB2D1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD86F83B77
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6etcBFyhDkP for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:43:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E4C583B5A
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:43:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0A664868DF; Thu,  5 Aug 2021 19:43:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:37:17 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a7d76c1220ef2739d860ac67d2fb10db11c97265
X-Git-Newrev: 0d27d60daecb62fb876658b73c6597cea870ea89
X-Patchwork-Hint: ignore
Message-Id: <20210805194327.0A664868DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnetfilter-log:
 fix build on musl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0d27d60daecb62fb876658b73c6597cea870ea89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add upstream patches to fix the following build failure with suricata
raised since bump to version 6.0.3 in commit
4c429c3f8c322381991a58fcc37c01da9eb5e8a6

checking for libnetfilter_log/libnetfilter_log.h... no
configure: error: libnetfilter_log.h not found ...

Fixes:
 - http://autobuild.buildroot.org/results/0b960f40b5d7e4bb0c4ba20638fe66a9e0964ab3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3529c0c3f5ed15e46fa2636c583a2204581bde0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nclude-needed-for-integer-type-definition.patch |  27 ++
 .../0003-src-Use-stdint-types-everywhere.patch     | 489 +++++++++++++++++++++
 ...-include-Sync-with-current-kernel-headers.patch | 112 +++++
 3 files changed, 628 insertions(+)

diff --git a/package/libnetfilter_log/0002-Add-include-needed-for-integer-type-definition.patch b/package/libnetfilter_log/0002-Add-include-needed-for-integer-type-definition.patch
new file mode 100644
index 0000000000..bc8bbb2239
--- /dev/null
+++ b/package/libnetfilter_log/0002-Add-include-needed-for-integer-type-definition.patch
@@ -0,0 +1,27 @@
+From 7529487f70e244cd31ef84b037b1c32749c134a7 Mon Sep 17 00:00:00 2001
+From: Eric Leblond <eric@regit.org>
+Date: Sun, 4 Nov 2012 09:29:44 +0100
+Subject: Add include needed for integer type definition.
+
+[Retrieved from:
+https://git.netfilter.org/libnetfilter_log/commit/?id=7529487f70e244cd31ef84b037b1c32749c134a7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/libnetfilter_log/libnetfilter_log.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/libnetfilter_log/libnetfilter_log.h b/include/libnetfilter_log/libnetfilter_log.h
+index 6b0d3b0..a1331de 100644
+--- a/include/libnetfilter_log/libnetfilter_log.h
++++ b/include/libnetfilter_log/libnetfilter_log.h
+@@ -9,6 +9,7 @@
+ #ifndef __LIBNETFILTER_LOG_H
+ #define __LIBNETFILTER_LOG_H
+ 
++#include <sys/types.h>
+ #include <libnetfilter_log/linux_nfnetlink_log.h>
+ 
+ struct nflog_handle;
+-- 
+cgit v1.2.3
+
diff --git a/package/libnetfilter_log/0003-src-Use-stdint-types-everywhere.patch b/package/libnetfilter_log/0003-src-Use-stdint-types-everywhere.patch
new file mode 100644
index 0000000000..dfc59483a5
--- /dev/null
+++ b/package/libnetfilter_log/0003-src-Use-stdint-types-everywhere.patch
@@ -0,0 +1,489 @@
+From 42878e88e5b72d3120434564942417cae3723385 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 14:01:00 +0200
+Subject: src: Use stdint types everywhere
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+[Retrieved from:
+https://git.netfilter.org/libnetfilter_log/commit/?id=42878e88e5b72d3120434564942417cae3723385]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/libnetfilter_log/libipulog.h        |  5 +-
+ include/libnetfilter_log/libnetfilter_log.h | 39 ++++++------
+ src/libipulog_compat.c                      | 10 ++--
+ src/libnetfilter_log.c                      | 92 ++++++++++++++---------------
+ utils/nfulnl_test.c                         |  6 +-
+ 5 files changed, 77 insertions(+), 75 deletions(-)
+
+diff --git a/include/libnetfilter_log/libipulog.h b/include/libnetfilter_log/libipulog.h
+index 1093bdd..ee7890a 100644
+--- a/include/libnetfilter_log/libipulog.h
++++ b/include/libnetfilter_log/libipulog.h
+@@ -2,6 +2,7 @@
+ #define _LIBIPULOG_H
+ 
+ #include <errno.h>
++#include <stdint.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/types.h>
+@@ -33,9 +34,9 @@ typedef struct ulog_packet_msg {
+ struct ipulog_handle;
+ extern int ipulog_errno;
+ 
+-u_int32_t ipulog_group2gmask(u_int32_t group);
++uint32_t ipulog_group2gmask(uint32_t group);
+ 
+-struct ipulog_handle *ipulog_create_handle(u_int32_t gmask, u_int32_t rmem);
++struct ipulog_handle *ipulog_create_handle(uint32_t gmask, uint32_t rmem);
+ 
+ void ipulog_destroy_handle(struct ipulog_handle *h);
+ 
+diff --git a/include/libnetfilter_log/libnetfilter_log.h b/include/libnetfilter_log/libnetfilter_log.h
+index a1331de..7812877 100644
+--- a/include/libnetfilter_log/libnetfilter_log.h
++++ b/include/libnetfilter_log/libnetfilter_log.h
+@@ -9,6 +9,7 @@
+ #ifndef __LIBNETFILTER_LOG_H
+ #define __LIBNETFILTER_LOG_H
+ 
++#include <stdint.h>
+ #include <sys/types.h>
+ #include <libnetfilter_log/linux_nfnetlink_log.h>
+ 
+@@ -29,19 +30,19 @@ extern struct nflog_handle *nflog_open(void);
+ extern struct nflog_handle *nflog_open_nfnl(struct nfnl_handle *nfnlh);
+ extern int nflog_close(struct nflog_handle *h);
+ 
+-extern int nflog_bind_pf(struct nflog_handle *h, u_int16_t pf);
+-extern int nflog_unbind_pf(struct nflog_handle *h, u_int16_t pf);
++extern int nflog_bind_pf(struct nflog_handle *h, uint16_t pf);
++extern int nflog_unbind_pf(struct nflog_handle *h, uint16_t pf);
+ 
+ extern struct nflog_g_handle *nflog_bind_group(struct nflog_handle *h,
+-						 u_int16_t num);
++						 uint16_t num);
+ extern int nflog_unbind_group(struct nflog_g_handle *gh);
+ 
+ extern int nflog_set_mode(struct nflog_g_handle *gh,
+-			  u_int8_t mode, unsigned int len);
+-extern int nflog_set_timeout(struct nflog_g_handle *gh, u_int32_t timeout);
+-extern int nflog_set_flags(struct nflog_g_handle *gh, u_int16_t flags);
+-extern int nflog_set_qthresh(struct nflog_g_handle *gh, u_int32_t qthresh);
+-extern int nflog_set_nlbufsiz(struct nflog_g_handle *gh, u_int32_t nlbufsiz);
++			  uint8_t mode, unsigned int len);
++extern int nflog_set_timeout(struct nflog_g_handle *gh, uint32_t timeout);
++extern int nflog_set_flags(struct nflog_g_handle *gh, uint16_t flags);
++extern int nflog_set_qthresh(struct nflog_g_handle *gh, uint32_t qthresh);
++extern int nflog_set_nlbufsiz(struct nflog_g_handle *gh, uint32_t nlbufsiz);
+ 
+ extern int nflog_callback_register(struct nflog_g_handle *gh, 
+ 				    nflog_callback *cb, void *data);
+@@ -50,23 +51,23 @@ extern int nflog_handle_packet(struct nflog_handle *h, char *buf, int len);
+ 
+ extern struct nfulnl_msg_packet_hdr *nflog_get_msg_packet_hdr(struct nflog_data *nfad);
+ 
+-extern u_int16_t nflog_get_hwtype(struct nflog_data *nfad);
+-extern u_int16_t nflog_get_msg_packet_hwhdrlen(struct nflog_data *nfad);
++extern uint16_t nflog_get_hwtype(struct nflog_data *nfad);
++extern uint16_t nflog_get_msg_packet_hwhdrlen(struct nflog_data *nfad);
+ extern char *nflog_get_msg_packet_hwhdr(struct nflog_data *nfad);
+ 
+-extern u_int32_t nflog_get_nfmark(struct nflog_data *nfad);
++extern uint32_t nflog_get_nfmark(struct nflog_data *nfad);
+ extern int nflog_get_timestamp(struct nflog_data *nfad, struct timeval *tv);
+-extern u_int32_t nflog_get_indev(struct nflog_data *nfad);
+-extern u_int32_t nflog_get_physindev(struct nflog_data *nfad);
+-extern u_int32_t nflog_get_outdev(struct nflog_data *nfad);
+-extern u_int32_t nflog_get_physoutdev(struct nflog_data *nfad);
++extern uint32_t nflog_get_indev(struct nflog_data *nfad);
++extern uint32_t nflog_get_physindev(struct nflog_data *nfad);
++extern uint32_t nflog_get_outdev(struct nflog_data *nfad);
++extern uint32_t nflog_get_physoutdev(struct nflog_data *nfad);
+ extern struct nfulnl_msg_packet_hw *nflog_get_packet_hw(struct nflog_data *nfad);
+ extern int nflog_get_payload(struct nflog_data *nfad, char **data);
+ extern char *nflog_get_prefix(struct nflog_data *nfad);
+-extern int nflog_get_uid(struct nflog_data *nfad, u_int32_t *uid);
+-extern int nflog_get_gid(struct nflog_data *nfad, u_int32_t *gid);
+-extern int nflog_get_seq(struct nflog_data *nfad, u_int32_t *seq);
+-extern int nflog_get_seq_global(struct nflog_data *nfad, u_int32_t *seq);
++extern int nflog_get_uid(struct nflog_data *nfad, uint32_t *uid);
++extern int nflog_get_gid(struct nflog_data *nfad, uint32_t *gid);
++extern int nflog_get_seq(struct nflog_data *nfad, uint32_t *seq);
++extern int nflog_get_seq_global(struct nflog_data *nfad, uint32_t *seq);
+ 
+ enum {
+ 	NFLOG_XML_PREFIX	= (1 << 0),
+diff --git a/src/libipulog_compat.c b/src/libipulog_compat.c
+index 64ca7f3..2d5b23a 100644
+--- a/src/libipulog_compat.c
++++ b/src/libipulog_compat.c
+@@ -20,7 +20,7 @@ struct ipulog_handle
+ 	struct nlmsghdr *last_nlh;
+ #if 0
+ 	int fd;
+-	u_int8_t blocking;
++	uint8_t blocking;
+ 	struct sockaddr_nl local;
+ 	struct sockaddr_nl peer;
+ #endif
+@@ -72,7 +72,7 @@ const char *ipulog_strerror(int errcode)
+ }
+ 
+ /* convert a netlink group (1-32) to a group_mask suitable for create_handle */
+-u_int32_t ipulog_group2gmask(u_int32_t group)
++uint32_t ipulog_group2gmask(uint32_t group)
+ {
+ 	if (group < 1 || group > 32)
+ 	{
+@@ -83,8 +83,8 @@ u_int32_t ipulog_group2gmask(u_int32_t group)
+ }
+ 
+ /* create a ipulog handle for the reception of packets sent to gmask */
+-struct ipulog_handle *ipulog_create_handle(u_int32_t gmask, 
+-					   u_int32_t rcvbufsize)
++struct ipulog_handle *ipulog_create_handle(uint32_t gmask,
++					   uint32_t rcvbufsize)
+ {
+ 	int rv;
+ 	struct ipulog_handle *h;
+@@ -155,7 +155,7 @@ next_msg:	printf("next\n");
+ 	h->upmsg.hook = hdr->hook;
+ 
+ 	if (tb[NFULA_MARK-1])
+-		h->upmsg.mark = ntohl(*(u_int32_t *)NFA_DATA(tb[NFULA_MARK-1]));
++		h->upmsg.mark = ntohl(*(uint32_t *)NFA_DATA(tb[NFULA_MARK-1]));
+ 	else
+ 		h->upmsg.mark = 0;
+ 
+diff --git a/src/libnetfilter_log.c b/src/libnetfilter_log.c
+index 76ed436..e92576b 100644
+--- a/src/libnetfilter_log.c
++++ b/src/libnetfilter_log.c
+@@ -72,7 +72,7 @@ struct nflog_g_handle
+ {
+ 	struct nflog_g_handle *next;
+ 	struct nflog_handle *h;
+-	u_int16_t id;
++	uint16_t id;
+ 
+ 	nflog_callback *cb;
+ 	void *data;
+@@ -111,7 +111,7 @@ static void add_gh(struct nflog_g_handle *gh)
+ 	gh->h->gh_list = gh;
+ }
+ 
+-static struct nflog_g_handle *find_gh(struct nflog_handle *h, u_int16_t group)
++static struct nflog_g_handle *find_gh(struct nflog_handle *h, uint16_t group)
+ {
+ 	struct nflog_g_handle *gh;
+ 
+@@ -124,8 +124,8 @@ static struct nflog_g_handle *find_gh(struct nflog_handle *h, u_int16_t group)
+ 
+ /* build a NFULNL_MSG_CONFIG message */
+ static int
+-__build_send_cfg_msg(struct nflog_handle *h, u_int8_t command,
+-		     u_int16_t groupnum, u_int8_t pf)
++__build_send_cfg_msg(struct nflog_handle *h, uint8_t command,
++		     uint16_t groupnum, uint8_t pf)
+ {
+ 	union {
+ 		char buf[NFNL_HEADER_LEN
+@@ -148,7 +148,7 @@ static int __nflog_rcv_pkt(struct nlmsghdr *nlh, struct nfattr *nfa[],
+ {
+ 	struct nfgenmsg *nfmsg = NLMSG_DATA(nlh);
+ 	struct nflog_handle *h = data;
+-	u_int16_t group = ntohs(nfmsg->res_id);
++	uint16_t group = ntohs(nfmsg->res_id);
+ 	struct nflog_g_handle *gh = find_gh(h, group);
+ 	struct nflog_data nfldata;
+ 
+@@ -359,7 +359,7 @@ int nflog_close(struct nflog_handle *h)
+  *
+  * \return integer inferior to 0 in case of failure
+  */
+-int nflog_bind_pf(struct nflog_handle *h, u_int16_t pf)
++int nflog_bind_pf(struct nflog_handle *h, uint16_t pf)
+ {
+ 	return __build_send_cfg_msg(h, NFULNL_CFG_CMD_PF_BIND, 0, pf);
+ }
+@@ -373,7 +373,7 @@ int nflog_bind_pf(struct nflog_handle *h, u_int16_t pf)
+  * Unbinds the given nflog handle from processing packets belonging
+  * to the given protocol family.
+  */
+-int nflog_unbind_pf(struct nflog_handle *h, u_int16_t pf)
++int nflog_unbind_pf(struct nflog_handle *h, uint16_t pf)
+ {
+ 	return __build_send_cfg_msg(h, NFULNL_CFG_CMD_PF_UNBIND, 0, pf);
+ }
+@@ -395,7 +395,7 @@ int nflog_unbind_pf(struct nflog_handle *h, u_int16_t pf)
+  * \return a nflog_g_handle pointing to the newly created group
+  */
+ struct nflog_g_handle *
+-nflog_bind_group(struct nflog_handle *h, u_int16_t num)
++nflog_bind_group(struct nflog_handle *h, uint16_t num)
+ {
+ 	struct nflog_g_handle *gh;
+ 	
+@@ -461,7 +461,7 @@ int nflog_unbind_group(struct nflog_g_handle *gh)
+  * \return -1 on error; >= otherwise.
+  */
+ int nflog_set_mode(struct nflog_g_handle *gh,
+-		   u_int8_t mode, u_int32_t range)
++		   uint8_t mode, uint32_t range)
+ {
+ 	union {
+ 		char buf[NFNL_HEADER_LEN
+@@ -493,10 +493,10 @@ int nflog_set_mode(struct nflog_g_handle *gh,
+  *
+  * \return -1 in case of error and errno is explicity set.
+  */
+-int nflog_set_timeout(struct nflog_g_handle *gh, u_int32_t timeout)
++int nflog_set_timeout(struct nflog_g_handle *gh, uint32_t timeout)
+ {
+ 	union {
+-		char buf[NFNL_HEADER_LEN+NFA_LENGTH(sizeof(u_int32_t))];
++		char buf[NFNL_HEADER_LEN+NFA_LENGTH(sizeof(uint32_t))];
+ 		struct nlmsghdr nmh;
+ 	} u;
+ 
+@@ -518,10 +518,10 @@ int nflog_set_timeout(struct nflog_g_handle *gh, u_int32_t timeout)
+  *
+  * \return -1 in case of error and errno is explicity set.
+  */
+-int nflog_set_qthresh(struct nflog_g_handle *gh, u_int32_t qthresh)
++int nflog_set_qthresh(struct nflog_g_handle *gh, uint32_t qthresh)
+ {
+ 	union {
+-		char buf[NFNL_HEADER_LEN+NFA_LENGTH(sizeof(u_int32_t))];
++		char buf[NFNL_HEADER_LEN+NFA_LENGTH(sizeof(uint32_t))];
+ 		struct nlmsghdr nmh;
+ 	} u;
+ 
+@@ -547,10 +547,10 @@ int nflog_set_qthresh(struct nflog_g_handle *gh, u_int32_t qthresh)
+  *
+  * \return -1 in case of error and errno is explicity set.
+  */
+-int nflog_set_nlbufsiz(struct nflog_g_handle *gh, u_int32_t nlbufsiz)
++int nflog_set_nlbufsiz(struct nflog_g_handle *gh, uint32_t nlbufsiz)
+ {
+ 	union {
+-		char buf[NFNL_HEADER_LEN+NFA_LENGTH(sizeof(u_int32_t))];
++		char buf[NFNL_HEADER_LEN+NFA_LENGTH(sizeof(uint32_t))];
+ 		struct nlmsghdr nmh;
+ 	} u;
+ 	int status;
+@@ -581,10 +581,10 @@ int nflog_set_nlbufsiz(struct nflog_g_handle *gh, u_int32_t nlbufsiz)
+  *
+  * \return -1 in case of error and errno is explicity set.
+  */
+-int nflog_set_flags(struct nflog_g_handle *gh, u_int16_t flags)
++int nflog_set_flags(struct nflog_g_handle *gh, uint16_t flags)
+ {
+ 	union {
+-		char buf[NFNL_HEADER_LEN+NFA_LENGTH(sizeof(u_int16_t))];
++		char buf[NFNL_HEADER_LEN+NFA_LENGTH(sizeof(uint16_t))];
+ 		struct nlmsghdr nmh;
+ 	} u;
+ 
+@@ -616,9 +616,9 @@ int nflog_set_flags(struct nflog_g_handle *gh, u_int16_t flags)
+  * The nfulnl_msg_packet_hdr structure is defined in libnetfilter_log.h as:
+  *\verbatim
+ 	struct nfulnl_msg_packet_hdr {
+-	        u_int16_t       hw_protocol;    // hw protocol (network order)
+-	        u_int8_t        hook;           // netfilter hook
+-		u_int8_t        _pad;
++	        uint16_t       hw_protocol;    // hw protocol (network order)
++	        uint8_t        hook;           // netfilter hook
++		uint8_t        _pad;
+ 	} __attribute__ ((packed));
+ \endverbatim
+  */
+@@ -634,9 +634,9 @@ struct nfulnl_msg_packet_hdr *nflog_get_msg_packet_hdr(struct nflog_data *nfad)
+  *
+  * \return the hardware link layer type.
+  */
+-u_int16_t nflog_get_hwtype(struct nflog_data *nfad)
++uint16_t nflog_get_hwtype(struct nflog_data *nfad)
+ {
+-	return ntohs(nfnl_get_data(nfad->nfa, NFULA_HWTYPE, u_int16_t));
++	return ntohs(nfnl_get_data(nfad->nfa, NFULA_HWTYPE, uint16_t));
+ }
+ 
+ /**
+@@ -645,9 +645,9 @@ u_int16_t nflog_get_hwtype(struct nflog_data *nfad)
+  *
+  * \return the size of the hardware link layer header
+  */
+-u_int16_t nflog_get_msg_packet_hwhdrlen(struct nflog_data *nfad)
++uint16_t nflog_get_msg_packet_hwhdrlen(struct nflog_data *nfad)
+ {
+-	return ntohs(nfnl_get_data(nfad->nfa, NFULA_HWLEN, u_int16_t));
++	return ntohs(nfnl_get_data(nfad->nfa, NFULA_HWLEN, uint16_t));
+ }
+ 
+ /**
+@@ -667,9 +667,9 @@ char *nflog_get_msg_packet_hwhdr(struct nflog_data *nfad)
+  *
+  * \return the netfilter mark currently assigned to the logged packet.
+  */
+-u_int32_t nflog_get_nfmark(struct nflog_data *nfad)
++uint32_t nflog_get_nfmark(struct nflog_data *nfad)
+ {
+-	return ntohl(nfnl_get_data(nfad->nfa, NFULA_MARK, u_int32_t));
++	return ntohl(nfnl_get_data(nfad->nfa, NFULA_MARK, uint32_t));
+ }
+ 
+ /**
+@@ -707,9 +707,9 @@ int nflog_get_timestamp(struct nflog_data *nfad, struct timeval *tv)
+  * \warning all nflog_get_dev() functions return 0 if not set, since linux
+  * only allows ifindex >= 1, see net/core/dev.c:2600  (in 2.6.13.1)
+  */
+-u_int32_t nflog_get_indev(struct nflog_data *nfad)
++uint32_t nflog_get_indev(struct nflog_data *nfad)
+ {
+-	return ntohl(nfnl_get_data(nfad->nfa, NFULA_IFINDEX_INDEV, u_int32_t));
++	return ntohl(nfnl_get_data(nfad->nfa, NFULA_IFINDEX_INDEV, uint32_t));
+ }
+ 
+ /**
+@@ -720,9 +720,9 @@ u_int32_t nflog_get_indev(struct nflog_data *nfad)
+  * If the returned index is 0, the packet was locally generated or the
+  * physical input interface is no longer known (ie. POSTROUTING?).
+  */
+-u_int32_t nflog_get_physindev(struct nflog_data *nfad)
++uint32_t nflog_get_physindev(struct nflog_data *nfad)
+ {
+-	return ntohl(nfnl_get_data(nfad->nfa, NFULA_IFINDEX_PHYSINDEV, u_int32_t));
++	return ntohl(nfnl_get_data(nfad->nfa, NFULA_IFINDEX_PHYSINDEV, uint32_t));
+ }
+ 
+ /**
+@@ -733,9 +733,9 @@ u_int32_t nflog_get_physindev(struct nflog_data *nfad)
+  * returned index is 0, the packet is destined for localhost or the output
+  * interface is not yet known (ie. PREROUTING?).
+  */
+-u_int32_t nflog_get_outdev(struct nflog_data *nfad)
++uint32_t nflog_get_outdev(struct nflog_data *nfad)
+ {
+-	return ntohl(nfnl_get_data(nfad->nfa, NFULA_IFINDEX_OUTDEV, u_int32_t));
++	return ntohl(nfnl_get_data(nfad->nfa, NFULA_IFINDEX_OUTDEV, uint32_t));
+ }
+ 
+ /**
+@@ -749,9 +749,9 @@ u_int32_t nflog_get_outdev(struct nflog_data *nfad)
+  * \return The index of physical interface that the packet output will be
+  * routed out.
+  */
+-u_int32_t nflog_get_physoutdev(struct nflog_data *nfad)
++uint32_t nflog_get_physoutdev(struct nflog_data *nfad)
+ {
+-	return ntohl(nfnl_get_data(nfad->nfa, NFULA_IFINDEX_PHYSOUTDEV, u_int32_t));
++	return ntohl(nfnl_get_data(nfad->nfa, NFULA_IFINDEX_PHYSOUTDEV, uint32_t));
+ }
+ 
+ /**
+@@ -767,9 +767,9 @@ u_int32_t nflog_get_physoutdev(struct nflog_data *nfad)
+  * The nfulnl_msg_packet_hw structure is defined in libnetfilter_log.h as:
+  * \verbatim
+         struct nfulnl_msg_packet_hw {
+-                u_int16_t       hw_addrlen;
+-                u_int16_t       _pad;
+-                u_int8_t        hw_addr[8];
++                uint16_t       hw_addrlen;
++                uint16_t       _pad;
++                uint8_t        hw_addr[8];
+         } __attribute__ ((packed));
+ \endverbatim
+  */
+@@ -817,12 +817,12 @@ char *nflog_get_prefix(struct nflog_data *nfad)
+  *
+  * \return the UID of the user that has genered the packet, if any.
+  */
+-int nflog_get_uid(struct nflog_data *nfad, u_int32_t *uid)
++int nflog_get_uid(struct nflog_data *nfad, uint32_t *uid)
+ {
+ 	if (!nfnl_attr_present(nfad->nfa, NFULA_UID))
+ 		return -1;
+ 
+-	*uid = ntohl(nfnl_get_data(nfad->nfa, NFULA_UID, u_int32_t));
++	*uid = ntohl(nfnl_get_data(nfad->nfa, NFULA_UID, uint32_t));
+ 	return 0;
+ }
+ 
+@@ -832,12 +832,12 @@ int nflog_get_uid(struct nflog_data *nfad, u_int32_t *uid)
+  *
+  * \return the GID of the user that has genered the packet, if any.
+  */
+-int nflog_get_gid(struct nflog_data *nfad, u_int32_t *gid)
++int nflog_get_gid(struct nflog_data *nfad, uint32_t *gid)
+ {
+ 	if (!nfnl_attr_present(nfad->nfa, NFULA_GID))
+ 		return -1;
+ 
+-	*gid = ntohl(nfnl_get_data(nfad->nfa, NFULA_GID, u_int32_t));
++	*gid = ntohl(nfnl_get_data(nfad->nfa, NFULA_GID, uint32_t));
+ 	return 0;
+ }
+ 
+@@ -849,12 +849,12 @@ int nflog_get_gid(struct nflog_data *nfad, u_int32_t *gid)
+  *
+  * \return the local nflog sequence number.
+  */
+-int nflog_get_seq(struct nflog_data *nfad, u_int32_t *seq)
++int nflog_get_seq(struct nflog_data *nfad, uint32_t *seq)
+ {
+ 	if (!nfnl_attr_present(nfad->nfa, NFULA_SEQ))
+ 		return -1;
+ 
+-	*seq = ntohl(nfnl_get_data(nfad->nfa, NFULA_SEQ, u_int32_t));
++	*seq = ntohl(nfnl_get_data(nfad->nfa, NFULA_SEQ, uint32_t));
+ 	return 0;
+ }
+ 
+@@ -866,12 +866,12 @@ int nflog_get_seq(struct nflog_data *nfad, u_int32_t *seq)
+  *
+  * \return the global nflog sequence number.
+  */
+-int nflog_get_seq_global(struct nflog_data *nfad, u_int32_t *seq)
++int nflog_get_seq_global(struct nflog_data *nfad, uint32_t *seq)
+ {
+ 	if (!nfnl_attr_present(nfad->nfa, NFULA_SEQ_GLOBAL))
+ 		return -1;
+ 
+-	*seq = ntohl(nfnl_get_data(nfad->nfa, NFULA_SEQ_GLOBAL, u_int32_t));
++	*seq = ntohl(nfnl_get_data(nfad->nfa, NFULA_SEQ_GLOBAL, uint32_t));
+ 	return 0;
+ }
+ 
+@@ -923,7 +923,7 @@ int nflog_snprintf_xml(char *buf, size_t rem, struct nflog_data *tb, int flags)
+ {
+ 	struct nfulnl_msg_packet_hdr *ph;
+ 	struct nfulnl_msg_packet_hw *hwph;
+-	u_int32_t mark, ifi;
++	uint32_t mark, ifi;
+ 	int size, offset = 0, len = 0, ret;
+ 	char *data;
+ 
+diff --git a/utils/nfulnl_test.c b/utils/nfulnl_test.c
+index ae5da79..dd3091b 100644
+--- a/utils/nfulnl_test.c
++++ b/utils/nfulnl_test.c
+@@ -9,9 +9,9 @@
+ static int print_pkt(struct nflog_data *ldata)
+ {
+ 	struct nfulnl_msg_packet_hdr *ph = nflog_get_msg_packet_hdr(ldata);
+-	u_int32_t mark = nflog_get_nfmark(ldata);
+-	u_int32_t indev = nflog_get_indev(ldata);
+-	u_int32_t outdev = nflog_get_outdev(ldata);
++	uint32_t mark = nflog_get_nfmark(ldata);
++	uint32_t indev = nflog_get_indev(ldata);
++	uint32_t outdev = nflog_get_outdev(ldata);
+ 	char *prefix = nflog_get_prefix(ldata);
+ 	char *payload;
+ 	int payload_len = nflog_get_payload(ldata, &payload);
+-- 
+cgit v1.2.3
+
diff --git a/package/libnetfilter_log/0004-include-Sync-with-current-kernel-headers.patch b/package/libnetfilter_log/0004-include-Sync-with-current-kernel-headers.patch
new file mode 100644
index 0000000000..bb62411ec4
--- /dev/null
+++ b/package/libnetfilter_log/0004-include-Sync-with-current-kernel-headers.patch
@@ -0,0 +1,112 @@
+From 614d8b6cfb969c6102ef320de22b1eb199efce2a Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 13:37:53 +0200
+Subject: include: Sync with current kernel headers
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+[Retrieved from:
+https://git.netfilter.org/libnetfilter_log/commit/?id=614d8b6cfb969c6102ef320de22b1eb199efce2a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/libnetfilter_log/linux_nfnetlink_log.h | 51 +++++++++++++-------------
+ 1 file changed, 25 insertions(+), 26 deletions(-)
+
+diff --git a/include/libnetfilter_log/linux_nfnetlink_log.h b/include/libnetfilter_log/linux_nfnetlink_log.h
+index 4c802c8..9f38277 100644
+--- a/include/libnetfilter_log/linux_nfnetlink_log.h
++++ b/include/libnetfilter_log/linux_nfnetlink_log.h
+@@ -20,33 +20,31 @@ enum nfulnl_msg_types {
+ };
+ 
+ struct nfulnl_msg_packet_hdr {
+-	u_int16_t	hw_protocol;	/* hw protocol (network order) */
+-	u_int8_t	hook;		/* netfilter hook */
+-	u_int8_t	_pad;
+-} __attribute__ ((packed));
++	__be16		hw_protocol;	/* hw protocol (network order) */
++	__u8	hook;		/* netfilter hook */
++	__u8	_pad;
++};
+ 
+ struct nfulnl_msg_packet_hw {
+-	u_int16_t	hw_addrlen;
+-	u_int16_t	_pad;
+-	u_int8_t	hw_addr[8];
+-} __attribute__ ((packed));
++	__be16		hw_addrlen;
++	__u16	_pad;
++	__u8	hw_addr[8];
++};
+ 
+ struct nfulnl_msg_packet_timestamp {
+-	aligned_u64	sec;
+-	aligned_u64	usec;
+-} __attribute__ ((packed));
+-
+-#define NFULNL_PREFIXLEN	30	/* just like old log target */
++	__aligned_be64	sec;
++	__aligned_be64	usec;
++};
+ 
+ enum nfulnl_attr_type {
+ 	NFULA_UNSPEC,
+ 	NFULA_PACKET_HDR,
+-	NFULA_MARK,			/* u_int32_t nfmark */
++	NFULA_MARK,			/* __u32 nfmark */
+ 	NFULA_TIMESTAMP,		/* nfulnl_msg_packet_timestamp */
+-	NFULA_IFINDEX_INDEV,		/* u_int32_t ifindex */
+-	NFULA_IFINDEX_OUTDEV,		/* u_int32_t ifindex */
+-	NFULA_IFINDEX_PHYSINDEV,	/* u_int32_t ifindex */
+-	NFULA_IFINDEX_PHYSOUTDEV,	/* u_int32_t ifindex */
++	NFULA_IFINDEX_INDEV,		/* __u32 ifindex */
++	NFULA_IFINDEX_OUTDEV,		/* __u32 ifindex */
++	NFULA_IFINDEX_PHYSINDEV,	/* __u32 ifindex */
++	NFULA_IFINDEX_PHYSOUTDEV,	/* __u32 ifindex */
+ 	NFULA_HWADDR,			/* nfulnl_msg_packet_hw */
+ 	NFULA_PAYLOAD,			/* opaque data payload */
+ 	NFULA_PREFIX,			/* string prefix */
+@@ -71,23 +69,23 @@ enum nfulnl_msg_config_cmds {
+ };
+ 
+ struct nfulnl_msg_config_cmd {
+-	u_int8_t	command;	/* nfulnl_msg_config_cmds */
++	__u8	command;	/* nfulnl_msg_config_cmds */
+ } __attribute__ ((packed));
+ 
+ struct nfulnl_msg_config_mode {
+-	u_int32_t	copy_range;
+-	u_int8_t	copy_mode;
+-	u_int8_t	_pad;
++	__be32		copy_range;
++	__u8	copy_mode;
++	__u8	_pad;
+ } __attribute__ ((packed));
+ 
+ enum nfulnl_attr_config {
+ 	NFULA_CFG_UNSPEC,
+ 	NFULA_CFG_CMD,			/* nfulnl_msg_config_cmd */
+ 	NFULA_CFG_MODE,			/* nfulnl_msg_config_mode */
+-	NFULA_CFG_NLBUFSIZ,		/* u_int32_t buffer size */
+-	NFULA_CFG_TIMEOUT,		/* u_int32_t in 1/100 s */
+-	NFULA_CFG_QTHRESH,		/* u_int32_t */
+-	NFULA_CFG_FLAGS,		/* u_int16_t */
++	NFULA_CFG_NLBUFSIZ,		/* __u32 buffer size */
++	NFULA_CFG_TIMEOUT,		/* __u32 in 1/100 s */
++	NFULA_CFG_QTHRESH,		/* __u32 */
++	NFULA_CFG_FLAGS,		/* __u16 */
+ 	__NFULA_CFG_MAX
+ };
+ #define NFULA_CFG_MAX (__NFULA_CFG_MAX -1)
+@@ -95,6 +93,7 @@ enum nfulnl_attr_config {
+ #define NFULNL_COPY_NONE	0x00
+ #define NFULNL_COPY_META	0x01
+ #define NFULNL_COPY_PACKET	0x02
++/* 0xff is reserved, don't use it for new copy modes. */
+ 
+ #define NFULNL_CFG_F_SEQ	0x0001
+ #define NFULNL_CFG_F_SEQ_GLOBAL	0x0002
+-- 
+cgit v1.2.3
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
