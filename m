From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Sep 2018 09:47:05 +0200
Subject: [Buildroot] Including example applications to target
In-Reply-To: <SYCPR01MB344072FCAF83E300F7033CC0CB0D0@SYCPR01MB3440.ausprd01.prod.outlook.com>
 (Bassem Fahmy's message of "Sun, 2 Sep 2018 02:33:42 +0000")
References: <SYCPR01MB344072FCAF83E300F7033CC0CB0D0@SYCPR01MB3440.ausprd01.prod.outlook.com>
Message-ID: <87tvn849za.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bassem" == Bassem Fahmy <t_fahmy_bassem@hotmail.com> writes:

 > Hi,

 > I'm trying to add a new cmake package (aws-iot-devic-sck-cpp) to
 > buildroot. I managed to integrate it and the shared object is added to
 > the target /usr/lib folder. The build also produces a bunch of sample
 > applications (and unit tests). These are not however added to the
 > target (cmake install step doesn't include them in the first
 > place). What is the best approach to add these sample applications to
 > the final image. My two thinkings are:


 > - Add a post install package step to copy those samples (and certificates) to target

 > - Add a patch to the CMakeLists.txt file to add them in the install step.

You probably want to make installing the example conditional on a sub
option (like E.G. BR2_PACKAGE_QT_EXAMPLES), so the first option sounds
simplest.

-- 
Bye, Peter Korsgaard
