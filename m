From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Wed, 12 Dec 2018 12:22:21 -0700
Subject: [Buildroot] [PATCH v2 04/14] fftw: breaks fftw-double into a
 dedicated package
In-Reply-To: <20181212074539.11656-4-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
 <20181212074539.11656-4-gwenj@trabucayre.com>
Message-ID: <CA+1k=2ZLyABj2X7GJiymV=ZyqG5R3ncOC9kMAtDR1_LjC9RAOg@mail.gmail.com>
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
> This patch breaks fftw double precision into a new package and:
> - deprecates BR2_PACKAGE_FFTW_PRECISION_DOUBLE, BR2_PACKAGE_FFTW_DOUBLE must be
>   used instead;
> - suppress BR2_PACKAGE_FFTW_USE_SSE2 since option is only available on single and
>   double precision. Corresponding options are directly
>   handled in fftw-double package;
> - do fftw depends on fftw-double when this package is enabled.
> - select this option when fftw is enabled and no precision is enabled
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

Testing: compile-tested all the permutations of enabling/disabling
fftw-single, fftw-double, and fftw-long-double on an aarch64 build (so
no fftw-quad available)
