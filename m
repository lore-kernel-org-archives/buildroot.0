From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Sep 2019 10:57:04 +0200
Subject: [Buildroot] [PATCH v2] package/python-numpy: add reverse
 dependency on packages using python-numpy
In-Reply-To: <20190808151950.26321-1-alexandre.payen@smile.fr> (Aalx's message
 of "Thu, 8 Aug 2019 17:19:50 +0200")
References: <20190808151950.26321-1-alexandre.payen@smile.fr>
Message-ID: <87sgpgfl7j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Aalx" == Aalx  <alexandre.payen@smile.fr> writes:

 > From: Alexandre PAYEN <alexandre.payen@smile.fr>
 > Since commit 1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed[1] is merged, a
 > new build failure occurs when selecting packages which needs
 > python-numpy as dependency.

 > This fix a build issue[2] by adding the correct reverse dependencies
 > to the following packages :
 > - gnuradio (for python support)
 > - opencv3 (for python support)
 > - piglit
 > - python-matplotlib

 > So :
 > - adding to every listed packages
 >   `depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)`
 >   and add a comment to explain what happend.

 > [1] https://git.buildroot.net/buildroot/commit/?id=1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed
 > [2] http://autobuild.buildroot.org/results/b76/b76b6cf9602bcf5df69a7276762eab54cf74007b

 > Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
 > Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Damien DUVAL <damien.duval@smile.fr>
 > Cc: Romain Naour <romain.naour@smile.fr>
 > Reviewed-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > I also checked there is no more dependecy propagation.
 > v2:
 > Remove gr-osmosdr propagation because it depends on gnuradio which
 > depends on glic or musl.

Committed, thanks.

-- 
Bye, Peter Korsgaard
