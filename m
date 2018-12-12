From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 12 Dec 2018 10:30:26 +0100
Subject: [Buildroot] [PATCH v2 3/5] optee-benchmark: new package
In-Reply-To: <20181210225955.589c8f58@windsurf>
References: <1542990817-28362-1-git-send-email-etienne.carriere@linaro.org>
 <1542990817-28362-3-git-send-email-etienne.carriere@linaro.org>
 <20181210225955.589c8f58@windsurf>
Message-ID: <CAN5uoS_Kb4=ScfmOHLSHXUe_7cmwKro1t0z7DTO+hdgVSm59dA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Dec 2018 at 22:59, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Etienne,
>
> On Fri, 23 Nov 2018 17:33:35 +0100, Etienne Carriere wrote:
> > OP-TEE performance benchmark tools for the OP-TEE project.
> >
> > This packages generates embedded Linux based OS materials used
> > to retrieve execution timing information on invocation of the
> > OP-TEE secure services.
> >
> > It is added next to the OP-TEE client package in BR configuration.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>
> Thanks. I have pretty much the same comments as for PATCH 2/5 on
> optee-client, so if you could apply the same logic to this PATCH 3/5,

Indeed I will, thanks.

> it would be nice. A few other things though.
>
> >  package/Config.in                            |  1 +
> >  package/optee-benchmark/Config.in            | 69 ++++++++++++++++++++++++++++
> >  package/optee-benchmark/optee-benchmark.hash |  2 +
> >  package/optee-benchmark/optee-benchmark.mk   | 22 +++++++++
> >  4 files changed, 94 insertions(+)
>
> Please add an entry in the DEVELOPERS file (it should be done in each
> patch for the package being added by that patch).
>
> > diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
> > new file mode 100644
> > index 0000000..2d56a7e
> > --- /dev/null
> > +++ b/package/optee-benchmark/Config.in
> > @@ -0,0 +1,69 @@
> > +config BR2_PACKAGE_OPTEE_BENCHMARK
> > +     bool "Embed OP-TEE benchmark support"
> > +     select BR2_PACKAGE_OPTEE_CLIENT
> > +     select BR2_PACKAGE_LIBYAML
> > +     help
> > +       Enable the OP-TEE benchmark package that brings facilities
> > +       for profiling traversal and execution timings when
> > +       invoking OP-TEE. OP-TEE benchmark is a component delivered
> > +       by the OP-TEE project.
> > +
> > +       http://github.com/linaro-swg/optee_benchmark
> > +
> > +if BR2_PACKAGE_OPTEE_BENCHMARK
> > +
> > +choice
> > +     prompt "OP-TEE Benchmark version"
> > +     default BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
> > +     help
> > +       Select the version of OP-TEE benchmark you want to use
> > +
> > +config BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
> > +     bool "sync with latest release tag"
> > +     help
> > +       Sync on latest release tag. This currently fetches the
> > +       latest registered release tag from the OP-TEE official
> > +       Git repository.
> > +
> > +config BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_GIT
> > +     bool "sync with a specific Git"
> > +     help
> > +       Sync with a specific OP-TEE Git repository.
>
> Do we really need all this version customization stuff for
> optee-benchmark ? I doubt it is needed. Buildroot generally doesn't
> provide a version selection, except for highly HW-specific packages
> (kernel, bootloaders, firmware, etc.).

Ok fine, let's default supporta single version and only from the
official Git repo.

regards,
etienne

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
