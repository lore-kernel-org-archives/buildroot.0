From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 13:14:55 +0200
Subject: [Buildroot] [PATCH 20/23] qt: simplify and fix installing qt in
 the target
In-Reply-To: <1254907246-5650-21-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-21-git-send-email-mroth@nessie.de>
Message-ID: <20091007131455.0e427cd0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:43 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> Get rid of unnecessary complex constructs to install Qt in the target
> file system. This also fixes the installation procedure when Qt is
> build static.
> 
> Additionally wipe out old Qt files from the staging area and target
> file system before installing the new ones to prevent messiness.

Ok, but two remarks:

 1. I'm a little bit confused by the .staged/.installed naming.
    Instead, could we use a naming closer to the one used in
    Makefile.autotools.in, which could be: .staging_installed
    and .target_installed ?

 2. The installation of the libraries to the target/ directory will
    include the unnecessary libQt*.so symbolic link (only libQt*.so.X
    symbolic links + the library itself are really needed for the
    runtime)

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
