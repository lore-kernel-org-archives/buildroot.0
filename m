From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Feb 2015 00:38:56 +0100
Subject: [Buildroot] [PATCH 1/2] automake: complete the removal of the
	target package
In-Reply-To: <87y4ofgbp9.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 03 Feb 2015 00:01:22 +0100")
References: <1422809500-23948-1-git-send-email-fabio.porcedda@gmail.com>
 <87y4ofgbp9.fsf@dell.be.48ers.dk>
Message-ID: <87h9v3g9yn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
 >> The variable ACLOCAL_DIR points to the staging area but is not useful
 >> anymore because the target package was removed.  Fix ACLOCAL_DIR by
 >> pointing to $(HOST_DIR)/usr/share/aclocal and remove ACLOCAL_HOST_DIR
 >> because ACLOCAL_DIR has the same value so it's not useful anymore.

 >> Also remove the reference to ACLOCAL_HOST_DIR from the host-autoconf
 >> package.

 >> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

 > Committed, thanks.

Actually, this doesn't work as we still need to look for .m4 files
installed by other target packages.

E.G.
http://autobuild.buildroot.net/results/b20/b20e3efcb0be3032781d7b2f0ef4c351834da0ce/

target-alsa-utils cannot find alsa.m4 installed by target-alsa-lib.

So I've reverted it again.

-- 
Bye, Peter Korsgaard
