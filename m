From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 7 Jun 2007 12:19:48 +0200
Subject: [Buildroot] problems building x86_64 target
In-Reply-To: <FC6B700F-A073-4E83-A3AB-BFD8A9E5ED56@lanl.gov>
References: <3AF470EE-B97B-40FC-B806-12627EC946D0@lanl.gov>
	<20070606173826.GA4543@aon.at> <20070606184023.GA7593@aon.at>
	<FC6B700F-A073-4E83-A3AB-BFD8A9E5ED56@lanl.gov>
Message-ID: <20070607101948.GH2853@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 06, 2007 at 05:31:25PM -0700, kevint wrote:
>Hello,
>
>Thanks for your tips.  I set --disable-libmudflap in "Additional gcc  
>options", and that got past the error I first came across, but I also  
>had to modify a couple things to get it to compile the rest of the way:

I tried this yesterday and yes, it's broken ATM.
The includes are pretty messed up, could be that the patch in the thread
with subject "sysroot support in toolchain, use correct pathes" in the
archives helps there. This needs proper fixing anyway and this patch
does make it better (didn't try x86_64, though) but since gcc-3.4
doesn't have sysroot support, it breaks in many funny ways, of course.
All vaguely recent gcc -- i.e. the 4.x series onward -- do have proper
sysroot support and work flawlessly.

I'll have a look at it again.
