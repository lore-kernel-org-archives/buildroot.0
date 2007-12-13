From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Dec 2007 04:10:30 -0800
Subject: [Buildroot] [buildroot 0001622]: [PATCH] gcc 3.x/4.x symlinks to cc
Message-ID: <3d8f07d8a4a62bc86b15cbfe2e71d8f1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-30-2007 07:28 PST
Last Modified:              12-13-2007 04:10 PST
====================================================================== 
Summary:                    [PATCH] gcc 3.x/4.x symlinks to cc
Description: 
The 'cc' symlink to 'gcc' is wrongly created as $(REAL_GNU_TARGET_NAME)-cc
for gcc 3.x (overwrites link to  $(REAL_GNU_TARGET_NAME)-gcc). Also the
'cc' link should be created in $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/
instead of $(STAGING_DIR)/usr/bin.

The attached patch fixes this for both gcc 3.x and 4.x.

====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-13-07 04:10  
---------------------------------------------------------------------- 
fixed in 20646 rev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-07 07:28  atle           New Issue                                    
11-30-07 07:28  atle           Status                   new => assigned     
11-30-07 07:28  atle           Assigned To               => buildroot       
11-30-07 07:28  atle           File Added: gcc-cc_links-fix.diff                
   
12-13-07 04:10  vanokuten      Status                   assigned => closed  
12-13-07 04:10  vanokuten      Note Added: 0003139                          
======================================================================
