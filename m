From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 21:11:26 +0100
Subject: [Buildroot] [PATCH v13 0/7] Add support for top-level parallel
	make
In-Reply-To: <1392371709-26662-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Fri, 14 Feb 2014 10:55:02 +0100")
References: <1392371709-26662-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87d2ipmp3l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Hi all,
 > this is a patch set for adding support for top-level parallel make in
 > buildroot, the common problem scattered in buildroot's top-level
 > makefiles is that in the rules it relies on the order of evaluation of
 > the prerequisites, to be able to use top-level parallel make instead
 > of reling on the left to right ordering of evaluation of the
 > prerequisites we must add an explicit rule to describe the
 > dependencies.

 > With this patch set the top-level parallel make seems to works fine,
 > example:
 > 	make clean
 > 	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN` + 1))

 > Before to try it remeber to remove the ".NOTPARALLEL" line.

 > On my quad core system the building time for the first 220 defconfig lines of
 > the option "allpackageyesconfig" is 45m vs 24m.

 > I've tested the qemu_x86_defconfig.

 > I will test futrher the top-level parallel make feature for building
 > all the packages so expect some other patches to improve this feature.

 > Thank you for all reviews and in particular Arnout.

 > Best regards
 > Fabio Porcedda

 > v13:
 >  - Modified the "package: add support for top-level parallel make"
 >    patch, improved a comment and spliting the $$($(2)_TARGET_BUILD)
 >    dependency as suggested by Arnout.
 >  - Modified the sdl patch to use SDL_PRE_CONFIGURE_HOOKS as suggested
 >    by Thomas P.

Committed series to next, thanks for your persistence!

-- 
Bye, Peter Korsgaard
