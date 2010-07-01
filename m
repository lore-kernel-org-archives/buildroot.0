From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 Jul 2010 14:53:13 +0200
Subject: [Buildroot] Getting package sources from git/svn/bzr
In-Reply-To: <L4TK9K$D17BBF1C51BFC0643CBBFAC2EB922E1E@aruba.it> (Luca
	Ceresoli's message of "Wed, 30 Jun 2010 10:44:08 +0200")
References: <L4TK9K$D17BBF1C51BFC0643CBBFAC2EB922E1E@aruba.it>
Message-ID: <874ogj9xdy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Hi,
 Luca> I'm trying to understand how a buildroot generic (or autotools-based)
 Luca> package can download sources from a git repository instead of just
 Luca> grabbing a tarball.

 Luca> In an old post Peter wrote:
 >> See the tremor handling in package/multimedia/libvorbis/libvorbis.mk
 >> for an example. You could argue about the usefullness of creating a
 >> dated tarball of the checkout or not.
 Luca> (http://lists.busybox.net/pipermail/buildroot/2009-August/028932.html)

 Luca> The odd thing is that tremor does *not* checkout anything: it just
 Luca> downloads a tarball which presumably contains the snapshot (see log below).
 Luca> I didn't find any other supposedly-working example in the current tree.

Ups, seems like Sven's commit (1dc19c44570031e28ad4) from back in
December broke it - I'll fix.

 Luca> So I'd renew the question: is git/svn/bzr repository download actually
 Luca> working? I spent a little time in trying, but after a few dirty hacks I
 Luca> couldn't produce anything really working.

No, there's no generic support for it.

 Luca> Of course a more complete approach would be to have a DOWNLOAD function
 Luca> that actually understands git/svn/bzr, but this may be less interesting
 Luca> until there are only very few packages using such a feature in mainline
 Luca> buildroot.

I've pondered that as well. One of the issues is how to encode the
git/svn/bzr specific parameters in an URL, so we can easily extract it,
and figuring out if a http:// url means something for wget or
svn-over-http or git-over-http.

 Luca> Is my view correct?

yes.

-- 
Bye, Peter Korsgaard
