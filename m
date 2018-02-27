From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 21:35:13 +0100
Subject: [Buildroot] [PATCH v2,1/1] domoticz: depends on NPTL
In-Reply-To: <20180210195815.20942-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Feb 2018 20:58:15 +0100")
References: <20180210195815.20942-1-fontaine.fabrice@gmail.com>
Message-ID: <877eqynpby.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > boost 1.66 uses pthread_condattr_setclock in
 > boost/asio/detail/impl/posix_event.ipp.

 > Boost is mostly a header-only library, in particular the asio stuff.
 > There are sub-options for the parts of Boost that are not purely
 > headers, but there are not any sub-options for the parts of Boost that
 > are just headers.

 > So, the options are either to add sub-options to Boost, or to make
 > Boost as a whole only available on NPTL toolchains. The latter is a bit
 > annoying as it would mean adding this dependency to all Boost reverse
 > dependencies, even those not using asio.

 > So, instead of updating boost, add a dependency to
 > BR2_TOOLCHAIN_HAS_THREADS_NPTL to domoticz. This is the best solution
 > that can be done today. It's not perfect, but it's good enough.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/197baa15cbf7f4fc7b3ccc602515af3f375ed68f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Korsgaard and Thomas Petazzoni):
 >  - Add Thomas's explanation/opinion in commit message

Committed, thanks.

-- 
Bye, Peter Korsgaard
