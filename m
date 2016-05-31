From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 16:39:46 +0200
Subject: [Buildroot] [PATCH v3] dosfstools: security bump to version 4.0
In-Reply-To: <1464125552-11702-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 May 2016 18:32:32 -0300")
References: <1464125552-11702-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877feaz3yl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-8872 - if the third to last entry was written on a FAT12
 > filesystem with an odd number of clusters, the second to last entry
 > would be corrupted. This corruption may also lead to invalid memory
 > accesses when the corrupted entry becomes out of bounds and is used
 > late.

 > CVE-2016-4804 - the variable used for storing the FAT size (in bytes)
 > was an unsigned int. Since the size in sectors read from the BPB was not
 > sufficiently checked, this could end up being zero after multiplying it
 > with the sector size while some offsets still stayed excessive.
 > Ultimately it would cause segfaults when accessing FAT entries for which
 > no memory was allocated.

 > Converted package to autotools infra to match upstream.

 > The install options are now removals, enabled compatibilty symlinks and
 > exec-prefix set to / to match previous install names/locations.

 > Accounted for optional udev usage.

 > Dropped musl compatibility patch since it's upstream.

 > Add upstream patch to keep sectors a multiple of sectors per track since
 > it makes mtools cranky.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 > Changes for v3:
 >  Enable compat symlinks for host variant for genimage (Jacmet)
 >  Add patch to make total sectors a multiple of sectors/track (Jacmet)

 > Changes for v2:
 >  Drop double rm -f as pointed by Yann.

As discussed on IRC, the ipact of these CVEs are quite low, and this is
a fairly intrusive change this late in the release cycle, so I've
instead applied it to next - Thanks.

-- 
Bye, Peter Korsgaard
