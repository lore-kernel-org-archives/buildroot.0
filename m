From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Jan 2009 22:27:48 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <1231012341.8886.115.camel@linux-yrgm.site> (Ulf Samuelsson's
	message of "Sat\, 03 Jan 2009 20\:52\:21 +0100")
References: <20090103010637.58207769FD@busybox.osuosl.org>
	<871vvk17mo.fsf@macbook.be.48ers.dk>
	<1231012341.8886.115.camel@linux-yrgm.site>
Message-ID: <87k59cyt9n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Don't see any whitespace damage in my file, there is a TAB character
 Ulf> at the beginning of each line instead of 8 space characters.

Sorry, my fault - Didn't notice the spaces.

 Ulf> As for comments on ?24465:
 Ulf> Yes, I consider it an improvement that all (except one)
 Ulf> thing that regularily changes is located in a separate file.

You still need to change BR2_KERNEL_PATCH_LEVEL and
BR2_KERNEL_CURRENT_VERSION and BR2_LINUX_2_6_STABLE, right? I don't
see it as an advantage, and could very well imagine someone only
updating one of the files and not the other.

 Ulf> I do not think it is a good idea to remove support for kernel versions
 Ulf> and I do not think it is a good idea to deprecate them.
 Ulf> I fail to see any significant benefit in doing this, 
 Ulf> and I can foresee substantial drawbacks for individual users.

I do. It simply doesn't scale to add more config options to
buildroot. We already now have a bunch of stuff that doesn't build,
and adding more versions of each package makes the number of
combinations grow exponentally.

One of the goals of getting stable releases out of the door is to be
able to deprecate AND REMOVE old versions - More about that shortly.

I don't think it's realistic with the available manpower to target
much else than the latest stable version of each package - And
spending time on older packages instead is doing a disservice to those
projects.

 Ulf> The deprecation of binutils-2.17 has, as you know caused
 Ulf> extra work, which we all could benefit from avoiding.

Why were you using such an ancient version to begin with? 2.17 is
more than 3 years old.

 Ulf> The only significant drawback of keeping multiple choice,
 Ulf> is that the list of choices grow.
 Ulf> By sorting the list of choices in reverse order,
 Ulf> this is more or less nullified,.

NOT True. Every time you make a change to those makefiles you need to
verify that it still works with all those versions, which noone
ofcourse does as it is too much work - and stuff breaks.

Letting users use outdated (and likely with known bugs/security
issues) is doing a disservice to our users and the upstream projects.

-- 
Bye, Peter Korsgaard
