From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 2 Oct 2008 09:49:08 -0700
Subject: [Buildroot] [buildroot 0005204]: Makefile error
Message-ID: <c00ca8ec57ebb1e48199f54d25ed7aa3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5204 
====================================================================== 
Reported By:                suffecool
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5204
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-02-2008 09:49 PDT
Last Modified:              10-02-2008 09:49 PDT
====================================================================== 
Summary:                    Makefile error
Description: 
The file target/linux/Makefile.in.advanced has an error on line 431.

The current line is:
cp -dpf .config $(TARGET_DIR)/boot/busybox.config

This is erroneously copying the top-level buildroot .config file, when it
should be copying the busybox .config file.  I believe the line should
actually read:

cp -dpf $(BUSYBOX_DIR)/.config $(TARGET_DIR)/boot/busybox.config
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-02-08 09:49  suffecool      New Issue                                    
10-02-08 09:49  suffecool      Status                   new => assigned     
10-02-08 09:49  suffecool      Assigned To               => buildroot       
======================================================================
