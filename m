From: Scott Dudley <scott@telesoft.com>
Date: Thu, 01 Sep 2011 16:02:56 -0700
Subject: [Buildroot] buildroot-2011.08, crosstool-ng-1.12.1, and Samba
Message-ID: <4E600F20.7010606@telesoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I've been using buildroot + crosstool-ng targeted for i486 and glibc 
successfully for some time.

I was asked today to include Samba in my target build.  Simple enough.  
Compiled without issue however both nmbd and smbd segfault on 
execution.  If I run them interactively via the -i flag, I see much of 
the following:

init_iconv: Conversion from UTF-16LE to CP850 not supported
init_iconv: Attempting to replace with conversion from UTF-16LE to ASCII
init_iconv: Conversion from UTF-8 to CP850 not supported
init_iconv: Attempting to replace with conversion from ASCII to ASCII
init_iconv: Conversion from ANSI_X3.4-1968 to CP850 not supported
init_iconv: Attempting to replace with conversion from ASCII to ASCII
init_iconv: Conversion from CP850 to UTF-16LE not supported
init_iconv: Attempting to replace with conversion from ASCII to UTF-16LE
init_iconv: Conversion from CP850 to UTF-8 not supported
init_iconv: Attempting to replace with conversion from ASCII to ASCII
...

I see no option in buildroot to build libiconv.

Any guidance/assistance is very much appreciated.
