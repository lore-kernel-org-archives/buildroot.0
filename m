From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2014 23:35:28 +0200
Subject: [Buildroot] [PATCH 1/6] system: make the zoneinfo list a system
	option
In-Reply-To: <3b823a60209ab14af1ad45420c9b3bd4014f3311.1396900553.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 7 Apr 2014 21:58:03 +0200")
References: <cover.1396900553.git.yann.morin.1998@free.fr>
 <3b823a60209ab14af1ad45420c9b3bd4014f3311.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <87y4zfa4in.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>

 > ---
 > Note: because the tzdata package loses its prompt, it defaults
 > to 'n'. This means a user will loose his timezone settings,
 > unless he selects to install timezone info in the system
 > configuration menu.

 > We can not add a legacy option for that, or we'd get a circular
 > dependency. The only way we'd be fool-proof would be by renaming
 > the package altogether, and adding a legacy option for the old
 > name.
 > ---
 >  Config.in.legacy         | 15 +++++++++++++++
 >  package/tzdata/Config.in | 23 +++--------------------
 >  package/tzdata/tzdata.mk |  4 ++--
 >  system/Config.in         | 23 +++++++++++++++++++++++
 >  4 files changed, 43 insertions(+), 22 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index ce44d0f..393cc1f 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -215,6 +215,21 @@ config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 >  ###############################################################################
 >  comment "Legacy options removed in 2014.02"
 
 > +config BR2_TARGET_TZ_ZONELIST
 > +	default BR2_PACKAGE_TZDATA_ZONELIST if BR2_PACKAGE_TZDATA_ZONELIST != ""
 > +

These should go under 2014.05. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
