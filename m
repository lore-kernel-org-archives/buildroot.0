From: Jeroen Roovers <jer@airfi.aero>
Date: Tue, 1 Nov 2016 11:49:19 +0100
Subject: [Buildroot] buildroot and SELinux
In-Reply-To: <CAF_dkJDYo2pxYTYojvOiUcCw0p6dV46_H6C4s6GVm2-nR+wqRw@mail.gmail.com>
References: <CAF_dkJDYo2pxYTYojvOiUcCw0p6dV46_H6C4s6GVm2-nR+wqRw@mail.gmail.com>
Message-ID: <CANCHnQph3GgcJdrozS0g52E9k+OQ1trWtZ3kWvsM2rMDFFbr7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31 October 2016 at 16:33, Patrick Doyle <wpdster@gmail.com> wrote:
> I'm not sure if SELinux is the right answer to my question(*), but
> assuming that it is... how well do buildroot and SELinux play
> together?  I found an email thread from 2013 where Clayton Shotwell
> and Tomas Patazzoni were discussing rolling SELinux into buildroot.
> And I see configuration items related to that now.

SELinux works absolutely fine for me. But I don't think it's the best
answer to your question.

> (*) and my real question is: can I use SELinux to make a binary
> executable, but unreadable by anybody, including root?  An ancillary
> question would be, if that executable were included as part of the
> CRAMFS rootfs built into the kernel, how would I set the the
> attributes for that executable at buildtime to achieve this
> executable-but-not-readable state?

You could simply ensure that the up and running userland can't read
the file, possibly by excluding userland support for reading cramfs or
whatever filesystem you choose, so that only the kernel can read it at
boot time, and then removing (rm) the file from the ramdisk during
boot up and after you've used it.

Doing this with SELinux would require you to build a policy for that
file so that its execution is only allowed in specific security
contexts.


Regards,
     jer
