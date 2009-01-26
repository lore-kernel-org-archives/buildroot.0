From: Robert Nelson <robert.nelson.work@gmail.com>
Date: Mon, 26 Jan 2009 11:24:28 -0600
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <87skn9iv5w.fsf@macbook.be.48ers.dk>
References: <87skn9iv5w.fsf@macbook.be.48ers.dk>
Message-ID: <497DF1CC.2010404@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/23/2009 3:12 PM, Peter Korsgaard wrote:
> Hi,
>
> Another week, another release candidate. I have released
> buildroot-2009.02-rc2:
>
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc2.tar.gz
>
> or
>
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc2.tar.bz2
>
> Please give it a spin and report back issues to the mailing list or
> the bug tracker.
>
> I think we're pretty well on track to do a final release in 2 weeks.
>
>    

Hi Peter & Ulf,

Was just able to test rc-2 for avr32 (atngw100_defconfig and friends)

default atngw100_defconfig is failling at this point in rc2...

log***************
make[4]: Entering directory 
`/media/mirror/testing/buildroot-2009.02-rc2/build_avr32/libglib2-2.16.6/gobject'
make[4]: `glib-genmarshal' is up to date.
make[4]: Leaving directory 
`/media/mirror/testing/buildroot-2009.02-rc2/build_avr32/libglib2-2.16.6/gobject'
echo "#ifndef __G_MARSHAL_H__" > xgen-gmh \
&& echo "#define __G_MARSHAL_H__" >> xgen-gmh \
&& /usr/bin/glib-genmarshal --nostdinc --prefix=g_cclosure_marshal 
./gmarshal.list --header >> xgen-gmh \
&& echo "#endif /* __G_MARSHAL_H__ */" >> xgen-gmh \
&& (cmp -s xgen-gmh gmarshal.h 2>/dev/null || cp xgen-gmh gmarshal.h) \
&& rm -f xgen-gmh xgen-gmh~ \
&& echo timestamp > stamp-gmarshal.h
/bin/sh: line 2: /usr/bin/glib-genmarshal: No such file or directory
make[3]: *** [stamp-gmarshal.h] Error 127
make[3]: Leaving directory 
`/media/mirror/testing/buildroot-2009.02-rc2/build_avr32/libglib2-2.16.6/gobject'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory 
`/media/mirror/testing/buildroot-2009.02-rc2/build_avr32/libglib2-2.16.6'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/media/mirror/testing/buildroot-2009.02-rc2/build_avr32/libglib2-2.16.6'
make: *** 
[/media/mirror/testing/buildroot-2009.02-rc2/build_avr32/libglib2-2.16.6/.stamp_built] 
Error 2

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/
