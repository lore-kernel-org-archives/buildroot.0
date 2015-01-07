From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Jan 2015 22:17:14 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/lockdev: handle
 static/shared only build
In-Reply-To: <20150107220143.3565f3b1@free-electrons.com>
References: <1420585564-7921-1-git-send-email-romain.naour@openwide.fr>
 <20150107220143.3565f3b1@free-electrons.com>
Message-ID: <20150107211713.GE4249@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-07 22:01 +0100, Thomas Petazzoni spake thusly:
> On Wed,  7 Jan 2015 00:06:03 +0100, Romain Naour wrote:
> > Add a patch to install headers and static library separately.
> > 
> > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> > ---
> > v2: Headers must always be installed in staging,
> >     remove static library installation from install_dev target (ThomasP)
> 
> Thanks, both patches applied. Can you submit upstream?
> 
> To be honest, I am wondering if it's really a good idea to patch all
> package to make sure they only install shared libraries in a
> BR2_SHARED_LIBS=y build. Ideally yes, but do we want to carry patches
> in all packages that have a crazy build system, and are for many of
> them essentially unmaintained? I don't know.

Gustavo and I already discussed this on IRC a while back.

The basic idea was to have a way to identify bad packages, and somehow
mark them so that Buildroot would do the clean-up in a generic way.

Something like: FOO_IS_NOT_SHARED_ONLY_CLEAN = YES
and Buildroot would remove the .a files.

But there are some gotchas, since we can not blindly remove any and
every .a files, as some are really needed (from the toolchain, for
example, or because the package really only installs a .a because a .so
is meaningless).

Anyway, I'm still thinking about that...

Topic for the BDD, maybe?


Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
