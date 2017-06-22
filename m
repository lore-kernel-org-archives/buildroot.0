From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 22:04:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxconsoletools: always
	select a sub-option
In-Reply-To: <201706221304.v5MD4b8J004249@mx1.sonologic.net> (Koen Martens's
 message of "Thu, 22 Jun 2017 15:03:00 +0200")
References: <201706221304.v5MD4b8J004249@mx1.sonologic.net>
Message-ID: <87vannlrfl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Koen" == Koen Martens <koen.martens@transport.alstom.com> writes:

 > This patch forces BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH
 > to be selected if none of the other sub-options are
 > selected. This fixes build failures when using
 > 'make randpackageconfig', where selecting
 > BR2_PACKAGE_LINUXCONSOLETOOLS without selecting any sub-option
 > would break in the 'install to target' phase.

Please remember to add a reference to the specific autobuilder issues
this fixes for the future.

 > Signed-off-by: Koen Martens <koen.martens@transport.alstom.com>
 > ---
 >  package/linuxconsoletools/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/linuxconsoletools/Config.in b/package/linuxconsoletools/Config.in
 > index d2b0117..bc20abe 100644
 > --- a/package/linuxconsoletools/Config.in
 > +++ b/package/linuxconsoletools/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_LINUXCONSOLETOOLS
 >  	bool "linuxconsoletools"
 > +	select BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH if !BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK && !BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK

I've rewrapped this line and added autobuilder references and committed,
thanks!

-- 
Bye, Peter Korsgaard
