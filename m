From: hartleys <hartleys@visionengravers.com>
Date: Wed, 18 Jun 2008 14:28:04 -0400
Subject: [Buildroot] Problem with buildroot and external toolchain
In-Reply-To: <87myljdyuw.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE1909182568@mi8nycmail19.Mi8.com><20080617183841.GA18089@real.realitydiluted.com><BD79186B4FD85F4B8E60E381CAEE190918260A@mi8nycmail19.Mi8.com><87k5gng9wx.fsf@macbook.be.48ers.dk><BD79186B4FD85F4B8E60E381CAEE19091826AF@mi8nycmail19.Mi8.com>
	<87myljdyuw.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909182BBC@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard writes:
> I doubt it. I'm using 4.2.31 (on Debian as well).

Hello Peter,

I've been messing with the ext-tool.mk trying to figure out why the
external libraries are not getting copied to the root filesystem.

I added some echo statements in copy_toolchain_lib_root and verified
that the LIB, DEST, and STRIP values are getting set correctly. The
LIB_DIR is getting set correctly to the path of the external library.

It still appears that the find statement in the for loop is not working
right. I added a

	echo "FILE=$${FILE}"; \

Right after the "for FILE in ..." stuff and never get an echo statement.

Any other ideas what might be the problem?

Thanks,
Hartley
