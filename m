From: g4 at novadsp.com <g4@novadsp.com>
Date: Wed, 24 Jun 2015 20:06:35 +0100
Subject: [Buildroot] B3+external kernel: not quite sure how to make these
	pieces fit ...
Message-ID: <066601d0aeb0$e445c840$acd158c0$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Want to automate building kernel and filesystem for Beaglebones. 

 

The kernel itself is the mainline 4.x with a set of patches applied from
Robert Nelson's (RCN) GIT repo. 

 

Problem is that there is no mechanism for file system construction/
packaging. Obviously Buildroot to the rescue here. 

 

I thought I'd start by trying to get BR to use the existing external
toolchain - specifying 'toolchain path' as
'~/rcn/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux'

 

But this fails with 'External toolchain uses the unsuported OABI'. There is
an old reference to this here:
http://git.buildroot.net/buildroot/commit/?id=b2e88073dbf05faa47475bf96d5ccf
8a45906a3c

 

I don't see any conflict with the target settings. Is there a solution or is
this a more fundamental/complex issue? 

 

This obviously begs the question of how the externally built kernel gets
into the BR mix but I'll leave that for next time.

 

Thx++

 

--------------------snip--------------------

Target Architecture (ARM (little endian))  --->
x x   

  x x                Target Binary Format (ELF)  --->
x x   

  x x                Target Architecture Variant (cortex-A8)  --->
x x   

  x x                Target ABI (EABIhf)  --->
x x   

  x x                Floating point strategy (VFPv3-D16)  --->
x x   

  x x                ARM instruction set (ARM)  --->             

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150624/2eadb813/attachment.html>
