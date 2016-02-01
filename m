From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Feb 2016 14:54:05 +0100
Subject: [Buildroot] [PATCH 02/16 v3] toolchain/external: add hashes for
 actual sources
In-Reply-To: <56AE8B01.1080205@mind.be>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <1aaa41e84c4084331e638ac19c10017d6ad30268.1454004518.git.yann.morin.1998@free.fr>
 <56AE8B01.1080205@mind.be>
Message-ID: <20160201135405.GD4278@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-01-31 23:30 +0100, Arnout Vandecappelle spake thusly:
> On 28-01-16 19:15, Yann E. MORIN wrote:
> > As we currently download the actual sources as part of saving the
> > legal-info, we do not check the hashes of those downloads.
[--SNIP--]
> > So we just add hashes for those actual external-toolchain sources we may
> > have to download.
[--SNIP--]
> > diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> > index dd7073f..22bbe51 100644
> > --- a/toolchain/toolchain-external/toolchain-external.hash
> > +++ b/toolchain/toolchain-external/toolchain-external.hash
> > @@ -12,6 +12,7 @@ sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfi
> >  # Mentor's Sourcery CodeBench Lite toolchains
> >  # ARM
> >  sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> > +sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
> 
>  Why only this one, and not the six other Sourcery toolchains?

Because I did not add them. ;-)

Seriously, I just forgot. And it takes quite some time to get them all.

I've added hashes for all the CS toolchains now, but maybe there are
other toolchains for which we're still missing the hashes for the source
tarball. Maybe we can just add them whenever someone stumbles on it?

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
