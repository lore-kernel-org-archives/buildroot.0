From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Apr 2017 11:06:58 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
	BR2_GENIMAGE_CFG_FILES
In-Reply-To: <20170401155116.66464885@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 1 Apr 2017 15:51:16 +0200")
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <20170401155116.66464885@free-electrons.com>
Message-ID: <8760ilvozx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 31 Mar 2017 00:51:08 +0200, Arnout Vandecappelle wrote:

 >> I'm still not entirely sure if this new option is worthwhile. Without it, you
 >> would instead need
 >> 
 >> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 >> BR2_ROOTFS_POST_SCRIPT_ARGS="board/acmesystems/aria-g25/genimage.cfg"
 >> 
 >> Not really complicated either... The only real advantage I see is that it
 >> motivates people more to use genimage (which is otherwise a bit hidden). But for
 >> that, a paragraph or two in docs/manual/customize-post-image.txt would also
 >> work. By the way, even for this series an explanation of the option would be
 >> required in that file.
 >> 
 >> What do the others think?

 > I agree that the new option doesn't seem really useful.

I'm not sure. One of the problems with genimage is that it calls a
number of external utilities depending on the content of
genimage.cfg, and it isn't directly clear what host packages you need to
enable to ensure it works. If we add explicit BR2_GENIMAGE_FAT / CPIO /
EXT2 / ISO / JFFS2 / UBI / .. options selecting the needed host packages
then that would solve that issue.

I think the option should select BR2_HOST_PACKAGE_GENIMAGE instead of
depending on it though.

-- 
Bye, Peter Korsgaard
