From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 7 Jan 2020 22:46:15 +0530
Subject: [Buildroot] [PATCH v5 2/2] package/python-scipy: new package
In-Reply-To: <20190930084326.4414-2-esben@geanix.com>
References: <20190930084326.4414-1-esben@geanix.com>
 <20190930084326.4414-2-esben@geanix.com>
Message-ID: <CAMty3ZCObAUJ+j1zfKdNUvmwsYkCHdy5LPi8iuDKdQQ_bsMKbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 30, 2019 at 2:13 PM Esben Haabendal <esben@geanix.com> wrote:
>
> See http://scipy.github.io/devdocs/building/linux.html
> for SciPy build requirements:
>
>     * BLAS and LAPACK libraries
>     * C and Fortran compilers
>     * Python header files
>     * Cython compiler
>
> For now, clapack package is used to provide both BLAS and LAPACK libraries, as
> that is what is supported by the current python-numpy recipe which
> python-scipy depends on.
>
> With additional work, it should be possible to improve both python-numpy and
> python-scipy to support other BLAS and LAPACK library implementations, but it
> is probably best to keep such changes aligned.
>
> A site.cfg file is used to configure numpy distutils extension to find include
> files and libraries in stagging.
>
> Note, host-python-numpy is needed in order to use numpy distutils extension
> from it.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

Thanks for the great work.

Tested the build via arm64 configuration and verified import in sample
python test.

Tested-by: Jagan Teki <jagan@amarulasolutions.com>
