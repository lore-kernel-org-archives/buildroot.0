From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Fri, 21 Sep 2018 15:55:19 +0200
Subject: [Buildroot] [PATCH 0/2] package/pkg-kconfig.mk: Target to compare
 configurations
Message-ID: <20180921135521.32435-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Inspired" by the discussion we had at [1], I propose this patch series
to support developers who fragment their configurations. They will be
able to compare the current configuration of any kconfig based package
with the one derived from the defconfig + fragments (if any). The
output of the new target would look like the following:

### start of linux-diff-config output ###
 CONFIG_CPU_IDLE_GOV_MENU y -> n
 CONFIG_MODULE_FORCE_UNLOAD n -> y
### end of linux-diff-config output ###


[1]: https://patchwork.ozlabs.org/patch/951068/


Marcel Patzlaff (2):
  package/pkg-kconfig.mk: Reusability improvements
  package/pkg-kconfig.mk: new <pkg>-diff-config target

 package/pkg-kconfig.mk | 77 +++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 23 deletions(-)

-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
