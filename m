From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 21 Sep 2012 20:36:45 +0200
Subject: [Buildroot] [PATCH 05/13] perl: add GDBM_File
In-Reply-To: <20120920215953.4d4650fb@skate>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-5-git-send-email-francois.perrad@gadz.org>
 <20120920215953.4d4650fb@skate>
Message-ID: <CAB0FRsuJ8vSgW8My3HzKVG5BDMu7049NtScW6ijbzKbL4sTPLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/9/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Sat,  8 Sep 2012 14:28:37 +0200, Francois Perrad wrote:
>
>> +ifdef BR2_PACKAGE_PERL_GDBM_FILE
>
> ifeq ($(BR2_PACKAGE_PERL_GDBM_FILE),y)

ok

>
>> +    PERL_DEPENDENCIES += gdbm
>> +endif
>>  HOST_PERL_DEPENDENCIES =
>
> There is no configuration option or argument to pass to Perl to tell it
> to use Gdbm (or Berkeley DB)? I am a bit worried that if GDBM is
> available on the build machine (for the build machine architecture),
> the Perl build system might get confused and think that GDBM or
> Berkeley DB are available, while they are not available for the target.
> I.e, for autotools packages, we typically have:
>
> ifeq ($(BR2_PACKAGE_FOO_FEATURE_A),y)
> FOO_DEPENDENCIES += liba
> FOO_CONF_OPT += --enable-feature-a
> else
> FOO_CONT_OPT += --disable-feature-a
> endif
>
> Isn't a similar construct necessary here?
>

The Configure script is not created by autotools, by a tool named 'metaconfig'.
So, an option --enable-gdbm is not needed.
The Configure script detects the include and the lib.
The parameter libc defines a path with SYSROOT, so, there is not
confusion with build machine.

Fran?ois

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
