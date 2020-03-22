From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:30:23 +0100
Subject: [Buildroot] [PATCH v2] uclibc: update to 1.0.33
In-Reply-To: <5e9204f5-2088-18f3-6871-681749eadbf5@gmail.com>
References: <20200309101810.5wtqf2bzxipp536t@waldemar-brodkorb.de>
 <5e9204f5-2088-18f3-6871-681749eadbf5@gmail.com>
Message-ID: <20200322223023.7ce73bff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Mar 2020 16:46:42 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Hi Weldemar,
> 
> Le 09/03/2020 ? 11:18, Waldemar Brodkorb a ?crit?:
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>  
> 
> I used the Buildroot gitlab ci to test the uClibc-ng update
> 
> It seems we need to fix something in qt5base package:
> .obj/qfilesystemengine_unix.o: in function `qt_real_statx(int, char const*, int,
> statx*)':
> qfilesystemengine_unix.cpp:(.text+0x5c): undefined reference to `statx'
> 
> https://gitlab.com/kubu93/buildroot/-/jobs/472027985
> 
> It seems related to [1] but we don't have such issue with glibc (2.29 & 2.30).
> 
> [1]
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=8a04c4d84c8a1a1297ec0c5cec5522112981e0c0

Thanks for the testing. Due to this issue, I'm holding off on the
update to uClibc-ng 1.0.33. Waldemar, will you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
