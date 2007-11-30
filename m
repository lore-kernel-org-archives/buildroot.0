From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 30 Nov 2007 07:28:26 -0800
Subject: [Buildroot] [buildroot 0001622]: [PATCH] gcc 3.x/4.x symlinks to cc
Message-ID: <11ed598e4440a89070f1a03789ef4401@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1622 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1622
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-30-2007 07:28 PST
Last Modified:              11-30-2007 07:28 PST
====================================================================== 
Summary:                    [PATCH] gcc 3.x/4.x symlinks to cc
Description: 
The 'cc' symlink to 'gcc' is wrongly created as $(REAL_GNU_TARGET_NAME)-cc
for gcc 3.x (overwrites link to  $(REAL_GNU_TARGET_NAME)-gcc). Also the
'cc' link should be created in $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/
instead of $(STAGING_DIR)/usr/bin.

The attached patch fixes this for both gcc 3.x and 4.x.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-07 07:28  atle           New Issue                                    
11-30-07 07:28  atle           Status                   new => assigned     
11-30-07 07:28  atle           Assigned To               => buildroot       
11-30-07 07:28  atle           File Added: gcc-cc_links-fix.diff                
   
======================================================================
