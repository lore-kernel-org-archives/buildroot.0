From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jun 2010 22:32:29 +0200
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Tue, 22 Jun 2010 10:39:39 -0500")
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<87hbkv6sej.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87d3vi7qqq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

Hi,

 H> Hello Peter,

 H> I added this to the *.mk and it worked:

 H> FIRE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install

 H> Is that the correct way to handle this?

Well, it certainly works around the problem about the buildsystem
calling install -s, but the real issue is that the install program is
hardcoded to run "strip" and not whatever we have set $STRIP or
$STRIP_FOR_TARGET to.

Anyway, this is what coreutils' install does, so we probably don't have
much chance for changing it. I have been pondering always doing make
install instead of install-strip as we always strip at the end anyway.

-- 
Bye, Peter Korsgaard
