Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5040C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 06:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F64D40A90;
	Tue, 25 Jan 2022 06:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIlBwie5roUh; Tue, 25 Jan 2022 06:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4720640A8D;
	Tue, 25 Jan 2022 06:04:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD1F41BF307
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 06:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C329D84C6B
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 06:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ushkysA5GDWP for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 06:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 494A384BCE
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 06:03:56 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 32D2F440537;
 Tue, 25 Jan 2022 08:03:40 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1643090620;
 bh=/6wz8leU8l5BZAQ1T0n/wQONyuKx8oqgnhZCdlZGH0o=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=v7T7X6UhmskucVWDVmZ+9IgDsM+GHKUYSinp9QiLlhOVaCV+4R+kheQLbVW+ZxH7D
 JkK4B0JKD1CYYR9/g2zvIk7tM/b7b048cdFrT6Tk40tUQS9ktVAtJoiAVY1D5NunDA
 ROztOj9ZHz16L6Jj6ERl/Pe8QMGfT4VOy086J6TSqoSX5tG3TYGjAAXIIJOaFtctmq
 MqIbhuXr2R2JXE1hsCzM6Mwowq6LNlt8DMR2NYmZh2zQFek5OjRmCue2zgqmgwm1eb
 S7SR2bZknVwQWoP/HMXGhrZIIrdNxaRa5Y5WZNl9pJRd6MkX9wq1vGpdeyBVDwm81N
 r7Bci4OWmAGlQ==
References: <20220124213420.1171861-1-angelo@amarulasolutions.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 25 Jan 2022 08:01:55 +0200
In-reply-to: <20220124213420.1171861-1-angelo@amarulasolutions.com>
Message-ID: <877dao9ws8.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/htpdate: bump to version 1.3.3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Angelo,

On Mon, Jan 24 2022, Angelo Compagnucci wrote:
> Bump and update project to its new location.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> * Rebased on master
> * Keeping buildroot package init scripts
>
>  package/htpdate/S43htpdate      | 2 +-
>  package/htpdate/htpdate.hash    | 2 +-
>  package/htpdate/htpdate.mk      | 6 +++---
>  package/htpdate/htpdate.service | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
> index 75f9a995ff..5971d70639 100644
> --- a/package/htpdate/S43htpdate
> +++ b/package/htpdate/S43htpdate
> @@ -9,7 +9,7 @@ test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
>  start() {
>  	printf 'Starting %s: ' "$DAEMON"
>  	# shellcheck disable=SC2086 # we need the word splitting
> -	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
> +	start-stop-daemon -S -q -x "/usr/sbin/$DAEMON" \
>  		-- -D -i "$PIDFILE" $HTPDATE_ARGS
>  	status=$?
>  	if [ "$status" -eq 0 ]; then
> diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
> index 824266c1bc..ef27f8f94c 100644
> --- a/package/htpdate/htpdate.hash
> +++ b/package/htpdate/htpdate.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated:
> -sha256 d2cff522b8f53b00769dcca77d8025b19238ed35d702a4739dc05e387f718909  htpdate-1.2.6.tar.gz
> +sha256 74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7  htpdate-1.3.3.tar.gz
>  sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
> diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
> index 52022346a9..200c3207a2 100644
> --- a/package/htpdate/htpdate.mk
> +++ b/package/htpdate/htpdate.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>  
> -HTPDATE_VERSION = 1.2.6
> -HTPDATE_SITE = $(call github,angeloc,htpdate,v$(HTPDATE_VERSION))
> +HTPDATE_VERSION = 1.3.3
> +HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))

You should update the Config.in link as well.

baruch

>  HTPDATE_LICENSE = GPL-2.0+
>  HTPDATE_LICENSE_FILES = LICENSE
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -HTPDATE_BUILD_OPTS = ENABLE_HTTPS=1
> +HTPDATE_BUILD_OPTS = https
>  HTPDATE_DEPENDENCIES += openssl host-pkgconf
>  endif
>  
> diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
> index b7f1371b08..95220581d4 100644
> --- a/package/htpdate/htpdate.service
> +++ b/package/htpdate/htpdate.service
> @@ -7,7 +7,7 @@ Type=forking
>  PIDFile=/run/htpdate.pid
>  Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
>  EnvironmentFile=-/etc/default/htpdate
> -ExecStart=/usr/bin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
> +ExecStart=/usr/sbin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
>  
>  [Install]
>  WantedBy=multi-user.target


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
