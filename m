From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 22:53:28 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/uvw: new package
In-Reply-To: <CALFsTFXm7CvseV6B0A56AgwM2VB4Mkz3pKy5B0f6uGAm4zQAXA@mail.gmail.com>
References: <20191026140204.14776-1-asafka7@gmail.com>
 <20191026194317.1f32c85a@windsurf.home>
 <CALFsTFXm7CvseV6B0A56AgwM2VB4Mkz3pKy5B0f6uGAm4zQAXA@mail.gmail.com>
Message-ID: <20191026225328.2fdecad3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 23:40:25 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Actually, this failure isn't related to Doxygen.
> The problem occurs when CMake runs a simple threads test.
> This seems to be fixed on a newer CMake version, as described in this issue:
> https://gitlab.kitware.com/cmake/cmake/issues/16920
> As a workaround, setting THREADS_PTHREAD_ARG to "2" on UVW_CONF_OPTS
> does the job, but I wonder maybe we want to put it on toolchainfile.cmake,
> as this can potentially happen in the future with other packages...
> 
> Do you have any thoughts regarding the correct solution?

We have numerous packages that do this:

# The following CMake variable disables a TRY_RUN call in the -pthread
# test which is not allowed when cross-compiling.
EXIV2_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

would that help for this package as well ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
