From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Mar 2015 13:21:00 +0200
Subject: [Buildroot] [PATCH v2] package/perf: build outside kernel tree
In-Reply-To: <CAKbGBLjn3LqxTxBYUtRK8q8tCPPfto2LJfFcg7Rn5pD6NMN_9Q@mail.gmail.com>
References: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
 <20150319110240.GE2415@tarshish>
 <CAKbGBLjn3LqxTxBYUtRK8q8tCPPfto2LJfFcg7Rn5pD6NMN_9Q@mail.gmail.com>
Message-ID: <20150319112100.GG2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

On Thu, Mar 19, 2015 at 04:04:38AM -0700, Steven Noonan wrote:
> On Thu, Mar 19, 2015 at 4:02 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Thu, Mar 19, 2015 at 03:57:31AM -0700, Steven Noonan wrote:
> >>  # Source taken from the Linux kernel tree
> >> -PERF_SOURCE =
> >>  PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> >> +PERF_SOURCE = linux-$(PERF_VERSION).tar.xz
> >> +ifeq ($(findstring x2.6.,x$(PERF_VERSION)),x2.6.)
> >> +PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> >> +else
> >> +PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
> >
> > What about v4.x?
> 
> Good callout. Have there been related changes submitted for the
> linux-headers and kernel packages?

In case the maintainers decide this is the way to go about perf (which I 
doubt), then we should move this code to a common place instead of duplicating 
it. While at it we should also fix the v4.x case.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
