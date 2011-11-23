From: Tim Judd <tjudd2k@yahoo.com>
Date: Wed, 23 Nov 2011 14:38:27 -0800 (PST)
Subject: [Buildroot] a visit long ago
Message-ID: <1322087907.73142.YahooMailNeo@web161206.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone.


I've been working hard to try to get buildroot (current and past archive versions) to build me a firmware image for a little useless NAS now that I've gutted it.? It's a headless 486 (with very limited instruction or cpu set).? This is not the problem, I can get the userland to boot, once I solve the problem I'm writing to you about.

the OEM has kernel 2.6.19 installed.? Someone else has gotten 2.6.20.4 working with it too.? I'd rather stick with that genre of time for the kernel (planning to keep the kernel, just replace the userland since it's an OEM proprietary box).? Problem I'm repeatedly getting myself into is libc headers and redefines of functions.? This one is stumping me for answers.? Kernel 2.6.20 redefines getline() and the error thrown says /usr/lib/stdio.h previously defines getline and errors out.
? Where I'm confused is if "/usr...." is my host build environment stdlibc, or if it's uclibc during the build process.? How can I check/be sure?? I seem to haphazardly removing and adding packages to the host (and tried multiple hosts at that) to resolve these old legacy coding problems.? And hasn't solved them? :(



If, on the other hand, using kernel headers from something like 2.6.35 isn't going to give 2.6.19 or 2.6.20.4 problems, I can successfully compile the userland with the newer kernel/toolchain headers.



I'm baffled on how to keep the 2.6.19 (preferred) kernel (which has lots of OEM patches) with any userland that is sure not to give problems.? my small microtesting with kernel toolchain headers from 2.6.35 aren't giving kernel 2.6.19 problems but I am not at all versed with linuxisms to resolve this with my own limited knowledge.




thanks all,

?
--Tim
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111123/90fe9622/attachment.html>
