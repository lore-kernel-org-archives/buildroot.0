From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 23 Mar 2016 08:57:08 +0100
Subject: [Buildroot] [PATCH v2 1/1] gnuradio: fix compilation with
 cmake-3.5
In-Reply-To: <4pb8scxncf.ln2@ID-313208.user.individual.net>
References: <1458646304-339-1-git-send-email-gwenj@trabucayre.com>
 <tm98scxncf.ln2@ID-313208.user.individual.net>
 <20160322181159.600222f8@x230.trabucayre.com>
 <4pb8scxncf.ln2@ID-313208.user.individual.net>
Message-ID: <20160323085708.077f41ef@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Mar 2016 18:25:24 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Am Tue, 22 Mar 2016 18:11:59 +0100 schrieb gwenhael.goavec:
> 
> > according to FindBoost.cmake boost_threads depends on atomic &
> > chrono. I think (I'm test before sent a patch) it's better to add
> > the missing dependencies. No ?  
> 
> Hi,
> 
> I have no idea about the internal dependencies of boost. According to
> the commit message CMake now recognizes "indirect dependencies", with
> them gnuradio compiles without problems, like it did with cmake
> 3.4.3. So we have too choices:
> - add dependencies to gnuradio without being sure they are really
> needed
> - live with "indirect dependencies" in boost without knowing whether
> they cause harm or not.
> 
I have maybe wrong but if these "indirect dependencies" are present it's
not for the fun.
It's okay, with the patch mentioned above, gnuradio build successfully,
but don't take care about this dependencies (maybe useless) may
produces problem in a future (or not). I think it's more secure to add
missing modules.

Regards, Gwen
