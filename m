From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Oct 2012 22:45:19 +0200
Subject: [Buildroot] u-boot compiling
In-Reply-To: <1349713787.63802.YahooMailNeo@web164603.mail.gq1.yahoo.com>
References: <1349713787.63802.YahooMailNeo@web164603.mail.gq1.yahoo.com>
Message-ID: <50748CDF.6030203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/10/12 18:29, Zoran Djordjevic wrote:
> I want to achieve booting linux on my ARM board without messages
> displaying on console. AFAIK, I must have u-boot version compiled
> with that possiblity (CONFIG_SILENT_CONSOLE). My u-boot binary
> version (on my board CD) seems not to be of that kind, because when I
> set "silent" environment variable, nothing happens.
> So, I am interested if I can compile u-boot alone, by
> using Buildroot ie. without building kernel and root file system ?

  You can, but there's not much point using buildroot then.  It's just as
easy to create a toolchain with crosstool-NG or to download a  precompiled
one, and use that to compile U-Boot.  U-Boot is pretty good at
cross-compilation :-)

  Anyway, if you want to create an empty buildroot, just do the following:
- in Package selection, remove busybox;
- in Filesystem, remove tar;
- in Bootloaders, select U-Boot and set the config name.

> Also, what amount of boot time shortage can I expect when supressing
> console messages ?

  It won't be measurable without an oscilloscope.  U-Boot generates so little
output when booting that it hardly affects its runtime - unless you have a
very fast processor and a very slow serial port.  Disabling the kernel
output (by adding the 'quiet' option to the bootargs) will help a lot more
(about 1 second on my OMAP).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
