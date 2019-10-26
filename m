From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 12:31:54 +0200
Subject: [Buildroot] [PATCH v2] package/qt5/qt5base: fix icu detection
 in Qt 5.6.3
In-Reply-To: <20190930135157.15779-1-andrej.skvortzov@gmail.com>
References: <ad2094a3-b3bf-defd-70ce-1519eb033032@mind.be>
 <20190930135157.15779-1-andrej.skvortzov@gmail.com>
Message-ID: <20191026123154.14713237@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 16:51:57 +0300
Andrey Skvortsov <andrej.skvortzov@gmail.com> wrote:

> icu is required to build Q5tWebkit.
> When UChar is defined as char16_t in ICU, then qtbase fails to detect ICU.
> The issue is described https://bugreports.qt.io/browse/QTBUG-49586
> 
> Build fails with following error messages:
> ...
> ustring.h:473:20: error: ?UChar? does not name a type
>  u_strCompare(const UChar *s1, int32_t length1,
>                     ^
>           ^
> make[2]: *** [Makefile:195: icu.o] Error 1
> ICU disabled.
> The ICU library support cannot be enabled.
> 
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
