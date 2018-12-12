From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Wed, 12 Dec 2018 12:18:52 -0700
Subject: [Buildroot] [PATCH v2 02/14] fftw: breaks fftw-long-double into
 a dedicated package
In-Reply-To: <20181212074539.11656-2-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
 <20181212074539.11656-2-gwenj@trabucayre.com>
Message-ID: <CA+1k=2Z6UsFbRe92ASB-EQMyxiizvniazCoxDTH+zimxs03V8g@mail.gmail.com>
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
> This patch breaks fftw long double precision into a new package and:
> - deprecates BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE,
>   BR2_PACKAGE_FFTW_LONG_DOUBLE must be used instead;
> - do fftw depends on fftw-long-double when this package is enabled.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

Testing: compile-tested all the permutations of enabling/disabling
fftw-single, fftw-double, and fftw-long-double on an aarch64 build (so
no fftw-quad available)
