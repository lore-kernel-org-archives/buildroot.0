From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2008 21:12:03 +0100
Subject: [Buildroot] using of local dir
In-Reply-To: <20080326180926.GA404@mx.loc> (Bernhard Fischer's message of
	"Wed\, 26 Mar 2008 19\:09\:26 +0100")
References: <47EA8F05.8090102@gmx.net> <20080326180926.GA404@mx.loc>
Message-ID: <877ifp1bzg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> This would have been the correct thing, yes. svn blame Makefile;
 Bernhard> Ah, alright, no surprise..

 Bernhard> Apart from what you mention, i strikes me as broken not to allow for
 Bernhard> BUILDROOT_LOCAL to point to anywhere but to limit it to the TOPDIR

It indeed seems quite broken. The $LOCAL variable isn't used anywhere either.

 Bernhard> *shrug* I'd rip it out in a whim either way

Well, the local/save/getconfig stuff does seem kinda overengineered -
Couldn't we just have a bunch of *_defconfig files under configs/
instead with a make %_defconfig target like the kernel has instead?

-- 
Bye, Peter Korsgaard
