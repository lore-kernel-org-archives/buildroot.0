From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 21 Apr 2017 10:19:26 +0200
Subject: [Buildroot] glmark2 regression on mx6
In-Reply-To: <CAOMZO5COcgkg7X1wpnqMfpD6=1YCqzmetMMCANrqbqA=a9moxA@mail.gmail.com>
References: <CAOMZO5COcgkg7X1wpnqMfpD6=1YCqzmetMMCANrqbqA=a9moxA@mail.gmail.com>
Message-ID: <CAAMH-yvDXjBz_PWh23SF1fb-vZHQK+r1zZqfXo-NFWNEby-DvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Fri, Apr 21, 2017 at 12:32 AM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Gary,
>
> I have just tested glmark2 with Buildroot master on imx6 and I got the
> following error:
>
> # glmark2-es2-drm
> ** Failed to set swap interval. Results may be bounded above by refresh rate.
> =======================================================
>     glmark2 2014.03
> =======================================================
>     OpenGL Information
>     GL_VENDOR:     etnaviv
>     GL_RENDERER:   Gallium 0.4 on Vivante GC2000 rev 5108
>     GL_VERSION:    OpenGL ES 2.0 Mesa 17.0.3

Never tried Mesa 17.0.3. What's the kernel version you're using?

> =======================================================
> ** Failed to set swap interval. Results may be bounded above by refresh rate.

That swap interval message I've seen in the past (and discarded it).

> [build] use-vbo=false:Segmentation fault

Segfault however I've never seen. Is kmscube running fine with this setup?

> Before I start investigating this problem, I would like to know if you
> have already seen this issue or if you have any suggestions.

Does this happen for each test? Have you tried specifying one test like:
glmark2-es2-drm -b desktop:effect=shadow:windows=4:shadow-size=5
glmark2-es2-drm -b jellyfish
glmark2-es2-drm -b ideas

Is the segfault happening on each example above?

Other than this I don't have much suggestion except asking on IRC
(#etnaviv), the channel is very active lately (Android work).

Regards,
Gary
