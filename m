From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 23 Aug 2007 17:25:56 +0100
Subject: [Buildroot] Struggling with undefined reference to
	`__fgetc_unlocked'
Message-ID: <d6cda7730708230925x19bc0901v9a6dd1f18ee325ec@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   I'm struggling with qtopia. During the link of rcc (which is a host
tool, natively compiled) I get:

g++  -o ../../../bin/rcc .obj/release-shared-emb-avr32/main.o
.obj/release-shared-emb-avr32/rcc.o
.obj/release-shared-emb-avr32/qglobal.o
.obj/release-shared-emb-avr32/qbuffer.o
.obj/release-shared-emb-avr32/qdir.o
.obj/release-shared-emb-avr32/qfile.o
.obj/release-shared-emb-avr32/qfileinfo.o
.obj/release-shared-emb-avr32/qfsfileengine.o
.obj/release-shared-emb-avr32/qiodevice.o
.obj/release-shared-emb-avr32/qtemporaryfile.o
.obj/release-shared-emb-avr32/qtextstream.o
.obj/release-shared-emb-avr32/qbytearraymatcher.o
.obj/release-shared-emb-avr32/qchar.o
.obj/release-shared-emb-avr32/qdatetime.o
.obj/release-shared-emb-avr32/qhash.o
.obj/release-shared-emb-avr32/qlistdata.o
.obj/release-shared-emb-avr32/qlocale.o
.obj/release-shared-emb-avr32/qmap.o
.obj/release-shared-emb-avr32/qstring.o
.obj/release-shared-emb-avr32/qstringlist.o
.obj/release-shared-emb-avr32/qstringmatcher.o
.obj/release-shared-emb-avr32/qvector.o
.obj/release-shared-emb-avr32/qabstractfileengine.o
.obj/release-shared-emb-avr32/qbytearray.o
.obj/release-shared-emb-avr32/qbitarray.o
.obj/release-shared-emb-avr32/qunicodetables.o
.obj/release-shared-emb-avr32/qvsnprintf.o
.obj/release-shared-emb-avr32/qregexp.o
.obj/release-shared-emb-avr32/qtextcodec.o
.obj/release-shared-emb-avr32/qutfcodec.o
.obj/release-shared-emb-avr32/qisciicodec.o
.obj/release-shared-emb-avr32/qtsciicodec.o
.obj/release-shared-emb-avr32/qlatincodec.o
.obj/release-shared-emb-avr32/qsimplecodec.o
.obj/release-shared-emb-avr32/qdom.o
.obj/release-shared-emb-avr32/qxml.o
.obj/release-shared-emb-avr32/qfsfileengine_unix.o     -lz -ldl
.obj/release-shared-emb-avr32/qfsfileengine.o: In function
`QFSFileEngine::read(char*, long long)':
qfsfileengine.cpp:(.text+0x1160): undefined reference to `__fgetc_unlocked'
collect2: ld returned 1 exit status
make[3]: *** [../../../bin/rcc] Error 1


I googled for the error, but could only find ppl complaining about
this when linking against uClibc, when this should be linking against
the system glibc. Does anyone has an idea of what I could try?

Regards,
    Thiago A. Correa
