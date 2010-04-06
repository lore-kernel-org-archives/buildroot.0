From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Apr 2010 17:02:06 +0200
Subject: [Buildroot] External toolchain built by buildroot no longer
	supported.
In-Reply-To: <hpfh61$drp$1@dough.gmane.org> (Grant Edwards's message of "Tue, 
	6 Apr 2010 14:41:05 +0000 (UTC)")
References: <hpfh61$drp$1@dough.gmane.org>
Message-ID: <87y6h0r5e9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> As of this commit
 Grant>   http://git.buildroot.org/buildroot/commit/?id=3b7aee23f2ab732f06b8a090ca002fb102d547ee

 Grant> use of of external toolchains built by buildroot is no longer
 Grant> possible.

 Grant> Are we to assume that crosstool-NG is now the "officially supported"
 Grant> source for external toolchains?

Long term I think users are better off with using crosstool-NG for their
toolchains, as that has a more active development community. The
buildroot toolchains work, and I do small fixes / version updates, but
noone is really doing active development on them.

As an example, GDB 7.x is out since October, but still not in BR (I had
a quick look, but didn't get it to work).

With that said, I would very much like to support BR toolchains as
external toolchains if it's possible without too many dirty hacks
(sorry, haven't been following the recent discussion about it). Besides
the advantages you listed there's also the fact that it will make
migration easier in the future - E.G.:

BR with internal toolchain -> BR with external BR toolchain -> BR with
crosstool-NG toolchain.

-- 
Bye, Peter Korsgaard
