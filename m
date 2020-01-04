From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 4 Jan 2020 13:28:42 +0100
Subject: [Buildroot] [PATCH 07/11] support/scripts/pkg-stats: store
 dependencies of package
In-Reply-To: <20200104103936.06a7a228@windsurf>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-8-heiko.thiery@gmail.com>
 <20200103162941.6b428eec@windsurf>
 <CAEyMn7YhmtuRSfZscUqyNm7wEWcye5x9YZO=5T8VPPzbEBuErQ@mail.gmail.com>
 <20200104103936.06a7a228@windsurf>
Message-ID: <CAEyMn7aE2y0HZb59b9GemwXUdvWv+ZKjTMCpuQKjZjKnf7C2-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Am Sa., 4. Jan. 2020 um 10:39 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Fri, 3 Jan 2020 17:39:13 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Thought it is a good idea because I saw that on the
> > https://layers.openembedded.org/layerindex/recipe/45257/. They also
> > show the dependencies with a note that this can differ dependent on
> > the real used configuration. But if you think it is too confusing I
> > can drop that.
>
> Don't get me wrong, it would be nice to have the dependencies of
> packages, but it is simply not possible.
>
> Consider a package like this:
>
> FOO_DEPENDENCIES = bar baz
>
> ifeq ($(BR2_PACKAGE_LIBPNG),y)
> FOO_DEPENDENCIES += libpng
> endif
>
> If you run "make VARS=FOO_DEPENDENCIES printvars" with no Buildroot
> configuration defined, or with a Buildroot configuration defined that
> has the libpng package disabled, it will return:
>
> FOO_DEPENDENCIES=bar baz
>
> If however, you run the same command with a Buildroot configuration
> defined that has the libpng package enabled, it will return:
>
> FOO_DEPENDENCIES=bar baz libpng
>
> So as you can see, there is nothing like "the list of all dependencies
> of a package" that you can get with printvars. Lots of dependencies are
> optional. Some are even conflicting, like a package can depend on A
> *or* B, but not both. Etc.
>
> This is why I think it is not a good idea to show those dependencies,
> because they simply cannot be correct "in general": they can only be
> correct within the context of a particular Buildroot configuration.

It is no problem for ... Just thought it is a good idea. but I will drop that

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
