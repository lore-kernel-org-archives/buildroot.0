From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 May 2014 00:21:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: remove useless
	makefile target.
In-Reply-To: <1400444650-29600-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 18 May 2014 22:24:10 +0200")
References: <1400444650-29600-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87egzqlocm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Makefile's target "install-magickincarchHEADERS" and "magick-install-data-local"
 > install both the same file (magick-baseconfig.h) in the same time...

 > The problem can be reproduced with:
 > mkdir /tmp/bar
 > /usr/bin/install -c -m 644 foo /tmp/bar &
 > /usr/bin/install -c -m 644 foo /tmp/bar/foo
 > /usr/bin/install: cannot create regular file '/tmp/bar/foo' : File exists

 > So, remove one of them.

 > Fixes:
 > http://autobuild.buildroot.net/results/d34/d34077ce582866c50bbd90de10bbe593e39463f1/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
