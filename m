From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 21:57:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/skeleton-init-common: Create
 /lib/modules directory
In-Reply-To: <dfeb8c8b-e3bc-f96c-4052-c6b55cf85653@mind.be> (Arnout
 Vandecappelle's message of "Tue, 19 Mar 2019 18:57:35 +0100")
References: <20190318163010.8056-1-norbert.lange@andritz.com>
 <20190318174436.GI14237@scaer>
 <CADYdroMoAzR6=nniTiBZvvs2fkwJJ7hGM-rd2OixxA6FpjRj7A@mail.gmail.com>
 <20190318190315.GJ14237@scaer>
 <CADYdroPQYoDW=T7ZOdDNucb4O3wu4poD-ZVuLY1PApB4i_dMrg@mail.gmail.com>
 <dfeb8c8b-e3bc-f96c-4052-c6b55cf85653@mind.be>
Message-ID: <875zsefupf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 18/03/2019 21:43, Norbert Lange wrote:
 >> Should I re-roll the patch next, or can we continue this discussion
 >> until you decide on whether you will include the change.

 >  For me as well, the direction should be to remove things from the skeleton
 > rather than adding to it. So if you would get rid of /media etc. I'd maybe be in
 > favour of it, but I'm certainly not going to defend adding yet another directory.

 >  I'll add Peter in Cc to draw a line in the sand.

I'm with Arnout here. Buildroot has always been about minimalism, so
having extra things just-in-case isn't really nice.

If you really want to, you can create extra directories in the target
without any buildroot customizations, just call mkdir as a post-build
script:

BR2_ROOTFS_POST_BUILD_SCRIPT="mkdir"
BR2_ROOTFS_POST_SCRIPT_ARGS="-p $(TARGET_DIR)/path/to/somewhere"

-- 
Bye, Peter Korsgaard
