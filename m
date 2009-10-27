From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Oct 2009 15:34:02 +0100
Subject: [Buildroot] [PATCH] netkitftp: ftp client from netkit project
In-Reply-To: <20091027141842.GP30850@hiegel.fr> (hugues@hiegel.fr's message of
	"Tue\, 27 Oct 2009 15\:18\:42 +0100")
References: <1256573832-11116-2-git-send-email-hugues@hiegel.fr>
	<1256647300-19012-1-git-send-email-hugues@hiegel.fr>
	<871vkpdlst.fsf@macbook.be.48ers.dk>
	<20091027141842.GP30850@hiegel.fr>
Message-ID: <87skd4dhyd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hugues" == Hugues  <hugues@hiegel.fr> writes:

 >> Thanks, looks a lot better, but we're still not quite there yet.

 Hugues> aha :-)

;)

 >> It would be good if you could add a signed-of-by line to the end of the
 >> commit message - E.G.
 >> 
 >> Signed-off-by: Hugues Hiegel <hugues.hiegel@openwide.fr>

 Hugues> Well, perhaps should you be the really one who should answer me : 
 Hugues> what's the purpose of this "signed-off-by" !? :)

We're using the same system as the Linux kernel, so take a look at
section 12 of Documentation/SubmittingPatches in the kernel sources for
the details (http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/SubmittingPatches)

With git it's very easy to do - Simply add the -s argument to git
commit (or alternatively to git format-patch if you forgot while
committing).

 Hugues> +	  "Classic" ftp client with standard behaviour from 
 >> 
 >> Trailing space.

 Hugues> Argh, I *really* need to tweak my vim config to show these...

Not a big deal.

 >> You'll also need to prepend netkitftp- to the patch names, as they will
 >> otherwise not get applied and configure errors out on unrecognized
 >> options.

 Hugues> Mhm, it seemed to work correctly for me, I'll put another eye with more
 Hugues> coffee ...

 >> Are you testing this in some other tree than mainline?

 Hugues> Yes, it's a tree that has been grown up from 2009.08_rc2, and
 Hugues> I've got a bunch of configuration that work with.  I should
 Hugues> certainly consider getting a clean and correct config which
 Hugues> works on top of the master branch (on which I cherry-pick my
 Hugues> netkitftp tweaks ;))

That probably explains why you are seeing different things. We afaik
tightened up the patch handling since then to not apply *.patch* because
of packages supporting multiple versions.

 Hugues> It'll take me some more days,
 Hugues> I've got another bunch of things to do right now :(

 Hugues> But I'm still not discouraged ;o)

;)

 >> Could you fix those issues please?

 Hugues> Oh yeah, no problem :)

Great!

 Hugues> Thanks you a lot for your patience...

Same to you.

-- 
Bye, Peter Korsgaard
