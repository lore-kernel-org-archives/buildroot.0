From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:27:28 +0100
Subject: [Buildroot] [PATCH next] memtool: new package
In-Reply-To: <20170226214659.33355f63@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 26 Feb 2017 21:46:59 +0100")
References: <20170226204427.31044-1-peter@korsgaard.com>
 <20170226214659.33355f63@free-electrons.com>
Message-ID: <87y3wslk1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sun, 26 Feb 2017 21:44:27 +0100, Peter Korsgaard wrote:
 >> memtool allows one to read and write memory mapped registers via /dev/mem.
 >> The commands are inspired by the respective commands of the barebox
 >> bootloader.  This is handy during driver development to inspect and modify
 >> register settings.  It can also be used to modify regular files and
 >> character devices (e.g. to paint to /dev/fb0).
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Just curious: why not package/devmem2/ ?

Because devmem2 only gives access to a single register. memtool (which I
only learned of yesterday from the post to debian-arm) allows to
write/hexdump sequences of registers, and allows access to other
character devices than /dev/mem:

https://lists.debian.org/debian-arm/2017/02/msg00044.html

 >> package/Config.in            |  1 +
 >> package/memtool/Config.in    | 13 +++++++++++++
 >> package/memtool/memtool.hash |  2 ++
 >> package/memtool/memtool.mk   | 13 +++++++++++++

 > The update to the DEVELOPERS file is missing here :)

Gaah yes, I'll fix that when applying.

-- 
Bye, Peter Korsgaard
