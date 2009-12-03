From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Dec 2009 11:30:57 +0100
Subject: [Buildroot] Help understanding how to develop with buildroot
In-Reply-To: <16d4c3590912021826v916b813gf6f422634058df54@mail.gmail.com>
	(Mike Crowe's message of "Wed, 2 Dec 2009 21:26:30 -0500")
References: <16d4c3590912021826v916b813gf6f422634058df54@mail.gmail.com>
Message-ID: <878wdktkm6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Crowe <drmikecrowe@gmail.com> writes:

Hi,

 Mike> Apologies if this is obvious, but I haven't been able to find the
 Mike> right words to search for it:

 Mike> It appears that BR copies my new package from packages/ to
 Mike> build_arm/ and compiles it.

Yes. Notice that the 2009.11 release is out now, and it has a somewhat
different (simpler) build directory layout.

 Mike> However, if I have to do a lot of source code changes, it appears
 Mike> that I should edit the build_arm directory and then sync it back
 Mike> to packages when I have it running.

Yes, if you need to patch something in the package sources, you'll need
to make a patch (quilt is nice for this) and copy it to
package/<something>/. Make sure you name it <something>-*.patch
otherwise it won't be applied.

What exactly is it that you are changing? If you're fixing something
general, then please submit those patches to the package upstream and us
so we can integrate it into buildroot.

 Mike> Is this the right flow?? Are there any instructions or tools to help do this?

It is, but it's pretty uncommon to have to do project specific patching
of the packages.

-- 
Bye, Peter Korsgaard
