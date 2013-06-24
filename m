From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Jun 2013 18:46:17 +0200
Subject: [Buildroot] why to have separate uboot-tools?
In-Reply-To: <51C825B8.6070800@gmail.com>
References: <51C825B8.6070800@gmail.com>
Message-ID: <51C877D9.8070705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/06/13 12:55, Jan Pohanka wrote:
> Hi all,
>
> currently I'm trying to customize buildroot a bit to allow it to be used
> by my colleagues as a base of their development environment.
> I have noticed that there is separate package for u-boot-tools (mkimage,
> etc.) Can please someone tell me why these tools are not installed from
> u-boot package defined in bootloaders section?

  uboot-tools are the tools for the _target_, e.g. fw_printenv and 
friends. mkimage is sometimes also useful on the target.

  For the host, it would be possible to use the tools from uboot instead, 
but for consistency it is just the host version of the uboot-tools package.

  Note also that it is possible and sometimes useful to build uboot-tools 
when you don't actually build U-boot. For instance, many devboards have 
U-boot in SPI flash so you don't need to build it.

> Once we use our own u-boot with its own tools (uflash from TI) I need to
> alter two packages and also u-boot sources are downloaded two times.
> I can prepare a patch to use just u-boot in bootloaders section, but the
> question is if it is not worthless...

  Indeed, it would be nice if it would be possible to have uboot-tools 
reuse the source of uboot itself (if uboot is selected). However, we 
currently have no infrastructure to do that. I think there has been a 
patch on the list to implement such a reuse of the source code, but it 
was considered too much of a hack.

  When/if the out-of-tree build directory packages by Thomas are 
accepted, it would be much easier/cleaner to rewrite the uboot-tools 
package to use the uboot source.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
