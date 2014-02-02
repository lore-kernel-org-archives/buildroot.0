From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2014 11:19:20 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
 BR2_EXTERNAL
In-Reply-To: <52E69503.60101@mind.be>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
 <20140126145342.4c5ccc4e@skate> <52E69503.60101@mind.be>
Message-ID: <20140202101919.GB3331@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-01-27 18:18 +0100, Arnout Vandecappelle spake thusly:
> On 26/01/14 14:53, Thomas Petazzoni wrote:
> >Dear Yann E. MORIN,
> >
> >On Wed, 22 Jan 2014 21:59:34 +0100, Yann E. MORIN wrote:
> >
> >>+is interpreted relative to the main Buildroot source directory, not
> >>+the Buildroot output directory. Using relative paths can lead to various
> >>+broken setups, and thus is highly discouraged in favour of using
> >>+absolute paths.
> >
> >In this patch and in patch 3/3, I don't quite agree with the strong
> >suggestion to use absolute paths. I personally find the usage of
> >absolute paths ugly, and prefer to have in the manual an explanation on
> >how the paths are interpreted, so that the users can understand how to
> >properly use either relative paths or absolute paths as they prefer.
> >
> >To me, a tool that strongly suggests to use absolute paths is broken.
> 
> +1
> 
>  I have never used anything except relative paths for O= (and I use O= all
> the time :-).

It does work because Buildroot create $(O). At worst, it will not end up
where you hoped it to end up in, but the build will not fail because of
a mis-configured $(O) (typo, not relative to $(TOPDIR)...)

(which, by the way, is a fundamentaly broken behaviour, IMHO.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
