From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Jun 2017 22:41:35 +0200
Subject: [Buildroot] [PATCH v2] package/socat: Fix TABDLY,
	CSIZE and CRDLY shifts for PowerPC
In-Reply-To: <20170608220426.2e141c9d@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 8 Jun 2017 22:04:26 +0200")
References: <20170606220403.31732-1-andrew.smirnov@gmail.com>
 <20170608220426.2e141c9d@free-electrons.com>
Message-ID: <87d1ae9pq8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue,  6 Jun 2017 15:04:03 -0700, Andrey Smirnov wrote:
 >> As can be seen in linux/arch/powerpc/include/uapi/asm/termbits.h are
 >> defined as (note that those are octal numbers):
 >> 
 >> \#define TABDLY	00006000
 >> \#define CSIZE	00001400
 >> \#define CRDLY	00030000
 >> 
 >> which gives shifts of 10, 8 and 12. Adjust socat.mk accordingly to
 >> reflect that difference.
 >> 
 >> Signed-off-by: Mark Hinds <zoronic@gmail.com>
 >> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 >> ---
 >> package/socat/socat.mk | 13 +++++++++++--
 >> 1 file changed, 11 insertions(+), 2 deletions(-)

 > Applied to master, thanks. Peter: I think we should apply for the LTS
 > branch(es).

Agreed. Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
