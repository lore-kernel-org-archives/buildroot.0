From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 7 Jul 2007 11:46:40 -0700
Subject: [Buildroot] [buildroot 0001251]: Buildroot uses lots of cp commands
	that assume GNU cp
Message-ID: <893c482ebc6dc46de259ba02a78eae77@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been set as DUPLICATE OF issue 0000944. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1251 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1251
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-02-2007 13:26 PST
Last Modified:              07-07-2007 11:46 PDT
====================================================================== 
Summary:                    Buildroot uses lots of cp commands that assume GNU
cp
Description: 
There's some incompatilibity between GNU cp and Mac OS X (probably BSD,
too) cp commands. GNU cp arguments -d and -a do not exist on OS X. -a can
be written -pPR on OS X. -d is partly covered by -P and partly by -R. -P
is the --no-dereference part of -d and -R does what --preserve=links does
AFAICT. The ugly part is that -R, which is also recursive, has to be used
to get real as-is copying of symbolic links. Attached a patch for some of
the cp commands, but there are many more. Maybe, patches could be appended
to this report.
======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0000944 Some portability fixes for running on a...
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-02-07 13:26  holin          New Issue                                    
03-02-07 13:26  holin          Status                   new => assigned     
03-02-07 13:26  holin          Assigned To               => buildroot       
03-02-07 13:26  holin          File Added: buildroot-070302-cp-01.patch         
          
03-31-07 09:42  bendiken       Issue Monitored: bendiken                    
07-07-07 11:46  bernhardf      Relationship added       duplicate of 0000944
======================================================================
