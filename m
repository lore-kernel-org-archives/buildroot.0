From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 May 2016 23:40:35 +0200
Subject: [Buildroot] [PATCH v3] openzwave: new package
In-Reply-To: <18234_1461593236_571E2494_18234_9415_1_d894cc93-b732-4ef7-ad29-329991781b34@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
 (fabrice fontaine's message of "Mon, 25 Apr 2016 16:07:10 +0200")
References: <18234_1461593236_571E2494_18234_9415_1_d894cc93-b732-4ef7-ad29-329991781b34@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
Message-ID: <874m9g4k6k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <fabrice.fontaine@orange.com> writes:

Hi,

Sorry for the slow response. The commit looks good, but when I tried
doing a test build with it applied to the next branch I got:

Building Msg.o
Building Notification.o
Creating vers.cpp
Making ozw_config file
Building vers.o
/home/peko/source/buildroot/output-zwave/build/openzwave-v1.4/cpp/src/vers.cpp:4:30: error: ?rc1? was not declared in this scope
 uint16_t ozw_vers_revision = rc1;
                              ^
/home/peko/source/buildroot/output-zwave/build/openzwave-v1.4/cpp/build/support.mk:113: recipe for target '/home/peko/source/buildroot/output-zwave/build/openzwave-v1.4/.lib/vers.o' failed
make[3]

vers.cpp contains:

#include "Defs.h"
uint16_t ozw_vers_major = 1;
uint16_t ozw_vers_minor = 4;
uint16_t ozw_vers_revision = rc1;
char ozw_version_string[] = "2016.05-rc1-96-gb28564b";

Which sounds like it is getting the git version info of the Buildroot
repo, which is obviously wrong.

Care to take a look?

-- 
Bye, Peter Korsgaard
