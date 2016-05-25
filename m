From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 22:58:06 +0200
Subject: [Buildroot] [PATCH] hidapi: fix the patch renaming a file
In-Reply-To: <1464169350-10752-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 25 May 2016 11:42:30 +0200")
References: <1464169350-10752-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bn3t97oh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The patch
 > 0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch in the
 > hidapi package needs to rename a file from .cpp to .c to avoid a
 > dependency on C++. This renaming currently uses the Git-way of
 > describing renames in patches. While this is interpreted properly by
 > recent enough versions of the 'patch' tool, it is ignored and not
 > understood by older versions of 'patch'. Due to this, with these older
 > versions of 'patch', the file is not renamed, and it causes a build
 > failure.

 > We fix this by not using the Git-like way of describing rename, but
 > rather using the old-style way of doing renames. It makes the patch
 > longer, but compatible with older versions of 'patch'.

 > Fixes:

 >   http://autobuild.buildroot.org/results/d7509d9fdf8f86332a023358a740975f535eafef/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
