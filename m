From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 20 Jul 2015 07:54:50 +0000
Subject: [Buildroot] [PATCH v2] uclibc: run snapshot and ng configs
 through "savedefconfig"
In-Reply-To: <20150718225626.603c2b7f@free-electrons.com>
References: <1429544863-19143-1-git-send-email-abrodkin@synopsys.com>
 <20150718225626.603c2b7f@free-electrons.com>
Message-ID: <1437378890.4091.1.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, 2015-07-18 at 22:56 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Mon, 20 Apr 2015 18:47:43 +0300, Alexey Brodkin wrote:
> > Recently uClibc got support of "savedefconfig" target that allows
> > generation of compact configuration description which only lists
> > differences from default options.
> > 
> > That's uClibc commit -
> > http://git.uclibc.org/uClibc/commit/?id=e286a674419d31cb0757dd2f8307d8b4756cf1f9
> > 
> > This change represents post-processing of "uClibc-snapshot.defconfig"
> > and "uClibc-ng.config" with "make savedefconfig" made on current
> > uClibc/master and uClibc-ng/1.0 branches accordingly.
> > 
> > Unfortunately the most recent stable uClibc version 0.9.33.2 doesn't
> > have "savedefconfig" target so I'm leaving uClibc-0.9.33.config as it
> > is.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Max Filippov <jcmvbkbc@gmail.com>
> > Cc: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> > Changes in v2:
> >  [1] uClibc-ng/1.0 branch is used as a base instead of master because as of
> >      today only uClibc-ng v1.0 is supported in Buildroot. And uClibc-gd master
> >      branch has significant differences in supported options.
> 
> I've refreshed the defconfig with the latest Buildroot and current
> versions of uClibc, and applied. Test builds of an ARM
> (uClibc-ng.config) and ARC (uClibc-snapshot.config) worked fine.

Thanks a lot for doing this!

Now it's much easier to deal with these configs compared to expanded ones
we used to have for many years.

-Alexey
