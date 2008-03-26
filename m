From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 20:30:29 -0700
Subject: [Buildroot] [buildroot 0002634]: path to ncurses seems to contain
	extra 'gnu/'
Message-ID: <19e7cf07c158a6672e0a80b1a6c4a6a7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2634 
====================================================================== 
Reported By:                travishein
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2634
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             03-22-2008 09:42 PDT
Last Modified:              03-25-2008 20:30 PDT
====================================================================== 
Summary:                    path to ncurses seems to contain extra 'gnu/'
Description: 
The value of the variable $(BR2_GNU_MIRROR) seems to contain the /gnu/ path
component, so in the package/ncurses/ncurses.mk where it includes
gnu/ncurses again it is not finding it
====================================================================== 

---------------------------------------------------------------------- 
 travishein - 03-22-08 13:21  
---------------------------------------------------------------------- 
hmm actually everything that relies on the BR2_GNU_MIRROR variable is
currently suffering from this issue.

Im not sure, if the BR2_GNU_MIRROR in the .config (and .defconfig) should
be changed from http://ftp.gnu.org/pub/gnu to http://ftp.gnu.org/pub

or if the following package that refer to BR2_GNU_MIRROR should have their
path updated ?

package/gawk/gawk.mk
package/gzip/gzip.mk
package/autoconf/autoconf.mk
package/ncurses/ncurses.mk
package/findutils/findutils.mk
package/gettext/gettext.mk
package/editors/ed/ed.mk
package/bash/bash.mk
package/diffutils/diffutils.mk
package/wget/wget.mk
package/tar/tar.mk
package/m4/m4.mk
package/make/make.mk
package/bison/bison.mk
package/sed/sed.mk
package/automake/automake.mk
package/readline/readline.mk
package/libtool/libtool.mk
package/coreutils/coreutils.mk 

---------------------------------------------------------------------- 
 gnat - 03-24-08 10:14  
---------------------------------------------------------------------- 
a patch to fix all gnu packages is attached to bug
http://busybox.net/bugs/view.php?id=2654. 

---------------------------------------------------------------------- 
 hmoffatt - 03-25-08 20:30  
---------------------------------------------------------------------- 
Applied gnat's patch from http://busybox.net/bugs/view.php?id=2654. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-22-08 09:42  travishein     New Issue                                    
03-22-08 09:42  travishein     Status                   new => assigned     
03-22-08 09:42  travishein     Assigned To               => buildroot       
03-22-08 09:42  travishein     File Added: ncurses_path_20080321.diff           
        
03-22-08 13:21  travishein     Note Added: 0005834                          
03-24-08 10:14  gnat           Note Added: 0005854                          
03-25-08 20:30  hmoffatt       Status                   assigned => resolved
03-25-08 20:30  hmoffatt       Resolution               open => fixed       
03-25-08 20:30  hmoffatt       Note Added: 0005914                          
======================================================================
