From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Dec 2012 23:10:25 +0100
Subject: [Buildroot] [PATCH 03/51] package/dtc: add option to install
	programs
In-Reply-To: <50BE6AF7.8090101@mind.be>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <201211301738.37463.yann.morin.1998@free.fr> <50BE6AF7.8090101@mind.be>
Message-ID: <201212042310.25968.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 04 December 2012 Arnout Vandecappelle wrote:
> On 30/11/12 17:38, Yann E. MORIN wrote:
> > On Thursday 29 November 2012 Arnout Vandecappelle wrote:
> >>    I would also call it _TARGET instead of _RULE.
> > Why?
>   Because it's not a rule.  A rule is a line with a colon in the Makefile
> that is followed by a command.

Right.

>   But actually target is also not correct - the GNU make manual calls it
> a 'goal'. (Never mind that goal and target are synonyms :-) That's why
> the variable is called MAKECMDGOALS.

Right again.

[--SNIP--]
>   Given that in buildroot the make goals are called targets all the time,
> calling it _GOAL here would solve the duplication but reduces consistency.
> Unless we change all the current uses of 'target' to 'goal' (which would
> resolve some confusion with the target directory, so that would be a good
> thing...).
> 
>   I realize that this is nitpicking, but if we choose a name now we'll
> probably be stuck with it for years, so we need to have this discussion
> at some point.

OK, so let's first list what variables we need. I can think of at least
these (prefix by "$(PKG)_", of coure):

Variable            |  Default  | Notes
--------------------+-----------+----------------------------------
MAKE_CONFIG_GOAL    | (empty)   | Not used if empty (or not set?)
MAKE_BUILD_GOAL     | (empty)   | Will call the default target of the Makefile
MAKE_INSTALL_GOAL   | install   |
MAKE_UNINSTALL_GOAL | uninstall |
MAKE_CLEAN_GOAL     | clean     |

I think the names are explicit enough, save for the first one. Some packages
may require a step before the acutal build: for the Linux kernel, we need
to make oldconfig first.

Now, let's settle for a naming convention. See my proposal above.
Anyone wants to suggest another naming scheme?

Note however that I really want to get rid of this qemu series of mine
(ie. have it applied upstream asap). ;-) I'll rework the series to move
this to the end, so we can have more time to think about the naming
scheme.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
