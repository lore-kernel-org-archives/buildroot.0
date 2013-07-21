From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 21 Jul 2013 13:26:27 -0300
Subject: [Buildroot] [PATCH 1/9] gcc/bfin: doesn't support --with-cpu
 defaults
In-Reply-To: <20130721173539.28707500@skate>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
 <1374324735-2286-2-git-send-email-gustavo@zacarias.com.ar>
 <20130721173539.28707500@skate>
Message-ID: <51EC0BB3.6060109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/21/2013 12:35 PM, Thomas Petazzoni wrote:

> This looks odd because the BR2_GCC_TARGET_CPU_REVISION thing was added
> by Sonic Zhang, see 66d41890ec2b76189bcd427a0cc3966ff56f9712. So it is
> specifically useful on Blackfin. Maybe just with Analog Devices
> toolchains, I don't know. But clearly, removing that for Blackfin seems
> wrong.

Exactly, with their twisted toolchains, snip without it:

checking for clock_t... yes
checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
This target does not support --with-cpu.
Valid --with options are:
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/home/gustavoz/b/fin/output/build/host-gcc-initial-4.5.4/build'
make: ***
[/home/gustavoz/b/fin/output/build/host-gcc-initial-4.5.4/.stamp_built]
Error 2

Regards.
