Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2FCECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 12:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02A782E14;
	Sun, 11 Sep 2022 12:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F02A782E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ly0_URrrsXT; Sun, 11 Sep 2022 12:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1DF182D2F;
	Sun, 11 Sep 2022 12:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1DF182D2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 372071BF373
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 12:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 110B9416BE
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 12:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 110B9416BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96utB33VxDh2 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 12:15:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC5C416BA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CC5C416BA
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 12:15:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:981a:f392:e207:b56b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E0FB919F59D;
 Sun, 11 Sep 2022 14:14:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 14:14:57 +0200
Date: Sun, 11 Sep 2022 14:14:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20220911121457.GG264214@scaer>
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
 <20220905115121.GC1490660@scaer>
 <75e277ba-99aa-78f3-a60d-5e8cf2c1b9a8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75e277ba-99aa-78f3-a60d-5e8cf2c1b9a8@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662898501;
 bh=Fm2FYl092Py/qPeJQTzQdnUQK8g9uwUkgKQf0Op3BXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ErrokJwErdQHH4637qa+ihlZ9Th6gCHZHjYONOLra/AbmyhPfoeqHJ1Uz0y+VZVR1
 DrDSKcWknj8hRFbSoEUOnXzBzgby99bb6Kmdgmga/EvyZex6JvhtyJ8fL7WlCoe32c
 53V8SZ0UJiZWhK2F4lU/yJfIeSLdYMTPKX7hdWaXVB0keudWEbV3zctV+VFmT8JkIV
 ucjcI/fVrjLowfDGels2fvqtNLCeoN2DZadeZMnM3Ani1myl7ss2BRQridXfMwAOq+
 XQa3s8XMURQCANMBmSgquNeVDY+XYXEew6qmkw+vO3dgx8LTRlK7D9Swvh1GTLzQq/
 C2oBDu0iTtNpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ErrokJwE
Subject: Re: [Buildroot] [PATCH v2 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael, All,

On 2022-09-11 13:22 +0200, Raphael Pavlidis spake thusly:
> On 05.09.22 13:51, Yann E. MORIN wrote:
> >On 2022-09-04 14:43 +0200, Raphael Pavlidis spake thusly:
> >>shadow provides utilities to deal with user accounts.
> >You will probably have more explanations to provide in the commit log,
> >to explain how the pacakge is integrated in Buildroot. See the qustions
> >below...
> How about using the description of the GitHub repository? Or is this too
> long? Also, using it as a description in the Config.in?
> 
> "The shadow package includes the necessary programs for converting UNIX
> password files to the shadow password format, plus programs for managing
> user and group accounts. The [snip]"

Starting the commit log with a terse explanations of the package purpose
is interesting, but what really matters are the details of the
integration in Buildroot.

For example:

    package/shawdow: new package

    shadow provides utilities to deal with user accounts.

    We decided to expose all the options present in configure, as
    options in Config.in, because those are sensitive, security-related
    options, and we want the user to take responsibility on the
    settings. The defaults are as they are exposed by the configure
    script; we especially default the max group name mength to 32,
    because accepting too long group names is a path to DoS attacks.

    Signed-off-by: Your REALNAM <your-email>

Of course, the above is just for demonstration and mostly made up, the
actual commit content should be adapted. But you get the idea.

> [--SNIP--]>
> >As Arnout noted, shadow, or ony some of its utilities, may come
> >conflicting with busybox' provided applets.
> >
> >So, we also need a dependency in Config.in:
> >
> >     depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> >
> >Note: *if* only sub-options of shadow do conflict, then the dependency
> >should be moved dow to those sub-options.
> 
> Can you explain, what exactly this option BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> does? I did not understand it, I apologize for the inconvenience.

Right, this is not trivial. Busybox installs a set of programs, for
example /bin/ash or /bin/wc, which are also provided by the bigger ones,
resp. dash and coreutils.

So, we by default do not want to show dash and coreutils in the
menuconfig, as the programs they install are already installed by
busybox, and even though the busybox variants may be slightly less
capable that the bigger ones, they are far smaller and, more often than
not, are sufficient.

Howerver, in some cases, most busybox applets are enough for the system,
except a very sall subset, for which we want to be able to use the
bigger ones.

That's when BR2_PACKAGE_BUSYBOX_SHOW_OTHERS comes into play: the user
can enable that option in the menuconfig, and so packages that install
the same set of programs as busybox applets, are now visible in the
menuconfig too.

See for example package/dash/Config.in:

    1 config BR2_PACKAGE_DASH
    2     bool "dash"
    3     depends on BR2_USE_MMU # fork()
    4     depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

So, for shadow, I think at least the 'su' option should also depend on
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, if not the whole package (yet, I'd
vote for the whole package for simplicity sake).

> [--SNIP--]
> >We usually have no option that defaults to 'y', and when we do, there
> >is a reason for that, so please explain that in the commit log. This
> >comment is also valid for all the symbols below that default to y.
> All default values and description of the option were taken from the
> configure.ac file of the repository. The intention behind was, that the
> developers know best which option should be activated on default.

I see the reasoning.

I'm still not entirely sure, and stating "shadow developpers know best"
is still not very correct, because the one who knows best _in their
specific case_ is the user.

Also, if you did not have an actual use-case for an option, then do not
expose it at all. When/if someone actually has a need for that option,
then they can send a patch to add it.

[--SNIP--]
> >>+config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
> >>+	bool "subordinate-ids"
> >>+	default y
> >>+	help
> >>+	  Support subordinate ids.
> >An help entry that just repeats the prompt is totally useless. If there
> >is nothing better than to repeat the prompt, then don't provide a help
> >entry. Otherwise, provide actual help.
> The help entry was taken also from the configure.ac file. I will remove it.
> ;)

