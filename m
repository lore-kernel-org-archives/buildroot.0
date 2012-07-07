From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 7 Jul 2012 23:18:34 +0200
Subject: [Buildroot] [PATCH v2] Make external toolchain relocatable
In-Reply-To: <1341087767-20528-1-git-send-email-arnout@mind.be>
References: <1341087767-20528-1-git-send-email-arnout@mind.be>
Message-ID: <CAHXCMMKEWFS82V0wGLGD4Le66zKzGHs2UHd2bzxEvwU7bPbo3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

2012/6/30 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>:
> The external toolchain wrapper sets sysroot etc. to an absolute path.
> By changing this to a relative path, it is possible to move the host
> directory to a different location and still have a working build
> system.

I've just tested your patch on top of my branch, it seems working well
but doesn't do all the job.
You have probably focused on the wrapper code and forgot to update
target of the symlinks of all other tools, pointing to the relative
location of them instead of the absolute one.


> This only works for a downloaded external toolchain.  For a pre-installed
> external toolchain, it is possible to move the host directory to a
> different location, but not the external toolchain directory (it does work
> if the external toolchain directory lies within the host directory).  For
> an internal or crosstool-ng toolchain, there is no wrapper so updating the
> sysroot path should be done in a different way.

For internal and crosstool-ng toolchains, I think if we want to ensure
the tools are called with the correct sysroot argument, tehn we should
use  the wrapper too.
Unless someone is confident enough to patch gcc sources to compute
sysroot path in the same way the wrapper does; it looks like, even
CodeSourcery guys didn't! ;-)


Cheers,

-- 
Sam
