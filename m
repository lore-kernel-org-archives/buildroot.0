From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 22:18:13 +0100
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <20150315221722.3645eb35@free-electrons.com>
References: <20150315221722.3645eb35@free-electrons.com>
Message-ID: <20150315221813.173a36e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Sun, 15 Mar 2015 22:17:22 +0100, Thomas Petazzoni wrote:
> Hello Gustavo,
> 
> I believe you originally added the support to build a Blackfin
> toolchain with the Buildroot internal toolchain backend. Today, I've
> added an external Blackfin toolchain built by Buildroot in the
> autobuilder, and one build failure occurred with this toolchain, on the
> Bellagio package:
> 
>   http://autobuild.buildroot.org/results/05f/05fa9cb522514e9e5b9e81893f145aab00abd803/build-end.log

There was also another issue, on alsa-lib:

  http://autobuild.buildroot.org/results/b6c/b6c5dc4c4bfed3e23ebb698bc3b262798fcbedd9/build-end.log

.libs/error.o: In function `_snd_lib_error_default':
error.c:(.text+0xca): undefined reference to `___emutls_get_address'
.libs/error.o: In function `_snd_lib_error_set_local':
error.c:(.text+0x15a): undefined reference to `___emutls_get_address'
error.c:(.text+0x166): undefined reference to `___emutls_get_address'

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
