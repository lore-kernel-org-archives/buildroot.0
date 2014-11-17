From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 22:48:21 +0100
Subject: [Buildroot] [PATCH v3 1/5] Makefile: don't depend on the umask
In-Reply-To: <546A6BA0.2000500@mind.be>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-2-git-send-email-guido@vanguardiasur.com.ar>
 <20141117213645.GE12473@free.fr> <546A6BA0.2000500@mind.be>
Message-ID: <20141117214821.GI12473@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-11-17 22:41 +0100, Arnout Vandecappelle spake thusly:
> On 17/11/14 22:36, Yann E. MORIN wrote:
> > On 2014-11-17 14:19 -0300, Guido Mart?nez spake thusly:
[--SNIP--]
> >> +all:
> >> +	@umask $(UMASK) && make --no-print-directory
[--SNIP--]
> > I'm not too fond of --no-print-directory, because it is gonna be
> > inherited by all sub-makes, and especially the sub-makes that actually
> > build the packages. I don't care we have an extra "Entering directory"
> > message.
> 
>  Note that the generated Makefile in $(O) does add --no-print-directory...

And guess who added that generated file?

    # git blame support/scripts/mkmakefile
    [...]
    aefad531 scripts/mkmakefile         (Yann E. MORIN    2010-09-26 10:56:12 +0200 31) MAKEFLAGS += --no-print-directory
    [...]

Ok, Ok. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
