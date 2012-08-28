From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Aug 2012 01:18:00 +0200
Subject: [Buildroot] 2012.08-rc3 skipping python modules during build
In-Reply-To: <CALoHCLOK1-F5uxiWc95Mr6SJwCc2sqxicBi5V93-HtuBOhY0kA@mail.gmail.com>
References: <CALoHCLOK1-F5uxiWc95Mr6SJwCc2sqxicBi5V93-HtuBOhY0kA@mail.gmail.com>
Message-ID: <20120829011800.01eb081e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Aug 2012 08:43:38 -0700,
Eric Seifert <eric.seifert@cyaninc.com> a ?crit :

> Hello, I have been using the stable 2012.05 build without issue and wanted
> to try the latest rc3. I have a few extra python modules I have added to
> the external python modules section. It seems in the latest rc3 is not
> building them or even downloading the packages even though they are
> selected in the menuconfig, they are just ignored. It works in the stable
> 2012.05 build. When I select one of the existing external modules such as
> pthon-serial, it does get built.

You aren't giving enough details to provide a final answer, but my
guess is that you should replace:

$(eval $(call GENTARGETS))

by

$(eval $(generic-package))

at the end of your Python external modules .mk files.

And also, you should submit those .mk files upstream if they correspond
to publicly available Python modules.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
