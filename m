From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:45:28 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
In-Reply-To: <trinity-6f4e61bd-29a2-4eda-99e3-7f78e881ab04-1522571242948@3c-app-mailcom-bs16>
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
 <trinity-60c51855-aef6-4353-90a8-2e1f048863e2-1522567079284@3c-app-mailcom-bs16>
 <trinity-8edc1929-b40d-4afa-85a8-e152cef642fb-1522567556973@3c-app-mailcom-bs16>
 <1je6pexo6d.ln2@ID-313208.user.individual.net>
 <trinity-550783d4-570b-41d5-937b-f66aa367d27f-1522568580265@3c-app-mailcom-bs16>
 <4sf6pexo6d.ln2@ID-313208.user.individual.net>
 <trinity-8096f0c8-32ae-4d0a-ad74-d40b12f0f8ff-1522569777353@3c-app-mailcom-bs16>
 <e4h6pexo6d.ln2@ID-313208.user.individual.net>
 <trinity-6f4e61bd-29a2-4eda-99e3-7f78e881ab04-1522571242948@3c-app-mailcom-bs16>
Message-ID: <20180401104528.415486a7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 1 Apr 2018 10:27:22 +0200, daggs wrote:

> > so you think it is possible to use libamcodec support in Kodi with OpenGL 
> > ES provided by, let's say, mesa3d with the DRI swrast driver? And even if 
> > there is no direct dependency between the libamcodoc and odroid-mali 
> > packages what about extending the
> > 
> > 	ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> > 
> > check in kodi.mk to
> > 
> > 	ifeq ($(BR2_PACKAGE_LIBAMCODEC)$(BR2_PACKAGE_ODROID_MALI),yy)
> > 
> > to fix the build error?
> > 
> > Regards, Bernd
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >   
> 
> as said by Thomas in another mail, there shouldn't be any dependency, what is the exact issue? compilation failure? what kodi version are you using?
> the answers for the two questions above will give me a lead on where to start looking.

Well, even though there is no dependency between libamcodec and
odroid-mali, it is possible that Kodi needs both to enable the AML
platform support.

But indeed, it would be easier if Bernd could provide a .config file
that allows to reproduce the build failure.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
