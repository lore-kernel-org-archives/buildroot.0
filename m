From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 23:27:50 +0200
Subject: [Buildroot] [PATCH 2/6 v2] support/download: fix the git helper
In-Reply-To: <b0bdeb224c0dab926128a93fe7ddf31d4a3b67ac.1404769268.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 7 Jul 2014 23:44:33 +0200")
References: <cover.1404769268.git.yann.morin.1998@free.fr>
 <b0bdeb224c0dab926128a93fe7ddf31d4a3b67ac.1404769268.git.yann.morin.1998@free.fr>
Message-ID: <87wqbnwnft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When switching the git helper over to a shell script, a special case was
 > not carried over: in case the remote has the required reference, we
 > attempt a shallow clone, using --depth 1. However, this is not supported
 > when the remote is accessed with the http protocol.

 > Therefore, the download fails.

 > What happened before the conversion to a shell script was that the helper
 > in the Makefile would fallback to doing a full-clone.

 > This is the case and behaviour that were lost in the conversion.

 > To avoid making the script too complex, we only attempt a full clone if
 > needed. And we decide that a full clone is needed by default; we decide
 > it is unnecessary if the remote has the needed reference *and* the
 > shallow clone was successful.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
