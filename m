From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 08:44:03 +0200
Subject: [Buildroot] [PATCH 01/16] download/git: create GNU format tar
	files
In-Reply-To: <20170321000712.26500-2-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 21 Mar 2017 01:06:57 +0100")
References: <20170321000712.26500-1-arnout@mind.be>
 <20170321000712.26500-2-arnout@mind.be>
Message-ID: <87mvc2ymh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > On most distros, the tar format defaults to GNU. However, at build time
 > the default format may be changed to posix. Also, future versions of
 > tar will default to posix.

 > Since we want the tarballs created by the git download method to be
 > reproducible (so their hash can be checked), we should explicitly
 > specify the format. Since existing tarballs on sources.buildroot.org
 > use the GNU format, and also the existing hashes in the *.hash files
 > are based on GNU format tarballs, we use the GNU format.

 > In addition, the Posix format encodes atime and ctime as well as mtime,
 > but tar offers no option like --mtime to override them. In the GNU
 > format, atime and ctime are only encoded if the --incremental option is
 > given.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Peter, can you test if this solves the issue for you?

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
