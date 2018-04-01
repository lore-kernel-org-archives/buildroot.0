From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 12:54:24 +0200
Subject: [Buildroot] [PATCH v3 1/1] New board: SolidRun ClearFog Base
In-Reply-To: <3921d73144f2246045336d67ffa0306380c77c12.1504557196.git.jan.kundrat@cesnet.cz>
References: <20170904174220.xeweolump7hsgfqm@tarshish>
 <3921d73144f2246045336d67ffa0306380c77c12.1504557196.git.jan.kundrat@cesnet.cz>
Message-ID: <fa0a51d2-9c80-42d9-4af2-c26eed8ba364@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-09-17 22:30, Jan Kundr?t wrote:
> My goal was to rely on upstreamed features as much as possible, which
> means that some bits are only half-baked for now:
> 
> - Due to the DTS restructuring in upstream kernel, we require 4.11+. The
> latest LTS or CIP kernels do not know about the -Base model.

 Latest is better :-)

> 
> - Linux has no generic support for SFP cages (yet). It seems that this
> has hit the net-next tree in August 2017, but there's been no release
> (it's probably targettting 4.14). Also, the merge only included the
> required infrastructure; the mvneta driver conversion is not included.
> Patches which finalize this exist in Russel King's tree and also in
> random vendor trees.
> 
> - There's no access to the SPI flash in these versions of
> uboot/linux/dts.

 All these limitations really are no problem.

 I committed to master, but with a bunch of fixes:

     - rename to solidrun_clearfog_defconfig;
     - specify kernel headers version (default is now 4.15);
     - remove ext2 fs size override, the 4 extra MB are not needed;
     - U-Boot needs dtc and openssl;
     - add comments to defconfig;
     - update .gitlab-ci.yml;
     - mention in readme.txt that SFP support is missing;
     - add Jan to DEVELOPERS.

 If you would update to a more recent kernel, please remember to update the
readme.txt as well if some of the limitations are removed.

 Regards,
 Arnout

> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
