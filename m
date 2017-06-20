From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jun 2017 22:04:49 +0200
Subject: [Buildroot] [PATCH] roseapplepi: backport upstream patches to
	fix build with gcc 6
In-Reply-To: <20170620213008.652bc050@windsurf.lan> (Thomas Petazzoni's
 message of "Tue, 20 Jun 2017 21:30:08 +0200")
References: <20170620114952.16292-1-peter@korsgaard.com>
 <20170620213008.652bc050@windsurf.lan>
Message-ID: <87shiue87y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> ---
 >> Andreas F?rber has recently contributed minimal mainline Linux support for
 >> this SoC, so I'll have a look at migrating to that once it ends up in Linus'
 >> tree:

 > I've applied to master. But to be honest, I'm not thrilled with the idea
 > of adding 1100+ lines of patches just to make one single defconfig build
 > again with gcc 6.x. If the kernel doesn't build with gcc 6.x, it means
 > the HW platform is poorly maintained, and it will become worse and
 > worse.

 > Perhaps for such platforms we should change the defconfig to use gcc
 > 5.x (or whatever older version works). And once we remove the support
 > for those older gcc versions, drop the defconfig as well.

 > What do you think?

Yeah, it isn't really nice. I was also hessitating between sticking to
gcc5 or add the patches, but as mainline support seems to be finally
moving forward for this SoC (and we already carried patches for building
with gcc 5.x), I went for the patches.

-- 
Bye, Peter Korsgaard
