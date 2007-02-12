From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:11 -0800
Subject: [Buildroot] [buildroot 0000900]: add some libs and apps to buildroot
Message-ID: <4520af9f7de5dcdf5e2daf97976dae8a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=900 
====================================================================== 
Reported By:                sraue
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   900
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-12-2006 07:46 PDT
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    add some libs and apps to buildroot
Description: 
This patch 
- fixes install location for $(STAGING_DIR) for
    SDL
    freetype

- add support for
    alsa-lib 1.0.11
    lcms 1.15
    libogg 1.1.3
    libvorbis 1.1.2
    libungif 4.1.4
    SDL-image 1.2.5
    SDL-ttf 2.0.8
    tiff 3.8.2

to buildroot.
This is the first part of adding/update some multimedia-packages
====================================================================== 

---------------------------------------------------------------------- 
 ramack - 09-30-06 16:13  
---------------------------------------------------------------------- 
nice patch but shouldn't line 41 in package/freetype/freetype.mk look like

     cp -dpf $(STAGING_DIR)/lib/libfreetype.so* $(TARGET_DIR)/usr/lib/

(removed usr in source path) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-12-06 07:46  sraue          New Issue                                    
06-12-06 07:46  sraue          Status                   new => assigned     
06-12-06 07:46  sraue          Assigned To               => uClibc          
06-12-06 07:46  sraue          File Added: buildroot-addpackages-001.patch      
             
09-14-06 09:59  Scott B        Issue Monitored: Scott B                     
09-30-06 16:13  ramack         Note Added: 0001678                          
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
