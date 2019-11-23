From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Nov 2019 13:40:40 +0100
Subject: [Buildroot] [git commit branch/next] glibc: install glibc utils
 to target
In-Reply-To: <CAJ4jsaf_Oi35Md=sKwP1u+OWf=a8J2wSeMJxA=NJejtsMONo5w@mail.gmail.com>
References: <20191123104533.B93648F470@busybox.osuosl.org>
 <CAJ4jsaf_Oi35Md=sKwP1u+OWf=a8J2wSeMJxA=NJejtsMONo5w@mail.gmail.com>
Message-ID: <20191123124040.GU32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-11-23 08:17 -0300, Carlos Santos spake thusly:
> On Sat, Nov 23, 2019 at 7:53 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > commit: https://git.buildroot.net/buildroot/commit/?id=c6cd512fe2e954b2ccc0412717c1c3380bc5f69b
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
> >
> > With this patch we introduce an option for glibc, which
> > installs getconf, ldconfig and ldd utilities on target, that
[--SNIP--]
> > +       $(foreach util,$(GLIBC_TARGET_UTILS_BIN), \
> > +               $(INSTALL) -D -m 0755 $(@D)/build/$(util) $(TARGET_DIR)/bin/$(notdir $(util))
> 
> The usual path of these utilities on non-merged-usr systems (e.g. RHEL-6) is:
> 
>      [root at rhel-6-1 ~]# which getconf ldconfig ldd
>     /usr/bin/getconf
>     /sbin/ldconfig
>     /usr/bin/ldd

I also considered this before applying, and the locations on Ubuntu
(Debian) are the same as you report on RHEL.

But in the end, I considered it was a minor issue, for a few reasons:

 1. it not very important where a program lies, as long as it can be
    found in the PATH

 2. we mostly only care when there are two or more packages providing
    those programs, and we want them all to install those in the same
    location (so that we don't have two, say, ls in the PATH). But when
    there is a single package that install programs, it is not so
    important where it is installed (see 1.)

 3. the code snippet was suggested by Thomas in v1 of the patchset, so
    that is authoritative too ;-)

So I applied.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
