From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 18:02:06 +0100
Subject: [Buildroot] svn commit: [25827] trunk/buildroot/package/automake
In-Reply-To: <20090326165522.5C989771F6@busybox.osuosl.org>
	(tpetazzoni@uclibc.org's message of "Thu\,
	26 Mar 2009 16\:55\:22 +0000 \(UTC\)")
References: <20090326165522.5C989771F6@busybox.osuosl.org>
Message-ID: <87tz5ggqup.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "tpetazzoni" == tpetazzoni  <tpetazzoni@uclibc.org> writes:

 tpetazzoni> Author: tpetazzoni
 tpetazzoni> Date: 2009-03-26 16:55:21 +0000 (Thu, 26 Mar 2009)
 tpetazzoni> New Revision: 25827

 tpetazzoni> Log:
 tpetazzoni> /usr/share/aclocal is now in $(HOST_DIR) and not $(STAGING_DIR).

Hmm, isn't this mixing up the host aclocal dir and the target
(staging) one? The host packages install into HOST_DIR (and hence
HOST_DIR/usr/share/aclocal), and the target libraries install into
STAGING_DIR.

I guess auto* won't be able to find the m4 files for the packages
where we don't build a host version with this change.

-- 
Bye, Peter Korsgaard
