From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 27 Jun 2010 23:28:47 +0200
Subject: [Buildroot] [PATCH 3/5] toolchain: move makefile includes
In-Reply-To: <87wrtk2nin.fsf@macbook.be.48ers.dk>
References: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1277504132-11184-4-git-send-email-yann.morin.1998@anciens.enib.fr>
	<87wrtk2nin.fsf@macbook.be.48ers.dk>
Message-ID: <201006272328.47905.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Sunday 27 June 2010 23:06:56 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:
>  Yann> Including a bunch of Makefiles with wildcard makes it impossible
>  Yann> to add new toolchain backends. Avoid that by namely including
>  Yann> needed files.
[--SNIP--]
> Why are the order of those includes not the same?

For external toolchains, the original Makefile was doing:
  include toolchain/*/*.mk

So I just did:
  ls -1 toolchain/*/*.mk

and replaced the single include with the output of ls, so as to keep the
inclusion in the same order the original Makefile was doing it.

> gcc-uclibc-3.x.mk is gone.
> 2x toolchain-external/ext-tool.mk?

Hmmm... I seem to have missed something here. Wrong tree, I guess... :-(

> Why do we need to include all these when using an external toolchain?
> Most of them doesn't seem to make sense to me.

I just did what the original Makefile did, just moved the stuff to
toolchain-specific Makefiles.

I guess it is needed when the user wants to have a native toolchain
in his/her rootfs, as the rules to build it are in those files. The
cross-stuff is not built due to the BASE_TARGETS variable that does
include them only for internal toolchain.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
