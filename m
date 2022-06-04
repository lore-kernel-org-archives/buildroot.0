Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BBEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 17:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC26660ED2;
	Sat,  4 Jun 2022 17:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAKRK7Mn1MJ5; Sat,  4 Jun 2022 17:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A716079D;
	Sat,  4 Jun 2022 17:05:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 681ED1BF364
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 17:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64A64419C7
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 17:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iLziQSK15n5 for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 17:05:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23F3F4099E
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 17:05:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 664CF5FF67;
 Sat,  4 Jun 2022 19:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654362347;
 bh=vpa0sUQiiThbIHmnVS+Sltc7UNUuHuwRkIq31vx/edY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ktD2fQ53YTikKdyceg1zqRXYEmWcEQYWUMLqa9QvOc2TSbDUunpxjAPaHKM7+CQkO
 UZt5W46L4mfJmghwv63MltdAdwItlBBrMKTgGOFNyptaZmgooqKy9tOyrLVidnlvBo
 PAaL0gyebFY8oSo6BfLi21sP8I52FyGRMIcBPlGSVIKmeIjuRExrUtB7mQbbck9TZa
 8IY7lh5dDKthGf8LV9SJqJCdX6JgqXt1M0QESyGNGRWLfW6UufEaHeaL91ZKk5Rc6l
 b6wj1gIaU1++H2EyuhTJaoS7rjNWaUmznb8ngVWvzrhHpd5P0XBrf9OapSfQwZbmkv
 7KwxGFfgkrdog==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 19:05:45 +0200
Date: Sat, 4 Jun 2022 19:05:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220604170545.GQ427639@scaer>
References: <20220519164200.918286-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519164200.918286-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/iucode-tool: fix build with
 argp-standalone and NLS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-19 18:42 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with argp-standalone and NLS raised
> since commit 5430c8fedd0392e79e0c011825b056fea129980a:
> 
> configure:6091: /home/autobuild/autobuild/instance-3/output-1/host/bin/x86_64-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp   >&5
> /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libargp.a(argp-parse.o): in function `argp_version_parser':
> /home/autobuild/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'
> 
> [...]
> 
> checking for library containing argp_parse... no
> configure: error: An implementation of GNU Argp was not found, please install libargp
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3d2d9e27aabcd6763510238087fe25d5273d3535
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/iucode-tool/iucode-tool.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
> index 596ad268b7..b123973a90 100644
> --- a/package/iucode-tool/iucode-tool.mk
> +++ b/package/iucode-tool/iucode-tool.mk
> @@ -7,11 +7,15 @@
>  IUCODE_TOOL_VERSION = 2.3.1
>  IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
>  IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
> -IUCODE_TOOL_DEPENDENCIES = $(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
>  IUCODE_TOOL_LICENSE = GPL-2.0+
>  IUCODE_TOOL_LICENSE_FILES = COPYING
>  IUCODE_TOOL_CPE_ID_VENDOR = iucode-tool_project
>  
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +IUCODE_TOOL_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
> +IUCODE_TOOL_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
> +endif
> +
>  define IUCODE_TOOL_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/iucode-tool/S00iucode-tool \
>  		$(TARGET_DIR)/etc/init.d/S00iucode-tool
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
