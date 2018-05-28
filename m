From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 21:29:32 +0200
Subject: [Buildroot] [PATCH v2] toolchain: GCC bug 85180
In-Reply-To: <1527521710-3889-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1527521710-3889-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180528212932.297eadf7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 May 2018 10:35:10 -0500, Matt Weber wrote:
> Works around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> which is an issue where the Microblaze archtecture had code that
> caused a infinite recursion while optimizing in versions of GCC
> less then 8.x.  More BR discussion can be found on this thread.
> http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2018-04-25-td192721.html
> 
> Resolves:
> http://autobuild.buildroot.net/results/b42d68c66d8ea035845a28c5530ef0682fd95713 (boost)
> http://autobuild.buildroot.net/results/af976a4805fb8b3f0c17a8e3a1f901b2255caa0b (flare-engine)
> http://autobuild.buildroot.net/results/d20/d20700bd538ba1e9d45ab8a61ecbbba1a320ef38 (gst-ffmpeg)
> 
> CC: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Thanks for your work on this!

So, only boost-fiber is affected inside the boost package ?

And passing -O0 or -O2 instead of -Os doesn't work around the problem ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
