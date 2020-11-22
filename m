From: Christian Stewart <christian@paral.in>
Date: Sat, 21 Nov 2020 22:08:55 -0800
Subject: [Buildroot] [PATCH next 06/12] package/tinifier: new package
In-Reply-To: <20201121180418.GP771438@scaer>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-7-thomas.petazzoni@bootlin.com>
 <CALq67GDBMGctf5xsftX+nWfn8e7arP_1XN5S2Amt9h9nE-H2pQ@mail.gmail.com>
 <20201121180418.GP771438@scaer>
Message-ID: <CA+h8R2pMyptpELtQrtxtCN2W+s=zU_rwyYPOLrApotqD1AgCeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Sat, Nov 21, 2020 at 10:04 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > I took a look at the legal-info side in regards to downloading
> > packages with the post-processing support. This has been discussed
> > previously on the patch "[v3,09/10] package/ripgrep: add legal-info
> > for dependencies":
> >
> > https://patchwork.ozlabs.org/project/buildroot/patch/20200220160119.3407-9-patrick.havelange at essensium.com/
>
> legal-info is also something Thomas and I discussed and IRC when he
> posted his series.
>
> We know it is not perfect, but this can be extended in a followup
> series.

> > I understand add/showing these license and how to exactly handle this
> > are future additions.
>
> My idea is that the go/cargo/... infras would be responsible for
> providing "some kind of" post-legal-info hooks, so they can extend the
> licenses list and license files list as well.
>
> But really, I would like to make that a next step, so that the technical
> side of the support for package managers can get in sooner rather than
> later.
>
> If we can not in the end come up woth a satifying licensing report for
> those (or for some of those) package managers, we would at least have
> support for building them.
>
> FTR, Thomas and I already adressed that issue quite a while ago, and we
> concluded that it was not so obvious as one may initially think (I'd
> have to dig my IRC logs to find the explanations...)

If you're open to building + running host Go code as part of this
process, then it is straightforward to extract the module dependency
graph and the Licenses.

If we're doing this bash + makefile purism, then this is definitely not easy.

Best,
Christian
