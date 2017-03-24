From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Mar 2017 13:49:34 +0100
Subject: [Buildroot] [PATCH 2/2] board: Add support for Engicam i.CoreM6
 Quad
In-Reply-To: <CAMty3ZA275KNiBcuM_YvZVmYcQQXp-Zq2R0o7_y2w7p6xxfZ-Q@mail.gmail.com>
References: <1489489266-23161-1-git-send-email-jagan@openedev.com>
 <1489489266-23161-2-git-send-email-jagan@openedev.com>
 <20170319152039.6d0770f4@free-electrons.com>
 <CAMty3ZA275KNiBcuM_YvZVmYcQQXp-Zq2R0o7_y2w7p6xxfZ-Q@mail.gmail.com>
Message-ID: <20170324134934.4b89a5bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 16:08:22 +0530, Jagan Teki wrote:

> > Also, your defconfig should be named engicam_imx6q_icore_defconfig.  
> 
> Just for my understanding, why we add prefix engicam_ here because
> these boards always use Mainline code instead of freescale or some
> other source. I guess the reason behind
> freescale_imx6qsabresd_defconfig and imx6q-sabresd_defconfig based on
> the source where it cloned is that correct?

No, the main reason is just inconsistency I'd say. Ideally, all
defconfigs should follow this <vendor>_<product>_defconfig format I
believe.

> > Please use a fixed version of U-Boot.  
> 
> I'm planning to sync with Latest sources instead of some specific
> version, so-that I don't need to change my config again for next
> available/suitable version of source.

That's not how our defconfigs work. We want to build a fixed version of
the kernel and U-Boot, which has been tested by the person submitting
the defconfig. So please adopt the convention used in other defconfigs,
thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
