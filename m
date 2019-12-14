From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 14 Dec 2019 21:48:05 +0100
Subject: [Buildroot] [PATCH v3 for-next 00/11] gitlab Qemu runtime
 testing
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <4ae261dd-e9f5-0212-eafd-c642c21d27bf@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 17/11/2019 ? 21:18, Romain Naour a ?crit?:
> This new iteration take into account the previous review with
> some additional rework.
> 
> This series start by removing useless host-qemu build for
> m68k_q800, enable serial console for x86/x86_64 and some
> refactoring for csky and arm-versatile.
> 
> Replace the readme.txt file by a bash script that ease starting
> Qemu. Then a new comment is added to each Qemu defconfig files in
> order to provide the path to this new script.
> This path help to link each Qemu defconfig with it's own script.
> 
> Add new python script to be used by gitlab to start Qemu when
> a Qemu defconfig is built.
> 
> Finally add this new python script to .gitlab-ci.yml.
> 
> http://lists.busybox.net/pipermail/buildroot/2019-May/249432.html
> 

I discussed about this series with Jeremy and he suggest to add the Qemu command
line into the Qemu's defconfig file (add a new Kconfig option).
With that, we can even add a new Makefile target "make run-qemu" to start Qemu
when the Qemu command line is set in the defconfig (this would avoid adding
several launch.sh script).

Thought ?

Best regards,
Romain
