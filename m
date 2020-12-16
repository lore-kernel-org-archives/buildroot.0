From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 16 Dec 2020 07:58:22 +0100
Subject: [Buildroot] host-ninja: ccache: build failure on latest Ubuntu
 host system
In-Reply-To: <CA+h8R2pnu3Gn=AzhffpVUsAghS47fGSaDDQ5M5sekGyKdnNckg@mail.gmail.com>
References: <CA+h8R2pnu3Gn=AzhffpVUsAghS47fGSaDDQ5M5sekGyKdnNckg@mail.gmail.com>
Message-ID: <CAGm1_ksSBGTwRq17+xSnXCkHzi5A_JQGdKd3fDD5jYPhVgvCRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Wed, Dec 16, 2020 at 12:38 AM Christian Stewart <christian@paral.in> wrote:
>
> Hi all,
>
> For some reason against latest Ubuntu, Buildroot builds have been
> failing for me since upgrading to 2020.11.x on GitHub Actions:
>
> https://github.com/skiffos/SkiffOS/actions/runs/424300538
>
> The error is related to the ccache, the ccache appears to be getting
> incorrect flags:
>
> >>> host-ninja 1.10.0 Configuring
> -- The C compiler identification is unknown
> -- The CXX compiler identification is unknown
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - failed
> -- Check for working C compiler: host/bin/ccache
> -- Check for working C compiler: host/bin/ccache - broken
> CMake Error at CMakeTestCCompiler.cmake:66 (message):
>   The C compiler
>
>     "host/bin/ccache"
>
>   is not able to compile a simple test program.
>
>   It fails with the following output:
>
>    host/bin/ccache: invalid option -- 'O'
>
> It appears that the ccache is getting an option meant for gcc - I
> found a few emails mentioning this from a long time ago which said to
> wrap the CFLAGS with quotes.
>
> Given that this is a fairly standard Ubuntu system I don't think this
> is related to the fact that it's running in a GitHub action (which has
> worked fine in the past).
>
> Thanks for any help on this.

Please take a look at this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20201212225224.117940-1-bernd.amend at gmail.com/

Best regards,
Yegor
