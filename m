From: Scott Fan <fancp2007@gmail.com>
Date: Mon, 31 Aug 2015 00:13:34 +0800
Subject: [Buildroot] [PATCH v2 4/4] cubieboard: [PATCH] ipconfig: add
 nameserver IPs to kernel-parameter ip=
In-Reply-To: <20150829232921.2dd013ab@free-electrons.com>
References: <1438067769-10254-1-git-send-email-fancp2007@gmail.com>
 <1438067769-10254-4-git-send-email-fancp2007@gmail.com>
 <20150829232921.2dd013ab@free-electrons.com>
Message-ID: <CAFkzVZbOsLLTx=SC4j_Ow=vgqz+zWBbZNNwtokES_V=GUQFocg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

I know your means, you are correct, i think.

Thanks for your explanation.

Scott Fan

On Sun, Aug 30, 2015 at 5:29 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Scott Fan,
>
> On Tue, 28 Jul 2015 15:16:09 +0800, Scott Fan wrote:
> > Signed-off-by: Scott Fan <fancp2007@gmail.com>
> > ---
> >  .../5e953778a2aab04929a5e7b69f53dc26e39b079e.patch | 133
> +++++++++++++++++++++
> >  configs/cubieboard2_defconfig                      |   1 +
> >  configs/cubieboard_defconfig                       |   1 +
> >  configs/cubietruck_defconfig                       |   1 +
> >  4 files changed, 136 insertions(+)
> >  create mode 100644
> board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch
>
> Thanks for this patch. It is indeed the backport of an upstream kernel
> patch. But if we go down the road of backporting patches adding new
> features to the kernel for each platform, it's going to be a never
> ending story. You are interested by nameserver configuration in ip=,
> but the next Buildroot user will want this other backported patch. This
> is not manageable I believe.
>
> So, I would suggest that you keep this backported patch in your
> project-specific customization. You can use BR2_GLOBAL_PATCH_DIR to
> point to a place outside of the Buildroot sources, and store your
> custom patches here.
>
> Consequently, I will mark your patch as "Rejected" in our patch
> tracking system.
>
> Thanks again!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150831/df30a53e/attachment.html>
