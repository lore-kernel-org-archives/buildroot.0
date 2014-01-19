From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Jan 2014 21:31:29 +0100
Subject: [Buildroot] [PATCH 09/10] urg: make sdl support optional
In-Reply-To: <1390073027-14239-10-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 18 Jan 2014 20:23:46 +0100")
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-10-git-send-email-s.martin49@gmail.com>
Message-ID: <877g9vn272.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Only enable SDL support if SDL and SDL_net are already enabled in the
 > configuration.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  package/urg/Config.in |  5 ++---
 >  package/urg/urg.mk    | 10 +++++++---
 >  2 files changed, 9 insertions(+), 6 deletions(-)

 > diff --git a/package/urg/Config.in b/package/urg/Config.in
 > index ded8204..232f4c4 100644
 > --- a/package/urg/Config.in
 > +++ b/package/urg/Config.in
 > @@ -1,11 +1,10 @@
 >  config BR2_PACKAGE_URG
 >  	bool "urg"
 >  	depends on BR2_INSTALL_LIBSTDCPP
 > -	select BR2_PACKAGE_SDL
 > -	select BR2_PACKAGE_SDL_NET
 >  	help
 >  	  Library to control Hokuyo's URG series sensors.
 > -	  Requires SDL & SDL_net.
 > +
 > +	  If SDL and SDL_net are enable, SDL support will be automatically added.

Committed with this line dropped as pointed out by Yann, thanks.

-- 
Bye, Peter Korsgaard
