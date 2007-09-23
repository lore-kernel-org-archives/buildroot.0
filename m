From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sun, 23 Sep 2007 17:25:45 +0100
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <1190563965.7015.21.camel@elrond.atmel.sweden>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
Message-ID: <d6cda7730709230925t2cbe4dc0q149a98cdce2a0350@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I built for AVR32. I even have some patches here that I'm not sure
were applied or not. I haven't updated the svn for a little while as I
have been working on the application lately.

It seams like the include path issue, if I'm not mistaken there is
some header (uClib I guess, not sure, and not Qt's) that does a
#define index

which is very bad :P

On 9/23/07, Ulf Samuelsson <ulf@atmel.com> wrote:
> Anyone building qtopia?
> I get (when compiling with gcc-4.2.1/binutils-2.18/uclibc-0.9.29):
>
>
> arm-linux-g++ -c -pipe -g -g -fvisibility=hidden
> -fvisibility-inlines-hidden -Wall -W -D_REENTRANT -fPIC -DQT_SHARED
> -DTSLIBMOUSEHANDLER_DEBUG -DQT_BUILD_CORE_LIB -DQT_NO_CAST_TO_ASCII
> -DQT_ASCII_CAST_WARNINGS -DQT3_SUPPORT -DQT_MOC_COMPAT
> -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE
> -I../../mkspecs/qws/linux-arm-g++ -I. -I../../include
> -I../../include/QtCore -Iglobal -I.moc/debug-shared-emb-arm
> -I.uic/debug-shared-emb-arm
> -o .obj/debug-shared-emb-arm/qresource_iterator.o
> io/qresource_iterator.cpp
> io/qresource_iterator.cpp:46:66: error: macro "index" requires 2
> arguments, but only 1 given
> io/qresource_iterator.cpp: In constructor
> 'QResourceFileEngineIterator::QResourceFileEngineIterator(QFlags<QDir::Filter>, const QStringList&)':
> io/qresource_iterator.cpp:47: error: expected `(' before '{' token
> make[2]: *** [.obj/debug-shared-emb-arm/qresource_iterator.o] Fel 1
>
>
> when compiling "src/corelib/io/qresource_iterator.cpp"
> This is the line giving problems.
>
> QResourceFileEngineIterator::QResourceFileEngineIterator(QDir::Filters
> filters,
>                                                          const
> QStringList &filterNames)
>     : QAbstractFileEngineIterator(filters, filterNames), index(-1)
> {
> }
>
>
>
> Best Regards
> Ulf Samuelsson
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
