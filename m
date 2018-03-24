From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 23 Mar 2018 21:39:31 -0500
Subject: [Buildroot] [PATCH v2 2/3] test-pkg: test a subset of
 toolchains by default, add -a and -n options
In-Reply-To: <20180323214815.19831-3-thomas.petazzoni@bootlin.com>
References: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
 <20180323214815.19831-3-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpa_H8Qxgm45xapR5JQFXG=vksQn+4HOBncNjbKbYhjeow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Mar 23, 2018 at 4:48 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> During the latest Buildroot Developers meeting, we discussed that
> test-pkg would perhaps be more widely used if it tested a smaller
> subset of toolchains. Indeed, it currently tests 47 toolchains, which
> takes very long to build. Several of the toolchain configurations are
> quite similar, and it is perhaps not necessary for contributors to
> test them all before submitting a package.
>
> Therefore, this commit changes the test-pkg script to only test a
> subset of the toolchain configurations by default. The N first
> configurations of the CSV files are tested, where N is hard-coded in
> the script. The CSV file has therefore been re-organized to have the
> first N toolchains be the most important ones.
>
> A -a/--all option is added to test with all toolchains, while a
> -n/--number option is added to test with the first N toolchains, N
> being passed on the command line.
>
> Note that the list of toolchains (built in the "toolchains" shell
> variable) is no longer sorted. Indeed, when the first N toolchains are
> tested, we want them to be tested in the same order as they are listed
> in the CSV file, as we are careful to order them in an interesting
> order. We only sort when all toolchains are tested.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I tested a basic one package build with -a, -n 2 and also the no arg
(default) number of toolchains.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
