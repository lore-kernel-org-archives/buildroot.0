From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 21:56:17 +0100
Subject: [Buildroot] [PATCH v1 0/3] qt5: fix build issue with mesa w/out
 xcb
In-Reply-To: <20180222164738.kprf7kz2u3vywpxm@archlinux> (=?utf-8?Q?=22Ga?=
 =?utf-8?Q?=C3=ABl?= PORTAY"'s
 message of "Thu, 22 Feb 2018 11:47:38 -0500")
References: <20180212042524.28675-1-gael.portay@savoirfairelinux.com>
 <20180222164738.kprf7kz2u3vywpxm@archlinux>
Message-ID: <87371mnocu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ga?l" == Ga?l PORTAY <gael.portay@savoirfairelinux.com> writes:

Hi,

 > As discussed with Thomas on the #buildroot channel:

 > 	2018-02-16 09:01:14	kos_tom	gportay: I think the OpenGL implementation should provide those flags in its .pc file, and qt should pick them up from there

 > Hopefully, the MESA_EGL_NO_X11_HEADERS cflags is present the egl.pc file
 > from mesa3d:

 > 	$ output/host/bin/pkg-config --cflags-only-other egl
 > 	 -DMESA_EGL_NO_X11_HEADERS

 > I will work on a proper solution that will be integrated in every Qt
 > projects that are impacted by this issue.

 > I need time/help to hundersand how qmake works in order to append the
 > egl cflags given by pkg-config in qmake.

 > I almost sure that I will miss the release. So, would you agree to
 > accept this patch serie as a temporary workaround since it fixes a real
 > build issue?

Yes, I guess that is the best solution for 2018.02. I'll apply the 3 patches.

-- 
Bye, Peter Korsgaard
