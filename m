From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 9 Nov 2008 03:45:38 -0800
Subject: [Buildroot] [buildroot 0006054]: [PATCH] fbv smarter clean method
Message-ID: <1f5a57cc08459ee119e2781e73c28b46@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6054 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6054
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-09-2008 03:45 PST
Last Modified:              11-09-2008 03:45 PST
====================================================================== 
Summary:                    [PATCH] fbv smarter clean method
Description: 
The command fbv is used to show up all the images in a slide show.
Unfortunately it clean the screen and after a while commit the image on
it. During this time the user starring in front of a non-very-interesting
black screen.

The proposed solution is not the smartest solution in order to clean the
border around the image but it is the most fast and simplest way to reset
the frame buffer before committing the image on it. However if this
solution is not fast/smart enough then much probably the whole fbv image
committing would be too slow too. In this case the usage of the double
buffering is the only way to made the FB rapidly switching from an image
to the next.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-09-08 03:45  robang74       New Issue                                    
11-09-08 03:45  robang74       Status                   new => assigned     
11-09-08 03:45  robang74       Assigned To               => buildroot       
11-09-08 03:45  robang74       File Added: fbv-smarter-clean.patch              
     
======================================================================
