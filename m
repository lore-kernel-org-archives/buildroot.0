From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 21:59:04 +0100
Subject: [Buildroot] [PATCH 0/4] rt-tests: patches rename & versoin bump
	& support of non-NPTL tools
In-Reply-To: <20141111161056.52d0cee7@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 11 Nov 2014 16:10:56 +0100")
References: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
 <20141111154340.258edd64@free-electrons.com>
 <1415718077.4122.19.camel@abrodkin-8560l.internal.synopsys.com>
 <20141111161056.52d0cee7@free-electrons.com>
Message-ID: <87h9y5mp2f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > I must confess that I don't actually don't know precisely how git
 > encodes renames. But basically, my understanding is that even if you do

Easy, it doesn't. It just stores blobs and the old and new files will
share the same blob as they are identical. The rename detection is only
for how you want the commit to PRESENTED.

 > "git mv", "git format-patch" will encode a rename as a complete removal
 > + a complete addition, because that's the only way, in the traditional
 > patch format, to express a rename. However, by passing -M to git
 > format-patch, you tell git that it can generate a git patch, making the
 > assumption that it's git that will be used to apply the patch, and not
 > just the basic "patch" tool. In this case, it can encode the rename in
 > a smarter way.

Indeed. You can enable it by default with something like:

git config --global diff.renames copy

-- 
Bye, Peter Korsgaard
