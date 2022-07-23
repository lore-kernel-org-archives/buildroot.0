Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BBFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B44D34169A;
	Sat, 23 Jul 2022 20:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B44D34169A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Igo82jFXJY9f; Sat, 23 Jul 2022 20:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D33D4050C;
	Sat, 23 Jul 2022 20:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D33D4050C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3411BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56A8D84B9C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A8D84B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHn17ShuJ5eT for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:16:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A054084B85
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A054084B85
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:16:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso4202428wmq.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hOleq4eLCNjNVNefEAiCX/u9+oetfyQVK67svRk0I9s=;
 b=Y9VC9uU/VzP7QNcUXmX7FkZopaRAfDhe6npAQRmAs0IgDpy0ppyE6LN/XdqtAZgLOe
 AiJUJHUbQIKfBE/P/IKRx1LbM+5Ky9RZxTjAx7X9k6IdTonzrPqQTof5onU/Ohm6Jw/R
 NNLTHwkC01bajgLh5aDc96d1xLr6kcsyawnJnPe0ouGSgt9QPFLWGxBVM86rN7lcc+Ql
 oF8IDfLyyCtwdPEwe9NWB2qQQawHUsvwVfi1JCN1SqOYYkGntrnp/pVJk1sZjKg2H0MC
 jZ1BjcKXgUyAUt1DVDTkuaptGlXRp2lKaDyaw5x6ruU7C+VRKK2sef8x30F8R3faRSha
 1Xeg==
X-Gm-Message-State: AJIora9TBTQKd3VDop4N9zynSE7EhBMy9N99m7ytoyU/taJ2xu5YcTIm
 hFQ6L9pw+tcT6zCuZCAhe/pEYg==
X-Google-Smtp-Source: AGRyM1umAbvG+L1rpxISU2nDOXQYDbvbJQ1gXtXlZ5RokiRpJfTeFsSF9Juizfj2i/bdWUBqVaJhvQ==
X-Received: by 2002:a05:600c:364f:b0:3a3:20ea:b85d with SMTP id
 y15-20020a05600c364f00b003a320eab85dmr16069124wmq.125.1658607401512; 
 Sat, 23 Jul 2022 13:16:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc34a000000b003a30f84a9aasm8845490wmj.26.2022.07.23.13.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 13:16:41 -0700 (PDT)
Message-ID: <8357cef3-46f8-2e62-eb77-89b825f1d7b1@mind.be>
Date: Sat, 23 Jul 2022 22:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220622165728.71856-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220622165728.71856-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hOleq4eLCNjNVNefEAiCX/u9+oetfyQVK67svRk0I9s=;
 b=WJs8xp4FoGXGrKdfFhpMYWySlEHLlGe17PIjZQfJo0jdSsSMR3uRArAFoOPo6/CjKN
 wqKq5Vu559Y3NS2b8ZDmd65JA2Lsp80r4gfCdX8MNA3vfWg402+LVcNrfWCTcc/C9tMA
 r04v1Sn34gzabO3DOyXXZztOz0FVK/uAkZyzIAqOLRGNDMEzhXfw+Znx8Q/Hs9ZFrxnJ
 wMUYxspQcj5lMPL+GabpIhOXhZwu8GNwM9DKPFpFFFDygXlzcdCQyaV+FD0tU2IFc1BT
 eQCZlixeby944LFDaGtIFZyuxNa7lJeo3URdgE/odmq7o56vSgJQpFAHMk+m1LW7uNDP
 oYuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WJs8xp4F
Subject: Re: [Buildroot] [PATCH 1/1] package/libnfnetlink: bump to version
 1.0.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2022 18:57, Fabrice Fontaine wrote:
