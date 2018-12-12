From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Wed, 12 Dec 2018 12:17:39 -0700
Subject: [Buildroot] [PATCH v2 01/14] fftw: breaks fftw-single into a
 dedicated package
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <CA+1k=2YyGizHcRfbU7kF=nNxzQ6SG0-T3wpjS9p4Y6scXRj2QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 12, 2018 at 12:45 AM Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
>
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> fftw's library name depends on the precision option. Consequently,
> it's possible to install multiple flavor on the same target.
>
> This patch breaks fftw single precision into a new package and:
> - deprecates BR2_PACKAGE_FFTW_PRECISION_SINGLE, BR2_PACKAGE_FFTW_SINGLE must be
>   used instead;
> - suppress BR2_PACKAGE_FFTW_USE_SSE and BR2_PACKAGE_FFTW_USE_NEON since options
>   are only available on single precision. Corresponding options are directly
>   handled in fftw-single package;
> - do fftw depends on fftw-single when this package is enabled.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

Testing: compile-tested all the permutations of enabling/disabling
fftw-single, fftw-double, and fftw-long-double on an aarch64 build (so
no fftw-quad available)

Thanks for your work on this patch series, Gwenhael!  I ran into this
awhile back, where I noticed I could only select one FFTW build, and I
had some issues with liquid-dsp depending on which one was selected.
I decided to just pick the one option that worked even though I would
have liked to have another available. I was too busy at the time to
spend time trying to fix it.
