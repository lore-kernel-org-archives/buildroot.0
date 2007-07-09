From: Allan Clark <allanc@chickenandporn.com>
Date: Mon, 9 Jul 2007 14:50:19 -0400
Subject: [Buildroot] [buildroot 0001415]: SVN buildroot does not build
	configuration package
In-Reply-To: <20070709182752.GB24951@aon.at>
References: <6b74b6a0ff9392d0dc56e671767727a0@busybox.net>
	<20070709182752.GB24951@aon.at>
Message-ID: <37c712e0707091150q216848bqfb06055300b50398@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/9/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> >----------------------------------------------------------------------
> > chickenandporn - 07-09-07 11:19
> >----------------------------------------------------------------------
> >(over checkout of r19054)
> >patching file target/device/Soekris/net4521/linux.mk
> >patching file target/device/Via/epia-mii/linux.mk
> >patching file target/device/Sharp/LNode80/linux.mk
>
> Yes, these should be deleted.

They're not deleted in SVN, so I patch them per "cp -fa" -> "cp -fPpR"

> >patching file package/openssl/openssl.mk
> >patching file Makefile
> >patching file package/config/foo.h
>
> There's no need to touch foo.h

Actually, there is, and I discussed it in the list


> >patching file toolchain/gcc/4.2.0/500-bsd-no-map_anonymous.patch
> >patching file toolchain/dependencies/dependencies.sh
> >patching file toolchain/dependencies/dependencies.mk
> >patching file package/make/make.mk
>
> Is there a newer version of make out there?

I think it was updated in r19056; this change is used with following:

> >patching file toolchain/dependencies/check-host-make.sh

See also bug #1422

> >patching file toolchain/uClibc/uClibc-0.9.28-no-cp-d.patch
>
> You should send this to the uClibc list..

yup, it's involved too with the linux.mk changes above, and it's still
too dirty to share.

> >:~/src/buildroot Allan$ chmod +x
> >toolchain/dependencies/check-host-make.sh
>
> I don't think that you really need this to be executable

Fails if it isn't executable.

I assume if my bug#1422, resolved by file#1072 and 1073 is
incorporated, then I won't need to make this file executable, it'll
checkout executable just as check-host-sed.sh does.

Allan
-- 
allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
