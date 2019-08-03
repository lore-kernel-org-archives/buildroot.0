From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 19:46:27 +0200
Subject: [Buildroot] [PATCH] package/lapack: enable unconditionally
 complex matrices support
In-Reply-To: <20190803165240.4674-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sat, 3 Aug 2019 18:52:40 +0200")
References: <20190803165240.4674-1-romain.naour@smile.fr>
Message-ID: <87mugq9m6k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > In order to avoid build issues when complex matrices support is
 > disabled, we enable it unconditionally.

 > While working on new runtime tests for python-numpy package, we
 > noticed a build issue whith python-numpy package when
 > BR2_PACKAGE_LAPACK_COMPLEX is not set. The python-numpy package
 > was patched to add the dependency on lapack package instead of
 > clapack.

 > It failed with the following error:

 > libcblas.so: undefined reference to `scnrm2_'
 > libcblas.so: undefined reference to `scasum_'

 > Indeed, scnrm2 and scasum are added to libblas.so only when
 > BUILD_COMPLEX is enabled.

 > Also, there is no really important space saving on the target:

 > | Library name  | Without lapack complex | With lapack complex |
 > | liblapack.so  | 2,4M                   | 4,6M                |
 > | liblapacke.so | 1,8M                   | 1,5M                |
 > | libcblas.so   | 48K                    | 76K                 |
 > | libblas.so    | 96K                    | 232K                |

 > (Tested with the ARM external toolchain 2019.03)

That is quite a big difference, so I think we still need the explicit
option.

I've marked the patch as rejected in pw.

-- 
Bye, Peter Korsgaard
