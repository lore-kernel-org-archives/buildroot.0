From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 May 2014 22:40:43 +0200
Subject: [Buildroot] [PATCH] host-pkgconf: use --static option for
	static builds
In-Reply-To: <536A46A2.2010502@mind.be> (Arnout Vandecappelle's message of
 "Wed, 07 May 2014 16:43:46 +0200")
References: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
 <536A46A2.2010502@mind.be>
Message-ID: <87siolcofo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 05/03/14 13:19, Vicente Olivert Riera wrote:
 >> Detect when BR2_PREFER_STATIC_LIBS is selected and modify the host
 >> pkg-config wrapper to append the --static option in that case.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/
 >> 
 >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 >  Tested with an allpackageyesconfig with 
 > http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-x86-64-core2-full.config
 > as the toolchain (and PREFER_STATIC added to the config, of course).

 >  I ran this config with and without this patch applied, by running make -k
 > and then make -k again to collect the failures. 

 >  The following packages are fixed by this patch:
 > at
 > gdk-pixbuf
 > xerces
 > xfsprogs

Thanks for the work both - Committed, thanks.

-- 
Bye, Peter Korsgaard
