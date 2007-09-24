From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 24 Sep 2007 01:56:05 +0100
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <1190591711.4299.17.camel@cyclops.infocab.com.au>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
Message-ID: <d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

shouldn't you patch uClib instead? Claiming index with a define is
really stupid on the part of the library. Others, including myself use
index as variable names quite often.

On 9/24/07, Adam Hawes <adam@infocab.com.au> wrote:
> On Sun, 2007-09-23 at 18:12 +0200, Ulf Samuelsson wrote:
> > Anyone building qtopia?
> > I get (when compiling with gcc-4.2.1/binutils-2.18/uclibc-0.9.29):
> >
> >
> > arm-linux-g++ -c -pipe -g -g -fvisibility=hidden
> > -fvisibility-inlines-hidden -Wall -W -D_REENTRANT -fPIC -DQT_SHARED
> > -DTSLIBMOUSEHANDLER_DEBUG -DQT_BUILD_CORE_LIB -DQT_NO_CAST_TO_ASCII
> > -DQT_ASCII_CAST_WARNINGS -DQT3_SUPPORT -DQT_MOC_COMPAT
> > -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE
> > -I../../mkspecs/qws/linux-arm-g++ -I. -I../../include
> > -I../../include/QtCore -Iglobal -I.moc/debug-shared-emb-arm
> > -I.uic/debug-shared-emb-arm
> > -o .obj/debug-shared-emb-arm/qresource_iterator.o
> > io/qresource_iterator.cpp
> > io/qresource_iterator.cpp:46:66: error: macro "index" requires 2
> > arguments, but only 1 given
> > io/qresource_iterator.cpp: In constructor
> > 'QResourceFileEngineIterator::QResourceFileEngineIterator(QFlags<QDir::Filter>, const QStringList&)':
> > io/qresource_iterator.cpp:47: error: expected `(' before '{' token
> > make[2]: *** [.obj/debug-shared-emb-arm/qresource_iterator.o] Fel 1
> >
>
> Yup.  To quote Carmelo Amoroso (search the archives in the last month):
>
> "The problem is that you have uClibc configure with SUSv3_LEGACY_MACRO
> on that define index."
>
> I have attached a patch that fixes the problem in all the places that
> needs to be fixed (#undef index).  I need SUSv3 macros to build some
> other things so I didn't want to turn them off and fix other things.
>
> Cheers,
> A
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
