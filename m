From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 14 Apr 2017 08:50:02 +0300
Subject: [Buildroot] [PATCH v3] atest: new package
In-Reply-To: <CAOMZO5Ch5+VOHYuO8W4r3wZSBsXSzLSuXvvNsNyC2Fn--nWc5Q@mail.gmail.com>
References: <1491759842-27293-1-git-send-email-festevam@gmail.com>
 <20170413224848.393b11be@free-electrons.com>
 <CAOMZO5Ch5+VOHYuO8W4r3wZSBsXSzLSuXvvNsNyC2Fn--nWc5Q@mail.gmail.com>
Message-ID: <20170414055002.r4swrkh3kzx65rlc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Thu, Apr 13, 2017 at 08:14:56PM -0300, Fabio Estevam wrote:
> On Thu, Apr 13, 2017 at 5:48 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> 
> > A Config.in comment was missing here to show the glibc/musl+thread
> > dependency, so I've added that.
> 
> I see you added:
> 
> +comment "atest needs a glibc or musl toolchain w/ threads"
> + depends on !BR2_bfin
> + depends on BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_HAS_THREADS
> 
> ,but this should be:
> 
> depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HAS_THREADS

We want the comment to appear when the packages can't build because of 
toolchain properties. So the committed dependency looks correct. That is, the 
comment appears when the toolchain uses uClibc or doesn't support threads.

The !BR2_bfin dependency is there to hide the comment when the architecture is 
incompatible. The comment will be misleading (changing toolchain won't help), 
and the user can't change the architecture selection in most cases.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
