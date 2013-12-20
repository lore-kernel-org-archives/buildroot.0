From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 10:43:01 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/providers
In-Reply-To: <20131220103143.53d1434e@skate>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
 <20131220103143.53d1434e@skate>
Message-ID: <201312201043.01660.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 20 December 2013 10:31:43 Thomas Petazzoni wrote:
> On Fri, 20 Dec 2013 00:43:23 +0100, Yann E. MORIN wrote:
> 
> > This series is a third attempt at trying to fix the BR2_EXTERNAL issue,
> > in that packages in BR2_EXTERNAL can't be providers of an implementation
> > for a virtual package, such as libegl.
> 
> I must say I really like this proposal! It both makes virtual packages
> better, and solves the BR2_EXTERNAL problem without making invasive
> changes in the package infrastructure.

Note that I still intend to work on the post-pone patch, as this would
allow more integration of BR2_EXTERNAL.

> A few minor questions:
> 
>  *) Shouldn't we use 'qstrip' when doing:
> 
>     POWERVR_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_POWERVR)

Probably. I must say I forgot to mark this PR as an RFC. I did not
actually test it, besides checking the Kconfig variable was properly
set in .config.

I'll conduct more thourough tests tonight and this WE.

So: this was an RFC. ;-)

>  *) The jpeg virtual package should also be converted in the same way.

I've looked at the jpeg and cryptodev packages, but they do not follow
the "standard" virtual packages scheme (or, as Gustavo put it on IRC
yesterday: "they are not real virtual packages").

>  *) In PATCH 1, in package/rpi-userland/Config.in, you're adding an if
>     BR2_PACKAGE_RPI_USERLAND ... endif block, but *before* the comment
>     related to the toolchain dependencies of rpi-userland. I never
>     remember if that is the situation causing indentation problem of the
>     comment in menuconfig or not. Would be good to check this.

I'll look into that, too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
