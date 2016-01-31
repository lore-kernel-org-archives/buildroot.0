From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 10:18:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/mosh: Update upstream URLs
	after move to github.com
In-Reply-To: <1454225902-21407-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 31 Jan 2016 08:38:22 +0100")
References: <1454225902-21407-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87r3gyjedd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The project moved to github.com, our current download URL was broken:
 > http://mailman.mit.edu/pipermail/mosh-users/2015-July/000284.html

It was?

wget https://mosh.mit.edu/mosh-1.2.5.tar.gz
--2016-01-31 10:14:36--  https://mosh.mit.edu/mosh-1.2.5.tar.gz
Resolving mosh.mit.edu (mosh.mit.edu)... 18.181.0.46
Connecting to mosh.mit.edu (mosh.mit.edu)|18.181.0.46|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 308857 (302K) [application/gzip]
Saving to: ?mosh-1.2.5.tar.gz?

mosh-1.2.5.tar.gz           100%[=============================================>] 301.62K   633KB/s   in 0.5s   

2016-01-31 10:14:37 (633 KB/s) - ?mosh-1.2.5.tar.gz? saved [308857/308857]


That URL is also listed in the release notes as the official location.


 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/mosh/Config.in | 2 +-
 >  package/mosh/mosh.hash | 4 ++--
 >  package/mosh/mosh.mk   | 5 +++--
 >  3 files changed, 6 insertions(+), 5 deletions(-)

 > diff --git a/package/mosh/Config.in b/package/mosh/Config.in
 > index 868b9ff..ab6eeb8 100644
 > --- a/package/mosh/Config.in
 > +++ b/package/mosh/Config.in
 > @@ -21,4 +21,4 @@ config BR2_PACKAGE_MOSH
 >  	  allows roaming, and provides speculative local echo and line editing
 >  	  of user keystrokes.
 
 > -	  https://mosh.mit.edu
 > +	  https://github.com/mobile-shell/mosh

But the mit.edu page is still what I would consider the user homepage.

> diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
 > index ab925b5..b0a0906 100644
 > --- a/package/mosh/mosh.hash
 > +++ b/package/mosh/mosh.hash
 > @@ -1,2 +1,2 @@
 > -# From: http://mailman.mit.edu/pipermail/mosh-users/2015-July/000283.html
 > -sha256 1af809e5d747c333a852fbf7acdbf4d354dc4bbc2839e3afe5cf798190074be3 mosh-1.2.5.tar.gz
 > +# Locally computed
 > +sha256	35025d412046ee5199ebaa8d876131fc683dccedde18b3945b3bc3662bc9f373	mosh-mosh-1.2.5.tar.gz
 > diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
 > index f8c45e8..3967f41 100644
 > --- a/package/mosh/mosh.mk
 > +++ b/package/mosh/mosh.mk
 > @@ -4,11 +4,12 @@
 >  #
 >  ################################################################################
 
 > -MOSH_VERSION = 1.2.5
 > -MOSH_SITE = https://mosh.mit.edu
 > +MOSH_VERSION = mosh-1.2.5
 > +MOSH_SITE = $(call github,mobile-shell,mosh,$(MOSH_VERSION))
 >  MOSH_DEPENDENCIES = zlib ncurses protobuf openssl host-pkgconf
 >  MOSH_LICENSE = GPLv3+ with exception
 >  MOSH_LICENSE_FILES = COPYING COPYING.iOS
 > +MOSH_AUTORECONF = YES
 
So the only thing this changes is that we now need to autoreconf :/

Perhaps they will stop putting release tarballs on mosh.mit.edu at some
time in the future, but for now I don't see the point of changing this.

-- 
Bye, Peter Korsgaard
