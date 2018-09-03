From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 00:28:25 +0200
Subject: [Buildroot] patch buildroot/package/dtc
In-Reply-To: <CO2PR01MB1976EB656E93F73EA89B8FFECC0D0@CO2PR01MB1976.prod.exchangelabs.com>
References: <CO2PR01MB1976EB656E93F73EA89B8FFECC0D0@CO2PR01MB1976.prod.exchangelabs.com>
Message-ID: <eec5d16e-459e-becf-e5ff-f3b15fdb7a16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/09/2018 23:04, Enoch W. wrote:
> Since Linux 14.4 kernel has its own libfdt_env.h, grep:
> beagleboard/linux/scripts/dtc/libfdt/fdt.c:#include "libfdt_env.h"
> 
> We need to reject the almost identical file from the host tools, find:
> output/host/include/libfdt_env.h
> 
> Or otherwise have fdt16_to_cpu etc. redefinition errors.

 This is fixed more elegantly with [1].

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/964474/

> 
> The fix is trivial.
> 
> Thanks, Enoch.
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
