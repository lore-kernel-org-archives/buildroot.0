From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 2 Mar 2007 13:26:20 -0800
Subject: [Buildroot] [buildroot 0001251]: Buildroot uses lots of cp commands
	that assume GNU cp
Message-ID: <c5366a2a98b31a23483fabf295e85bce@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Last Modified:              03-02-2007 13:26 PST
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-02-07 13:26  holin          New Issue                                    
03-02-07 13:26  holin          Status                   new => assigned     
03-02-07 13:26  holin          Assigned To               => buildroot       
03-02-07 13:26  holin          File Added: buildroot-070302-cp-01.patch         
          
======================================================================
