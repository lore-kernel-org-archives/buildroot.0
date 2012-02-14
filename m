From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Feb 2012 10:55:01 +0100
Subject: [Buildroot] simple question about dropbear
In-Reply-To: <BAB70BB3-C317-49C7-80E2-016DD9BECAF1@informatik.uni-bremen.de>
 (Johannes Teiwes's message of "Tue, 14 Feb 2012 10:30:45 +0100")
References: <853BA8D0-AD4E-4B14-A9E7-EC9908AE5C9A@informatik.uni-bremen.de>
 <871uq32cin.fsf@macbook.be.48ers.dk>
 <E38CC59C-6BA9-4775-9A90-5D4C13A78902@informatik.uni-bremen.de>
 <CA+appbOjdSO6HqBNCALy_SmfkKycJNV_gHJqxY1aQbfyQbXMdg@mail.gmail.com>
 <87zkcmwjsg.fsf@macbook.be.48ers.dk>
 <BAB70BB3-C317-49C7-80E2-016DD9BECAF1@informatik.uni-bremen.de>
Message-ID: <87aa4lwxhm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johannes" == Johannes Teiwes <jteiwes@informatik.uni-bremen.de> writes:

Hi,

 Johannes> I have also BR2_PACKAGE_DROPBEAR_SMALL enabled in my
 Johannes> configuration.  The 'slowness' can be the cause since the
 Johannes> microblaze machine only runs at about 66MHz.

 Johannes> Is there any way to convince dropbear/ssh to use a small (or
 Johannes> precomputed) session key?  If this is possible one could
 Johannes> check, if the system-speed is really the limiting factor.

Not afaik. You could try disabling DROPBEAR_SMALL and rebuild dropbear
(rm -rf output/build/dropbear-*; make)

 Johannes> I am using static device tables and the default dev_table as
 Johannes> my structure - maybe there are some devices missing or
 Johannes> misconfigured for doing ssh right out of the box?

No, it should afaik work out of the box. Does it put anything sensible
in /var/log/messages?

-- 
Bye, Peter Korsgaard
