From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 2 Aug 2008 13:36:32 -0700
Subject: [Buildroot] [buildroot 0001305]: DEPRECATED: target "ARM" does not
	build
Message-ID: <e683ecc6753dbad228aa653d993dd169@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1305 
====================================================================== 
Reported By:                bell
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1305
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-08-2007 01:09 PDT
Last Modified:              08-02-2008 13:36 PDT
====================================================================== 
Summary:                    DEPRECATED: target "ARM" does not build
Description: 
Target architecture "arm" with no other changes on default config does not
build:


.debug_varnames
 *(.debug_varnames)

.note.gnu.arm.ident
 *(.note.gnu.arm.ident)

/DISCARD/
 *(.note.GNU-stack)
OUTPUT(busybox_unstripped elf32-littlearm)
collect2: ld returned 1 exit status
/home/anwender/embedded/elta8882a/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-strip:
'busybox_unstripped': No such file
install: cannot stat `busybox': No such file or directory
make[1]: *** [install] Fehler 1
make[1]: Leaving directory
`/home/anwender/embedded/elta8882a/buildroot/buildroot/build_arm/busybox-1.5.0'
make: ***
[/home/anwender/embedded/elta8882a/buildroot/buildroot/build_arm/root/bin/busybox]
Fehler 2



====================================================================== 

---------------------------------------------------------------------- 
 Matthias Kaehlcke - 04-15-07 07:49  
---------------------------------------------------------------------- 
i have the same (or similar) behaviour when trying to build busybox (for
ARM) with the ELDK-uClibc 4.1 toolchain 

---------------------------------------------------------------------- 
 bell - 08-02-08 13:36  
---------------------------------------------------------------------- 
Today i tested the compiling now. It works. You can close this bug. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-08-07 01:09  bell           New Issue                                    
04-08-07 01:09  bell           Status                   new => assigned     
04-08-07 01:09  bell           Assigned To               => buildroot       
04-15-07 07:49  Matthias KaehlckeNote Added: 0002318                          
04-19-07 00:31  Matthias KaehlckeFile Added: build.log                        
07-07-07 12:00  bernhardf      Summary                  target "ARM" does not
build => DEPRECATED: target "ARM" does not build
08-02-08 13:36  bell           Note Added: 0010164                          
======================================================================
