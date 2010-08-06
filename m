From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Aug 2010 20:00:30 +0200
Subject: [Buildroot] External toolchain doesn't support --sysroot.
In-Reply-To: <201008061844.48326.yann.morin.1998@anciens.enib.fr>
References: <AANLkTim-th7FF0dh0ZecLeRMZ+0iMFYpMZrM5QsWLYRL@mail.gmail.com>
	<201008061844.48326.yann.morin.1998@anciens.enib.fr>
Message-ID: <20100806200030.0f798014@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Aug 2010 18:44:48 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> AFAIK, sysroot support in the toolchain is mandatory for use as an
> external toolchain in buildroot.

Correct.

We have an enhancement request, at
https://bugs.busybox.net/show_bug.cgi?id=1315, to extend Buildroot to
support non sysroot toolchains.

However, when I initially updated the support for external toolchains,
I tried *not* to use the sysroot capability, and in turned out to be a
nightmare. You could fairly easily get a basic build to work, but as
soon as you started adding slightly more complicated packages, it was
failing with strange issues. Using the --sysroot capability of the
toolchain turned out to be the most reasonable solution, and with gcc
supporting --sysroot since the beginning of the 4.x era, restricting
ourselves to sysrooted toolchains only didn't sound terribly
unreasonable.

Of course, if you want non-sysroot toolchains to work, feel free to
work on such a patch, and check that it indeed works to build a large
set of Buildroot packages. Bug #1315 mentionned above has such a patch,
but I'm not sure how well all the Buildroot packages behave with such a
patch applied. Don't hesitate to report your tries, successes and
failures.

Regards!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
