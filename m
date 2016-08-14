From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Aug 2016 23:57:19 +0200
Subject: [Buildroot] [PATCH 4/8] package/android-tools: drop
 musl-compatibility cdefs patching out
In-Reply-To: <0cc766e7-d59b-3e2c-bf9e-abba7f6cb94b@mind.be>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <bf528a01457458785591880406b964fcce771ca7.1471033837.git.yann.morin.1998@free.fr>
 <0cc766e7-d59b-3e2c-bf9e-abba7f6cb94b@mind.be>
Message-ID: <20160814215719.GH30771@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-14 23:34 +0200, Arnout Vandecappelle spake thusly:
> On 12-08-16 22:49, Yann E. MORIN wrote:
> > We now always have a sys/cdefs.h, so we no longer need to patch it out.
> > 
> > Simplify the patch by removing any hunk removing cdefs.h or the use of
> > __BEGIN_DECLS/__END_DECLS. However, it must be included when macros it
> > defines are being used.
> > 
> > Also, renumber patches to guarantee ordering.
> 
>  You actually changed the ordering...
> 
> 0005-fix-big-endian-build.patch
> 0005-fix-static-link-zlib.patch
> 
> ->
> 
> 0005-fix-static-link-zlib.patch
> 0006-fix-big-endian-build.patch
> 
> so I guess the order doesn't matter.

No it does not. But if you git-log the package, you'll see that the
static fix was introduced before the big-endian one.

>  But anyway, after careful review of the patch-in-patch changes:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
