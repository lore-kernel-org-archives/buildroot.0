From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Mar 2015 23:47:47 +0100
Subject: [Buildroot] [PATCH 09/14 v6] package/nvidia-driver: add
 NVidia's OpenGL binary blob
In-Reply-To: <20150221183902.7a37db02@free-electrons.com>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
 <74d12982c60d0c697e816489109c038ebf86b4e1.1422055104.git.yann.morin.1998@free.fr>
 <20150221183902.7a37db02@free-electrons.com>
Message-ID: <20150306224747.GC4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-21 18:39 +0100, Thomas Petazzoni spake thusly:
> On Sat, 24 Jan 2015 00:24:38 +0100, Yann E. MORIN wrote:
> > This patch only adds the userland part. Unless other such other packages
> > (which we named like: rpi-userland), we do not replicate this naming
> > scheme with this package, as a future patch will also enable building
> > the kernel part of the driver. So, it is better to just name that
> > package with -driver, rather than with -userland and renaming it
> > afterwards.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I've applied to next, after doing some changes:
[--SNIP--]
> However, one thing that I find a bit unclear and that might need
> improvement is that you are making this package depend on X.org while
> it does provide an EGL implementation. So you install the 36 MB
> libnvidia-eglcore.so.346.35 unconditionally, even though I believe it's
> probably unused when X.org is used.
> 
> Same for libGLES: do we really need to install both libGL and libGLES ?
> Though I agree libGLES* are very small.

Well, I just did reproduce what the standard install procedure of the
package does: it installs everything. Agreed, I did not even try to
think those things apart.

> So I believe at least the EGL stuff should be separated out: either you
> do X.org, or you do EGL. But I don't think both can be used at the same
> time. Doing this would allow to drastically cut the installed size of
> this huge package.

Well, it is indeed quite huge, but also consider the type of systems it
is supposed to run on: desktop-class machines. The only embedded-class
board I know of that has an NVidia GPU is the newly introduced Jetson
TK1, and it has 16GiB of on-board eMMC...

> So now, the diff of the changes I made:

Thanks for this cleanup pass! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
