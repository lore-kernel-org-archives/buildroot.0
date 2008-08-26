From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 16:15:21 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/i2c-tools
In-Reply-To: <20080826140349.GM2213@mx.loc> (Bernhard Reutner-Fischer's
	message of "Tue\, 26 Aug 2008 16\:03\:49 +0200")
References: <20080826130305.B90693C7BC@busybox.net>
	<87prnvew4v.fsf@macbook.be.48ers.dk> <20080826140349.GM2213@mx.loc>
Message-ID: <87wsi3c16u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Him

 Bernhard> Please think about $(STRIP_STRIP_UNNEEDED) vs. $(STRIP_STRIP_ALL).

 Bernhard> Ask yourself:
 Bernhard> 1) Do i want my libraries be able to load?
 Bernhard>    If you answer Y here, then use _UNNEEDED
 Bernhard> 2) Do i want my binaries small?
 Bernhard>    If you answer Y here, then use _ALL

 Bernhard> Read the corresponding manpage for details and try to correct the
 Bernhard> incorrectly stripped stuff that accumulated during the last months.

Yeah. Maybe we should simply have called them STRIP_BIN / STRIP_LIB
instead to make it completely clear. The issue is kinda moot though
with Makefile.autotools.in as make install-strip doesn't differenciate
between binaries and libs.

Perhaps we should simply add $(STRIP_STRIP_UNNEEDED) to $(STRIPCMD)
and run $(STRIP_STRIP_ALL) on all files in
$(TARGET_DIR)/{bin,sbin,usr/bin,sbin} as a post processing step?

-- 
Bye, Peter Korsgaard
