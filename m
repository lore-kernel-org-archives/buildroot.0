From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 09:53:04 -0700
Subject: [Buildroot] [buildroot 0001250]: Targets do not work correctly on
	Mac OS X
Message-ID: <97a71b8a1325219f422c3439ea4f03fc@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1250 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1250
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-02-2007 13:17 PST
Last Modified:              03-20-2007 09:53 PDT
====================================================================== 
Summary:                    Targets do not work correctly on Mac OS X
Description: 
Mac OS X has no "root" group, it has "wheel" instead as group 0. Therefore,
it would seem better to use numeric ids for chown commands in target build
scripts. Also, genext2fs 1.3 does not build on OS X, but the newly
released 1.4 does. Some arguments have changed and it should support hard
links now. Attached a patch to, hopefully, handle all these issues. 
====================================================================== 

---------------------------------------------------------------------- 
 holin - 03-02-07 23:45  
---------------------------------------------------------------------- 
"0001225: Bump genext2fs" probably does a better job at upgrading genext2fs
than this one. The other parts still apply, though. 

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 09:53  
---------------------------------------------------------------------- 
Fixed in r18181.
Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-02-07 13:17  holin          New Issue                                    
03-02-07 13:17  holin          Status                   new => assigned     
03-02-07 13:17  holin          Assigned To               => buildroot       
03-02-07 13:17  holin          File Added: buildroot-070302-targets-osx.patch   
                
03-02-07 23:45  holin          Note Added: 0002198                          
03-20-07 09:53  bernhardf      Status                   assigned => closed  
03-20-07 09:53  bernhardf      Note Added: 0002247                          
======================================================================
