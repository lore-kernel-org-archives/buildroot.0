From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 May 2014 22:52:23 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
	parent include dir
In-Reply-To: <5388ECDC.6050909@gmx.net> ("Peter =?utf-8?Q?K=C3=BCmmel=22's?=
 message of "Fri, 30 May 2014 22:41:00 +0200")
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
 <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
 <5388A9DC.1010204@gmx.net>
 <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
 <20140530222718.5cb42dd5@free-electrons.com>
 <5388ECDC.6050909@gmx.net>
Message-ID: <8761kn7zw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter K?mmel <syntheticpp@gmx.net> writes:

Hi,

 >> Agreed, and therefore I'd like to understand in more details why the
 >> patch is needed. We typically don't commit things we don't understand
 >> why they are needed :)

 > In short: anybody assumes "#include <GLES2/gl2.h>" works when the search
 > paths of pkg-config are used. But when pkg-config reports /usr/include/GLES2
 > gl2.h could not be found, because there is no /usr/include/GLES2/GLES2/gl2.h.

 > Until now this doesn't pop up because by chance the directory GLES2
 > resides in /usr/include and this path is added by most by build systems.
 > But the cmake configure scripts of Qt5 test for "GLES2/gl2.h" only in the path
 > reported by pkg-config.

But $SYSROOT/usr/include is the standard include path, so gcc
automatically looks there. What exactly doesn't work for you?

This is exactly the same as E.G. #include <sys/stat.h> for open(2).

-- 
Bye, Peter Korsgaard
