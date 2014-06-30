From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 30 Jun 2014 07:29:50 +0000
Subject: [Buildroot] [PATCH v2] uclibc: enable parallel building of
 libraries
In-Reply-To: <20140630092438.14723c95@free-electrons.com>
References: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
 <20140630092438.14723c95@free-electrons.com>
Message-ID: <1404113390.3117.5.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-06-30 at 09:24 +0200, Thomas Petazzoni wrote:
> This patch apparently breaks the build on AVR32, which uses an old
> (0.9.31) version of uClibc. So maybe we should use $(MAKE) instead of
> $(MAKE1) only for uClibc >= 0.9.33 ?
> 
> See
> http://jenkins.free-electrons.com/job/buildroot/config=atstk100x_defconfig/298/consoleText
> for the build log. Both AVR32 defconfigs failed to build tonight, and
> the only patch I can think of that was applied yesterday in relation to
> uClibc is the parallel build one.

Thanks for this.
Let me look at this issue on AVR32.

Frankly I'd prefer to escape conditions withing "uclibc.mk" - this
condition will remain for many years until somebody tries to do another
round of clean-up.

I'll try to find an upstream patch that fixes disclosed issue and put it
in "package/uclibc/0.9.31.1".

What do you think of this approach?

-Alexey
