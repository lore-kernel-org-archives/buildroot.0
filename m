From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Mon, 3 Feb 2014 21:03:10 -0200
Subject: [Buildroot] [PATCH 2/2] mysql: disable debugging option
In-Reply-To: <20140203225237.6c503ed7@skate>
References: <52efff31.0902ec0a.7f04.45f7@mx.google.com>
 <20140203225237.6c503ed7@skate>
Message-ID: <CA+kK6WueuafTab1brxw-DakS7JBFM8hMgfoDtm9Z_-PTsv_xuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> On Mon,  3 Feb 2014 17:51:19 +0000, kuyurix at gmail.com wrote:
> > From: Marcelo Guti?rrez <kuyurix@gmail.com>
> >
> > it is not necessary to use $(ENABLE_DEBUG) with "--without-server"
> option.
>
> Can you expand on this a little bit?
>

When you use --without-server option, there is no debugging log, because
will work only when MySQL server is enabled.

MySQL 5.1 Reference Manual:
http://dev.mysql.com/doc/refman/5.1/en/debugging-server.html

No, not necessarily. ENABLE_DEBUG is a global variable that contains
> --enable-debug if BR2_ENABLE_DEBUG is enabled, or is empty otherwise.
> See: http://git.buildroot.net/buildroot/tree/package/Makefile.in#n357.
>

To configure MySQL with debugging code, we need to use the
--with-debugoption. But right now we only compile MySQL client, so
that option it's not
necessary.

Also, I'm not sure to understand why this patch is PATCH 2/2. I don't
> think I have received a PATCH 1/2 in this series. Is this expected?
>

You're right, there is no PATCH 1/2 . My bad. I didn't change the subject.

Best,
Marcelo


2014-02-03 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Mon,  3 Feb 2014 17:51:19 +0000, kuyurix at gmail.com wrote:
> > From: Marcelo Guti?rrez <kuyurix@gmail.com>
> >
> > it is not necessary to use $(ENABLE_DEBUG) with "--without-server"
> option.
>
> Can you expand on this a little bit?
>
> > BTW, the value of "ENABLE_DEBUG" is empty.
>
> No, not necessarily. ENABLE_DEBUG is a global variable that contains
> --enable-debug if BR2_ENABLE_DEBUG is enabled, or is empty otherwise.
> See: http://git.buildroot.net/buildroot/tree/package/Makefile.in#n357.
>
> Also, I'm not sure to understand why this patch is PATCH 2/2. I don't
> think I have received a PATCH 1/2 in this series. Is this expected?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140203/725e74b1/attachment.html>
