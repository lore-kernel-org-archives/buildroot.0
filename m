From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 21:33:18 +0100
Subject: [Buildroot] [PATCH] util-linux: re-enable libmount and binaries
	on Microblaze
In-Reply-To: <1415648741-30563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 10 Nov 2014 20:45:41 +0100")
References: <1415648741-30563-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4rhmq9d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit 442aa88f95d6c4a921aa3d4de91f54d50bd0cd35 ("util-linux: bump
 > version and revamp options"), Gustavo disabled util-linux libmount and
 > binaries on microblaze, as it was not building properly.

 > However, as mentionned in the comment, these options were disabled on
 > Microblaze due to "libc lacks UTIME_NOW & UTIME_COMMIT for
 > libmount". This was true specifically for the microblaze external
 > toolchain that we were using at the time. But we are no longer using
 > this external toolchain (which proved to be broken in many ways), and
 > have microblaze support in our internal backend.

 > I have verified that with our internal toolchain, util-linux with
 > libmount and the binaries enabled builds fine.

 > Those options are not selected by anything else in Buildroot, so
 > there's no other package impacted by this dependency change.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
