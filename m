From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Jun 2015 20:05:01 +0200
Subject: [Buildroot] [PATCH 01/11 v2] package-infra: add helper to build
 kernel modules
In-Reply-To: <20150610210819.GD26406@dkarchlinux64.currentcomm.com>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <a9355834b4604ad9989556affbddeb9926343abd.1433964001.git.yann.morin.1998@free.fr>
 <20150610210819.GD26406@dkarchlinux64.currentcomm.com>
Message-ID: <20150611180501.GB3689@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, All,

On 2015-06-10 16:08 -0500, rdkehn at yahoo.com spake thusly:
> On Wed, Jun 10, 2015 at 09:22:05PM +0200, Yann E. MORIN wrote:
> > The Linux kernel offers a nice and easy-to-use infra to build
> > out-of-tree kernel modules.
> > 
> > Currently, we have quite a few packages that build kernel modules, and
> > most duplicate (or rewrite) the same code over-and-over again.
> > 
> > Introduce a new infrastructure that provides helpers to build kernel
> > modules, so packages do not have to duplicate/rewrite that.
> > 
> > The infrastructure, unlike any other package infra, is not standalone.
> > It needs another package infra to be used. This is so that packages that
> > provide both userland and kernel modules can be built easily. So, this
> > infra only defines post-build and post-install hooks, that will build
> > the kernel modules after the rest of the package.
> > 
> > Also, no host version is provided, since it does not make sense to build
> > kernel modules for the host.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Baruch Siach <baruch@tkos.co.il>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> Tested-by: Doug Kehn <rdkehn@yahoo.com>

Sorry, I forgot to propagate your Tested-by tag from the previous
iteration. I'll do for the next one.

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
