From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Nov 2020 22:07:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/libass: bump to version 0.15
In-Reply-To: <20201029132429.392911-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 29 Oct 2020 14:24:29 +0100")
References: <20201029132429.392911-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh3za2nt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - harfbuzz is mandatory since
 >   https://github.com/libass/libass/commit/f3e2c97e1818598afb0b1c7010003ffe4823ff21
 > - Fix CVE-2020-26682 (In libass 0.14.0, the `ass_outline_construct`'s
 >   call to `outline_stroke` causes a signed integer overflow.) through
 >   https://github.com/libass/libass/commit/676f9dc5b52ef406c5527bdadbcb947f11392929
 >   which does not apply cleanly over version 0.14.

:/

 >   It should be noted that version 0.15 also fixes other integer
 >   overflows (which have no CVE assigned)
 > - Update indentation in hash file (two spaces)

 > https://github.com/libass/libass/releases/tag/0.15.0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/gstreamer1/gst1-plugins-bad/Config.in |  8 ++++++++
 >  package/kodi/Config.in                        |  2 ++
 >  package/libass/Config.in                      |  9 +++++++++
 >  package/libass/libass.hash                    |  4 ++--
 >  package/libass/libass.mk                      | 10 ++--------
 >  5 files changed, 23 insertions(+), 10 deletions(-)

 > diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
 > index 6523dde8c2..72909ae643 100644
 > --- a/package/gstreamer1/gst1-plugins-bad/Config.in
 > +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
 > @@ -330,8 +330,16 @@ comment "plugins with external dependencies"
 
 >  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 >  	bool "assrender"
 > +	depends on BR2_INSTALL_LIBSTDCPP # libass -> harfbuzz
 > +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
 > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libass -> harfbuzz
 >  	select BR2_PACKAGE_LIBASS
 
 > +comment "assrender plugin needs a toolchain w/ C++, gcc => 4.8"

It is '>=', not '=>'

Committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
