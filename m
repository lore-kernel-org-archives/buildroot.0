From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jun 2008 15:16:48 +0200
Subject: [Buildroot] uClibc missing limits.h
In-Reply-To: <485F9581.2040204@cetrtapot.si>
References: <485F9581.2040204@cetrtapot.si>
Message-ID: <20080623131648.GE8920@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 23, 2008 at 02:22:25PM +0200, Hinko Kocevar wrote:
>Hi,
>
>I've found a way for uClibc to find headers that are not in the $(shell $CC -print-file-name=include), but in $(shell $CC -print-file-name=include)-fixed.
>According to http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html LIBC should also look in other gcc provided header directories (eg. include-fixed) instead only relying on 'include' to contain all correct headers.
>
>Below is uClibc patch for this (tested on cris).

Well, that's not really correct since the default search path already
should to be
$target_triple/$ver/include \
$target_triple/$ver/include-fixed \

And apart from that you would not get away with just doing this for uClibc..

Please paste the failing "cross-gcc -v" invocation that fails to find
the include-fixed.
