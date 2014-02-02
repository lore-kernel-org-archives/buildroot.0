From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2014 11:16:39 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
 BR2_EXTERNAL
In-Reply-To: <20140126145342.4c5ccc4e@skate>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
 <20140126145342.4c5ccc4e@skate>
Message-ID: <20140202101639.GA3331@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-01-26 14:53 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Wed, 22 Jan 2014 21:59:34 +0100, Yann E. MORIN wrote:
> 
> > +is interpreted relative to the main Buildroot source directory, not
> > +the Buildroot output directory. Using relative paths can lead to various
> > +broken setups, and thus is highly discouraged in favour of using
> > +absolute paths.
> 
> In this patch and in patch 3/3, I don't quite agree with the strong
> suggestion to use absolute paths. I personally find the usage of
> absolute paths ugly, and prefer to have in the manual an explanation on
> how the paths are interpreted, so that the users can understand how to
> properly use either relative paths or absolute paths as they prefer.
> 
> To me, a tool that strongly suggests to use absolute paths is broken.

I am a bit unsure how to handle this situation.

On the one hand, I agree with you that not supporting relative paths
would be bad. We should work seemlessly with relative paths.

On the other hand, the way we handle relative paths is counter-intuitive,
since they are interpreted relative to the Buildroot top-dir, not to the
current directory [*], which is baiscally the way virtually all other
programs handles relative paths, which makes it weird to a new-comer (or
even to long-timers, I have to admit).

Also, I personnally don't much care what we do or do not usggest either
way. I'm just trying to avoid the easy pitfalls.

[*] Note that this is not our fault, but make's, since that the way make
behaves. I checked the dicumentation, and there is no way to get back
the CWD make was run from.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
