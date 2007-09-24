From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 24 Sep 2007 00:56:43 -0700
Subject: [Buildroot] [buildroot 0001234]: Allow common configuration options
	to be specified in one place
Message-ID: <5462bfc20465956fbe5355a6277d8335@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1234 
====================================================================== 
Reported By:                djl197
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1234
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-19-2007 07:15 PST
Last Modified:              09-24-2007 00:56 PDT
====================================================================== 
Summary:                    Allow common configuration options to be specified
in one place
Description: 
This change allows users to use menuconfig to select Static or Shared
package builds (or both).
At the same time it allows a set of common configure options to be
specified.
(TARGET_CONFIGURE_FLAGS).
These flags specify common flags based upon which packages are specified. 
For instance enabling LIBJPEG will pass --enable-libjpeg and
--enable-jpeg=yes to configure.
The package makefiles will need to be modified to start using this
variable and that is not done in this patch. I hope people will start to
use this variable.
====================================================================== 

---------------------------------------------------------------------- 
 djl197 - 02-20-07 00:48  
---------------------------------------------------------------------- 
Updated patch as first one had a trailing \ missing !!!! 

---------------------------------------------------------------------- 
 bernhardf - 09-24-07 00:56  
---------------------------------------------------------------------- 
Unfortunately this will not work as advertised since several configure will
barf on unsupported flags such as --enable-sdl (or --disable-sdl for that
matter). 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-19-07 07:15  djl197         New Issue                                    
02-19-07 07:15  djl197         Status                   new => assigned     
02-19-07 07:15  djl197         Assigned To               => buildroot       
02-19-07 07:15  djl197         File Added: buildroot_common_config_opts.patch   
                
02-20-07 00:47  djl197         File Added: buildroot_common_config_opts_2.patch 
                  
02-20-07 00:48  djl197         Note Added: 0002183                          
09-24-07 00:56  bernhardf      Status                   assigned => closed  
09-24-07 00:56  bernhardf      Note Added: 0002780                          
======================================================================
