From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2014 21:02:58 +0100
Subject: [Buildroot] [PATCH 1 of 4 v2] infra: remove variable
 FOO_DIR_PREFIX
In-Reply-To: <6a46109dc43358a75adb.1391530913@argentina>
References: <patchbomb.1391530912@argentina>
 <6a46109dc43358a75adb.1391530913@argentina>
Message-ID: <20140204200258.GA3404@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-02-04 17:21 +0100, Thomas De Schampheleire spake thusly:
> Variable FOO_DIR_PREFIX in inner-generic-package isn't really needed. The
> contents of this variable are 'package' for normal packages, 'boot' for
> bootloaders, and 'linux' for the linux kernel.
> When patching a package, all you need to know is the directory where
> patches can reside, which is already returned by $(pkgdir). In order to be
> able to use this variable outside of inner-generic-package, we introduce a
> target-specific variable PKGDIR that equals to this $(pkgdir).

Maxime, I guess that's the variable we needed, and were desparately
looking for in the tree, when hacking spidermonkey during our wayback
trip from Brussels! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
