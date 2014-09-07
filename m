From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 7 Sep 2014 08:12:06 +0200
Subject: [Buildroot] [UNSURE] Analysis of build failures
In-Reply-To: <20140906203640.09c6d8be@free-electrons.com>
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
Message-ID: <CAB0FRsvqDSWDtZKEvf7=XMgwmBJAEU3xRexjK79xCGErZXN88w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-09-06 20:36 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> Fran?ois, Nathaniel, see below.
>
>>       i686 |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/179d10ed4855cb0e357ff50517abc737c9abdce4/
>
> Fran?ois ?
>
> /usr/bin/perl "-Iinc" /usr/share/perl/5.20/ExtUtils/xsubpp  -typemap /usr/share/perl/5.20/ExtUtils/typemap -typemap typemap  SSLeay.xs > SSLeay.xsc && mv SSLeay.xsc SSLeay.c
> make[1]: *** No rule to make target '/home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/perl5/5.18.2/i686-linux/CORE/vutil.h', needed by 'SSLeay.o'.  Stop.
>
>>        arm |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/c1454491c21c81a2f01b5f21aeff5c39f0a49155/

a quick fix is add another `touch` for vutil.h in perl.mk (see
http://git.buildroot.net/buildroot/commit/package/perl?id=63d0d8040ab4ba8956a13dafd73e2fa044e29c8b)

the real fix is building a host-perl (the patch serie is already is
the patchwork queue)

Fran?ois

>
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
