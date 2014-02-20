From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2014 19:16:47 +0100
Subject: [Buildroot] [PATCH 03/10] package/linux-headers: select
 appropriate 'AT_LEAST_XXX' header version
In-Reply-To: <53029015.9020101@mind.be>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <94dd7d99bafacf64d4b2497b01de76472f4c9a70.1392571021.git.yann.morin.1998@free.fr>
 <53029015.9020101@mind.be>
Message-ID: <20140220181647.GA8457@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-02-17 23:41 +0100, Arnout Vandecappelle spake thusly:
> On 16/02/14 18:27, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
> > internal toolchain backend.
> > 
> > The custom and snapshot options do not select anything:
> >   - snapshot is for a 2.6 kernel (BR2_DEFAULT_KERNEL_HEADERS="2.6" in this
> >     case)
> >   - we provide most of post-3.x kernel versions
> >   - custom and snapshot are thus to select a version before 3.0
> 
>  I'm afraid that the custom and snapshot can also be used in other
> situations. I've used it for instance with a 3.4 kernel where there were
> some vendor-specific additions to the headers.
> 
>  So to be complete, there should be another choice to select the actual
> kernel version just like for the external toolchain...

OK for the "Manually specified Linux version", but the "Local Linux
snapshot" is expressly marked as a 2.6 snapshot:

    config BR2_KERNEL_HEADERS_SNAP
        bool "Local Linux snapshot (linux-2.6.tar.bz2)"

    [...]

    config BR2_DEFAULT_KERNEL_HEADERS
        string
        [...]
        default "2.6"       if BR2_KERNEL_HEADERS_SNAP

So, I'm not a fan of adding this for the snapshot.

I'll respin the series with jsut the manual version change. If we deem
it necessary to add it for snapshot too, this can be done in a follow-up
patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
