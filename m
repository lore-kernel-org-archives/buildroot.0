From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 16 Apr 2016 12:25:49 -0300
Subject: [Buildroot] [PATCH v3 0/4] Minnowboard: The grand unification
In-Reply-To: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <CAAEAJfCrVfTBBe02b3-QfdkZz+HMHgD03uDyPst+xfhbE_tjbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 April 2016 at 12:23, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> Following Arnout comments, here's a patchset that first unifies
> the Minnowboard board support, and then adds a "graphics &
> audio, yet minimum" defconfig.
>
> The idea with this graphical_defconfig is to provide an X-based
> system, with ALSA audio and OpenGL enabled, at its minimum
> expression.
>
> Regarding the Minnowboard board support unification, it's worth
> mentioning that it's possible to use the same kernel on both.
> However, a couple reasons made me retain the current choices:
>
>   * It is desirable to use upstream, when possible. Hence,
>     we use upstream v4.4 for the Minnowboard MAX.
>
>   * The original Minnowboard has some GPIO keys that are
>     not supported upstream. Using out-of-tree patches sucks
>     because we need to carry them over when bumping, so I
>     decided to just stick with the v3.8 yocto kernel.
>
> The only change on this v3, is the replacement of the cumbersome
> startx script (which was based on xinit's startx), with a simple
> script that merely calls xinit with a vt7 server argument.
>
> This is required for the X server to start, apparently due to
> a bug that prevents starting X on the controlling terminal.
> More details here: https://bugs.freedesktop.org/show_bug.cgi?id=87762
>

As an alternative path, we could introduce a login manager. Maybe using
something like "nodm" would be better in our case.

I'll do some tests with it and we'll see how it goes.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
