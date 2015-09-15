From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 16 Sep 2015 09:54:37 +1200
Subject: [Buildroot] [PATCHv2] micropython: new package
In-Reply-To: <1442275305-10690-1-git-send-email-judge.packham@gmail.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
 <1442275305-10690-1-git-send-email-judge.packham@gmail.com>
Message-ID: <CAFOYHZBmchw4SpcVDLGnM4TfYrsSHN2-OHRHQyR=FpHXziYu=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 15, 2015 at 12:01 PM, Chris Packham <judge.packham@gmail.com> wrote:
> Micro Python is a lean and fast implementation of the Python 3
> programming language that is optimised to run on a microcontroller.
>
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>
> Hi Buildroot,
>
> Thought you might be interested in mircopython a minimal python 3
> implementation. It's designed for micro controllers but is also well suited
> to other general purpose embedded CPUs.
>
> Cheers,
> Chris
>
> Changes since v1:
> - Add dependency on host-pkgconf.
> - Use $(TARGET_MAKE_ENV) in make invocation for micropython
>   (micropython-lib doesn't need it because it doesn't use anything setup by
>   it).
> - Override PREFIX to install to /usr/bin instead of /usr/local/bin
> - Update/add some comments.
>
<snip>

I'll send a v3 mopping up the additional comments at some point.

One issue I am facing is that the build process for micropython ties
into git to generate it's version string which works when built from a
clone of the micropython git repo. But when run via buildroot it ends
up getting the version based on the buildroot git repo so the version
number displayed is 2015.10-... instead of 1.4.5. I'll do some
investigation to see if I can override the automatic logic but I was
wondering if there are any other packages with similar problems and
how they were addressed.
