From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 21 Apr 2017 10:58:56 -0300
Subject: [Buildroot] glmark2 regression on mx6
In-Reply-To: <CAAMH-yvDXjBz_PWh23SF1fb-vZHQK+r1zZqfXo-NFWNEby-DvA@mail.gmail.com>
References: <CAOMZO5COcgkg7X1wpnqMfpD6=1YCqzmetMMCANrqbqA=a9moxA@mail.gmail.com>
 <CAAMH-yvDXjBz_PWh23SF1fb-vZHQK+r1zZqfXo-NFWNEby-DvA@mail.gmail.com>
Message-ID: <CAOMZO5AyBmD+hmVGFf+PxT5girPaK13xOtKyj1W5XWPoQtAJ5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Fri, Apr 21, 2017 at 5:19 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Never tried Mesa 17.0.3. What's the kernel version you're using?

Also tried Mesa 17.0.4 with the same result.

Tested kernels 4.9, 4.10 and 4.11-rc and the glmark2 segfault always happen.

>
>> =======================================================
>> ** Failed to set swap interval. Results may be bounded above by refresh rate.
>
> That swap interval message I've seen in the past (and discarded it).
>
>> [build] use-vbo=false:Segmentation fault
>
> Segfault however I've never seen. Is kmscube running fine with this setup?
>
>> Before I start investigating this problem, I would like to know if you
>> have already seen this issue or if you have any suggestions.
>
> Does this happen for each test? Have you tried specifying one test like:
> glmark2-es2-drm -b desktop:effect=shadow:windows=4:shadow-size=5
> glmark2-es2-drm -b jellyfish
> glmark2-es2-drm -b ideas
>
> Is the segfault happening on each example above?

Yes, it happens in all of these examples as well.

In the last case there is also some warnings before the segfault:

# glmark2-es2-drm -b ideas
** Failed to set swap interval. Results may be bounded above by refresh rate.
=======================================================
    glmark2 2014.03
=======================================================
    OpenGL Information
    GL_VENDOR:     etnaviv
    GL_RENDERER:   Gallium 0.4 on Vivante GC2000 rev 5108
    GL_VERSION:    OpenGL ES 2.0 Mesa 17.0.4
=======================================================
** Failed to set swap interval. Results may be bounded above by refresh rate.
[ideas] <default>:[   79.619057] etnaviv-gpu 130000.gpu: hangcheck
detected gpu lockup!
[   79.625325] etnaviv-gpu 130000.gpu:      completed fence: 61
[   79.631058] etnaviv-gpu 130000.gpu:      active fence: 62
[   79.637492] etnaviv-gpu 130000.gpu: hangcheck recover!
[   83.116894] etnaviv-gpu 130000.gpu: hangcheck detected gpu lockup!
[   83.123160] etnaviv-gpu 130000.gpu:      completed fence: 62
[   83.128892] etnaviv-gpu 130000.gpu:      active fence: 63
[   83.134440] etnaviv-gpu 130000.gpu: hangcheck recover!
Segmentation fault

> Other than this I don't have much suggestion except asking on IRC
> (#etnaviv), the channel is very active lately (Android work).

Will report to the etnaviv folks, thanks.