Yeah, I get it:
    --enable-foo    Enable foo.

That still does not help at all. Help text should be able to actually
help, and so must provide more info than the prompt does.

[--SNIP--]
> >>+config BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH
> >>+	int "group-name-max-length"
> >>+	default 16
> >
> >Does it really make sense to have this be configurable?
> >If so, why is 16 the default, rather than unlimited?
> >
> 
> Oh, my mistake. The default value in the configure.ac is 32. Is it okay to
> change it to 32 then?

You still have to explain why providing a non-zero (thus unlimited)
default is better. Relying on "shadow developpers default that to 32,
so let's do the same" does not help much (but is still better than
not explaining it).

> I also think it should be configurable. The developers provide this option,
> so we should also provide this option to the users of buildroot.

The packaging in Buildroot mostly only (globally) expose just a very
small subset of all options exposed by the configure (or similar)
scripts.

We expose options in the menuconfig only when it actually makes sense.
What is the purpose of limiting the group name length? Why do we want to
allow the user to be able to set that value, rather than let the package
decide?

> >And if we keep it, then the prompt should not have dashes, but be a
> >sentence (i.e. it is not the name of program installed by shwadow):
> >     bool "max length of group names"
> I will change the name.

Note: it is not the _name_, it is the _prompt_ (i.e. what is shown to
the user).

[--SNIP--]
> >>+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> >>+SHADOW_CONF_OPTS += --with-libpam
> >>+SHADOW_DEPENDENCIES += linux-pam
> >>+else
> >>+SHADOW_CONF_OPTS += --without-libpam
> >>+endif
> >Is the dependency on linux-pam only needed for account-tools-setuid, or
> >can shadow also use linux-pam for something else?
> As far as I understood it, shadow also use linux-pam generally, but is
> required if account-tools-setuid is set.

OK, so this indeed gets a little bit more tricky.

The Config.in entry for account-tools-setuid should indeed use select
(as seen above; plus help text as an example):

    config BR2_PACAKGE_SHADOW_ACCOUNT_TOOLS_SETUID
        bool "account-tool setuid"
        select BR2_PACKAGE_LINUX_PAM
        help
          chmod the account-tool utility setuid, so that non-root
          users can use it, subjet to their PAM profile.

and then the .mk should propbably look like:

    ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
    SHADOW_DEPENDENCIES += linux-pam
    SHADOW_CONF_OPTS += --enable-pam
    else
    SHADOW_CONF_OPTS += --disable-pam
    endif

    ifeq ($(BR2_PACAKGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
    # PAM dependency handled above
    SHADOW_CONF_OPTS += --enable-account-tools-setuid-I-can-t-remember-the-option-name
    else
    SHADOW_CONF_OPTS += --disable-account-tools-setuid-I-can-t-remember-the-option-name
    endif

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
