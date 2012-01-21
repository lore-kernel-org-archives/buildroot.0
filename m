From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 03:46:05 +0100
Subject: [Buildroot] "configure: error: Can't use static libraries for
	DRI drivers" attempting to install X11 intel driver
In-Reply-To: <CAJSc0StTh6_SEt=vL93-ZbuHvojfEVkma2aP1gPG2t9NK=6H3w@mail.gmail.com>
References: <CAJSc0StTh6_SEt=vL93-ZbuHvojfEVkma2aP1gPG2t9NK=6H3w@mail.gmail.com>
Message-ID: <201201210346.06201.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 19 January 2012 12:42:16 Willy wrote:
> Hi,
> in my buildroot 2011.11 I've tried to install X11 intel video driver.
> After that I get the error:
> "configure: error: Can't use static libraries for DRI drivers"
> 
> Even if I deselect X11 intel video driver the error continues to show and
> my building fails every times.
> 
> I saw this message:
> 
> http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/33419
> 
> but I don't understand where I could download the patch (if there is one!)
> and how apply to my buildroot.
> 
> Regards,
> 

 Buildroot sets SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared to 
build both static and shared libraries, but mesa (and probably others) 
can't build both, and will default to static.

 To fix it, add --disable-static to MESA3D_CONF_OPT (in 
package/x11r7/mesa3d/mesa3d.mk).  If you have another package with the same
problem, you can fix it in the same way (and please report it on the list).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
