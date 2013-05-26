From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 May 2013 16:45:40 +0200
Subject: [Buildroot] [RFC/PATCH 0/4] support building from read-only
 source tree
In-Reply-To: <1340031743-29694-1-git-send-email-ntl@pobox.com>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
Message-ID: <20130526144540.GA3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathan, All,

On 2012-06-18 10:02 -0500, Nathan Lynch spake thusly:
> There are several places in Buildroot where files are copied from the
> source tree to the output directory and then modified.  The most
> obvious case is copying a .config or equivalent to the build
> directory and then modifying it with sed, as with uClibc or busybox.
> 
> This works fine when the source file has write permissions; this is
> preserved in the destination copy.  This is the behavior in the common
> case of running from a git repository or a release tarball.
> 
> However, when the source file is read-only, the destination copy is
> also not writable and such fixups fail.  This occurs when the the
> Buildroot source tree is being hosted in a Perforce repository.
> Perforce uses local file permissions to track whether a file is being
> edited and checks out all regular files read-only by design.
> 
> The following changes were enough to get qemu_mips_malta_defconfig to
> build and run successfully.  I submit these patches for discussion and
> illustration of the effort required to support this use case.

Unfortunately, those patches mostly no longer apply, since there have
been some code churn (reoridering) in the meantime.

I'll take whatever I can, and adapt the remaining.

Regards,
Yann E. MORIN. 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
