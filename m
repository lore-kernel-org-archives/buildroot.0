From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 19:20:18 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <CAHXCMMJ9M2m_EU0uweQjoEba1JObQWB43NYM31SXTvMxtWQmKQ@mail.gmail.com>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
 <20131128172357.1417a881@skate>
 <CAHXCMMJ9M2m_EU0uweQjoEba1JObQWB43NYM31SXTvMxtWQmKQ@mail.gmail.com>
Message-ID: <20131128192018.61cf8fdb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 28 Nov 2013 18:53:57 +0100, Samuel Martin wrote:

> Well, right now, most of the packages I put in my BR2_EXTERNAL tree
> are host tools to generate images.
> 
> With the previous version of this serie, the new menu entry was added
> at the top level
> of menuconfig, in which I added 2 submenus: "Target packages" and
> "Host packages".
> It was rather clear that all "company" stuff goes into this menu.
> 
> With the v2, I was a bit lost at first, the "company" menu got moved

I guess you meant "v3" here, because the "v2" included
$(BR2_EXTERNAL)/Config.in in the top-level menu of menuconfig.

> under "Target packages". So, now I have a menu tree like this:
> 
> ---
> Main menu
>   ...
>   Target packages --->
>     ...
>     Company --->
>       Target packages --->
>       Host packages --->
>   ...
>   Host packages --->
> ---
> 
> It does not hurt that much, but it's not really nice IMHO.

Then please talk to the people who asked for enforcing
$(BR2_EXTERNAL)/package/Config.in usage during the Buildroot Developers
Days in Edinburgh. This decision/choice is written very clearly in
http://elinux.org/Buildroot:DeveloperDaysELCE2013#BR2_EXTERNAL :

"""
Regarding the directory hierarchy in the external tree, it was agreed
that it is a good idea to force three subdirectories: package, board,
configs. Buildroot's package/Config.in will source
$BR2_EXTERNAL/package/Config.in.
"""

(It's even in bold in the report).

I believe the most vocal person in favor of this was Arnout, so I've
added him in Cc.

> BTW, to generate this/these Config.in{,host} files in the
> BR2_EXTERNAL tree, I already have a script scanning the tree and
> updating these files, it could be included as a support script as
> well.

Why is this needed? Just write Config.in like we do in the main
Buildroot tree. For example, people may want to have menus and submenus
in their $(BR2_EXTERNAL)/package/Config.in. Therefore, I don't think
providing more and more and more scripts that match a very specific use
case is really going to help our users, probably going to confuse them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
