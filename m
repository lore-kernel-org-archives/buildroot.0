Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F84EC47DAF
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC8F42244;
	Thu, 18 Jan 2024 16:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AC8F42244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkYCWic-05Ff; Thu, 18 Jan 2024 16:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3184B42260;
	Thu, 18 Jan 2024 16:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3184B42260
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F26F11BF348
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 16:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D40D142260
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 16:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D40D142260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AF7dkefNazZL for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 16:26:08 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85E3942244
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 16:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E3942244
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 17:26:04 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jan 2024 17:26:04 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 17:26:03 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 18 Jan 2024 17:26:03 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.05,203,1701126000"; d="scan'208";a="94049020"
Date: Thu, 18 Jan 2024 17:26:03 +0100
To: <buildroot@buildroot.org>
Message-ID: <ZalRG3A6D8xRnfg9@tl-lnx-nyma7486-2>
References: <e050e870b2afb35643036a87df540add584c95b4.1705594130.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e050e870b2afb35643036a87df540add584c95b4.1705594130.git.yann.morin@orange.com>
X-Originating-IP: [10.115.27.52]
X-ClientProxiedBy: OPE16NORMBX401.corporate.adroot.infra.ftgroup
 (10.115.26.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1705595167; x=1737131167;
 h=date:to:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=FMBVljSXSwhJuMmw785ZqReuP3uKcmt/Z7uAidQ/Iwg=;
 b=btKkP7dmdKN479aZSIbhxxNzRUG+EsC5RFmLnwnUvNG6m6d0ilbl4F9k
 89/a6wwn7aTTZ0J8h4QDoM65MOr5kRTyx3XkIO4a0tVEOn3/fBkM8fO/6
 po2J7ldIoxStWUTuh6d91r8rArm4B0npFPt8JbrdikUx7b9TXxgxZ9Ip+
 Gy9I36uozumMl8omGPM3FZi9MTduQCYdZRHLUa2TiWDXREKecNjA0OWVJ
 cyMc/XsKlLWMQJHx45gq7XKOUpcqPZ6aORJ2DmFp8TsdfK+XV2mkcY3nF
 8ZMSOcxpV7vfNSdcOh8OvarMps5Uv4OhBpULaWmgnhJ6hCWICeNTV9GW6
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=btKkP7dm
Subject: Re: [Buildroot] [PATCH] docs/manual: extend makedev syntax section
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-01-18 17:08 +0100, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The section of the manual describing the makedev syntax is not
> up-to-date with the current features, and does not properly describe
> existing ones.
> 
>   - extend the list of types with the requirements on the existence of
>     the target file or directory; for 'c', 'b', and 'p', the existence
>     requirement is inherited from mknod(2):
> 
>     ERRORS
>         ...
>         ENOENT A directory component in pathname does not exist or is a
>                dangling symbolic link.
> 
>     for the other types, the existence requirements are extracted from
>     the source of makedev.c;
> 
>   - format the types fags, so they are rendered in monospace;

Woops... *flags

Regards,
Yann E. MORIN.

>   - extend the 'mode' description, as it can be set to -1 for 'f', 'd',
>     or 'r', so that only the uid and gid are set. This is most useful
>     for 'r', where setting the same mode recursively for all the
>     sub-directories and files alike does not really make sense; indeed
>     in this case, the modes are usually set correctly when the package
>     (or rootfs overlay) installs the files, and only the uid and gid are
>     interesting to set;
> 
>   - extend and update the examples to show-case the -1 mode use-case.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  docs/manual/makedev-syntax.adoc | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/docs/manual/makedev-syntax.adoc b/docs/manual/makedev-syntax.adoc
> index d6efb31d42..e63c9233eb 100644
> --- a/docs/manual/makedev-syntax.adoc
> +++ b/docs/manual/makedev-syntax.adoc
> @@ -22,14 +22,19 @@ There are a few non-trivial blocks:
>  
>  - +name+ is the path to the file you want to create/modify
>  - +type+ is the type of the file, being one of:
> -  * f: a regular file
> -  * d: a directory
> -  * r: a directory recursively
> -  * c: a character device file
> -  * b: a block device file
> -  * p: a named pipe
> +  * `f`: a regular file, which must already exist
> +  * `F`: a regular file, which is ignored and not created if missing
> +  * `d`: a directory, which is created, as well as its parents, if missing
> +  * `r`: a directory recursively, which must already exist
> +  * `c`: a character device file, which parent directory must exist
> +  * `b`: a block device file, which parent directory must exist
> +  * `p`: a named pipe, which parent directory must exist
>  - +mode+ are the usual permissions settings (only numerical values
> -  are allowed)
> +  are allowed);
> +  for type `d`, the mode of existing parents is not changed, but the mode
> +  of created parents is set;
> +  for types `f`, `F`, and `r`, +mode+ can also be set to +-1+ to not
> +  change the mode (and only change uid and gid)
>  - +uid+ and +gid+ are the UID and GID to set on this file; can be
>    either numerical values or actual names
>  - +major+ and +minor+ are here for device files, set to +-+ for other
> @@ -38,22 +43,22 @@ There are a few non-trivial blocks:
>    of files, and can be reduced to a loop, beginning at +start+,
>    incrementing its counter by +inc+ until it reaches +count+
>  
> -Let's say you want to change the permissions of a given file; using
> -this syntax, you will need to write:
> +Let's say you want to change the ownership and permissions of a given
> +file; using this syntax, you will need to write:
>  
>  ----
>  /usr/bin/foo f 755 0 0 - - - - -
>  /usr/bin/bar f 755 root root - - - - -
>  /data/buz f 644 buz-user buz-group - - - - -
> +/data/baz f -1 baz-user baz-group - - - - -
>  ----
>  
> -Alternatively, if you want to change owner/permission of a directory
> -recursively, you can write (to set UID to foo, GID to bar and access
> -rights to rwxr-x--- for the directory /usr/share/myapp and all files
> -and directories below it):
> +Alternatively, if you want to change owner of a directory recursively,
> +you can write (to set UID to `foo` and GID to `bar` for the directory
> +`/usr/share/myapp` and all files and directories below it):
>  
>  ----
> -/usr/share/myapp r 750 foo bar - - - - -
> +/usr/share/myapp r -1 foo bar - - - - -
>  ----
>  
>  On the other hand, if you want to create the device file +/dev/hda+
> -- 
> 2.34.1
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
