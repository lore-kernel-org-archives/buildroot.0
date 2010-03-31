From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Mar 2010 20:52:47 +0200
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <4BB32831.6080306@browserseal.com>
References: <4BB32831.6080306@browserseal.com>
Message-ID: <20100331205247.765bc46e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 31 Mar 2010 13:47:13 +0300
Sasha Sirotkin <buildroot@browserseal.com> wrote:

> Attached please find both config files. 

Which exact AT91 CPU are you using ?

Your Buildroot .config specifies an ARM926 core, which is ARMv5.
However, if you use AT91RM9200, as ?ric B?nard noted, you have an
ARM920 core, which is ARMv4. Therefore, if you have an AT91RM9200 CPU,
it is normal that the Buildroot configuration you sent does not work.
Select BR2_arm920t instead of BR2_arm926t.

Your .config also states that you're using a crosstool-NG external
toolchain. Can you send the .config you used in Crosstool-NG to
generate the toolchain ?

In other words:
 * Give us more details about your hardware
 * Give us your Crosstool-NG configuration file

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
