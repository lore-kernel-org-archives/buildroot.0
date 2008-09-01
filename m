From: udmd-eric wann <udmderic@gmail.com>
Date: Mon, 1 Sep 2008 21:34:55 +0800
Subject: [Buildroot] build qtopia4 error
Message-ID: <46361d9e0809010634u7a2860cbsa38ebac8798635be@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

     Sorry if my questions is stupid, I am a complete newbie for qtopia.
     I am using buildroot-20080820.tar.bz2, my target is arm (arm926t).
     I try to enable qtopia4 package, this is my part setting for qtopia



           #
           # other GUIs
           #

           BR2_PACKAGE_QTOPIA4=y
           # BR2_PACKAGE_QTOPIA4_DEBUG is not set
           BR2_PACKAGE_QTOPIA4_SHARED=y
           # BR2_PACKAGE_QTOPIA4_STATIC is not set
           BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL=y
           # BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL is not set
           BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED=y
           # BR2_PACKAGE_QTOPIA4_QT3SUPPORT is not set
           BR2_PACKAGE_QTOPIA4_DEPTHS="-depths 24,16,8"
           # BR2_PACKAGE_QTOPIA4_GIF is not set
           # BR2_PACKAGE_QTOPIA4_LIBMNG is not set
           BR2_PACKAGE_QTOPIA4_NOJPEG=y
           # BR2_PACKAGE_QTOPIA4_SYSTEMJPEG is not set
           # BR2_PACKAGE_QTOPIA4_QTJPEG is not set
           BR2_PACKAGE_QTOPIA4_NOPNG=y
           # BR2_PACKAGE_QTOPIA4_SYSTEMPNG is not set
           # BR2_PACKAGE_QTOPIA4_QTPNG is not set
           BR2_PACKAGE_QTOPIA4_NOTIFF=y
           # BR2_PACKAGE_QTOPIA4_SYSTEMTIFF is not set
           # BR2_PACKAGE_QTOPIA4_QTTIFF is not set
           BR2_PACKAGE_QTOPIA4_QTZLIB=y
           # BR2_PACKAGE_QTOPIA4_SYSTEMZLIB is not set
           BR2_PACKAGE_QTOPIA4_NOFREETYPE=y
           # BR2_PACKAGE_QTOPIA4_QTFREETYPE is not set
           # BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE is not set
           BR2_PACKAGE_QTOPIA4_EMB_PLATFORM="arm"
           # BR2_PACKAGE_QTOPIA4_SQL_MODULE is not set
           # BR2_PACKAGE_QTOPIA4_XMLPATTERNS is not set
           # BR2_PACKAGE_QTOPIA4_SVG is not set
           # BR2_PACKAGE_QTOPIA4_WEBKIT is not set
           # BR2_PACKAGE_QTOPIA4_OPENSSL is not set
           ?
              and then I got the following error:

           ....[many warning for sqlite3.c]

           ../../../3rdparty/sqlite/sqlite3.c:56791: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function 'flagPragma':
           ../../../3rdparty/sqlite/sqlite3.c:56940: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function
'sqlite3InitCallback':
           ../../../3rdparty/sqlite/sqlite3.c:57987: warning: unused
parameter 'argc'
           ../../../3rdparty/sqlite/sqlite3.c:57987: warning: unused
parameter 'azColName'
           ../../../3rdparty/sqlite/sqlite3.c: In function 'sqlite3InitOne':
           ../../../3rdparty/sqlite/sqlite3.c:58172: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function 'sqlite3JoinType':
           ../../../3rdparty/sqlite/sqlite3.c:58845: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c:58852: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function
'matchOrderByTermToExprList':
           ../../../3rdparty/sqlite/sqlite3.c:60145: warning: unused
parameter 'idx'
           ../../../3rdparty/sqlite/sqlite3.c: In function
'sqlite3TriggersExist':
           ../../../3rdparty/sqlite/sqlite3.c:63197: warning: unused
parameter 'pParse'
           ../../../3rdparty/sqlite/sqlite3.c: In function 'sqlite3RunVacuum':
           ../../../3rdparty/sqlite/sqlite3.c:64192: warning:
comparison is always true due to limited range of data type
           ../../../3rdparty/sqlite/sqlite3.c:64290: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function 'sqlite3VtabUnlock':
           ../../../3rdparty/sqlite/sqlite3.c:64427: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function 'bestIndex':
           ../../../3rdparty/sqlite/sqlite3.c:66755: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function 'sqlite3WhereBegin':
           ../../../3rdparty/sqlite/sqlite3.c:67119: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c:67328: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function 'yyStackOverflow':
           ../../../3rdparty/sqlite/sqlite3.c:69408: warning: unused
parameter 'yypMinor'
           ../../../3rdparty/sqlite/sqlite3.c: In function 'yy_syntax_error':
           ../../../3rdparty/sqlite/sqlite3.c:70866: warning: unused
parameter 'yymajor'
           ../../../3rdparty/sqlite/sqlite3.c: In function 'binCollFunc':
           ../../../3rdparty/sqlite/sqlite3.c:72008: warning: unused
parameter 'NotUsed'
           ../../../3rdparty/sqlite/sqlite3.c: In function
'nocaseCollatingFunc':
           ../../../3rdparty/sqlite/sqlite3.c:72031: warning: unused
parameter 'NotUsed'
           ../../../3rdparty/sqlite/sqlite3.c: In function 'sqlite3_close':
           ../../../3rdparty/sqlite/sqlite3.c:72114: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c: In function 'sqlite3_interrupt':
           ../../../3rdparty/sqlite/sqlite3.c:72388: warning:
comparison between signed and unsigned
           ../../../3rdparty/sqlite/sqlite3.c:72388: warning:
comparison between signed and unsigned
           make[4]: *** [.obj/release-shared-emb-arm/sqlite3.o] Error 1
           make[3]: *** [sub-sqlite-make_default] Error 2
           make[2]: *** [sub-sqldrivers-make_default] Error 2
           make[1]: *** [sub-plugins-make_default-ordered] Error 2
           make: ***
[/home/ericwann/buildroot/build_arm/qt-embedded-linux-opensource-src-4.4.0/.compiled]
Error 2


           So what's wrong with my setting? Thanks for your help.
           And How should I do?


           Best Regards


           Eric Wann
