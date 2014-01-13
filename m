From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jan 2014 09:27:43 +0100
Subject: [Buildroot] [PATCH v2] rt-tests: disable NPTL is missing
In-Reply-To: <20140113161012.06535faf@skate> (Thomas Petazzoni's message of
 "Mon, 13 Jan 2014 16:10:12 +0800")
References: <0255f67e72bc626106163b3cfb821a68d99970fd.1389596187.git.baruch@tkos.co.il>
 <20140113161012.06535faf@skate>
Message-ID: <87r48c1e2o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Baruch Siach,
 > On Mon, 13 Jan 2014 08:56:27 +0200, Baruch Siach wrote:

 >> +	# priority-inheritance mutex needs NPTL
 >> +	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD

 > No, these symbols are specific to the internal toolchain backend, and
 > do not make sense for external toolchains. Therefore, they shouldn't be
 > used for package dependencies.

Notice that the dependency is !BR_THREADS, E.G. only hide if using the
internal uClibc toolchain with linuxthreads. That I believe is OK.

For external uClibc toolchains we don't know the threads variant, which
is why the 2nd line disables it for the specific archs where we know
NPTL isn't available.

-- 
Bye, Peter Korsgaard
