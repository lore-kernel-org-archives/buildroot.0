From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:02:17 +0200
Subject: [Buildroot] [PATCH] board/wandboard/post-build.sh: create
 boot.scr at TARGET_DIR/boot
In-Reply-To: <20200413215356.487df9e0@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 13 Apr 2020 21:53:56 +0200")
References: <20191012233041.29984-1-unixmania@gmail.com>
 <20200413215356.487df9e0@windsurf.home>
Message-ID: <87d07hhd0m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Carlos,
 > On Sat, 12 Oct 2019 20:30:41 -0300
 > unixmania at gmail.com wrote:

 >> From: Carlos Santos <unixmania@gmail.com>
 >> 
 >> There is no reason to create boot.scr at board/wandboard and later
 >> install it at TARGET_DIR/boot, leaving a stale file behind.
 >> 
 >> Signed-off-by: Carlos Santos <unixmania@gmail.com>
 >> ---
 >> board/wandboard/post-build.sh | 6 ++++--
 >> 1 file changed, 4 insertions(+), 2 deletions(-)

 > Applied to master after dropping the additional chmod 644 on the file,
 > as suggested by Arnout. Also, the same issue was present for other
 > boards, so I also did the following commits:

 > 2306339d1fe8d5ea2d9e17641f78a374f612f45e board/udoo/neo: create boot.scr in TARGET_DIR/boot
 > 9ddbd11620b5a01945a438085d45ef2131bad35f board/solidrun/mx6cubox: create boot.scr in TARGET_DIR/boot

 > What would perhaps be good is to use the BR2_TARGET_UBOOT_BOOT_SCRIPT
 > feature, which would automatically run mkimage and install boot.src in
 > $(BINARIES_DIR). The post-build script would then only have to copy it
 > to $TARGET_DIR/boot/.

The same set of commits now cherry-picked to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
