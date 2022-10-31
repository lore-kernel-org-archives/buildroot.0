Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F401ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA9B408AE;
	Mon, 31 Oct 2022 12:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA9B408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAdDj0VnwQa0; Mon, 31 Oct 2022 12:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FC840247;
	Mon, 31 Oct 2022 12:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FC840247
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B41941BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BB1940247
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB1940247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IiazurwTj5QO for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5220040241
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5220040241
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:55:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 062E6B00539;
 Mon, 31 Oct 2022 13:54:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 13:54:05 +0100
Date: Mon, 31 Oct 2022 13:54:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221031125405.GC1058960@scaer>
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
 <20221031132519.4e5ebc69@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031132519.4e5ebc69@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667220850;
 bh=Iv14n+jUJLiUKiSuBbjbf/h17sGHnUoEObQCUE0NazY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RASlrgQgO50aoebFapFEQr2KjeqU8dFTOMzNRXvTWKYYwbcPYofCj/3Vq06gl61t2
 T1Q1+VXSay4ARQAT6HE+j6PrlUfOIzTkrWndQbFcRIxNm+HeRRmY7Cgc48yp3ByFPH
 ydURYCvFjNMZ9S1gE8U2K8DC6yDxnJk16tI+MJ+uzfdZbF64HZYQKvhJmtl8FJfRnj
 iKOnKd5ewDC7kQNIExL5Zibg72ua61DlBkrjw6sF62kz8gq82HlP3lYPzyEBmdTj9G
 JEbpP73lbMm2MjwBM9qWABMvqz40ghNz0VgW1fnVZZIQE9aIFmOzN8mqN3MD0WoqOH
 71H8A1h6V/gQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RASlrgQg
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, Thomas, All,

On 2022-10-31 13:25 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Wed, 19 Oct 2022 01:46:17 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> > At the moment all APIs folders are copied to target increasing the size of
> > rootfs of ~190MB. Allow to select which API folders we want to copy to
> > target to shrink rootfs down.
> > 
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Practically speaking, could you describe which folders are needed in a
> typical scenario you've had?

Yes, can you provide a rationale for when only a subset of APIs is
needed?

> Here, I have these ones:
> 
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:58 2.0-api
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:58 3.5-api
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 4.0
> drwxr-xr-x   2 thomas thomas 12288 oct.  25 22:58 4.0-api
> drwxr-xr-x   4 thomas thomas 16384 oct.  25 22:58 4.5
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5.1-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5.2-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6.1-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6.2-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7.1-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7.2-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.8-api
> drwxr-xr-x 145 thomas thomas 12288 oct.  25 22:56 gac
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 lldb
> drwxr-xr-x   3 thomas thomas  4096 oct.  25 22:56 mono-configuration-crypto
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 monodoc
> drwxr-xr-x   3 thomas thomas  4096 oct.  25 22:56 msbuild
> drwxr-xr-x   6 thomas thomas  4096 oct.  25 22:56 xbuild
> drwxr-xr-x   4 thomas thomas  4096 oct.  25 22:56 xbuild-frameworks

It looks like we have three sets of directories here;
  - version-based dirs: from 2.0-api up to 4.8-api
  - gac/: big number of subdirs in there...
  - the rest

Your change trat them all on the same level, but are they all really
superfluous? Is there a set that absolutely needs to be there, or can we
really do with just one (or even none, see below)?

Note: can we unconditionally get rid of monodoc/? Of msbuild/? Of lldb/?

> > +config BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL
> > +	bool "Specify folders to install to target"
> > +	help
> > +	  Allow to specify which Mono folder to install to target
> 
> I don't really have a very good suggestion, but I don't like the name
> of the option. We rarely have option names that are "sentences", i.e
> "specify folders to install" is a sentence.
> 
> Should we instead have a single string option
> BR2_PACKAGE_MONO_INSTALL_LIB_DIRS, which is empty by default. When
> empty, it means all folders are installed. Otherwise, only the
> specified folders are installed.

Agreed. I expect that having no API level installed would yield a
non-working system, so:

    config BR2_PACKAGE_MONO_API_VERSIONS
        string "API versions to install"
        help
          Keep empty to install all.

> The other obvious question is whether this shouldn't simply be left as
> something to do in a post-build script. Even though I admit that
> reducing 190 MB down to something reasonable can be seen as something
> that is almost mandatory.
> 
> Or alternatively, do we have a better way, where we could automate this
> selection of which folders are needed?

I would prefer we avoid carrying the list of versionned APIs (and the
rest, see above).

Regards,
Yann E. MORIN.

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
