From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 14:13:01 +0200
Subject: [Buildroot] [PATCH 5/5] package/freerdp: introduce the wayland
	client
In-Reply-To: <cfef88063641104f06cac70e48390a1ea06305b9.1441569038.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 6 Sep 2015 21:54:22 +0200")
References: <cover.1441569038.git.yann.morin.1998@free.fr>
 <cfef88063641104f06cac70e48390a1ea06305b9.1441569038.git.yann.morin.1998@free.fr>
Message-ID: <87vbao9mlu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/freerdp/Config.in  |  5 +++++
 >  package/freerdp/freerdp.mk | 22 ++++++++++++++++++----
 >  2 files changed, 23 insertions(+), 4 deletions(-)

 > diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
 > index 7758025..a007b0b 100644
 > --- a/package/freerdp/Config.in
 > +++ b/package/freerdp/Config.in
 > @@ -69,6 +69,11 @@ config BR2_PACKAGE_FREERDP_CLIENT_X11
 >  comment "server and X11 client need X.Org"
 >  	depends on !BR2_PACKAGE_XORG7
 
 > +# Dependencies for wayland are already dependencies of FreeRDP
 > +config BR2_PACKAGE_FREERDP_CLIENT_WL
 > +	bool "wayland client"
 > +	select BR2_PACKAGE_WAYLAND

For the X11 client we depend on XORG, so it imho makes sense to use
depends on (and default y) here as well. It is also in line with the
other packages with optional wayland support (gstreamer, libgtk3).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
