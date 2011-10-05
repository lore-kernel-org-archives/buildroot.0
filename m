From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 21:08:07 +0200
Subject: [Buildroot] Bug in pkg-stats?
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DCFE910@AUSP01VMBX24.collaborationhost.net>
 (H. Hartley Sweeten's message of "Wed, 5 Oct 2011 13:52:18 -0500")
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AE@AUSP01VMBX24.collaborationhost.net>
 <20111005084340.204661fb@skate>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE877@AUSP01VMBX24.collaborationhost.net>
 <87sjn7nv4d.fsf@macbook.be.48ers.dk>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE910@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87obxvntns.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

Hi,

 >> version=$(awk -F'=| ' '/_VERSION/ { print $NF } END { print "unknown" } ' \
 >> $i | head -n 1)

 H> I thought there was some way of doing it with awk... I really need to figure
 H> out how that utility works... ;-)

;) It takes a bit of getting used to, but is quite powerful once you get it.

 >> But it naturally still doesn't work for packages with multiple versions
 >> (like busybox) or where version is major.minor (like glib2).

 H> With your awk line above, the only packages that show up strange are:

 H> util-linux		$(UTIL_LINUX_VERSION_MAJOR)
 H> xenomai		qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 H> imagemagick		$(IMAGEMAGICK_MAJOR)-6
 H> binutils		qstrip,$(BR2_BINUTILS_VERSION))
 H> microperl		$(MICROPERL_MAJ).8.8
 H> haserl		qstrip,$(BR2_PACKAGE_HASERL_VERSION))

 H> And, of course, the ones with version major.minor only show the major version.

 H> Regardless, do you think this patch is worth submitting?

Well, I think the info in useful, but as buildroot already knows the
version (except for unconfigured packages), wouldn't it make more sense
to add a <pkg>-version target to GENTARGETS and use that instead?

-- 
Bye, Peter Korsgaard
