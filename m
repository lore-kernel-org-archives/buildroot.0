From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 31 Jan 2012 17:10:46 +0100
Subject: [Buildroot] problem when using build cache ?
Message-ID: <9C7AEB06A00A49B5BC4F3D164ABB579E@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

 

Using 2011.11 :

 

The udev version in 2011.11 (v1.73) does not  generate the /dev/pts nodes  and as result there is no devpts in the mounts.

 

The dev/pts is needed if you want to access the box via telnet.

 

So I went back to udev 1.14 (package stolen from buildroot 2010.11 )

 

I noticed udev 1.14 does not build  when the build ccache is ON.

Without the build ccache it's ok.

 

Has this something to do with the fact that the udev 1.14 package makefile is different in structure then the structure used in
2011.11 ?

 

If you check the udev doc, it states that udev 1.73 only works with kernels >= 2.6.34

But I was using 2.6.36.1 and there where no /dev/pts nodes 

 

So there is a tight connection between udev versions and the kernel versions.

 

Regards.

 

Sagaert Johan

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120131/d2523a1b/attachment-0001.html>
