From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Sep 2010 22:35:50 +0200
Subject: [Buildroot] Building fw_printenv (u-boot utility) for target?
In-Reply-To: <i7decv$4q1$1@dough.gmane.org> (Grant Edwards's message of "Wed, 
	22 Sep 2010 17:29:03 +0000 (UTC)")
References: <i7decv$4q1$1@dough.gmane.org>
Message-ID: <87ocbpa53t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 Grant> I want fw_printenv on my target, and it would be convenient if
 Grant> buildroot built it and set up the relvent links.  But, AFAICT, I can't
 Grant> have buildroot build the fw_printenv utility without having it do a
 Grant> complete build of U-Boot.  I don't have any need/desire for buildroot
 Grant> to build the bootloader itself, I only need the fw_printenv linux app
 Grant> for the target.  Is that possible with buildroot?

Currently not, is it a big deal to build u-boot as well?
The reason for this is mainly that fw_printenv isn't available
seperately, so we would need to double quite a lot of the u-boot
handling if we were to move it to a seperate package, and they are most
of the time used together.

 Grant> Or should I just build fw_printenv separately and stick it into the
 Grant> filesystem using the custom package?

That's naturally an option as well.

-- 
Bye, Peter Korsgaard
