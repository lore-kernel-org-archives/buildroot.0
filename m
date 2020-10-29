From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 29 Oct 2020 14:12:24 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
In-Reply-To: <7e-5f9abe80-1-60a72780@84134619>
References: <20201029135017.652486f7@windsurf.home>
 <7e-5f9abe80-1-60a72780@84134619>
Message-ID: <CAMRc=MdSUOZmkDqkBfVPp2H6n+J9RS8Y2aLtLjYiQn3_2sDN-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 29, 2020 at 2:06 PM Michael Nosthoff <buildroot@heine.tech> wrote:
>
> Hi,
>
> On Thursday, October 29, 2020 13:50 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> >
> > Hum, this is a bit annoying. And upstream is not willing to have proper
> > conditional logic to keep supporting kernels older than 5.5 ? 5.5 is
> > not that old, it seems odd to so quickly drop support. Even 5.4 is the
> > current LTS kernel !
>
> At least that's how I interpret this comment in the NEWS for 1.5 [0]:
>
> - added support for bias flags which are a new functionality first available in
>   linux v5.5; subsequently the library now requires v5.5 kernel headers to
>   build;
>
> But maybe Bartosz can clarify on this, as he basically is the "upstream" :)
>
>
> Regards,
> Michael
>
> [0] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS
>

Hi Thomas!

I don't want to have an ifdef hell in libgpiod depending on symbol
presence/kernel version. I much better prefer to support multiple
stable branches. v1.4.x will be supported for as long as linux v5.4 is
supported.

That being said: libgpiod only requires the v5.5 headers to build. It
will still work on older kernels unless someone uses features that
aren't supported.

Bartosz
