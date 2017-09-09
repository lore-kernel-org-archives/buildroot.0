From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sat, 9 Sep 2017 22:42:44 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-bad: fix build against
 openjpeg 2.2
In-Reply-To: <CAAP7uc+zUqWR8w484d5uOtfCPgrkE7o=vaHHgBw7OSTvL1S5Rg@mail.gmail.com>
References: <20170908133156.10357-1-ps.report@gmx.net>
 <CAAP7uc+zUqWR8w484d5uOtfCPgrkE7o=vaHHgBw7OSTvL1S5Rg@mail.gmail.com>
Message-ID: <CAAP7ucKVZnudzmnbk+jWvLY=KmbeaAovUi=iyvjnsKh0GbtQtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Changes v2 -> v3:
>>   - add _GETTEXTIZE (instead of Makefile.in.in patch, suggested by Thomas Petazzoni)
>>
>> Changes v1 ->v2:
>>  - add _AUTORECONF (suggested by Peter Korsgaard)
>
> Re-running gettextize just to make autoreconf work is a bit overkill;
> gettextize is something that the package maintainer runs to get the
> i18n setup ready and among other things it may update gnulib imported
> files in unexpected ways. I'd bet that letting just autopoint work as
> expected (as a step part of autoreconf) would be way more than enough
> here (i.e. no _GETTEXTIZE needed), but that step is currently disabled
> in buildroot by default since some years ago.
>
> See for reference this patch I sent last month, that makes autopoint
> work again during autoreconf:
> http://lists.busybox.net/pipermail/buildroot/2017-August/200941.html
>

BTW, autopoint would also copy the latest available po/Makefile.in.in
when run as part of autoreconf (and overwrite whatever was provided in
the dist tarball), so probably the gettext min version bump to 0.19
would not be required in this case either.

-- 
Aleksander
https://aleksander.es
