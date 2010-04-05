From: Paul Jones <paul.jones@iwtech.com.au>
Date: Mon, 05 Apr 2010 20:33:32 +1000
Subject: [Buildroot] QT embedded working with Xorg?
In-Reply-To: <4BB5D9C3.1020209@terawatt.fr>
References: <4BB1EE15.6000505@browserseal.com>	<4BB1F87D.4050706@terawatt.fr>	<4BB1FA0F.5070703@carallon.com>	<4BB20147.50404@terawatt.fr>	<4BB4B0D7.4080002@carallon.com>	<4BB4B9F3.2010905@terawatt.fr>
	<4BB5D9C3.1020209@terawatt.fr>
Message-ID: <4BB9BC7C.4030404@iwtech.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/10 22:49, Damien Borie wrote:
> Hi,
>
> It's working fine! I only changed X11-commercial to X11-opensource and
> it's ok. I got problems with font or encoding but it will be cleared
> soon I think.
> Thank you, your patch was very useful.

What arch are you building for? I'm building for ARM and I'm getting
build errors.


compiling io/qabstractfileengine.cpp
../../include/QtCore/../../src/corelib/arch/qatomic_i386.h: In function
'char* HB_TextCodec_ConvertFromUnicode(void*, const HB_UChar16*,
hb_uint32, hb_uint32*)':
../../include/QtCore/../../src/corelib/arch/qatomic_i386.h:132: error:
impossible constraint in 'asm'
../../include/QtCore/../../src/corelib/arch/qatomic_i386.h:132: error:
impossible constraint in 'asm'
compiling io/qbuffer.cpp
make[2]: *** [.obj/release-shared/qharfbuzz.o] Error 1
make[2]: *** Waiting for unfinished jobs....
In file included from io/qbuffer.cpp:473:
../../include/QtCore/../../src/corelib/arch/qatomic_i386.h: In member
function 'virtual bool QBuffer::seek(qint64)':
../../include/QtCore/../../src/corelib/arch/qatomic_i386.h:132: error:
impossible constraint in 'asm'
../../include/QtCore/../../src/corelib/arch/qatomic_i386.h:132: error:
impossible constraint in 'asm'
make[2]: *** [.obj/release-shared/qbuffer.o] Error 1
../../include/QtCore/../../src/corelib/arch/qatomic_i386.h: In member
function 'virtual QString
QAbstractFileEngine::fileName(QAbstractFileEngine::FileName) const':
../../include/QtCore/../../src/corelib/arch/qatomic_i386.h:120: error:
impossible constraint in 'asm'
make[2]: *** [.obj/release-shared/qabstractfileengine.o] Error 1
make[2]: Leaving directory
`/media/stuff/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/src/corelib'
make[1]: *** [sub-corelib-make_default-ordered] Error 2
make[1]: Leaving directory
`/media/stuff/buildroot/output/build/qt-everywhere-opensource-src-4.6.2'
make: ***
[/media/stuff/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/.compiled]
Error 2
