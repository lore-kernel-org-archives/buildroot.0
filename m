From: Goe <sombradecrisantemo@gmail.com>
Date: Mon, 6 Jul 2015 14:46:21 +0200
Subject: [Buildroot] Error when opencv is included in compilation,
 'i586-buildroot-linux-g++' file is missed
Message-ID: <CACiBgcej-aEteA67kBPy9HXm20QQQHOnCVbrQqWKfhN2Ne0xiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to compile a buildroot instance with opencv included using a
machine with Ubuntu 14.04. The first compilation (before include opencv) is
correct, but it fails when I try to compile again including opencv in the
configuration.

The strangest thing is that the same steps work correctly in other machines
with Ubuntu 12.04 and Debian 8 (I do not have another Ubuntu 14.04 machine).

The followed steps are:
* make clean
* make (compilation finished without errors)
* make nconfig (Include WCHAR, C++ support and OpenCV)
* make

Then, the compilation of OpenCV crashes with this error:

//*************************************************//
CMake Error at CMakeLists.txt:56 (project):
  The CMAKE_CXX_COMPILER:


/home/VICOMTECH/jgoenetxea/Workspace/BuildRoot/buildroot-2015.05/output/host/usr/bin/i586-buildroot-linux-uclibc-g++

  is not a full path to an existing compiler tool.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full
path
  to the compiler, or to the compiler name if it is in the PATH.


-- Check for working C compiler:
/home/VICOMTECH/jgoenetxea/Workspace/BuildRoot/buildroot-2015.05/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
-- Check for working C compiler:
/home/VICOMTECH/jgoenetxea/Workspace/BuildRoot/buildroot-2015.05/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
-- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Configuring incomplete, errors occurred!
//*************************************************//

I have checked the file 'i586-buildroot-linux-uclibc-g++' and it is not in
that location (../output/host/usr/bin/) in the problematic machine, but it
is there in the other machines (not Ubuntu 14.04).

I have tried some solutions like this: '
http://lists.busybox.net/pipermail/buildroot/2014-May/097050.html' but I
can not find the solution.

Any help would be appreciated.

Thanks in advance,
Jon.

** I include attached the compilation output logs:
https://www.dropbox.com/sh/ust82qdfnlipz5r/AAD3I6HrdoCZSVPpGjInxd2da?dl=0
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150706/2f4305f7/attachment.html>
