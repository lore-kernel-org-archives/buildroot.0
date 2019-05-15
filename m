From: Stefano Guandalini <guandalf@gmail.com>
Date: Wed, 15 May 2019 03:51:41 -0700
Subject: [Buildroot] Npm install fails if package ships precompiled binaries
Message-ID: <CAH7nf8mdxiq2962Lch1xrkhpHms1nhoL+jXQNo22rYu6JPhttQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm building an image for raspberrypi3 containing nodejs and the "stf" npm
package.
The npm install phase completes correctly but then the check step
introduced by this commit:
https://git.busybox.net/buildroot/commit/?id=bbb7f6c16cd5ff04ec9b78713f42ea53a940529f
stops the build with errors like:
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/arm64-v8a/minirev" is "AArch64",
should be "ARM"

I temporarily solved the issue commenting out the check, provided that I
know stf is the only package I'm installing, but I thing there could be a
safer way to perform this step.

What do you think?

Thank you.



Stefano Guandalini
about.me/guandalf
[image: Stefano Guandalini on about.me]
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190515/aa2cd9f0/attachment.html>
