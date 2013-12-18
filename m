From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Dec 2013 11:29:48 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-17
In-Reply-To: <20131218104812.62edfd68@skate> (Thomas Petazzoni's message of
 "Wed, 18 Dec 2013 10:48:12 +0100")
References: <20131218073008.6219E100A64@stock.ovh.net>
 <20131218104812.62edfd68@skate>
Message-ID: <87ob4eo3j7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 18 Dec 2013 08:30:08 +0100 (CET), Thomas Petazzoni wrote:

 >> python-pycrypto-2.6 | 8 
 >> python-pyasn-1.2 | 6 

 > I have worked on those issues. They are caused by incorrect header and
 > library paths being passed. The pycrypto header problem is quite easy,
 > the library path is a little bit trickier, but I'm working on it. I
 > will be posting patches as soon as possible.

The other pycrypto issue (that legal-info fails) is that the one of the
license files is called LICENSE.orig and apply-patches.sh currently
deletes all *.orig files :/

I know patch generates these if the patch doesn't apply, but do anybody
know why we're deleting them? The patches should imho always apply
cleanly (and if not, fixed) so it should only happen during development,
where the .orig files might be handy.

We can also pass --no-backup-if-mismatch to patch to get it to not
create those files.

Can we get rid of the rm *.orig from apply-patches.sh?

-- 
Bye, Peter Korsgaard