> - Drop first and second patches (already in version) and so also drop
>    autoreconf
> - Drop third patch (not needed since
>    https://git.netfilter.org/libnfnetlink/commit/?id=efa1d8e417ae5b685c206853aaa0e7f762574585)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnfnetlink/0001-uclinux.patch       |  26 ----
>   ...002-include-Sync-with-kernel-headers.patch | 114 ------------------
>   package/libnfnetlink/0002-musl.patch          |  32 -----
>   package/libnfnetlink/libnfnetlink.hash        |   7 +-
>   package/libnfnetlink/libnfnetlink.mk          |   3 +-
>   5 files changed, 4 insertions(+), 178 deletions(-)
>   delete mode 100644 package/libnfnetlink/0001-uclinux.patch
>   delete mode 100644 package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
>   delete mode 100644 package/libnfnetlink/0002-musl.patch
> 
> diff --git a/package/libnfnetlink/0001-uclinux.patch b/package/libnfnetlink/0001-uclinux.patch
> deleted file mode 100644
> index b15201283a..0000000000
> --- a/package/libnfnetlink/0001-uclinux.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 8e5a9d8f32c9646d01d8c84e979892dfd28a7f7c Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Tue, 10 Sep 2013 15:35:22 -0300
> -Subject: [PATCH] configure: uclinux is also linux
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0926a1c..b979772 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -18,7 +18,7 @@ AC_DISABLE_STATIC
> - AM_PROG_LIBTOOL
> -
> - case "$host" in
> --*-*-linux*) ;;
> -+*-*-linux* | *-*-uclinux*) ;;
> - *) AC_MSG_ERROR([Linux only, dude!]);;
> - esac
> -
> ---
> -1.8.1.5
> -
> diff --git a/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch b/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
> deleted file mode 100644
> index f9e9c2e2ea..0000000000
> --- a/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From 7a1a07c0028a1c88cd7716a058697c552a563b24 Mon Sep 17 00:00:00 2001
> -From: Felix Janda <felix.janda@posteo.de>
> -Date: Sat, 16 May 2015 14:49:07 +0200
> -Subject: include: Sync with kernel headers
> -
> -Signed-off-by: Felix Janda <felix.janda@posteo.de>
> -Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
> -
> -[Retrieved from:
> -https://git.netfilter.org/libnfnetlink/commit/?id=7a1a07c0028a1c88cd7716a058697c552a563b24]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - include/libnfnetlink/linux_nfnetlink.h        | 44 ++++-----------------------
> - include/libnfnetlink/linux_nfnetlink_compat.h | 12 ++++----
> - 2 files changed, 12 insertions(+), 44 deletions(-)
> -
> -diff --git a/include/libnfnetlink/linux_nfnetlink.h b/include/libnfnetlink/linux_nfnetlink.h
> -index 76a8550..44a38d6 100644
> ---- a/include/libnfnetlink/linux_nfnetlink.h
> -+++ b/include/libnfnetlink/linux_nfnetlink.h
> -@@ -25,9 +25,9 @@ enum nfnetlink_groups {
> - /* General form of address family dependent message.
> -  */
> - struct nfgenmsg {
> --	u_int8_t  nfgen_family;		/* AF_xxx */
> --	u_int8_t  version;		/* nfnetlink version */
> --	u_int16_t    res_id;		/* resource id */
> -+	__u8  nfgen_family;		/* AF_xxx */
> -+	__u8  version;		/* nfnetlink version */
> -+	__be16    res_id;		/* resource id */
> - };
> -
> - #define NFNETLINK_V0	0
> -@@ -46,40 +46,8 @@ struct nfgenmsg {
> - #define NFNL_SUBSYS_CTNETLINK_EXP	2
> - #define NFNL_SUBSYS_QUEUE		3
> - #define NFNL_SUBSYS_ULOG		4
> --#define NFNL_SUBSYS_COUNT		5
> -+#define NFNL_SUBSYS_OSF			5
> -+#define NFNL_SUBSYS_IPSET		6
> -+#define NFNL_SUBSYS_COUNT		7
> -
> --#ifdef __KERNEL__
> --
> --#include <linux/netlink.h>
> --#include <linux/capability.h>
> --#include <net/netlink.h>
> --
> --struct nfnl_callback
> --{
> --	int (*call)(struct sock *nl, struct sk_buff *skb,
> --		struct nlmsghdr *nlh, struct nlattr *cda[]);
> --	const struct nla_policy *policy;	/* netlink attribute policy */
> --	const u_int16_t attr_count;		/* number of nlattr's */
> --};
> --
> --struct nfnetlink_subsystem
> --{
> --	const char *name;
> --	__u8 subsys_id;			/* nfnetlink subsystem ID */
> --	__u8 cb_count;			/* number of callbacks */
> --	const struct nfnl_callback *cb;	/* callback for individual types */
> --};
> --
> --extern int nfnetlink_subsys_register(const struct nfnetlink_subsystem *n);
> --extern int nfnetlink_subsys_unregister(const struct nfnetlink_subsystem *n);
> --
> --extern int nfnetlink_has_listeners(unsigned int group);
> --extern int nfnetlink_send(struct sk_buff *skb, u32 pid, unsigned group,
> --			  int echo);
> --extern int nfnetlink_unicast(struct sk_buff *skb, u_int32_t pid, int flags);
> --
> --#define MODULE_ALIAS_NFNL_SUBSYS(subsys) \
> --	MODULE_ALIAS("nfnetlink-subsys-" __stringify(subsys))
> --
> --#endif	/* __KERNEL__ */
> - #endif	/* _NFNETLINK_H */
> -diff --git a/include/libnfnetlink/linux_nfnetlink_compat.h b/include/libnfnetlink/linux_nfnetlink_compat.h
> -index e145176..74b9e55 100644
> ---- a/include/libnfnetlink/linux_nfnetlink_compat.h
> -+++ b/include/libnfnetlink/linux_nfnetlink_compat.h
> -@@ -1,6 +1,8 @@
> - #ifndef _NFNETLINK_COMPAT_H
> - #define _NFNETLINK_COMPAT_H
> --#ifndef __KERNEL__
> -+
> -+#include <linux/types.h>
> -+
> - /* Old nfnetlink macros for userspace */
> -
> - /* nfnetlink groups: Up to 32 maximum */
> -@@ -18,10 +20,9 @@
> -  * ! nfnetlink use the same attributes methods. - J. Schulist.
> -  */
> -
> --struct nfattr
> --{
> --	u_int16_t nfa_len;
> --	u_int16_t nfa_type;	/* we use 15 bits for the type, and the highest
> -+struct nfattr {
> -+	__u16 nfa_len;
> -+	__u16 nfa_type;	/* we use 15 bits for the type, and the highest
> - 				 * bit to indicate whether the payload is nested */
> - };
> -
> -@@ -57,5 +58,4 @@ struct nfattr
> -         + NLMSG_ALIGN(sizeof(struct nfgenmsg))))
> - #define NFM_PAYLOAD(n)  NLMSG_PAYLOAD(n, sizeof(struct nfgenmsg))
> -
> --#endif /* ! __KERNEL__ */
> - #endif /* _NFNETLINK_COMPAT_H */
> ---
> -cgit v1.2.3
> -
> diff --git a/package/libnfnetlink/0002-musl.patch b/package/libnfnetlink/0002-musl.patch
> deleted file mode 100644
> index bee7898aae..0000000000
> --- a/package/libnfnetlink/0002-musl.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Include <sys/types.h> to get the u_int* definitions
> -
> -This is needed to fix the build with the musl C library, and this
> -patch comes from
> -http://git.alpinelinux.org/cgit/aports/plain/main/libnfnetlink/musl-fix-includes.patch.
> -
> -It will no longer be needed with upcoming upstream releases of
> -libnfnetlink, since they have switched to use the <stdint.h> types
> -instead. However this change was too invasive to backport.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> ---- libnfnetlink-1.0.1.orig/include/libnfnetlink/linux_nfnetlink.h
> -+++ libnfnetlink-1.0.1/include/libnfnetlink/linux_nfnetlink.h
> -@@ -1,6 +1,6 @@
> - #ifndef _NFNETLINK_H
> - #define _NFNETLINK_H
> --#include <linux/types.h>
> -+#include <sys/types.h>
> - #include <libnfnetlink/linux_nfnetlink_compat.h>
> -
> - enum nfnetlink_groups {
> ---- libnfnetlink-1.0.1.orig/include/libnfnetlink/libnfnetlink.h
> -+++ libnfnetlink-1.0.1/include/libnfnetlink/libnfnetlink.h
> -@@ -15,6 +15,7 @@
> - #define aligned_u64 unsigned long long __attribute__((aligned(8)))
> - #endif
> -
> -+#include <sys/types.h>
> - #include <sys/socket.h>	/* for sa_family_t */
> - #include <linux/netlink.h>
> - #include <libnfnetlink/linux_nfnetlink.h>
> diff --git a/package/libnfnetlink/libnfnetlink.hash b/package/libnfnetlink/libnfnetlink.hash
> index 3392d239b6..63708f8f26 100644
> --- a/package/libnfnetlink/libnfnetlink.hash
> +++ b/package/libnfnetlink/libnfnetlink.hash
> @@ -1,6 +1,5 @@
> -# From ftp://ftp.netfilter.org/pub/libnfnetlink/libnfnetlink-1.0.1.tar.bz2.{md5sum,sha1sum}
> -md5	98927583d2016a9fb1936fed992e2c5e	libnfnetlink-1.0.1.tar.bz2
> -sha1	27ae2dfbd976e28cb7a417f9e946c901f512dd9a	libnfnetlink-1.0.1.tar.bz2
> +# From http://ftp.netfilter.org/pub/libnfnetlink/libnfnetlink-1.0.2.tar.bz2.sha256sum
> +sha256  b064c7c3d426efb4786e60a8e6859b82ee2f2c5e49ffeea640cfe4fe33cbc376  libnfnetlink-1.0.2.tar.bz2
>   
>   # Hash for license file:
> -sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
> +sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
> diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
> index a5ad47b85e..85a717b8d2 100644
> --- a/package/libnfnetlink/libnfnetlink.mk
> +++ b/package/libnfnetlink/libnfnetlink.mk
> @@ -4,10 +4,9 @@
>   #
>   ################################################################################
>   
> -LIBNFNETLINK_VERSION = 1.0.1
> +LIBNFNETLINK_VERSION = 1.0.2
>   LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
>   LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
> -LIBNFNETLINK_AUTORECONF = YES
>   LIBNFNETLINK_INSTALL_STAGING = YES
>   LIBNFNETLINK_LICENSE = GPL-2.0
>   LIBNFNETLINK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
