From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Mon, 14 Aug 2017 20:38:42 +0000
Subject: [Buildroot] Failing defconfigs due to GCC 6
In-Reply-To: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
References: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
Message-ID: <767EFADFF809234DB6CAABD6D2F93847C5D6E939@IRSMSX107.ger.corp.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

The Galileo and Galileo Gen 2 are supported by the upstream kernel, so that would be simplest approach.
Some minor non-upstream fixes will however be lost along the way.

The biggest obstacle is that I wouldn't be able to do anything on this until at least mid-September (due to travel).
Would be a pity to see Galileo support depreciated in BR.

Ray K

-----Original Message-----
From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Arnout Vandecappelle
Sent: Thursday, August 10, 2017 2:01 PM
To: Buildroot Mailing List <buildroot@buildroot.org>; Lothar Felten <lothar.felten@gmail.com>; Michael Trimarchi <michael@amarulasolutions.com>; Ezequiel Garc?a <ezequiel@vanguardiasur.com.ar>; Ariel D'Alessandro <ariel@vanguardiasur.com.ar>; Julien Boibessot <julien.boibessot@armadeus.com>; Padraig James Connolly <padraig.connolly@intel.com>; Kinsella, Ray <ray.kinsella@intel.com>; Gustavo Zacarias <gustavo@zacarias.com.ar>
Subject: [Buildroot] Failing defconfigs due to GCC 6

 Hi all,

 A number of defconfigs fail to build (usually the kernel, in one case U-Boot) because of GCC 6. Some of these could be fixed by simply bumping the upstream kernel; however, we really want defconfigs to be tested on an actual board, otherwise there's not much point.

 I've put the people who have been involved in these defconfigs in To. Could you look at these defconfigs and try to fix the build with GCC 6? Anything that remains unfixed by the end of the month will probably be removed.

beaglebone_qt5_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873600

firefly_rk3288_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873613

firefly_rk3288_demo_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873615

ci40_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873604

armadeus_apf9328_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873568

galileo_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873632

freescale_p1010rdb_pa_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873630


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
