From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 19:39:09 +0200
Subject: [Buildroot] [PATCH] package/cutelyst: Update micro version for
 build fix
In-Reply-To: <CACo8zOc4NmY_rYuiBC3nAfNrxmQ15z+OzPuEgQ9dVXfGk2nrGQ@mail.gmail.com>
References: <20180802133813.12698-1-dantti12@gmail.com>
 <20180802154726.46faa9d7@windsurf.home>
 <CACo8zOc4NmY_rYuiBC3nAfNrxmQ15z+OzPuEgQ9dVXfGk2nrGQ@mail.gmail.com>
Message-ID: <20180805193909.4a586bd6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Sun, 5 Aug 2018 12:31:57 -0300, Daniel Nicoletti wrote:

> > (Of course, use the correct hash, I just took a random build results to
> > illustrate here.)  
> Should all build failures be included or just one with the problem?

Just one with the problem.

> This here has a new error:
>         i686 |                 cutelyst-2.5.1 |
> http://autobuild.buildroot.net/results/d38411eda9edf16e2c40d8931bcfc889faae43dc
> I use SO_REUSEPORT but it seems this kernel is old and does not have
> support for it

Then you need to add a dependency on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
where 3_3 matches the kernel version in which SO_REUSEPORT was added.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
