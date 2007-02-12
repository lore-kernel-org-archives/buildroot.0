From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:42 -0800
Subject: [Buildroot] [buildroot 0000416]: busybox binary is overwritten by
	netkitbase inetd
Message-ID: <19ff0b1e931202a3e11d4d82721ccef7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=416 
====================================================================== 
Reported By:                sho
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   416
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-07-2005 11:29 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    busybox binary is overwritten by netkitbase inetd
Description: 
If both the inetd applet of busybox and the netkit inetd are enabled, the
netkit version overwrites the busybox binary inside the target filesystem
via the symbolic link /usr/sbin/inetd. It seems that the command

  rm -f $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)

is missing right in front of the line

cp $(NETKITBASE_DIR)/$(NETKITBASE_BINARY)
$(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)

in package/netkitbase/netkitbase.mk

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-07-05 11:29  sho            New Issue                                    
09-07-05 11:29  sho            Status                   new => assigned     
09-07-05 11:29  sho            Assigned To               => uClibc          
01-24-06 13:22  prpplague      Status                   assigned => resolved
01-24-06 13:22  prpplague      Resolution               open => fixed       
01-24-06 13:22  prpplague      Additional Information Updated                   

03-08-06 16:53  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
