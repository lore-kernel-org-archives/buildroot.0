From: Ulf Samuelsson <ulfs@dof.se>
Date: Sun, 14 Jan 2007 19:41:15 +0100
Subject: [Buildroot] chown 0 <file> fails while generating root file system
Message-ID: <009b01c7380f$a56568e0$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using buildroot-2006-11-01 with my own modifications.
When generating the root file system file (JFFS2/EXT2)
at the end, a file "install.sh" is called in build_arm/sudo-<ver>
which will chown some files to be owned by root.

This fails, since I am running as a normal user
so all files are owned by the user make'ing the buildroot.

I upgraded the operating system to OpenSuse 10.2 and this
generated error messages of type: (translated from Swedish)

chown: changing owner of "<file>": Operation not allowed

Is this a known problem?
I have not seen this error message when using OpenSuse 10.1 
on the same buildroot sources.

If known, has it been fixed in later version?


Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070114/52e35936/attachment.htm 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot_err.txt
Url: http://busybox.net/lists/buildroot/attachments/20070114/52e35936/attachment.txt 
