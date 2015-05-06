From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 6 May 2015 17:41:20 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyqt: fix opengl build failure
In-Reply-To: <20150506171450.4c3b4f28@free-electrons.com>
References: <1430924376-26750-1-git-send-email-gwenj@trabucayre.com>
 <20150506171450.4c3b4f28@free-electrons.com>
Message-ID: <20150506174120.7872f5aa@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes.
There are something funny in the logic of this disabling the disable of
something to enabling openglES support...
Gwen

On Wed, 6 May 2015 17:14:50 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Gwenhael Goavec-Merou,
> 
> On Wed,  6 May 2015 16:59:36 +0200, Gwenhael Goavec-Merou wrote:
> 
> > +ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
> > +PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_NoOpenGLES
> > +endif
> 
> Wow, this is a lot of negation.
> 
> So, when OpenGL ES is available, you need to disable the fact of not
> using OpenGL ES.
> 
> Interesting :-)
> 
> Maybe a comment above this piece of code would be useful, because it's
> a bit twisted.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
