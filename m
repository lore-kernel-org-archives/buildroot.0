From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 17:08:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/gerbera: add upstream patch to
 fix find_program with taglib-config
In-Reply-To: <e198cc50-3e78-b2df-ccc1-269af7fad363@mind.be>
References: <20190610212023.9483-1-joerg.krause@embedded.rocks>
 <20190610212023.9483-3-joerg.krause@embedded.rocks>
 <e198cc50-3e78-b2df-ccc1-269af7fad363@mind.be>
Message-ID: <20190611170804.0e17d415@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Jun 2019 00:33:31 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > ++            if (CMAKE_CROSSCOMPILING)
> > ++              set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)  
> 
>  Again, this is wrong IMO. The executables in the sysroot are not supposed to be
> executed on the host.
> 
>  What we really should do is to copy those config scripts to some other
> location, and add that to the PATH.

Not so simple: what do you do to differentiate between foo-config
describing foo for the host and foo-config describing foo for the
target ?

Yes, you could install the foo-config in a different directory than
$(HOST_DIR)/bin, but what if some package needs both foo-config for the
host and foo-config for the target, when building its code for the
target ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
