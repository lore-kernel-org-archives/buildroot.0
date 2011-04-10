From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 10 Apr 2011 12:10:30 -0700
Subject: [Buildroot] external-toolchain with CodeSourcery works well
Message-ID: <BANLkTi=hgwAAjD8QhBWoDcOnVy8vwFLCyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was able to take buildroot-2011.02 and select the CodeSourcery
external-toolchain. The CodeSourcery 2010.09.tar.bz2 downloaded and
installed in buildroot-2011.02/output/external-toolchain and created jffs2,
ubifs, cpio and tar root filesystems along with an external application with
a path to the same toolchain. Great job getting this part working in
buildroot.

I do see a powerpc-linux-gnu-gdb and gdbserver, both of which run. The
gdbserver runs on the PowerPC target and does make a connect.

Toolchain is gcc-4.5.1 and it looks like the notion of "target remote
targetIp:port" has now become "target extended-remote targetIp:port". When
the remote debugger disconnects, the target now goes back to waiting for a
connection which is a bit better then previous versions.

Now, I am going to attempt to understand a bit about crosstools-ng. Here, I
am guessing a bit on configuration settings, that is, things like prefixes
and paths. Any suggestions would be gratefully appreciated.

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110410/2f7f001f/attachment.html>
