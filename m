From: =?ISO-8859-2?B?o3VrYXN6IFB1s2th?= <lukasz@oxnet.pl>
Date: Wed, 2 Nov 2011 12:46:52 +0100
Subject: [Buildroot] PKG_CONFIG_PATH question
In-Reply-To: <CAAXf6LU3fXXea4e5_kXftPMeLoYz6AuSO75s6OShtYsgnjgE=g@mail.gmail.com>
References: <CALX2uoNbshTRLzEXYJMOKuKF2WOxks+Q3w5Rz83YXoku3z_ueA@mail.gmail.com>
 <CAAXf6LU3fXXea4e5_kXftPMeLoYz6AuSO75s6OShtYsgnjgE=g@mail.gmail.com>
Message-ID: <CALX2uoNrcXSLW0LxOomt=sKMPPPZBrxKVBn5pc-rv0xG0QGN2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> For the build system I use quite ancient host machine (slackware),
>> maybe it causes some problems.
>>
>> I could not compile libxcb, getting error from configure that
>> xcb-proto version is less than 1.5 (buildroot is looking for
>> xcb-proto.pc file (during configure) inside " /usr/lib/pkgconfig/" -
>> on my build system) is that nomal ?
>>
>> I could move forward by setting environment variable PKC_CONFIG_PATH
>> to the STAGING_DIR/usr/lib/pkgconfig/, butI do not like this solution.

> Could you give some more details, for example (part of) the build log,
> showing which package is being installed. Some packages first install
> a host- variant. In that case, it is perfectly valid for the configure
> step of that host package to check /usr/lib/pkgconfig.

The error occured when building xcb-proto for the target machine,  not
host-xcb-proto.

My version of pkg-config was 0.21, or 0.20, and it did not supported
PKG_CONFIG_SYSROOT_DIR environment variable.
After updating my build OS (slackware 12)  with newer pkg-config
(0.23) it was possible for me to move forward without the trick with
PKG_CONFIG_PATH.

After some time I found that buildroot generates host-pkg-config
package, but I wonder why buildroot uses my host installed pkg-config,
what is the reason to build host-pkg-config and use pkg-config from my
machine?

Best regards,
Lukasz
