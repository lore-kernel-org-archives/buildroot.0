From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:32:48 +0100
Subject: [Buildroot] [PATCH 2/2] fs/squashfs: enable squashfs to
 generate a verity hashtable
In-Reply-To: <20180322213410.GD4580@scaer> (Yann E. MORIN's message of "Thu,
 22 Mar 2018 22:34:10 +0100")
References: <1521752805-17690-1-git-send-email-ben.whitten@gmail.com>
 <1521752805-17690-2-git-send-email-ben.whitten@gmail.com>
 <20180322213410.GD4580@scaer>
Message-ID: <87woy368rz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Ben, All,
 > On 2018-03-22 21:06 +0000, Ben Whitten spake thusly:
 >> For those times that you want to verify that your readonly filesystem
 >> hasn't been tampered we can generate a dm-verity hash table.
 >> The root hash is enclosed in .table file and must be secured else where.

Strange, I don't seem to have received the original patch?

 > I don't think this should belong to the squashfs filesystem.

 > From what I understand, veritysetup is filesystem-agnostic, and can do
 > the hash checksums on any image (even a r/w filesystem as long as it is
 > mounted r/o for example).

 > My position is that this should be done in a post-image script.

I agree! It is quite simple to enable the host-cryptsetup package and
call veritysetup format in a post-image script, but there is quite some
flexibility in how to use dm-verity (data/hash block size, hashes
appended to image or in a separate partition, where to store toplevel
hash and offset, ..) which makes it hard to integrate as kconfig
options.

-- 
Bye, Peter Korsgaard
