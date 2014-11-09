From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Nov 2014 21:44:38 +0100
Subject: [Buildroot] [PATCHv2 2/3] quota: remove dependency on util-linux
In-Reply-To: <1415539854-25971-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Nov 2014 14:30:53 +0100")
References: <1415539854-25971-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1415539854-25971-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mw80p0i1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The dependency on util-linux is only present in Config.in, and not in
 > quota.mk, and quota indeed builds properly without util-linux. It
 > could be a runtime dependency, but there is no indication that it is
 > the case, and I don't see why quota would run-time depend on
 > util-linux utilities.

 > Looking back at when the quota package was introduced, in one of the
 > preliminary patch, he following explanation was given by the original
 > author:

 >   [Update: I added check for util-linux mount because
 >    it support usrquota and grpquota mount options.]

 > But I still don't see why usrquota and grpquota mount options would be
 > the source of a dependency of the quota utilities on util-linux. Here
 > is what the util-linux mount man page says about those two mount
 > options:

 >    grpquota|noquota|quota|usrquota

 >          These options are accepted but ignored.  (However, quota
 >          utilities may react to such strings in /etc/fstab.)

 > So indeed, the quota tools will look at /proc/mounts and see if those
 > options are used for certain mount points, but that doesn't create a
 > dependency of quota on util-linux.

 > Therefore, this commit gets rid of the dependency of quota on
 > util-linux. It allows to re-enable quota on Microblaze, since this
 > dependency was inherited from util-linux.

 > igned-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

'S' missing in top line. Committed with that line removed, thanks.

-- 
Bye, Peter Korsgaard
