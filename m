From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Dec 2017 11:01:57 +0100
Subject: [Buildroot] [PATCH] lldpd: remove check on CXX compiler
In-Reply-To: <20171218211935.15149-1-damien.riegel@savoirfairelinux.com>
 (Damien Riegel's message of "Mon, 18 Dec 2017 16:19:35 -0500")
References: <20171218211935.15149-1-damien.riegel@savoirfairelinux.com>
Message-ID: <87a7yf6noq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damien" == Damien Riegel <damien.riegel@savoirfairelinux.com> writes:

 > lldpd currently depends on a C++ compiler to configure properly, but
 > the package doesn't select that option, so builds fail if
 > BR2_TOOLCHAIN_BUILDROOT_CXX is not selected with following errors:

 >   checking how to run the C++ preprocessor... /lib/cpp
 >   configure: error: in `/home/dkc/src/buildroot/build-zii/build/lldpd-0.9.4':
 >   configure: error: C++ preprocessor "/lib/cpp" fails sanity check

 > This package actually builds fine without C++, so drop this check in
 > configure.ac. Attached patch has already been accepted upstream [1].

 > [1] https://github.com/vincentbernat/lldpd/pull/261

 > Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>

Committed after adjusting the comment explaining why we run autoreconf,
thanks.


-- 
Bye, Peter Korsgaard
