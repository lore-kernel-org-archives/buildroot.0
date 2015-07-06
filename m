From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 06 Jul 2015 10:43:24 -0300
Subject: [Buildroot] [PATCH] collectd: fix parallel build issues
In-Reply-To: <20150706153856.78ab447d@free-electrons.com>
References: <1436188343-11234-1-git-send-email-gustavo@zacarias.com.ar>	<20150706152250.54ec1b86@free-electrons.com>	<559A83B4.1010902@zacarias.com.ar>
 <20150706153856.78ab447d@free-electrons.com>
Message-ID: <559A85FC.1050907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/07/15 10:38, Thomas Petazzoni wrote:

> That same addition should be useless I believe:
>
> collectd_LDADD += $(LIBLTDL) $(top_builddir)/src/liboconfig/liboconfig.la
> collectd_DEPENDENCIES += $(top_builddir)/src/liboconfig/liboconfig.la
>
> So LDADD already contains $(top_builddir)/src/liboconfig/liboconfig.la,
> and LIBLTDL will be -lltdl, which will be ignored for foo_DEPENDENCIES.
>
> But oh, well, maybe you don't want to fix the entire collectd build system :-)

In theory it should, but yes i didn't go on a rampage about it since 
they seem to want automatic dependencies but aren't consistent about it.
Let's see what upstream says/applies.
Regards.
