From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 4 Mar 2011 16:13:42 -0600
Subject: [Buildroot] Applying custom kernel patches
In-Reply-To: <AANLkTikLN+Pr2+Stg_mb2fDvEZrRtHO9A_W14Xjd_=o3@mail.gmail.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com><9AC3F0E75060224C8BBC5BA2DDC8853A1F734F29@EXV1.corp.adtran.com>
	<AANLkTikLN+Pr2+Stg_mb2fDvEZrRtHO9A_W14Xjd_=o3@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F734F5E@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi Andy
> 
> I'm attempting to do a full build (uImage and rootfs)?
> 
> I've got 6 kernel patches which I need to apply before running the
> "full build", they add "board support" for my module and various other
> "nand" related bits. One of the patches adds
> "arch/arm/configs/telit_ge863_defconfig"?
> 

<list rules>  Plain Text (wrap at 72 chars), bottom post.  </list rules>

You should create a directory OUTSIDE the scope of the BuildRoot dirs
for your patches.  It didn't occur to me until I went looking for 
something else just now that buildroot/linux is a known directory.
Your patches could exist in buildroot/mylinux if you wanted, but you
shouldn't put stuff into dirs that BuildRoot knows.

So, you'll put your patches in mylinux then config the kernel patches
to the unqualified path starting in buildroot (or you could do something
along the lines of $(TOPDIR)/mylinux to be more BuildRoot friendly ;).

Andy
