From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 23:47:57 +0200
Subject: [Buildroot] [PATCH v7] openvmtools: new package
In-Reply-To: <1409674416-33961-1-git-send-email-kaszak@gmail.com> (Karoly
 Kasza's message of "Tue, 2 Sep 2014 18:13:36 +0200")
References: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
Message-ID: <87k3576vle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Karoly" == Karoly Kasza <kaszak@gmail.com> writes:

 > New package: openvmtools
 > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
 > ---

 > Changes v6 -> v7:
 >   - PAM support now depends on BR2_PREFER_STATIC_LIB
 >   - LDFLAGS="-L$(TARGET_DIR)/usr/lib" removed from procps section
 >   - Reference to $(STAGING_DIR) removed from DNET section
 >   - Additional comments added

Have you tested this against mainline buildroot? Compilation fails as
libglib2 also defines a g_info macro like openvmtools does since 2.40.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
