From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 5 Dec 2019 15:55:23 -0600
Subject: [Buildroot] [PATCH 1/2] package/pkg-python: use
 HOST_CONFIGURE_OPTS for distutils
In-Reply-To: <67664440-bebe-d2c2-fd21-a88353ace045@mind.be>
References: <20191111140643.2629-1-ryan.barnett@rockwellcollins.com>
 <CAMQcK5JFGOpe+=7fxq5cr7BVG9aiDjsEAVRgBq19-Zcxjgg7ow@mail.gmail.com>
 <67664440-bebe-d2c2-fd21-a88353ace045@mind.be>
Message-ID: <CAMQcK5+sdVe7zOuPccasw1HMsBKzvqfUajemB9t5NXwcpOV+=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, Dec 5, 2019 at 3:45 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On 04/12/2019 15:12, Ryan Barnett wrote:
> > On Mon, Nov 11, 2019 at 8:06 AM Ryan Barnett
> > <ryan.barnett@rockwellcollins.com> wrote:
> >>
> >> When building host python packages, we need to ensure that distutils
> >> package types utilize HOST_CONFIGURE_OPTS. This ensures that the
> >> correct linker and compiler environment variables are set to compile
> >> utilizing the host directory.
> >>
> >> It was discovered that when compiling a host-python package, it was
> >> using linking against the build machines library folder instead of the
> >> host folder because LDFLAGS was not properly set and was improperly
> >> detecting whether or not a shared or static library was present in the
> >> host folder.
> >
> > Is there any feedback on this approach to compiling a host python
> > distutils packages?
>
>  As such it seems like the right thing to do. However, it makes me wonder
>
> - why this is not needed for setuptools;
>
> - why we don't pass TARGET_CONFIGURE_OPTS in the environment for the target.

I will send a v2 where I combine the passing
{TARGET|HOST}_CONFIGURE_OPTS into their respective environments. I
will also send changing of the setuptools package type as well.

I'm not familiar with the setuptools build method for building with
python but I would image that it doesn't hurt to pass _CONFIGURE_OPTS
in the environment.

Thanks,
-Ryan
