From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Sep 2009 09:13:05 +0200
Subject: [Buildroot] at91bootstrap missing
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB69B26337@MAIL-UA.ccs.local> (Teemu
	Keskinarkaus's message of "Mon\, 28 Sep 2009 08\:08\:48 +0200")
References: <330EC2471BF24E48B513AF1A6975EB69B26337@MAIL-UA.ccs.local>
Message-ID: <87r5trsfsu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Teemu" == Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com> writes:

Hi,

 Teemu> I'm baffled. I've been building buildroot with external
 Teemu> toolchain and it needed some tweaking to get it work. For
 Teemu> example bootstrap needed to be disabled because it had some
 Teemu> problems so that I could continue compiling.

 Teemu> Now that everything else is sorted out I was starting to work
 Teemu> with the at91bootstrap only to notice that I can't figure out
 Teemu> how to enable it! I even cloned new version of the buildroot
 Teemu> from the Ulf's git-repository, but still can't find the place
 Teemu> where it's enabled and setup.

 Teemu> Any idea how it's enabled and what am I missing here? I see from
 Teemu> Config.in - files that it should be somewhere in target -
 Teemu> settings, and that's where it is in older buildroot, but now I
 Teemu> can't find it there (or anywhere else).

It hasn't been moved (atleast in the main repo, don't know about Ulf).

Target options->Atmel device support->Board support for the Atmel AT91->Build AT91 Bootstrap..

Notice the dependencies in target/device/Atmel/at91bootstrap/Config.in -
It's only visible if you have chosen one of the supported AT91 devices.

-- 
Bye, Peter Korsgaard
