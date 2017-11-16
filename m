From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 16 Nov 2017 09:00:49 +0100
Subject: [Buildroot] binutils: symbolic instead of hard links for the
 utilities
Message-ID: <7845d629-0d63-6d8c-e887-3531373d1fab@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

in the buildroot [1] project, we are currently facing a problem with 
hard linked utilities, e.g.:

   ./bin/x86_64-buildroot-linux-gnu-ar
   ./x86_64-buildroot-linux-gnu/bin/ar

To make a relocatable SDK, we sanitize and replace the absolute RPATH 
directories of all ELF files with relative paths using "$ORIGIN". e.g. 
"$ORIGIN/../lib". Unfortunately, this does not work with hard-linked 
files in different levels of the file hierarchy. Using symbolic links 
instead would fix the issue as the linker/loader seems to resolve 
symbolic links before searching for the libs in the RPATH directories.

Is there a rational behind using hard in favor of symbolic links?

Does a configuration option using symbolic instead of hard links has a 
chance to get accepted?

[1] https://buildroot.org/

Wolfgang.
