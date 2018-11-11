From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 22:17:17 +0100
Subject: [Buildroot] [PATCH] libtool: Make libltdl a separate package
In-Reply-To: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
Message-ID: <20181111221717.0855ea32@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Nov 2018 16:06:46 +0100, Alexander Sverdlin wrote:
> This will save megabytes on the target filesystem if target packages only
> require libltdl part of libtool.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Thanks for this patch!

In fact, I don't think we need the full libtool on the target at all,
so perhaps we should just change the existing libtool package in its
target variant to only install libltdl ?

I see the following packages that have a dependency on target libtool:

 - clamav
 - nut
 - pulseaudio
 - unixodbc

and all of them seem to have this dependency solely for libltdl.

Peter, Yann, Arnout, thoughts ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
