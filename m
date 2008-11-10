From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 10 Nov 2008 07:49:28 -0800
Subject: [Buildroot] [buildroot 0001553]: New package : midnight commander
Message-ID: <620bab640f462c3d123224f78eacbaa4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1553 
====================================================================== 
Reported By:                Leon Bailly
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1553
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-23-2007 17:32 PDT
Last Modified:              11-10-2008 07:49 PST
====================================================================== 
Summary:                    New package : midnight commander
Description: 
Midnight Commander 4.6.1 with debian patches.
Requires glib2.0 on buildmachine.

Requires glib2.0 + ncurses on hostmachine.


====================================================================== 

---------------------------------------------------------------------- 
 Leon Bailly - 10-30-07 05:54  
---------------------------------------------------------------------- 
An improved version mc2.tar.gz removes the dependency on ncurses.
You can use the recommended mc-slang library instead.

Further improvements:

- honors LARGEFILE_support setting
- honors HAVE_MANPAGES
- selectable NLS
- selectable VFS
- a space saving feature removes some hi-lite template files 

---------------------------------------------------------------------- 
 broeggle - 11-10-08 07:49  
---------------------------------------------------------------------- 
Hi,
I just tried out your mc2.tar.gz package, but unfortunately it doesn't
work for me.
The Config.in is missing some dependencies (e.g BR2_USE_WCHAR or
BR2_ENABLE_LOCALE)
However my main problem is that make always tries to recompile man2hlp
which of course fails as glibcompat.o is already built for x86 (which is
right behaviour) 
-> why it is trying to rebuild man2hlp? 

it would be nice if you could provide some help on this issue

I'm using buildroot to compile for an avr32 system 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-23-07 17:32  Leon Bailly    New Issue                                    
10-23-07 17:32  Leon Bailly    Status                   new => assigned     
10-23-07 17:32  Leon Bailly    Assigned To               => buildroot       
10-23-07 17:32  Leon Bailly    File Added: mc.tar.gz                        
10-23-07 17:32  Leon Bailly    Issue Monitored: Leon Bailly                    
10-30-07 05:42  Leon Bailly    File Added: mc2.tar.gz                       
10-30-07 05:54  Leon Bailly    Note Added: 0002870                          
11-02-07 20:34  Leon Bailly    Issue End Monitor: Leon Bailly                   

09-26-08 04:12  dpusz          Issue Monitored: dpusz                       
09-26-08 04:12  dpusz          Issue End Monitor: dpusz                     
11-10-08 07:49  broeggle       Note Added: 0015344                          
======================================================================
