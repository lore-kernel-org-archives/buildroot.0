From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 26 Oct 2019 23:40:25 +0300
Subject: [Buildroot] [PATCH v4 1/1] package/uvw: new package
In-Reply-To: <20191026194317.1f32c85a@windsurf.home>
References: <20191026140204.14776-1-asafka7@gmail.com>
 <20191026194317.1f32c85a@windsurf.home>
Message-ID: <CALFsTFXm7CvseV6B0A56AgwM2VB4Mkz3pKy5B0f6uGAm4zQAXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Oct 26, 2019 at 8:43 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat, 26 Oct 2019 17:02:04 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > A header-only libuv wrapper in C++.
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> > v3->v4:
> >  * gcc 7.x is now OR'ed with NPTL and dynamic library.
> >  * use UVW_SUPPORTS_IN_SOURCE_BUILD = NO.
>
> This patch causes a Doxygen issue:
> http://autobuild.buildroot.net/results/9c6/9c61c06142c832a9669afdcafcbb8b1f7df51082/build-end.log
>
> Could you have a look?

Actually, this failure isn't related to Doxygen.
The problem occurs when CMake runs a simple threads test.
This seems to be fixed on a newer CMake version, as described in this issue:
https://gitlab.kitware.com/cmake/cmake/issues/16920
As a workaround, setting THREADS_PTHREAD_ARG to "2" on UVW_CONF_OPTS
does the job, but I wonder maybe we want to put it on toolchainfile.cmake,
as this can potentially happen in the future with other packages...

Do you have any thoughts regarding the correct solution?

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Asaf.
