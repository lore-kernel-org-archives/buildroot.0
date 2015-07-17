From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 17 Jul 2015 09:23:01 -0700
Subject: [Buildroot] multiple BR2_EXTERNAL layers?
Message-ID: <55A92BE5.8060307@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, is it possible to specify multiple layers in BR2_EXTERNAL? When I try (make BR2_EXTERNAL="/foo /bar"), my second layer seems to be ignored.

My team has a bunch of testcases in separate directories. Many of these use simple bare metal executables, but some include Linux. I would like to adopt Buildroot, but keep testcase-specific bits (Linux config files, device trees, etc) in its own directory. At the same time, some components (e.g. test applications) should be shared across testcases. So I want to use BR2_EXTERNAL="/project/testcase /project/shared", but that doesn't seem to be possible right now...?

I believe I could relocate all these pieces out of the testcase directories into a parallel "layer" directory tree, but that doesn't match our workflow and would be fairly confusing (e.g. "to create a new testcase, first create the new testcase, then go over to a different directory tree and create the new testcase there too"). I think would make adopting Buildroot a tougher sell.

(I also think there's a little confusion about what "layer" means in the user manual, or at least I was confused. I expected "layer" to mean "a path which can be provided to BR2_EXTERNAL." However, reading closely, the user manual says "Each layer is typically embodied by a separate directory inside |board/<company>/|. Depending on your projects, you could even introduce more than two layers." So I think "layer" really means "directory inside the single BR2_EXTERNAL tree".)

-- 
Hollis Blanchard
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150717/cb54b965/attachment.html>
