From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 16:55:34 +0100
Subject: [Buildroot] [PATCH 1/1] gnutls: fix build on sparc
In-Reply-To: <20190117190252.32440-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 17 Jan 2019 20:02:52 +0100")
References: <20190117190252.32440-1-fontaine.fabrice@gmail.com>
Message-ID: <877eeog4jt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gnutls source code uses the C++11 <atomic> functionality since
 > https://github.com/gnutls/gnutls/commit/7978a733460f92b31033affd0e487c86d66c643d,
 > which internally is implemented using the __atomic_*() gcc built-ins

 > On certain architectures, the __atomic_*() built-ins are implemented in
 > the libatomic library that comes with the rest of the gcc runtime. Due
 > to this, code using <atomic> might need to link against libatomic,
 > otherwise one hits build issues such as:

 > ../lib/.libs/libgnutls.so: undefined reference to `__atomic_fetch_sub_4'

 > on an architecture like SPARC.

 > To solve this, a configure.ac check is added to know if we need to
 > link against libatomic or not. The library is also added to gnutls.pc.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6c749bd592ceffeacadd2ab570d127936cce64b2
 >  - http://autobuild.buildroot.org/results/30aa83d3cf3482af8a59250c196c85f4a278d343

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
