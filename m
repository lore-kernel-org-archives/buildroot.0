From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Jun 2012 21:27:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] libplayer: fix cflags
In-Reply-To: <87wr3ehq6p.fsf@macbook.be.48ers.dk>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
 <1339328813-6269-2-git-send-email-s.martin49@gmail.com>
 <87wr3ehq6p.fsf@macbook.be.48ers.dk>
Message-ID: <CAHXCMMJmA3AzTyMmzB26EM5gnA-xMpwAhTNxoehsgNTbrr5+bA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/6/10 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
> ?Samuel> Explicitly run pkg-config to add some include directories to the cflags
> ?Samuel> when gstreamer support is enabled.
>
> ?Samuel> This patch fixes the following unfound headers:
> ?Samuel> - glib.h
> ?Samuel> - glibconfig.h
> ?Samuel> - gst/gst.h
>
> What problem is this solving exactly? I don't recall seeing any failures
> on the autobuilders, and host-pkg-config + libglib2 are already
> dependencies of gstreamer, so it shouldn't be needed to list them
> explicitly.
hum... the problem was not found headers (the 3 mentioned above), but
actually this seems to be caused by a dirty work tree/build and
staging directories...
A git clean -fdx and a build from scratch fix it.

So, forget about this patch.

Apologize for the noise.


-- 
Sam
