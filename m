Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA19C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:45:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674C460F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 674C460F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37D2E60A7A;
	Thu,  5 Aug 2021 19:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iO_Lgf7s-12Y; Thu,  5 Aug 2021 19:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5512C60A75;
	Thu,  5 Aug 2021 19:45:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5121C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FEF8405E9
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqEKm0mEcgX2 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:43:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3332D405CC
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:43:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E6FAE8B8F4; Thu,  5 Aug 2021 19:43:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:37:13 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e7a306f0091f21a2a2b1f68861053d55457ae87d
X-Git-Newrev: a7d76c1220ef2739d860ac67d2fb10db11c97265
X-Patchwork-Hint: ignore
Message-Id: <20210805194326.E6FAE8B8F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnfnetlink: fix
 build on musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7d76c1220ef2739d860ac67d2fb10db11c97265
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Include upstream patch to fix build failure with suricata raised since
bump to version 6.0.3 in commit 4c429c3f8c322381991a58fcc37c01da9eb5e8a6

Fixes:
 - http://autobuild.buildroot.org/results/0b960f40b5d7e4bb0c4ba20638fe66a9e0964ab3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2ce779f91819941c0b34a1d3821cad7575415b3e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
