From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Sep 2012 17:10:03 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for
	boundarydevices nitrogen6x board
In-Reply-To: <5061B7A2.6060306@mind.be> (Arnout Vandecappelle's message of
 "Tue, 25 Sep 2012 15:54:42 +0200")
References: <20120925093427.C0B609970E@busybox.osuosl.org>
 <5061B7A2.6060306@mind.be>
Message-ID: <87ipb287g4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 09/24/12 22:51, Peter Korsgaard wrote:
 >> board/boundarydevices/nitrogen6x/6q_bootscript |  Bin 0 ->  455 bytes
 >> board/boundarydevices/nitrogen6x/6q_upgrade    |  Bin 0 ->  1587 bytes

 Arnout> Why not keep these as text files and use host-mkimage to
 Arnout> produce the images?

Simplicity. I didn't write these scripts myself (they are from the uSD
shipped with the board), and accessing host tools or checking if
host-mkimage is enabled from the post-build script is not that straight
forward (you cannot truly rely on host bein $TARGET_DIR/../host).

I also doubted about the u-boot.bin handling, but atleast the user
cannot change the IMAGES_DIR to anything else (like BR2_HOST_DIR).

-- 
Bye, Peter Korsgaard
