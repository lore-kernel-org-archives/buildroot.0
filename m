From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 15:16:29 +0100
Subject: [Buildroot] [PATCH v3] Make external toolchain relocatable
In-Reply-To: <1342350726-29970-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 15 Jul 2012 13:12:05 +0200")
References: <1342350726-29970-1-git-send-email-arnout@mind.be>
Message-ID: <877gmmrgle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> The external toolchain wrapper sets sysroot etc. to an absolute path.
 Arnout> By changing this to a relative path, it is possible to move the host
 Arnout> directory to a different location and still have a working build
 Arnout> system.

 Arnout> This only works for a downloaded external toolchain.  For a
 Arnout> pre-installed external toolchain, it is possible to move the
 Arnout> host directory to a different location, but not the external
 Arnout> toolchain directory (it does work if the external toolchain
 Arnout> directory lies within the host directory).  For an internal or
 Arnout> crosstool-ng toolchain, there is no wrapper so updating the
 Arnout> sysroot path should be done in a different way.

 Arnout> See
 Arnout> http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html
 Arnout> for information about others things to do to make the host
 Arnout> directory relocatable.

Committed, thanks.

-- 
Bye, Peter Korsgaard
