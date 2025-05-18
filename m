Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B59AC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C663781EAE;
	Sun, 18 May 2025 14:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6ScPhAvmy-N; Sun, 18 May 2025 14:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0916C81EB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0916C81EB3;
	Sun, 18 May 2025 14:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51BEC1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E4E740913
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VbaYvNi5utc for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B23F408F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B23F408F3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B23F408F3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 815291C0FF6; Sun, 18 May 2025 16:40:21 +0200 (CEST)
Message-ID: <165173c3-6498-4c10-9c03-0b240606c367@rnout.be>
Date: Sun, 18 May 2025 16:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: thomas.perale@mind.be
References: <20250515102716.2989377-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515102716.2989377-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579221; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ogsZluYuRXQcy1x9JlZkqOh2MOZS4A8844wyCR7DnI8=;
 b=EZOCv+hSPI0YpAWgj1YLg/Il2oC+3z7/cAOASpRO88Njexf+m1ZpGhSj+fOo7fUQuL+FXu
 Xvkj1rIadhrbI4LItC5RAW3rkCuSfXCBc8OAuqZfSZTq6Zb5wgxZSNgoIdoGSPcg5zVRDb
 74hXnMKixAzKsdxZ4xXgCfKGWH7ufIfi5egd9RlYt3gEb0SdzuG0aXSmFJYAKvzwpY3Nqr
 MM33m4SPWXCxXB0lB4jHpLk82oeo8ijgepJzEoYsRQCU2BtU27H5qXdQisFddLO4es+w2X
 x/PzeTJE+FSFfWA48BH9lh9rqKe0qnMOlgH3C2n9WLPxMxXdRoA3bhH7hiuESw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=EZOCv+hS
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/openssh: apply
 security patch for CVE-2025-32728 (sshd)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/05/2025 12:27, Titouan Christophe via buildroot wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> There is already a pending patch to bump OpenSSH to 10.0 on Buildroot master,
> but this probably won't happen in Buildroot LTS; hence this patch
> ---
>   ...ic-error-in-disableforwarding-option.patch | 49 +++++++++++++++++++
>   package/openssh/openssh.mk                    |  3 ++
>   2 files changed, 52 insertions(+)
>   create mode 100644 package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
> 
> diff --git a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
> new file mode 100644
> index 0000000000..2c64ec1910
> --- /dev/null
> +++ b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
> @@ -0,0 +1,49 @@
> +From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Wed, 9 Apr 2025 07:00:03 +0000
> +Subject: [PATCH] upstream: Fix logic error in DisableForwarding option.
> +
> +This option was documented as disabling X11 and agent forwarding but it failed to do so.
> +Spotted by Tim Rice.
> +
> +OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
> +
> +Upstream: https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367
> +
> +Fixes the following CVE:
> +  - CVE-2025-32728: In sshd in OpenSSH before 10.0, the DisableForwarding
> +                    directive does not adhere to the documentation stating
> +                    that it disables X11 and agent forwarding.
> +
> +[Titouan:
> + - Remove diff on OpenBSD comment at the top of the file that does not apply
> +   cleanly on openssh 9.9
> +]
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + session.c | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/session.c b/session.c
> +index 52a4a3446e6..6444c77f31c 100644
> +--- a/session.c
> ++++ b/session.c
> +@@ -2171,7 +2171,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
> + 	if ((r = sshpkt_get_end(ssh)) != 0)
> + 		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
> + 	if (!auth_opts->permit_agent_forwarding_flag ||
> +-	    !options.allow_agent_forwarding) {
> ++	    !options.allow_agent_forwarding ||
> ++	    options.disable_forwarding) {
> + 		debug_f("agent forwarding disabled");
> + 		return 0;
> + 	}
> +@@ -2566,7 +2567,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
> + 		ssh_packet_send_debug(ssh, "X11 forwarding disabled by key options.");
> + 		return 0;
> + 	}
> +-	if (!options.x11_forwarding) {
> ++	if (!options.x11_forwarding || options.disable_forwarding) {
> + 		debug("X11 forwarding disabled in server configuration file.");
> + 		return 0;
> + 	}
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 115290ce13..b5e4645b50 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -13,6 +13,9 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
>   OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
>   OPENSSH_LICENSE_FILES = LICENCE
>   
> +# 0001-fix-logic-error-in-disableforwarding-option.patch
> +OPENSSH_IGNORE_CVES += CVE-2025-32728
> +
>   OPENSSH_CONF_ENV = \
>   	LD="$(TARGET_CC)" \
>   	LDFLAGS="$(TARGET_CFLAGS)" \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
