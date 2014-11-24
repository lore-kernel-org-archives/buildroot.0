From: bart.thoelen at telenet.be <bart.thoelen@telenet.be>
Date: Mon, 24 Nov 2014 14:14:23 +0100 (CET)
Subject: [Buildroot] buildroot does not copy the C++ headers to sysroot
In-Reply-To: <1650912863.53529076.1416834831765.JavaMail.root@telenet.be>
Message-ID: <1600692898.53530555.1416834863233.JavaMail.root@telenet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

I successfully have created myself a basic kernel image and rootfs using buildoot (2014.08). Im using the codesourcery arm-xilinx-linux toolchain (2013.05) as an external toochain. 

I'm trying to add a C++ (autotools-generated) project but this fails to compile with message "cc1plus: error: include location "/usr/include" is unsafe for cross-compilation [-Werror=poison-system-directories]". 
The project compiles perfectly when manually configured for the toochain (hence not using buildroot). 

After some debugging I found that the C++ headers have not copied from the external toolchain into the buildroot's output/host folder. The libs are there - very strangly. 

As a test I made a make clean, configured buildroot to use and download the codesourcery toolchain 2013.05m but still the same issue. 

What I'm doing wrong here ?? 

buildroot .confg and the projects .mk included. 

Many thanks. 

BartT 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141124/342bcf4c/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: nmcmdserver.mk
Type: text/x-makefile
Size: 516 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141124/342bcf4c/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 43238 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141124/342bcf4c/attachment.obj>
