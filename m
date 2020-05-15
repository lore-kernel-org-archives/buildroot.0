From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 May 2020 19:30:02 -0500
Subject: [Buildroot] [PATCH 3/3 v2] package/lmod: add compression
 support for the host variant
In-Reply-To: <d66d07fe82ae1c515eb9a010f1df2cbcc10f1a87.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
 <d66d07fe82ae1c515eb9a010f1df2cbcc10f1a87.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpY_oNCXrq=vT6XQMRB6n_mH69vExO8nay2dX=V1qLjRSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,



On Sun, May 3, 2020 at 8:14 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> The kernel may install compressed modules. At the end of the buid, we
> then run depmod, to generate modules.dep and a few assorted files, so
> that loadign modules works properly on the target (loading by alias,
> loading dependencies...)
>
> However, depmod needs support for compressed modules, or it would
> generate empty modules.dep et al.
>
> Systematically adding support for gz and xz, and the required deps, was
> deemed too much of a burden [0], so we add too options to enable either
> or both compression.
>
> [0] http://lists.busybox.net/pipermail/buildroot/2018-April/218410.html
>
> Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Lucian Buga <lucianbuga@gmail.com>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
