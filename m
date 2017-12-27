From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 27 Dec 2017 09:34:32 +0100
Subject: [Buildroot] build failure against libintl on alpine
In-Reply-To: <871sjgg4mk.fsf@paral.in>
References: <871sjgg4mk.fsf@paral.in>
Message-ID: <20171227083432.GJ27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Christian Stewart wrote,

> 
> Hi all,
> 
> Here with another build error today, this time against Alpine linux.

Alpine uses musl C library, I think your errors are all related to
that. Does anyone used musl based system for buildroot development
before Christian?
 
> make[1]: Entering directory '/home/buildroot/output/build/uclibc-1.0.26/utils'
>   HOSTCC utils/getconf.host
>   HOSTCC utils/ldconfig.host
>   HOSTCC utils/ldd.host
> ../utils/getconf.c:439:29: error: '_SC_CHARCLASS_NAME_MAX' undeclared here (not in a function)
>      { "CHARCLASS_NAME_MAX", _SC_CHARCLASS_NAME_MAX, SYSCONF },
>                              ^~~~~~~~~~~~~~~~~~~~~~

I can take a look for this error.

best regards
 Waldemar
