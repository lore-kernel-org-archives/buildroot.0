From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 22 Mar 2007 09:22:04 -0700
Subject: [Buildroot] [buildroot 0001279]: bad compiler version discover in
	dependencies.sh
Message-ID: <5183fcb58eca029eb982bcf00e1d8d91@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1279 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1279
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     feedback
====================================================================== 
Date Submitted:             03-20-2007 15:19 PDT
Last Modified:              03-22-2007 09:22 PDT
====================================================================== 
Summary:                    bad compiler version discover in dependencies.sh
Description: 
Hello,
I don't know wheter or not $HOSTCC have to be defined before lauching
'make'.

Anyway, when not configured, the following test fails:
COMPILER=$(which $HOSTCC)

'which' gracefully respond with helps text....
that next $XSED is unable to understand ;)

file:
toolchain/dependencies/dependencies.sh; line
http://busybox.net/bugs/view.php?id=208#152


Bye
====================================================================== 

---------------------------------------------------------------------- 
 Franck78 - 03-20-07 15:37  
---------------------------------------------------------------------- 
same for $HOSTCXX, next test.

Note also 'head' is used before testing presence by the script. 

---------------------------------------------------------------------- 
 bernhardf - 03-21-07 01:07  
---------------------------------------------------------------------- 
HOSTCC and HOSTCXX are optional.

Please post the exact error you are seeing.

I don't understand why you point to an unrelated comment? Please
elaborate. 

---------------------------------------------------------------------- 
 Franck78 - 03-21-07 02:55  
---------------------------------------------------------------------- 
Hello,

Just log all the make programs output to see details of the error.
Or ever simpler: go directly in dependencies subir and lauch
dependencies.sh.
It tests every needed support program presence (except for 'head')
and it completly fails the compiler test version
WHEN HOSTCC IS NOT SET (then HOSTCXX)
Can't be more clear than that, sorry.

Asking 'which something' returns pathto something
Asking 'which' returns which's syntax usage.

Guess what happens when HOSTSCC is empty....

Franck 

---------------------------------------------------------------------- 
 Franck78 - 03-21-07 03:11  
---------------------------------------------------------------------- 
I understand why you don't understand the comment...

The link-pointer was a real text entered by me and it is the mantis bug
tracking system that replaced it.

http://busybox.net/bugs/view.php?id=222#172=> was "~~ line 172
~x172 

---------------------------------------------------------------------- 
 bernhardf - 03-21-07 04:00  
---------------------------------------------------------------------- 
foo=$(which) does not print anything for me.

what version of which do you see this with?

i replaced the use of head with sed -e '1d', please svn up and let me know
if that's better now.

PS: If you don't provide a copy and paste of the error you are getting
from dependencies.sh with HOSTCC and HOSTCXX unset, then i'll blissfully
ignore this part of your report. Thanks for your understanding. 

---------------------------------------------------------------------- 
 Franck78 - 03-21-07 04:44  
---------------------------------------------------------------------- 
my which prog comes from 'gnu' repository.
It does not print anything too, from command line.

but inside the script, it is not the same !?

Also, another thing changed in my system and now, dependencies.sh finds
the rigth version of gcc. Previously, it was an error message with
something 'not numeric'.


Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
LD_LIBRARY_PATH sane:                           Ok
which installed:                                Ok
./dependencies.sh: line 108: toolchain/dependencies/check-host-sed.sh:
Aucun fichier ou r?pertoire de ce type
sed works:                                      No, using buildroot
version instead
GNU make version '3.80':                        Ok
Usage: which [options] [--] programname [...]
Options: --version, -[vV] Print version and exit successfully.
         --help,          Print this help and exit successfully.
         --skip-dot       Skip directories in PATH that start with a dot.
         --skip-tilde     Skip directories in PATH that start with a
tilde.
         --show-dot       Don't expand a dot to current directory in
output.
         --show-tilde     Output a tilde for HOME directory for non-root.
         --tty-only       Stop processing options on the right if not on
tty.
         --all, -a        Print all matches in PATH, not just the first
         --read-alias, -i Read list of aliases from stdin.
         --skip-alias     Ignore option --read-alias; don't read stdin.
         --read-functions Read shell functions from stdin.
         --skip-functions Ignore option --read-functions; don't read
stdin.
C compiler '/usr/bin/cc'
C compiler version '4.0.2':                     Ok
Usage: which [options] [--] programname [...]
Options: --version, -[vV] Print version and exit successfully.
         --help,          Print this help and exit successfully.
         --skip-dot       Skip directories in PATH that start with a dot.
         --skip-tilde     Skip directories in PATH that start with a
tilde.
         --show-dot       Don't expand a dot to current directory in
output.
         --show-tilde     Output a tilde for HOME directory for non-root.
         --tty-only       Stop processing options on the right if not on
tty.
         --all, -a        Print all matches in PATH, not just the first
         --read-alias, -i Read list of aliases from stdin.
         --skip-alias     Ignore option --read-alias; don't read stdin.
         --read-functions Read shell functions from stdin.
         --skip-functions Ignore option --read-functions; don't read
stdin.
C++ compiler '/usr/bin/c++'
C++ compiler version '4.0.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

 

---------------------------------------------------------------------- 
 bernhardf - 03-21-07 11:16  
---------------------------------------------------------------------- 
Please update. Better now? 

---------------------------------------------------------------------- 
 Franck78 - 03-22-07 09:22  
---------------------------------------------------------------------- 
ok, no more junk in the log file and no more error about the first numeric
error also (the one that returned bad version for compiler).
The ">dev/null" doesn't explain why ;-) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-20-07 15:19  Franck78       New Issue                                    
03-20-07 15:19  Franck78       Status                   new => assigned     
03-20-07 15:19  Franck78       Assigned To               => buildroot       
03-20-07 15:20  Franck78       Issue Monitored: Franck78                    
03-20-07 15:37  Franck78       Note Added: 0002259                          
03-21-07 01:07  bernhardf      Note Added: 0002260                          
03-21-07 02:55  Franck78       Note Added: 0002261                          
03-21-07 03:11  Franck78       Note Added: 0002262                          
03-21-07 04:00  bernhardf      Note Added: 0002263                          
03-21-07 04:36  Franck78       Note Added: 0002264                          
03-21-07 04:44  Franck78       Note Edited: 0002264                         
03-21-07 11:16  bernhardf      Note Added: 0002265                          
03-22-07 06:22  bernhardf      Status                   assigned => feedback
03-22-07 09:22  Franck78       Note Added: 0002269                          
======================================================================
