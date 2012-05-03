From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 May 2012 14:23:35 +0200
Subject: [Buildroot] read-edid package - clarifications
In-Reply-To: <CADiAo4K90x6ZANyvQk7SYP=o=YmimOHDn+wfHLSrwE7bumcLKA@mail.gmail.com>
References: <CADiAo4K90x6ZANyvQk7SYP=o=YmimOHDn+wfHLSrwE7bumcLKA@mail.gmail.com>
Message-ID: <20120503142335.461f63c1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 3 May 2012 06:32:35 -0400,
Dimitry Golubovsky <golubovsky@gmail.com> a ?crit :

> > non-essential binaries should probably live in usr/bin/ rather than
> > bin/.
> 
> I think such program may be needed rather early in the boot process.
> Basically it is needed when setting up the framebuffer console
> resolution. I have a real case of Via Unichrome and a Dell widescreen
> monitor where the framebuffer driver is unable to sense the monitor
> (X.org driver does fine though), so the only way for me to initialize
> the console was to run read-edid even before I am attempting to load
> the framebuffer drivers and fbcon. That's why I placed it into /bin
> (or maybe it is even better in /sbin).

On Ubuntu, parse-edid is in usr/bin, get-edid is in usr/sbin. See
http://packages.ubuntu.com/quantal/i386/read-edid/filelist. I don't
feel strongly about this, if you prefer to keep them in bin/, it's
fine. On embedded systems, /usr is most likely on the same partition
as /, so it doesn't make much difference.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
