From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Jul 2021 23:36:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/tftpd: fix static build
In-Reply-To: <20210716232144.7a9d3371@windsurf>
References: <20210710084313.893425-1-fontaine.fabrice@gmail.com>
 <20210716232144.7a9d3371@windsurf>
Message-ID: <CAPi7W83fQbvzDfFGDMN4zh-VjfUCUZqQt2z_84Xe52-T_j3-oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Le ven. 16 juil. 2021 ? 23:21, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Sat, 10 Jul 2021 10:43:13 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/913e8b75422c8beba60df5ea2e2c9e431364566e
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../0002-__progname-is-provided-by-libc.patch | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 package/tftpd/0002-__progname-is-provided-by-libc.patch
>
> Thanks for the patch. However as usual, the question is: why is this
> suddenly happening? There hasn't been any recent update to the tftpd
> package, so why are we seeing this now? Or this an old issue we had
> never fixed?
I don't know why this is suddenly happening perhaps this is related to
a specific uclibc configuration or bug.
I know that uclibc does not always define __progname and had some bugs
in the past, for example
https://github.com/wbx-github/uclibc-ng/commit/64a2e37a0edd0b6fadb734b98eb0d828240d485d

However, given that this is an upstream commit that was applied 7
years ago, I think it is pretty safe to apply it to LTS.
>
> All this investigation is necessary to know if the fix is needed on our
> LTS branch.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
