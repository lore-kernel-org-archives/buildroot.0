From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 8 Nov 2015 13:30:45 +0000
Subject: [Buildroot] [PATCH 2/2] libtirpc: bump to version 1.0.1
In-Reply-To: <1446712210-14129-3-git-send-email-peda@lysator.liu.se>
References: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
 <1446712210-14129-3-git-send-email-peda@lysator.liu.se>
Message-ID: <CA+BsyQ7XEwj_dLa=H6Yt+rWQMh3rOvH7Bhr=BfWNNkMmVbfnuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 November 2015 at 08:30, Peter Rosin <peda@lysator.liu.se> wrote:
> From: Peter Rosin <peda@axentia.se>
>
> Adjust patch 0001 to trivial changes.
> Adjust patch 0007 to remove new DES things.
> Add patch 0008 directly from upstream to fix a late problem in the
> 1.0.1 release.

Thomas, Peter,

FYI the new 1.0.1 version of libtirpc contains my patch to remove the
calls to atomic operations that were causing a lot of autobuild
failures on SPARC (and probably some other lesser-used arches too).
Took a bit of negotiation to get the patch into a form they were happy
to accept, but we got there in the end.

So when the bump to 1.0.1 goes in we can expect this class of
autobuild issues to go away.

regards

Brendan
