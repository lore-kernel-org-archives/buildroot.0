From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:53:34 +0200
Subject: [Buildroot] [PATCH] Add out-of-source U-Boot device tree support
In-Reply-To: <54cae0a0-a7a5-9ef0-08c8-a14e871cf8bb@mind.be>
References: <1490595146-5638-1-git-send-email-james@balean.com.au>
 <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
 <1490681640-14995-1-git-send-email-james@balean.com.au>
 <54cae0a0-a7a5-9ef0-08c8-a14e871cf8bb@mind.be>
Message-ID: <20170328215334.405952d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Mar 2017 11:01:46 +0200, Arnout Vandecappelle wrote:

> > Have reconsidered this suggestion. I think that perhaps it would be best
> > not to make the U-boot option dependent on the Linux option. As Linux
> > and U-Boot use two different device tree sources, there may be occasions
> > when custom DTS configuration must be made to one or the other rather
> > than both. This is the case with my boards, which have device tree
> > support in Linux, but not in U-Boot.  
> 
>  Certainly, but I only suggested to *default* to the same DTS. It is also
> possible that the kernel isn't built at all by Buildroot, or that it uses an
> in-tree DTS, or that it is built without DTS because the DTB is provided by
> U-Boot. All of these cases are covered by the "if
> BR2_LINUX_KERNEL_USE_CUSTOM_DTS" part. And even if the both kernel and U-Boot
> use a DTS, it is possible to change the default.

I am not entirely convinced that this:

  default BR2_LINUX_KERNEL_CUSTOM_DTS_PATH if BR2_LINUX_KERNEL_USE_CUSTOM_DTS

is really a good idea. IMO, it tries to be too "clever". I'd really
prefer to keep the U-Boot and Linux configurations independent from
each other.



Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
