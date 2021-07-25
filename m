Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF871C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:28:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6956F60E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6956F60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F18140415;
	Sun, 25 Jul 2021 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSgdWEFtOXTl; Sun, 25 Jul 2021 21:28:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC0D4040A;
	Sun, 25 Jul 2021 21:28:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EBEF1BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E2ED4040A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHDvZ7F7K73E for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:27:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4162C403FB
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5F7A988FBC; Sun, 25 Jul 2021 20:53:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:27:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f20ad546fd89e8e2dee7b40ebea9878e72d082f
X-Git-Newrev: 2ce779f91819941c0b34a1d3821cad7575415b3e
X-Patchwork-Hint: ignore
Message-Id: <20210725205325.5F7A988FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnfnetlink: fix build on musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ce779f91819941c0b34a1d3821cad7575415b3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include upstream patch to fix build failure with suricata raised since
bump to version 6.0.3 in commit 4c429c3f8c322381991a58fcc37c01da9eb5e8a6

Fixes:
 - http://autobuild.buildroot.org/results/0b960f40b5d7e4bb0c4ba20638fe66a9e0964ab3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-include-Sync-with-kernel-headers.patch    | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch b/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
new file mode 100644
index 0000000000..f9e9c2e2ea
--- /dev/null
+++ b/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
@@ -0,0 +1,114 @@
+From 7a1a07c0028a1c88cd7716a058697c552a563b24 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 14:49:07 +0200
+Subject: include: Sync with kernel headers
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+[Retrieved from:
+https://git.netfilter.org/libnfnetlink/commit/?id=7a1a07c0028a1c88cd7716a058697c552a563b24]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/libnfnetlink/linux_nfnetlink.h        | 44 ++++-----------------------
+ include/libnfnetlink/linux_nfnetlink_compat.h | 12 ++++----
+ 2 files changed, 12 insertions(+), 44 deletions(-)
+
+diff --git a/include/libnfnetlink/linux_nfnetlink.h b/include/libnfnetlink/linux_nfnetlink.h
+index 76a8550..44a38d6 100644
+--- a/include/libnfnetlink/linux_nfnetlink.h
++++ b/include/libnfnetlink/linux_nfnetlink.h
+@@ -25,9 +25,9 @@ enum nfnetlink_groups {
+ /* General form of address family dependent message.
+  */
+ struct nfgenmsg {
+-	u_int8_t  nfgen_family;		/* AF_xxx */
+-	u_int8_t  version;		/* nfnetlink version */
+-	u_int16_t    res_id;		/* resource id */
++	__u8  nfgen_family;		/* AF_xxx */
++	__u8  version;		/* nfnetlink version */
++	__be16    res_id;		/* resource id */
+ };
+ 
+ #define NFNETLINK_V0	0
+@@ -46,40 +46,8 @@ struct nfgenmsg {
+ #define NFNL_SUBSYS_CTNETLINK_EXP	2
+ #define NFNL_SUBSYS_QUEUE		3
+ #define NFNL_SUBSYS_ULOG		4
+-#define NFNL_SUBSYS_COUNT		5
++#define NFNL_SUBSYS_OSF			5
++#define NFNL_SUBSYS_IPSET		6
++#define NFNL_SUBSYS_COUNT		7
+ 
+-#ifdef __KERNEL__
+-
+-#include <linux/netlink.h>
+-#include <linux/capability.h>
+-#include <net/netlink.h>
+-
+-struct nfnl_callback
+-{
+-	int (*call)(struct sock *nl, struct sk_buff *skb, 
+-		struct nlmsghdr *nlh, struct nlattr *cda[]);
+-	const struct nla_policy *policy;	/* netlink attribute policy */
+-	const u_int16_t attr_count;		/* number of nlattr's */
+-};
+-
+-struct nfnetlink_subsystem
+-{
+-	const char *name;
+-	__u8 subsys_id;			/* nfnetlink subsystem ID */
+-	__u8 cb_count;			/* number of callbacks */
+-	const struct nfnl_callback *cb;	/* callback for individual types */
+-};
+-
+-extern int nfnetlink_subsys_register(const struct nfnetlink_subsystem *n);
+-extern int nfnetlink_subsys_unregister(const struct nfnetlink_subsystem *n);
+-
+-extern int nfnetlink_has_listeners(unsigned int group);
+-extern int nfnetlink_send(struct sk_buff *skb, u32 pid, unsigned group, 
+-			  int echo);
+-extern int nfnetlink_unicast(struct sk_buff *skb, u_int32_t pid, int flags);
+-
+-#define MODULE_ALIAS_NFNL_SUBSYS(subsys) \
+-	MODULE_ALIAS("nfnetlink-subsys-" __stringify(subsys))
+-
+-#endif	/* __KERNEL__ */
+ #endif	/* _NFNETLINK_H */
+diff --git a/include/libnfnetlink/linux_nfnetlink_compat.h b/include/libnfnetlink/linux_nfnetlink_compat.h
+index e145176..74b9e55 100644
+--- a/include/libnfnetlink/linux_nfnetlink_compat.h
++++ b/include/libnfnetlink/linux_nfnetlink_compat.h
+@@ -1,6 +1,8 @@
+ #ifndef _NFNETLINK_COMPAT_H
+ #define _NFNETLINK_COMPAT_H
+-#ifndef __KERNEL__
++
++#include <linux/types.h>
++
+ /* Old nfnetlink macros for userspace */
+ 
+ /* nfnetlink groups: Up to 32 maximum */
+@@ -18,10 +20,9 @@
+  * ! nfnetlink use the same attributes methods. - J. Schulist.
+  */
+ 
+-struct nfattr
+-{
+-	u_int16_t nfa_len;
+-	u_int16_t nfa_type;	/* we use 15 bits for the type, and the highest
++struct nfattr {
++	__u16 nfa_len;
++	__u16 nfa_type;	/* we use 15 bits for the type, and the highest
+ 				 * bit to indicate whether the payload is nested */
+ };
+ 
+@@ -57,5 +58,4 @@ struct nfattr
+         + NLMSG_ALIGN(sizeof(struct nfgenmsg))))
+ #define NFM_PAYLOAD(n)  NLMSG_PAYLOAD(n, sizeof(struct nfgenmsg))
+ 
+-#endif /* ! __KERNEL__ */
+ #endif /* _NFNETLINK_COMPAT_H */
+-- 
+cgit v1.2.3
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
