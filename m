From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:22:42 -0700
Subject: [Buildroot] [buildroot 0001152]: DEPRECATED: gcc toolchain built
	for target fails
Message-ID: <7ff48aa2f7d2c5b0e3dd39ee34db0b54@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been UPDATED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1152 
====================================================================== 
Reported By:                Steven_Carr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1152
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-09-2007 22:49 PST
Last Modified:              07-08-2007 04:22 PDT
====================================================================== 
Summary:                    DEPRECATED: gcc toolchain built for target fails
Description: 
When building a "Generic development system" the compile fails.
I believe this to be a typo in the gcc-uclibc-3.x.mk file.   Please see
the Additional Information for potential patch.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-22-07 11:36  
---------------------------------------------------------------------- 
What were the exact steps you did to get to this?
unpack snapshot tarball / checkout source, step into the buildroot dir and
then.. 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 08:49  
---------------------------------------------------------------------- 
I will close this issue unless i receive instructions on how to reproduce
this within a week.

Thanks, 

---------------------------------------------------------------------- 
 hwstar - 02-06-07 17:42  
---------------------------------------------------------------------- 
I see the same problem and it is 100% repoducible with the 3 config files I
uploaded. Looking at the output leading up to the error, I noted a double
slash (//) in a pathname which may be causing the problem. This test was
with the latest buldroot snapshot dated 2/6/07. Here is the output from
make leading up to the error:

rm -f
/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/root/usr/lib/*.la*
#rm -rf
/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/root/share/locale
/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/root/usr/info
\
#      
/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/root/usr/man
/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/root/usr/share/doc
# Work around problem of missing syslimits.h
if [ ! -f
/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/root/usr/lib/gcc/i586-linux-uclibc//include/syslimits.h
] ; then \
        echo "warning: working around missing syslimits.h" ; \
        cp -f
/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/staging_dir/lib/gcc/i586-linux-uclibc//include/syslimits.h
\
               
/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/root/usr/lib/gcc/i586-linux-uclibc//include/
; \
fi
warning: working around missing syslimits.h
cp: cannot stat
`/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/staging_dir/lib/gcc/i586-linux-uclibc//include/syslimits.h':
No such file or directory
make[1]: ***
[/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot/build_i586/root/usr/bin/gcc]
Error 1
make[1]: Leaving directory
`/home/srodgers/projects/limey-linux/ll-vers-0.7b/build/buildroot'
make: *** [buildroot/rootfs.i586.ext2] Error 2

 

---------------------------------------------------------------------- 
 hwstar - 02-07-07 18:55  
---------------------------------------------------------------------- 
Uploaded patch file to resolve this issue. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-09-07 22:49  Steven_Carr    New Issue                                    
01-09-07 22:49  Steven_Carr    Status                   new => assigned     
01-09-07 22:49  Steven_Carr    Assigned To               => uClibc          
01-22-07 11:36  bernhardf      Note Added: 0002032                          
02-04-07 08:49  bernhardf      Note Added: 0002101                          
02-04-07 08:49  bernhardf      Status                   assigned => feedback
02-06-07 17:37  hwstar         File Added: buildroot.config                    
02-06-07 17:38  hwstar         File Added: uclibc.config                    
02-06-07 17:38  hwstar         File Added: busybox.config                    
02-06-07 17:42  hwstar         Note Added: 0002129                          
02-06-07 17:42  hwstar         Note Edited: 0002129                         
02-06-07 17:42  hwstar         Note Edited: 0002129                         
02-07-07 18:55  hwstar         File Added: patch-to-fix-syslimits-issue.patch   
                
02-07-07 18:55  hwstar         Note Added: 0002139                          
02-07-07 18:56  hwstar         Issue Monitored: hwstar                      
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
07-08-07 04:22  bernhardf      Summary                  gcc toolchain built for
target fails => DEPRECATED: gcc toolchain built for target fails
======================================================================
