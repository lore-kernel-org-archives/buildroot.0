From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Aug 2010 18:01:45 +0200
Subject: [Buildroot] Configuring host-lzo fails
In-Reply-To: <4C6FE59A.8020306@gmx.net>
References: <201007272333.09640.PeterHuewe@gmx.de>
	<20100813122600.3d227eb3@surf> <4C6C51CE.5020409@gmx.net>
	<4C6FE59A.8020306@gmx.net>
Message-ID: <20100821180145.1e51ced9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Aug 2010 16:41:30 +0200
Ossy <ossy1980@gmx.net> wrote:

> The same patch applied, I ran into an error with expat today:
> configure: error: no acceptable ld found in $PATH
> make: *** 
> [/home/ossy/buildroot/buildroot-dev/output/build/expat-2.0.1/.stamp_configured] 
> Fehler 1
> 
> After make flush; make the system build went on without problems.

When something doesn't work, then you do "make flush" and then it
works, it means that you've hit a configuration cache issue.

I'm more and more tempted to disable this configuration cache feature.
According to the autoconf maintainers, it could theorically work, but
in practice, there's no real convention on the variable name/value
stored in the configuration cache, so re-using the cache between
different packages is going to cause a lot of troubles. As we are
seeing.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
