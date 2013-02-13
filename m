From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Feb 2013 00:21:12 +0100
Subject: [Buildroot] uboot-tools and uboot being separate
In-Reply-To: <20130214001404.199dbd64@skate>
References: <511BCBEE.5040704@siganos.org> <20130213212002.25c976ca@skate>
 <511C1A3F.2080804@mind.be> <20130214001404.199dbd64@skate>
Message-ID: <511C1FE8.60103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/02/13 00:14, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 13 Feb 2013 23:57:03 +0100, Arnout Vandecappelle wrote:
>
>>    I've had the same issue once: a patch to add some functionality to
>> mkimage that I needed both on the host and on the target.
>
> Then easy enough; put your patch in package/uboot-tools/. It handles
> the build and installation of both the host *and* target variant of the
> U-Boot tools.

  In my particular use case (IIRC), the patched mkimage was used to 
process u-boot.bin into a ROM-bootable image. So the same patch had to be 
applied to uboot-tools and uboot. But it was not in fact the same patch, 
because the uboot version was different. What we did in the end is just 
change the uboot-tools site to the same git repository.


>>> No. You don't have to have identical uboot-tools and uboot.
>>> Basically uboot-tools provide one tool to create U-Boot images
>>> (mkimage) and tools to manipulate the U-Boot environment from Linux
>>> (fw_printenv, fw_setenv). Those tools are backward compatible, and
>>> so you can perfectly use the tools from U-Boot 2010.x with a
>>> running U-Boot 2012.x or 2013.x.
>>
>>    Unless some feature has been added or removed.
>
> In which case you bump the version of the uboot-tools package, just
> like any other package.

  Yes, but you have to do it twice.

  It's not that it's impossible to solve, it's just inconvenient and 
counter-intuitive. It's also inconvenient to have two U-Boot versions in 
your legal-info output. Just like it's inconvenient to have two linux 
tarballs.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
