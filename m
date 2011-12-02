From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 02 Dec 2011 14:44:11 +0000
Subject: [Buildroot] crosstool-ng and uClibc toolchain
Message-ID: <4ED8E43B.6020102@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been looking at building a toolchain using 2011.11 building it 
with crosstools-ng and uClibc.

It currently seems a little bit broken/limited. I can supply a custom 
ct-ng config, which specifies 0.9.32 but I am unable to select NPTL 
threading or to specify a custom uClibc config file.

Also if I choose to use libthreads.new then the build fails as the 
config file passed to build libc headers has no threading option 
enabled. This problem is I think caused by the uClibc config file you 
have to use. It contains LINUXTHREADS_OLD=y but there is not a not set 
entry for LINUXTHREADS_NEW which means the sed command to set it can't work.

In fact the uClibc config you are forced to use has lots of settings I 
would consider wrong.

Am I correct thinking these things are broken or am I missing something?

Am currently working on a patch that does the following:
- Allow user to pick uClibc version when using ct-ng
- Allow user to select nptl when using 0.9.32
- Supply better default uClibc config files (Using same config files as 
for internal buildroot config)
- Allow user to specify a custom uClibc config file

Assuming I can get it working I'll post it.

Thanks
Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
