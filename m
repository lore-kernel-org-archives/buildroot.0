From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 06:13:27 -0800
Subject: [Buildroot] [buildroot 0001612]: TARGET_CONFIGURE_OPTS redefine CC
	with TARGET_CFLAGS but not TARGET_LDFLAGS
Message-ID: <f218cfe50a1b4984cbc44efd7e9e8822@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Last Modified:              11-27-2007 06:13 PST
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 06:13  ikonst         New Issue                                    
11-27-07 06:13  ikonst         Status                   new => assigned     
11-27-07 06:13  ikonst         Assigned To               => buildroot       
11-27-07 06:13  ikonst         File Added: target_cc_with_ldflags.patch         
          
======================================================================
