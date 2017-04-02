From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 14:50:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix linking of
 etnaviv_cmd_stream_test
In-Reply-To: <20170402102730.14159-1-bernd.kuhls@t-online.de>
References: <20170402102730.14159-1-bernd.kuhls@t-online.de>
Message-ID: <20170402145029.2af44b86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 12:27:30 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/68a/68af62f4ab6944d326468818562c05fd5cc55b03/
> http://autobuild.buildroot.net/results/c33/c3330ef9a8cadb46bbd31c5b14ece34f192133e3/
> http://autobuild.buildroot.net/results/d18/d181bd044246646732a14815aae08337b0b5eecf/
> http://autobuild.buildroot.net/results/4f5/4f5872211812c7e191cffcf41cab998fc20c0d20/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied, after fixing two things:

 - You forgot to add AUTORECONF = YES, which is needed since you're
   patching Makefile.am

 - You forgot to use the -N option when using git format-patch, so we
   had this still 1/1 in [PATCH 1/1], which doesn't make any sense in
   the context of Buildroot, since this patch was actually the third
   patch out of three patches for this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
