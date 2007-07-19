From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Fri, 20 Jul 2007 02:02:18 +0700
Subject: [Buildroot] one-line bash job control patch
Message-ID: <5d75f4610707191202h76988af3w5a337f479e909a46@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attached is a one-line patch that allows bash to have job control.
The configure script for bash detects cross-compilation and does not
allow job control.  I need bash specifically since I use bash 3.2.X
regex syntax in my scripts, so just using ash or dash does not work
for me.  Is this what other people who need bash job control are doing
with buildroot?  I read a lot of mailing lists that say you need getty
and login and init so I put all that in and still didn't have job
control (but busybox ash did), and it turned out it was because the
default bash package with buildroot (at least as of subversion version
19152) was building a bash that does not include the job control.
Many things in the bash configure script are hard-coded to be off if
you are cross compiling; I wonder if more of them are needed.  Is
anybody else using bash with buildroot, or is everybody sticking with
busybox ash?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: bash.patch
Type: text/x-diff
Size: 393 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070720/edda5edd/attachment.bin 
