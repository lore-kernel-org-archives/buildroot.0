From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 09:24:38 +0200
Subject: [Buildroot] [PATCH v2] uclibc: enable parallel building of
 libraries
In-Reply-To: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
References: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140630092438.14723c95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Fri, 27 Jun 2014 20:26:00 +0400, Alexey Brodkin wrote:
> The use of MAKE1 for uClibc dates back 10 years:
> 
> commit 8e5fb3fb4ab09b4dc04fe7cb3f7becce6514117b
> Author: Eric Andersen <andersen@codepoet.org>
> Date:   Sat Dec 11 13:01:10 2004 +0000
> 
>     Add initial BR2_JLEVEL support, with some exceptions for apps that
>     have broken 'make -j' support
> 
> Since that time there were lots of improvements in uClibc that seem to allow
> parallel building of libs finally.
> 
> Unfortunately uClibc tests have dependences on previously built files,
> that's why tests left with MAKE1.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

This patch apparently breaks the build on AVR32, which uses an old
(0.9.31) version of uClibc. So maybe we should use $(MAKE) instead of
$(MAKE1) only for uClibc >= 0.9.33 ?

See
http://jenkins.free-electrons.com/job/buildroot/config=atstk100x_defconfig/298/consoleText
for the build log. Both AVR32 defconfigs failed to build tonight, and
the only patch I can think of that was applied yesterday in relation to
uClibc is the parallel build one.

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
