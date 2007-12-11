From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 11 Dec 2007 12:26:59 -0800
Subject: [Buildroot] [buildroot 0001612]: TARGET_CONFIGURE_OPTS redefine CC
	with TARGET_CFLAGS but not TARGET_LDFLAGS
Message-ID: <9d35baaf374484d5e3bfa35a7c4d3d06@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1612 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1612
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 06:13 PST
Last Modified:              12-11-2007 12:26 PST
====================================================================== 
Summary:                    TARGET_CONFIGURE_OPTS redefine CC with TARGET_CFLAGS
but not TARGET_LDFLAGS
Description: 
In package/Makefile.in, we have:
TARGET_CONFIGURE_OPTS= ...
               CC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \

So, instead of passing CFLAGS=$(TARGET_CFLAGS), we define it as part of
the CC execution string, which is fine. However, we don't pass
TARGET_LDFLAGS here, which is just as important -- in particular for
external toolchains, where the LDFLAGS are necessary to link with
$(STAGING_DIR)/lib.
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-11-07 12:26  
---------------------------------------------------------------------- 
But TARGET_LDFLAGS are passed in:
LD="$(TARGET_CROSS)ld $(TARGET_LDFLAGS)"

Do not understand why linker flags are needed on compile CC stage.
Could you please explain what particular problem are you facing with?

regards,
Ivan 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 06:13  ikonst         New Issue                                    
11-27-07 06:13  ikonst         Status                   new => assigned     
11-27-07 06:13  ikonst         Assigned To               => buildroot       
11-27-07 06:13  ikonst         File Added: target_cc_with_ldflags.patch         
          
12-11-07 12:26  vanokuten      Note Added: 0003089                          
======================================================================
