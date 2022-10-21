Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CE7C38A2D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 19:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 083E041938;
	Fri, 21 Oct 2022 19:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 083E041938
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OcWwuF7OWa2k; Fri, 21 Oct 2022 19:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7917640993;
	Fri, 21 Oct 2022 19:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7917640993
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC8EC1BF846
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B85B460A81
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B85B460A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1_mvwISpKYp for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 19:08:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB547605A3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB547605A3
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 19:08:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e722:2033:afe6:a970])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D9FA85FFA8;
 Fri, 21 Oct 2022 21:08:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Oct 2022 21:08:41 +0200
Date: Fri, 21 Oct 2022 21:08:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yann.morin@orange.com
Message-ID: <20221021190841.GD2992523@scaer>
References: <9796_1665746309_63494585_9796_388_2_2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
 <1138_1665746311_63494587_1138_437_1_82ab2cc49c43374ceb22a1fdd6bc5e4c72d29df2.1665746266.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1138_1665746311_63494587_1138_437_1_82ab2cc49c43374ceb22a1fdd6bc5e4c72d29df2.1665746266.git.yann.morin@orange.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666379324;
 bh=iE56oogG3DGrCWD50QHvmZuPC/DDaHBWM8NMW/Qty/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HPebGaxfWn1r11GgfKiE+IZ+r0dW/1iH3eLSXP/VNzvTfvuPN0Np9tduBNEew7BiI
 jKVcCHD8UgU2WH1TMKj3f10nEtDmd6AZwHY81ZJXd8WWsgW0C1iNGhZlMvgp5bU7Us
 6V5Mfky3ykpuuiza1ALF2bP4XlYpOGBv4yfguWRy+q+hD/h93AtnIIOTqqPi486T3F
 Eudx+tyl+6lGWbiLKNq5UYzYjXe1SHtPjV1xxUOqFNIFGFi05XeCgkDm9W9da9s+6V
 Wp8Au0N4XJ9p2tdm9GLieCr1zzZKptdLnrG/bsdMLGdYx1hKVwAzjnQ+Pm3R7MYS8Z
 vXfRtnL5JnEyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HPebGaxf
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts: don't require gawk to
 generate glibc gconv modules
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

Yann, All,

On 2022-10-14 13:18 +0200, yann.morin@orange.com spake thusly:
> When a subset of the glibc gconv modules installed, we eed to generate a

*are installed, we need

> trimmed-down list of available modules. We currently use gawk for that.
> 
> However, we are not using any GNU extension in that awk script, and it
> happens to work as expected when using mawk (which has no GNU
> extension).
> 
> Commit 11c1076db9a5 (toolchain: add option to copy the gconv libraries)
> did not explain why it used gawk explicitly, and given the age for that
> commit, we doubt we'd be able to have the involved participants recall
> anything from that period...
> 
> Besides, gawk is not a requirement for Buildroot.
> 
> Switch over to using plain awk.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master with the typoes fixed, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/expunge-gconv-modules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/expunge-gconv-modules b/support/scripts/expunge-gconv-modules
> index 03012c1ce3..bc60fc0ce4 100755
> --- a/support/scripts/expunge-gconv-modules
> +++ b/support/scripts/expunge-gconv-modules
> @@ -19,7 +19,7 @@
>  # we handle each with slightly different code, since the second never has
>  # associated aliases.
>  
> -gawk -v files="${1}" '
> +awk -v files="${2}" '
>  $1 == "alias" {
>      aliases[$3] = aliases[$3] " " $2;
>  }
> -- 
> 2.25.1
> 
> 
> _________________________________________________________________________________________________________________________
> 
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
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
