From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 1 Jul 2008 10:46:28 -0700 (PDT)
Subject: [Buildroot]  Howto mainline patches I have posted?
Message-ID: <18221527.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi

I have posted some patches and raised BUG reports but have had no feedback
and i was wondering how i might get these changes mainlined?
These changes are all designed to get GTK building with DirectFB support if
DirectFB is enabled and XORG is not.  I think this would benefit many
embedded buildroot users.
I am currently working on getting WebKit on GTK running with a patch they
have in their bug tracking system that removes the dependancy on ICU and
this I am sure will benefit all cross compilers out there 
For now I have lots of local changes and I just want to get them mainlined
for others to benefit / improve.

The changes are:
Summary 0003614: libxslt uses old build system and does not post edit the
xslt-config script like libxml2/freetype 
Description libxslt is built using old build system. Move to autotargets
system and make sure config script is post edited correctly.
Also add option to support conditional crypto support (based upon libgcrypt
being selected) 

Summary 0003604: libxml2 config script (xml2-config) is not edited in the
same way as freetype-config 
Description libxml2 produces a config script like freetype. Called
xml2-config. It requires that the same SED be done so that cross compilation
works. 

Summary 0003594: ATK does not always require X support to be compiled
 Description ATK does not always require X support to be enabled (DirectFB
only for instance) 

Summary 0003584: Cairo does not build directfb if directfb support required
(dependencies missing) 
Description Cairo supports being built for DirectFB. However it is not
dependent on DirectFB so DirectFB may not actually be build yet 

Summary 0003574: pango.mk redefines PKG_CONFIG_* for no reason 
Description pango.mk currently redefines PKG_CONFIG_PATH/SYSROOT. This is
not necessary as specified in configure enviroment. In my case I have added
usr/local/lib/pkgconfig as well and without this fix I need to edit multiple
makefiles not just package/Makefile.in. 

Summary 0003564: libgtk.mk redefines PKG_CONFIG_PATH, not necessary 
Description libgtk.mk currently redefines PKG_CONFIG_PATH. This is not
necessary as specified in configure enviroment. In my case I have added
usr/local/lib/pkgconfig as well and without this fix I need to edit multiple
makefiles not just package/Makefile.in. 

Summary 0003554: Make libgtk2 visible with DirectFB and not just XORG 
Description libgtk2 is currently dependent on XORG being selected in some
form or another. You may only have DirectFB is which case gtk is currently
not selectable. 

Hope this helps
Daniel Laird
-- 
View this message in context: http://www.nabble.com/Howto-mainline-patches-I-have-posted--tp18221527p18221527.html
Sent from the BuildRoot mailing list archive at Nabble.com.
