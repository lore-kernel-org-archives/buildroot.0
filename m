From: Christian Stewart <christian@paral.in>
Date: Tue, 18 Aug 2020 12:48:24 -0700
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: add support for
 aarch64 build
In-Reply-To: <20200818193338.GP24264@scaer>
References: <20200818191130.2888592-1-christian@paral.in>
 <20200818193338.GP24264@scaer>
Message-ID: <CA+h8R2oRLfVOG4m9_mbg_hHhZNxggQLZt_8JBTOL8poQwaP+DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Aug 18, 2020 at 12:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2020-08-18 12:11 -0700, Christian Stewart spake thusly:
> > Tested on Pi4 Model B (aarch64).
>
> There was previous proposal for this:
>
>     http://lists.busybox.net/pipermail/buildroot/2020-June/285000.html
>     http://lists.busybox.net/pipermail/buildroot/2020-January/271588.html
>
> where it wsa noticed and pointed out that not all libraries were
> installed for tghe 64-bit variants, and that parts of the 64-bit
> support even git reverted upstream:
>
>     https://github.com/raspberrypi/userland/commit/f97b1af1b3e653f9da2c1a3643479bfd469e3b74
>
> How does that patch address these issues?

I don't think this is relevant anymore.

In the userland commit you link just above, they disable some things
when targeting ARM64. We set ARM64 correctly in this patch with
-DARM64=ON if BR2_aarch64, so this addresses everything correctly.

Best,
Christian
