Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FF3ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 17:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E298640C15;
	Sun, 11 Sep 2022 17:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E298640C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRg0VUCKxVNi; Sun, 11 Sep 2022 17:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B663E40256;
	Sun, 11 Sep 2022 17:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B663E40256
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D784F1BF5D7
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 17:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6ED140256
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 17:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6ED140256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEhWpfNwsuyg for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 17:57:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF3C40183
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FF3C40183
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 17:57:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DB40913F8C6;
 Sun, 11 Sep 2022 19:57:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 19:57:26 +0200
Date: Sun, 11 Sep 2022 19:57:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20220911175726.GH264214@scaer>
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
 <20220905115121.GC1490660@scaer>
 <75e277ba-99aa-78f3-a60d-5e8cf2c1b9a8@gmail.com>
 <20220911121457.GG264214@scaer>
 <36548884-9180-1dfa-cbca-2ab45a037632@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36548884-9180-1dfa-cbca-2ab45a037632@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662919050;
 bh=S3DygbQBvN+fwrCm6ThGEcgAKHwGMpGE4tb86frFWaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ilvAprdz83sNDv1PCP8vcTetnA1lSCunAS/hh8XaQCkJZgrccK0zK+m+JSbzXxYQ2
 S9KB/yNyyKh2LHh+4QolYFE6MkuKeVN8KtKNoNYJrMlcoIxAL7d8l4TExL36o/PwBk
 OYuKxvVYHpY++5qyz1XgY3dVTRwAgKruj62Hk1GL9xYuoz931a3InRSTzVzTpOJv4B
 /kmq1Lq874A2NAxUpaAsFKOvVz44KuRNr5jaUwS6NOjGKMnfJGk3PPaaSSnBQgZsDb
 WjZ0GnpzOYdd2qppyrN5DM5xvHP01wegtFaP9jXweoNXlOfsn+DVOQRerITHZntBeo
 UtUSTKASvHO6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ilvAprdz
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

On 2022-09-11 14:55 +0200, Raphael Pavlidis spake thusly:
> On 11.09.22 14:14, Yann E. MORIN wrote:
[--SNIP--]
> >Of course, the above is just for demonstration and mostly made up, the
> >actual commit content should be adapted. But you get the idea.
> I will try it, thanks. Technically, I need this package to use podman for
> non-root user (newuidmap and newgidmap).

You can also indeed add a (terse) explanation why that package is
useful, indeed, as that explains the purpose and can then lead to a
better understanding of the integration. The sentence above is good, but
should be rephrased to a more neutral form:

    shadow is used by podman to enable support for non-root users (with
    newuidmap and newgidmap).

(again, adapt as appropriate.)

[--SNIP--]
> >So, for shadow, I think at least the 'su' option should also depend on
> >BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, if not the whole package (yet, I'd
> >vote for the whole package for simplicity sake).
> I think I understand it now. It is an option to show option or package,
> which install a non-busybox version of a binary, correct? I will add it to
> the whole package then.

Yes, you got it. :-)

[--SNIP--]
> >Also, if you did not have an actual use-case for an option, then do not
> >expose it at all. When/if someone actually has a need for that option,
> >then they can send a patch to add it.
> But this approach, I think have the disadvantage, that if it happens that
> somebody needs an option then he/she have to wait until is there, which it
> can take sometime. (Happen at least to me)
> I understand it for such options, which are useless for buildroot like if it
> is something Windows specific. IMHO, I do not see any harm to expose those
> options.

But exposing options you did not have a need for, and thus did not
exercise, means they can easily be mis-handled. Case in point: the max
length for group names.

[--SNIP--]
> >We expose options in the menuconfig only when it actually makes sense.
> >What is the purpose of limiting the group name length? Why do we want to
> >allow the user to be able to set that value, rather than let the package
> >decide?
> At least in my case, I need only BR2_PACKAGE_SHADOW_SUBORDINATE_IDS, so it
> would be nice that everything else could be deactivated to keep it small.

If you have a need for the option and you did exercise it, then that's
fine exposing it in the menuconfig.

If you want to "keep it small", then just make it so by disabling
everything, and leave it to people that actually need an option and can
test it, to add support for it.

Yes, it can take some time before a new feature lands in Buildroot.

> I tried to figure out, why this option was set to 32, and it seems that
> Linux only support username up to 32 characters. So, I will remove this
> option and set the value to 32 in the package because buildroot is only
> supporting Linux, as far as I know, correct?
> 
> https://github.com/shadow-maint/shadow/commit/1882c66bda31e50367d41b36fea41cd04fa19c73

Aha! ;-)

I won't say I knew it, but I really suspected something along those
lines. Indeed, we do not need to expose that option. It is a very good
example that exposing an untested option is not correct.

Just do not set that at all; just let the configure script use its
default. It is better to leave that untouched.

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
