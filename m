From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 20:56:25 +0100
Subject: [Buildroot] [PATCH] host-lua: fix bug #5354
In-Reply-To: <87boewt3hv.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 17 Nov 2012 20:48:28 +0100")
References: <1353146744-13529-1-git-send-email-francois.perrad@gadz.org>
 <87boewt3hv.fsf@dell.be.48ers.dk>
Message-ID: <871ufst34m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Francois> see https://bugs.busybox.net/show_bug.cgi?id=5354

 Peter> Thanks, but I don't get the problem in the first place. Lua links
 Peter> lua/luac using gcc, so why doesn't it pick up the stack protection bits?

Ahh, I see it now - It's because we're passing -nostdlib -lgcc when
creating the shared library. Why are we doing that in the first place?

Gustavo, it seems to date back to 46913a2d4. Do you have any idea why it
was done like that?

-- 
Bye, Peter Korsgaard
