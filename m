From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 23 Nov 2017 16:13:51 -0500
Subject: [Buildroot] [PATCH] qt5webengine: enable build for 5.6.3
In-Reply-To: <20171123205819.0d24f020@windsurf.lan>
References: <20171123000402.12399-1-gael.portay@savoirfairelinux.com>
 <20171123205819.0d24f020@windsurf.lan>
Message-ID: <20171123211351.d32j4tcxfankghzl@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, Nov 23, 2017 at 08:58:19PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for this contribution! See some comments below.
> 
> On Wed, 22 Nov 2017 19:04:02 -0500, Ga?l PORTAY wrote:
> > Allow to build qt5webengine 5.6.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> > Hi all,
> > 
> > The build was broken in 5.6.2 and was disabled.
> > 
> > Since we upgraded to 5.6.3, buildroot is able to build without backporting
> > patches.
> > 
> > The two additional patches are useful at run-time.
> > 
> > The first one avoid to specify the path to the SSL certificate directory (using
> > an additional environment variable).
> > 
> > The second one is the same used in 5.9.x (plus resolved conflicts). It uses the
> > process's context to get handles on EGLv2 and GLES libraries. Those libraries
> 
> EGL and GLESv2
> 
> > are linked to Qt WebEngine at compile time.
> > 
> > The patch is particularly usefull for RPI boards since the raspberrypi userland
> > package does not provide the libEGLv2.so.2 and libGLES.so.1 symlinks. Both
> > library paths are hardcoded in Qt WebEngine.
> 
> Please put all these explanations inside the commit log.
> 

Okay, I will add all of this for v2.

> > diff --git a/package/qt5/qt5webengine/5.6.3/0001-change-default-ssl-dir.patch b/package/qt5/qt5webengine/5.6.3/0001-change-default-ssl-dir.patch
> > new file mode 100644
> > index 0000000000..3e55545eee
> > --- /dev/null
> > +++ b/package/qt5/qt5webengine/5.6.3/0001-change-default-ssl-dir.patch
> > @@ -0,0 +1,19 @@
> > +Change the default SSL directory, as buildroot ca-cert package is
> > +installed at /etc/ssl. That way, we don't have to use the SSL_CERT_DIR
> > +environment at runtime.
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> 
> Please use Git formatted patches, since Qt is managed with the Git
> version control system.
> 
> Patch 0002 is correct, but not patch 0001.
> 
> Could you send a new version that fixes those issues?
> 

For sure. I will send the v2 in the next couple of hours.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

Regards,
Gael
