From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:52 -0800
Subject: [Buildroot] [buildroot 0000417]: makedevs behavior differs from
	documentation
Message-ID: <265e8c8dc174a0ffce0470ad40a33d96@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=417 
====================================================================== 
Reported By:                sho
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   417
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-07-2005 11:37 PDT
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    makedevs behavior differs from documentation
Description: 
According to the documentation, the makedevs interprets the value in the
last column of its input file as the number of devices to create. This is
not true, for exampele should the default configuration create hda[1-15],
but hda15 is missing. Changing the statement

  for (i = start; i < count; i++)

in makedevs.c into

  for (i = start; i < start+count; i++)

should fix the problem.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-07-05 11:37  sho            New Issue                                    
09-07-05 11:37  sho            Status                   new => assigned     
09-07-05 11:37  sho            Assigned To               => uClibc          
01-25-06 07:27  prpplague      Status                   assigned => closed  
01-25-06 07:27  prpplague      Resolution               open => won't fix   
01-25-06 07:27  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
