From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 10:03:42 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
In-Reply-To: <20080616075421.GB19499@mx.loc> (Bernhard Fischer's message of
	"Mon\, 16 Jun 2008 09\:54\:21 +0200")
References: <20080615204411.C28F33C937@busybox.net>
	<20080616075421.GB19499@mx.loc>
Message-ID: <87myllhkm9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> Modified: trunk/buildroot/package/valgrind/valgrind.mk
 >> ===================================================================
 >> --- trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 20:44:05 UTC (rev 22359)
 >> +++ trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 20:44:10 UTC (rev 22360)
 >> @@ -64,6 +64,7 @@
 -> cp package/valgrind/valgrind.sh $(TARGET_DIR)/usr/bin/valgrind

 Bernhard> $(INSTALL)

Sure.

 >> chmod a+x $(TARGET_DIR)/usr/bin/valgrind
 >> rm -rf $(TARGET_DIR)/usr/share/doc/valgrind
 >> +	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig

 Bernhard> Removing all is a bit generic, no? Think about somebody selecting
 Bernhard> pkgconfig for the target. If i would do this, i would expect
 Bernhard> $(TARGET_DIR)/usr/lib/pkgconfig to be populated and useable..

But we don't have target support for pkgconfig.

 >> #mkdir -p $(TARGET_DIR)/etc/default #cp
 >> $(VALGRIND_DIR)/valgrind.default
 >> $(TARGET_DIR)/etc/default/valgrind #mkdir -p
 >> $(TARGET_DIR)/usr/lib/valgrind

 Bernhard> cruft. Should have used $(INSTALL) -D
 Bernhard> $(VALGRIND_DIR)/valgrind.default
 Bernhard> $(TARGET_DIR)/etc/default/valgrind anyway.

Yes, I left it there as it's commented out anyway.

-- 
Bye, Peter Korsgaard
