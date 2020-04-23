From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 23 Apr 2020 08:55:14 +0200
Subject: [Buildroot] [PATCH 6/8] package/python3-pyyaml: add special
 host variant
In-Reply-To: <CAMQcK5K=okZopvaBnQ7aKnSodBpaoOdgumTP3to0+-K_gzEdBw@mail.gmail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-6-yegorslists@googlemail.com>
 <CAMQcK5K=okZopvaBnQ7aKnSodBpaoOdgumTP3to0+-K_gzEdBw@mail.gmail.com>
Message-ID: <CAGm1_ksyG7fEdwCYv_hxesdJtKcbX1Zj8EN_uqOLWhA6t6wUWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Tue, Apr 21, 2020 at 10:00 PM Ryan Barnett <ryan.barnett@collins.com> wrote:
>
> Yegor,
>
> I've been working on testing that your patch series builds/works to
> fix the issue with MongoDB not compiling with Buildroot 2020.02.
> Please see my feedback in regards to your current patch set below:
>
> On Mon, Mar 23, 2020 at 5:50 AM <yegorslists@googlemail.com> wrote:
> >
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Needed to build mongodb.
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/python3-pyyaml/python3-pyyaml.hash |  1 +
> >  package/python3-pyyaml/python3-pyyaml.mk   | 20 ++++++++++++++++++++
> >  2 files changed, 21 insertions(+)
> >  create mode 120000 package/python3-pyyaml/python3-pyyaml.hash
> >  create mode 100644 package/python3-pyyaml/python3-pyyaml.mk
> >
> > diff --git a/package/python3-pyyaml/python3-pyyaml.hash b/package/python3-pyyaml/python3-pyyaml.hash
> > new file mode 120000
> > index 0000000000..afa4932ecb
> > --- /dev/null
> > +++ b/package/python3-pyyaml/python3-pyyaml.hash
> > @@ -0,0 +1 @@
> > +../python-pyyaml/python-pyyaml.hash
> > \ No newline at end of file
> > diff --git a/package/python3-pyyaml/python3-pyyaml.mk b/package/python3-pyyaml/python3-pyyaml.mk
> > new file mode 100644
> > index 0000000000..3026135fca
> > --- /dev/null
> > +++ b/package/python3-pyyaml/python3-pyyaml.mk
> > @@ -0,0 +1,20 @@
> > +################################################################################
> > +#
> > +# python3-pyyaml
> > +#
> > +################################################################################
> > +
> > +# Please keep in sync with
> > +# package/python-pyyaml/python-pyyaml.mk
> > +PYTHON3_PYYAML_VERSION = 5.3
>
> This currently does not work as python-pyyaml has been bumped to version 5.3.1.
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20200326100404.82191-1-james.hilliard1 at gmail.com/
>
> Changing version to 5.3.1 fixes this.

Thanks for your feedback and testing. The problem is, there is still
no agreement on how to proceed. One way is to create python3-*
packages and the other is to remove Python2 support (see comments to
my patch [1]).

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200323104909.16765-3-yegorslists at googlemail.com/

Regards,
Yegor
