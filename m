From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2016 12:44:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-01-14
References: <20160115073021.DAA6410303A@stock.ovh.net>
 <jvipmcxaun.ln2@ID-313208.user.individual.net> <569AB33F.6010701@mind.be>
 <7mqqmcx6cr.ln2@ID-313208.user.individual.net> <569B5966.5080706@free.fr>
Message-ID: <odbsmcxudn.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 17 Jan 2016 10:05:42 +0100 schrieb Mason:

> Arnout is suggesting:
> 
> depends on !BR2_arc || BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> 
> This equivalence is called "material implication".
> https://en.wikipedia.org/wiki/Material_implication_%28rule_of_inference%
29
> 
> Reading more closely, are you saying the build is broken on ARC if gcc
> version >= 4.8 ? Or is gcc version <= 4.8 ?

Hi Mason,

the build on arc is broken with gcc-4.8, the fix was committed to gcc-4.9:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049

After further inspection I saw that gcc-4.8 is the only toolchain offered 
by buildroot for arc so
	depends on !BR2_arc
alone fixes the problem, see http://patchwork.ozlabs.org/patch/569251/

Regards, Bernd
