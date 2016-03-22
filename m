From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Mar 2016 18:25:24 +0100
Subject: [Buildroot] [PATCH v2 1/1] gnuradio: fix compilation with
	cmake-3.5
References: <1458646304-339-1-git-send-email-gwenj@trabucayre.com>
 <tm98scxncf.ln2@ID-313208.user.individual.net>
 <20160322181159.600222f8@x230.trabucayre.com>
Message-ID: <4pb8scxncf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 22 Mar 2016 18:11:59 +0100 schrieb gwenhael.goavec:

> according to FindBoost.cmake boost_threads depends on atomic & chrono. I
> think (I'm test before sent a patch) it's better to add the missing
> dependencies. No ?

Hi,

I have no idea about the internal dependencies of boost. According to the 
commit message CMake now recognizes "indirect dependencies", with them 
gnuradio compiles without problems, like it did with cmake 3.4.3. So we 
have too choices:
- add dependencies to gnuradio without being sure they are really needed
- live with "indirect dependencies" in boost without knowing whether they 
cause harm or not.

Regards, Bernd
