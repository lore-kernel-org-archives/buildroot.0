From: Andreas Aronsson <anar@Syntronic.se>
Date: Fri, 16 Nov 2007 16:23:03 +0100
Subject: [Buildroot] at91bootstrap - to patch the patch or new version?
In-Reply-To: <fbfc54a467bf14cd1f834b83b4f4f538@busybox.net>
References: <fbfc54a467bf14cd1f834b83b4f4f538@busybox.net>
Message-ID: <1195226583.4778.21.camel@salome.goteborg.syntronic.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

When selecting BR2_TARGET_AT91BOOTSTRAP it fails with the following:



main.o: In function `main':
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/main.c:93: undefined reference to `dbg_print'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/main.c:94: undefined reference to `dbg_print_hex'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/main.c:95: undefined reference to `dbg_print'
driver/dataflash.o: In function `df_init':
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:336: undefined reference to `dbg_print'
driver/dataflash.o: In function `load_df':
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:416: undefined reference to `dbg_print'
driver/dataflash.o: In function `df_read':
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:226: undefined reference to `dbg_print'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:229: undefined reference to `dbg_print'
driver/dataflash.o:/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:236: more undefined references to `dbg_print' follow
driver/dataflash.o: In function `df_download':
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:250: undefined reference to `dbg_print_hex'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:251: undefined reference to `dbg_print'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:252: undefined reference to `dbg_print_hex'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:253: undefined reference to `dbg_print'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:257: undefined reference to `dbg_print'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:258: undefined reference to `dbg_print_hex'
/home/aron/svn/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c:259: undefined reference to `dbg_print'
make: *** [result/at91sam9263ek-dataflashboot-2.3.4.elf] Error 1


I know how to fix it, but I don't know how to patch buildroot svn. 
In ~/svn/buildroot/target/device/Atmel/at91bootstrap
we have the at91bootstrap-2.3.4.patch file which needs some attention. 
Do I patch the patch or should I perhaps make a new patch in order to
have a new version ( I.E. at91bootstrap-2.3.5.patch )? 
Pls advise

--
Andreas Aronsson

Konsult

SYNTRONIC AB

?gatan 32

431 35 M?lndal, Sweden

Phone: +46(0)31-746 81 09

Fax: +46(0)31-746 81 07

Email: anar at syntronic.com


-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071116/95496517/attachment.htm 
