From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Feb 2013 23:49:42 +0100
Subject: [Buildroot] [RFC] Removing CLEAN_CMDS and
	UNINSTALL_(STAGING|TARGET)_CMDS
In-Reply-To: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201302082349.42455.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 08 February 2013 Thomas Petazzoni wrote:
> This is an RFC patch set to discuss whether or not we should keep the
> <pkg>_CLEAN_CMDS, <pkg>_UNINSTALL_TARGET_CMDS and
> <pkg>_UNINSTALL_STAGING_CMDS. It is a topic that has been discussed at
> various times in the past months/years.
> 
> A lot of packages don't implement them, we generally don't ask for
> them to be implemented when reviewing packages, and the uninstall
> commands are generally never updated when a package version is bumped,
> which means that they are probably bitrotting pretty quickly. We also
> have no automated way of testing these commands.
> 
> That said, it is true that the <pkg>-clean target might be useful for
> some use cases.

What about your pending out-of-tree package build? I see it as a very
easy way to clean a package: remove the build-dir altogether. Thus, we
still have the ability to '-clean' a package, whithout a requirement
on the package to provide any _CMDS for it.

> However, is <pkg>-uninstall really useful, considering
> that it doesn't take into account the removal of the reverse
> dependencies?

Not easily doable, so probably error-prone on the user side. However,
how many issues have been reported on this? I guess the volume was has
been pretty low, so either users do not use it, or are not aware of it,
or expect it to break and manually ensure coherency.

For the two first categories, they won't miss it if/when we remove it.
For the latter category, I doubt they are many, so will probably not
whine too much if/when we remove it.

My stance on the subject is:
  - pkg-clean can be achieved in a better, safer, more systematic way
    with your out-of-tree package build, so we can/should remove any
    _CLEAN_CMDS;
  - pkg-uninstall is inherently broken, and there is no easy, sustainable
    way to implement it, so we can/should remove it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
