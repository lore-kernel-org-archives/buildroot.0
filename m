From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jun 2014 09:35:19 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-25
In-Reply-To: <20140626063011.68A1B1011DF@stock.ovh.net>
References: <20140626063011.68A1B1011DF@stock.ovh.net>
Message-ID: <20140626063519.GQ4155@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Thu, Jun 26, 2014 at 08:30:11AM +0200, Thomas Petazzoni wrote:
>     xtensa |                   dhcpcd-6.4.0 | NOK | http://autobuild.buildroot.net/results/ecbba5682e3a8065f3cf3e0a9670c2febc71949a/

This is strange. It seems like xtensa toolchains don't like /dev/null as
output file:

$ .../output/host/usr/bin/xtensa-buildroot-linux-uclibc-gcc -o /dev/null test.c
.../output/host/usr/lib/gcc/xtensa-buildroot-linux-uclibc/4.8.3/../../../../xtensa-buildroot-linux-uclibc/bin/ld: Final link failed: File truncated

Toolchains for other architectures are just fine with /dev/null. Any Idea?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
