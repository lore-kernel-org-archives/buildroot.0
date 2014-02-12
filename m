From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 20:57:21 +0100
Subject: [Buildroot] [PATCH] Add OpenTyrian package (SDL game)
In-Reply-To: <1392108199-14612-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Tue, 11 Feb 2014 09:43:19 +0100")
References: <1392108199-14612-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87y51gqf32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 > From: Julien Boibessot <julien.boibessot@armadeus.com>
 > Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
 > ---
 >  Changes since RFC:
 >  - Took Arnout & Thomas comments into account:
 >    * installation of executable in /usr/bin instead of /usr/games
 >    * removing of double BR2_PACKAGE_SDL_NET
 >    * usage of /bin/true for STRIP
 >    * lowercase for .mk banner
 >    * creation of a dedicated package for game data

 >  package/Config.in                          |    2 +
 >  package/opentyrian-data/Config.in          |    8 ++++++
 >  package/opentyrian-data/opentyrian-data.mk |   23 +++++++++++++++++
 >  package/opentyrian/Config.in               |   24 ++++++++++++++++++
 >  package/opentyrian/opentyrian.mk           |   36 ++++++++++++++++++++++++++++
 >  5 files changed, 93 insertions(+), 0 deletions(-)
 >  create mode 100644 package/opentyrian-data/Config.in
 >  create mode 100644 package/opentyrian-data/opentyrian-data.mk
 >  create mode 100644 package/opentyrian/Config.in
 >  create mode 100644 package/opentyrian/opentyrian.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 631d8b2..c89f303 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -159,6 +159,8 @@ source "package/doom-wad/Config.in"
 >  source "package/gnuchess/Config.in"
 >  source "package/lbreakout2/Config.in"
 >  source "package/ltris/Config.in"
 > +source "package/opentyrian/Config.in"
 > +source "package/opentyrian-data/Config.in"
 >  source "package/prboom/Config.in"
 >  source "package/rubix/Config.in"
 >  endmenu
 > diff --git a/package/opentyrian-data/Config.in b/package/opentyrian-data/Config.in
 > new file mode 100644
 > index 0000000..ee3d8be
 > --- /dev/null
 > +++ b/package/opentyrian-data/Config.in
 > @@ -0,0 +1,8 @@
 > +config BR2_PACKAGE_OPENTYRIAN_DATA
 > +	bool "OpenTyrian data"
 > +	help

I don't think it makes much sense for people to select opentyrian-data
without opentyrian, so I've added a 'depends on BR2_PACKAGE_OPENTYRIAN'
and committed to next, thanks.

-- 
Bye, Peter Korsgaard
