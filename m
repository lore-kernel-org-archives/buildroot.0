From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jun 2016 22:34:03 +0200
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <20160616222854.6b20890a@free-electrons.com>
References: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20160616153710.12ef9233@free-electrons.com>
 <20160616214522.70ca9152@itchy>
 <20160616222854.6b20890a@free-electrons.com>
Message-ID: <20160616203403.GJ3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, ?ric, All,

On 2016-06-16 22:28 +0200, Thomas Petazzoni spake thusly:
> On Thu, 16 Jun 2016 21:45:22 +0200, Eric Le Bihan wrote:
> > > > Not being able to run ldconfig and generate the ld.so cache has two
> > > > drawbacks:
[--SNIP--]
> > uclibc-ng also provides ldconfig, which behaves like the glibc version
> > (see ldso/man/ldconfig.8 in the source tree).
> 
> OK. But IIRC, the ld.so.cache functionality in uClibc-ng is optional,
> and I'm not sure we have it enabled by default.
> 
> The uClibc-ng ld.so.cache format would be fully compatible with
> the one used in glibc ?

AFAICS, yes. Their ldocnfig code looks suspiciously like the glibc one.

> > > Another thing that bothers me is why it is not possible to have a
> > > cross-compilation aware ldconfig. This would really be much, much
> > > nicer than running ldconfig under qemu.  
> > 
> > Yocto provides a recipe named ldconfig-native_2.12.1.bb [1], which
> > contains a verbatim copy of the ldconfig source code from glibc, and a
> > truck load of patches. It looks a bit hairy...
> > 
> > [1] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> 
> Yes, I know they are doing this with a shitload of patches. Maybe we
> should host a project on github for a cross-compilation capable
> ldconfig, and then offer the Yocto people to use it?

Meh... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
