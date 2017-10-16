From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:45:44 +0200
Subject: [Buildroot] [PATCH] support/scripts/check-bin-arch: ignore
	symbolic links
In-Reply-To: <20170903140941.12455-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Sep 2017 16:09:41 +0200")
References: <20170903140941.12455-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87mv4qwyuv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since commit da32b49f0091ee9dfb613e0f00973bf6893bfa84
 > ("instrumentation: extend packages-file-list.txt with symlinks and
 > directories"), the packages-file-list.txt also contains symbolic
 > links. Therefore, check-bin-arch is now also checking symbolic links.

 > However, symbolic links in $(TARGET_DIR) can have absolute path as
 > targets, such as:

 > $ ls -l output/target/sbin/ifdown
 > lrwxrwxrwx 1 thomas thomas 10 Sep  3 15:55 output/target/sbin/ifdown -> /sbin/ifup

 > Therefore, we are now potentially checking a host binary, which
 > obviously makes check-bin-arch fail.

 > This commit changes check-bin-arch to ignore symbolic links. Indeed,
 > we have two cases:

 >  - The symbolic link really points to something that will in the
 >    rootfs (such as /sbin/ifup above). In this case, /sbin/ifup will be
 >    checked separately by check-bin-arch.

 >  - The symbolic link doesn't point to something that will be in the
 >    rootfs, and that is not a problem from the perspective of
 >    check-bin-arch, which checks the architecture of target binaries.

 > Fixes:

 >   http://autobuild.buildroot.net/results/16d384a0183d477646ac7692feb65f00dde7d068/
 >   (vim)

 >   http://autobuild.buildroot.net/results/50429c0f63a8befff9e20899327b9a8d754d99be/
 >   (ifupdown)

 >   http://autobuild.buildroot.net/results/1db65973e782bfa61abcbccd3501bfd235f77288/
 >   (gawk)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
