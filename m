From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Sep 2014 22:34:51 +0200
Subject: [Buildroot] [PATCH v6] bcache-tools: Adding package.
In-Reply-To: <540CBFA7.3070603@tribudubois.net>
References: <1407514262-18602-1-git-send-email-jcd@tribudubois.net>
 <20140906104208.GA3957@free.fr> <540C076B.30901@tribudubois.net>
 <20140907091406.GA4230@free.fr> <20140907091826.GA31418@free.fr>
 <540CBFA7.3070603@tribudubois.net>
Message-ID: <20140907203451.GI31418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On 2014-09-07 22:27 +0200, Jean-Christophe DUBOIS spake thusly:
> Le 09/07/2014 11:18 AM, Yann E. MORIN a ?crit :
> >On 2014-09-07 11:14 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> >>In this case, just add:
> >>
> >>     # bcache-tools forgets to create the required directory... :-/
> >>     define BCACHE_TOOLS_UDEV_DIR
> >>         mkdir -p $(TARGET_DIR)/lib/udev/
> >>     endef
> >>     BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_UDEV_DIR
> >>
> >>And you're done. ;-)
> >Of course, since cafeine hasn't yet fully kicked-in in my body, this
> >can/should be squashed in the existing PRE_INSTALL hook which creates
> >the man8 directory.
> 
> OK, I'll do it this way.

OK, thanks!

> Now just for my information, why is it better to force the creation of a
> missing directory rather
> than force as a dependency the build of the package bringing this directory?

Well, the udev package is not required to build bcache-tools. It;s just
bcache-tools' Makefile that is deficient, and forgets to create the
directory to start with.

Also, it is often the case that a decvelopper needs to build just one
package to test a build failure or a version bump. The more dependencies
there are to a package, the longer the build will be, the more
frustrating it becomes to the developper, since udev is not really a
build dependency.

And, since you anyway already have a hook to create one directory, why
not use it to create the other one?

Thanks for your efforts with this patch! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
