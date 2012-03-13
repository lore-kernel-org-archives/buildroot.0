From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Mar 2012 14:53:08 +0100
Subject: [Buildroot] [PATCH] imagemagick: Ignore host's xml2-config
In-Reply-To: <1331645708-7650-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Tue, 13 Mar 2012 13:35:08 +0000")
References: <1331645708-7650-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <877gyoli9n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> If $(HOST_DIR)/usr/bin is in the user's $PATH, and host-libxml2 is
 Markos> installed, the configure script will find xml2-config in
 Markos> $(HOST_DIR)/usr/bin  and the xml2-config --prefix will return the
 Markos> $(HOST_DIR)/usr. This is bad because imagemagick will append
 Markos> -L$(HOST_DIR)/usr/lib to LDFLAGS and it will try to link against
 Markos> the host's libraries instead of those located in the staging directory.

Hmm, is this still a problem? We already have a libxml2 patch for
imagemagick to ensure it picks up the target one, and we explicitly pass
--without-xml if we're not building libxml2 for the target.

Are you testing against buildroot git? From the the patch file name I
would guess not. Could you retry with latest git and let me know if it
is still needed?

-- 
Bye, Peter Korsgaard
