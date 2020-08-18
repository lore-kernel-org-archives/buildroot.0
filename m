From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2020 22:16:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: add support for
 aarch64 build
In-Reply-To: <CA+h8R2oRLfVOG4m9_mbg_hHhZNxggQLZt_8JBTOL8poQwaP+DQ@mail.gmail.com>
References: <20200818191130.2888592-1-christian@paral.in>
 <20200818193338.GP24264@scaer>
 <CA+h8R2oRLfVOG4m9_mbg_hHhZNxggQLZt_8JBTOL8poQwaP+DQ@mail.gmail.com>
Message-ID: <20200818201612.GR24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian., All,

On 2020-08-18 12:48 -0700, Christian Stewart spake thusly:
> On Tue, Aug 18, 2020 at 12:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2020-08-18 12:11 -0700, Christian Stewart spake thusly:
> > > Tested on Pi4 Model B (aarch64).
> >
> > There was previous proposal for this:
> >
> >     http://lists.busybox.net/pipermail/buildroot/2020-June/285000.html
> >     http://lists.busybox.net/pipermail/buildroot/2020-January/271588.html
> >
> > where it wsa noticed and pointed out that not all libraries were
> > installed for tghe 64-bit variants, and that parts of the 64-bit
> > support even git reverted upstream:
> >
> >     https://github.com/raspberrypi/userland/commit/f97b1af1b3e653f9da2c1a3643479bfd469e3b74
> >
> > How does that patch address these issues?
> 
> I don't think this is relevant anymore.
> 
> In the userland commit you link just above, they disable some things
> when targeting ARM64. We set ARM64 correctly in this patch with
> -DARM64=ON if BR2_aarch64, so this addresses everything correctly.

So, this would, amongst others, not build:

  - MMAL, so no low-level programming,

  - interface/khronos, so no OpenGL EGL/GLES, no OpenVG,

  - middleware/openmaxil, so no OpenMAX

Unless I'm missing something non-obvious, I do not see how that can be
irrelevant...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
