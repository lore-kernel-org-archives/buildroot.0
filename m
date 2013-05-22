From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 09:30:30 +0200
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <519C6E91.3080905@mind.be>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <20130520165204.0269d05a@skate>
 <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
 <20130520192543.3b61d666@skate> <519C636D.9010805@mind.be>
 <20130522090137.721cbaac@skate> <519C6E91.3080905@mind.be>
Message-ID: <20130522093030.23c820f5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 22 May 2013 09:06:57 +0200, Arnout Vandecappelle wrote:

> > So, to me, while this option is still named BR2_PREFER_STATIC_LIB, we
> > should think of it as BR2_USE_ONLY_STATIC_LIB. Maybe someday we'll
> > rename it? :-)
> 
>   Probably not :-)

Well, with the nice Config.in.legacy stuff you've done, you've opened
new horizons to people like me who like to rename config options just
for the sake of it :-)

> > Of course, that raises the question of whether we should disable all
> > libraries/applications that use dlopen() libraries when this option is
> > enabled.
> 
>   Hm. Does dlopen() still work when e.g. libc is linked statically? I 
> guess not, because the dlopen()en library  would probably need some 
> symbols from libc. Therefore, packages that dlopen() should depend on 
> !BR2_PREFER_STATIC_LIB.

Yes, I believe so.

>   Now, I would say that we require the "use only" logic only for new 
> packages, and we fix packages as we go. I don't think it's worth to spend 
> a lot of effort fixing all the existing packages (like lua libraries, 
> gst-plugins, who knows what).

Yes, I agree. For now, the BR2_PREFER_STATIC_LIB=y configurations in
the autobuilders are raising a sufficient number of issues, so let's
try to solve those first. Once this settle down, I'll enable something
that checks whether any shared library is installed in the
BR2_PREFER_STATIC_LIB=y case, and which will make the build fail if
it's the case.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
