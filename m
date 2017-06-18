From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Jun 2017 12:14:24 +0300
Subject: [Buildroot] [PATCH 02/14] toolchain: remove CodeSourcery x86
 toolchain
In-Reply-To: <20170618090833.GB2918@scaer>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <f9dda54d8c748b269aac1f9071986503ef5cb1b8.1497583686.git.baruch@tkos.co.il>
 <20170618090833.GB2918@scaer>
Message-ID: <20170618091424.tefhny6rq57ytdc2@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jun 18, 2017 at 11:08:33AM +0200, Yann E. MORIN wrote:
> Baruch, All,
> 
> On 2017-06-16 06:32 +0300, Baruch Siach spake thusly:
> > Since glibc 2.17, executable link command need not include the -lrt option for
> > clock_* system calls. As a result, over time less and less software packages
> > bother to check whether to toolchain needs -lrt. We are now at a point where
> > maintainers refuse to add this complexity into their build system. This
> > requires Buildroot to carry patches fixing this issue indefinitely.
> 
> What upstreams are refusing to fix that? Do you have references to
> share?

See http://patchwork.ozlabs.org/patch/773384/ (swupdate).

I put the link in the series cover. Should add it here as well?

baruch

> 
> > glibc 2.17 is now 4.5 years old. There is no reason to use an older version
> > with current software.
> 
> So we can now consider the cut-off at what we consider legacy is 4.5
> years old. Fine with me.
> 
> > This commit removes the predefined profile for CodeSourcery x86 toolchain that
> > is based on glibc 2.16. One may still use the custom external toolchain
> > support in Buildroot to get this toolchain back, and deal with any build
> > issues that this toolchain causes.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
