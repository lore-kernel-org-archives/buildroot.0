From: Andreas Ziegler <br015@umbiko.net>
Date: Sat, 06 Feb 2021 11:11:34 +0000
Subject: [Buildroot] BR2_HOST_GCC_AT_LEAST_4_8 not set but toolchain >
 linaro-7.3-2018.05 !?
In-Reply-To: <mailman.2252.1612552067.250548.buildroot@busybox.net>
References: <mailman.2252.1612552067.250548.buildroot@busybox.net>
Message-ID: <acc14f9c1a468562ab695cb5b68edd97@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Date: Fri, 5 Feb 2021 20:07:34 +0100
> Subject: [Buildroot] BR2_HOST_GCC_AT_LEAST_4_8 not set but toolchain
> 	linaro-7.3-2018.05 !?
> Message-ID:
> 	<CAGshWo2d2hWBWQ-02Eb89YpdnR7Ck6cezX=+grKu91sRf1ObQw@mail.gmail.com>

Hi Emmanuel,

> I build buildroot 2018.11.4 with external toolchain linaro-7.3-2018.05.
> I could not activate the QT5WEBENGINE because I have
> BR2_HOST_GCC_AT_LEAST_4_8 [=n]

HOST_GCC is your host compiler, the Linaro toolchain the cross compiler.

HOST_GCC refers to the toolchain on your build machine. Since it is 
improbable your host computer has a compiler with version < 5 installed, 
something must be wrong in your configuration or the way you start the 
Buildroot make. Do you have environment variables set related to 
compiler or cross compiling? The host path should not contain the target 
toolchain,@least not in first place ...

Buildroot parses the output of 'gcc --version' to eventually set the 
BR2_HOST_GCC_AT_LEAST variables, so maybe start looking there.

Kind regards,
Andreas
