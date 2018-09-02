From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Sep 2018 12:31:28 +0200
Subject: [Buildroot] Including example applications to target
In-Reply-To: <SYCPR01MB3440F757740F1CD405B561EECB0D0@SYCPR01MB3440.ausprd01.prod.outlook.com>
 (Bassem Fahmy's message of "Sun, 2 Sep 2018 10:09:22 +0000")
References: <SYCPR01MB344072FCAF83E300F7033CC0CB0D0@SYCPR01MB3440.ausprd01.prod.outlook.com>
 <87tvn849za.fsf@dell.be.48ers.dk>
 <SYCPR01MB3440F757740F1CD405B561EECB0D0@SYCPR01MB3440.ausprd01.prod.outlook.com>
Message-ID: <87lg8k42db.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bassem" == Bassem Fahmy <t_fahmy_bassem@hotmail.com> writes:

 >> You probably want to make installing the example conditional on a sub
 >> option (like E.G. BR2_PACKAGE_QT_EXAMPLES), so the first option sounds
 >> simplest.

 > Thanks for the reply.
 > Following on this I have another question. The sample applications are
 > built in the aws build folder
 > (buildroot/output/build/aws-iot-device-sdk-cpp-master/buildroot-build/bin). How
 > should I reference this?
 > Is it ok to reference buildroot-build directly or is there a variable that references it.

 > cp -dpfr $(@D)/buildroot-build/bin/* $(TARGET_DIR)/aws-iot-device-sdk-cpp

$(@D) is the build directory for the package, so that is fine.

I notice you have 'master' as the version in
aws-iot-device-sdk-cpp-master, which sounds like a branch name and not a
tag. The package version must refer to a tag (or vcs revision hash). See
the manual for details:

http://nightly.buildroot.org/manual.html#generic-package-reference

-- 
Bye, Peter Korsgaard
