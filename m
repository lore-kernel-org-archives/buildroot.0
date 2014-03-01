From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 1 Mar 2014 08:46:27 +0100
Subject: [Buildroot] host perl expat broken
In-Reply-To: <AD64DAF96C2F48068C6DE4BA542C19A9@JohanW7>
References: <AD64DAF96C2F48068C6DE4BA542C19A9@JohanW7>
Message-ID: <CAB0FRsvrbXW1p7D7EOR+DPvMepMjbRCLZ9xESmOgdLECKe4Brg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-03-01 1:27 GMT+01:00 Sagaert Johan <sagaert.johan@skynet.be>:
>
> Hi
>
> (using latest pull)
>
>
> make[2]: Entering directory `/home/brcpy/output/build/host-perl-xml-parser-2.41/Expat'
> cp Expat.pm ../blib/lib/XML/Parser/Expat.pm
> /usr/bin/perl /usr/share/perl/5.10.1/ExtUtils/xsubpp -noprototypes -typemap /usr/share/perl/5.10/ExtUtils/typemap -typemap typemap
> Expat.xs > Expat.xsc && mv Expat.xsc Expat.c
> cc -c   -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE
> -D_FILE_OFFSET_BITS=64 -O2 -g   -DVERSION=\"2.41\" -DXS_VERSION=\"2.41\" -fPIC "-I/usr/lib/perl/5.10/CORE"   Expat.c
> Expat.xs:12:19: fatal error: expat.h: No such file or directory
> compilation terminated.
> make[2]: *** [Expat.o] Error 1
> make[2]: Leaving directory `/home/brcpy/output/build/host-perl-xml-parser-2.41/Expat'
> make[1]: *** [subdirs] Error 2
> make[1]: Leaving directory `/home/brcpy/output/build/host-perl-xml-parser-2.41'
> make: *** [/home/brcpy/output/build/host-perl-xml-parser-2.41/.stamp_built] Error 2
>
> Buildroot seems to look for the header file on my host machine.
>

Oops, see http://patchwork.ozlabs.org/patch/325394/

Fran?ois

>
>
> Regards
>  Johan
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
