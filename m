From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 09:21:22 +0100
Subject: [Buildroot] [PATCH v2] package/qt5/qt5base: fix icu detection
 in Qt 5.6.3
In-Reply-To: <20190930135157.15779-1-andrej.skvortzov@gmail.com> (Andrey
 Skvortsov's message of "Mon, 30 Sep 2019 16:51:57 +0300")
References: <ad2094a3-b3bf-defd-70ce-1519eb033032@mind.be>
 <20190930135157.15779-1-andrej.skvortzov@gmail.com>
Message-ID: <874kzpz5od.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Skvortsov <andrej.skvortzov@gmail.com> writes:

 > icu is required to build Q5tWebkit.
 > When UChar is defined as char16_t in ICU, then qtbase fails to detect ICU.
 > The issue is described https://bugreports.qt.io/browse/QTBUG-49586

 > Build fails with following error messages:
 > ...
 > ustring.h:473:20: error: ?UChar? does not name a type
 >  u_strCompare(const UChar *s1, int32_t length1,
 >                     ^
 >           ^
 > make[2]: *** [Makefile:195: icu.o] Error 1
 > ICU disabled.
 > The ICU library support cannot be enabled.

 > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
 > ---

 > v2: formated Qt patch according to buildroot rules
 >     added information about upstream stage of the patch
 >     (Arnout Vandecappelle)

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
