From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Jan 2016 11:34:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-01-14
References: <20160115073021.DAA6410303A@stock.ovh.net>
Message-ID: <jvipmcxaun.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 15 Jan 2016 08:30:21 +0100 schrieb Thomas Petazzoni:

>          arc | libbroadvoice-f65b0f50c8c76... | NOK |
>          http://autobuild.buildroot.net/
results/2c6cc56b8d103c661b7ec66f5216ff6dc72ff02a/

Hi,

the reason for this build error is a arc-only gcc bug which was fixed in 
gcc-4.9: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049

The toolchain used by the autobuilders is gcc-4.8 which explains the 
build error. Afaics Kconfig does not allow something like this:

	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 if BR2_arc

Could you please give me some advise on how to fix the problem?
Thanks!

Regards, Bernd
