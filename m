From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 23 Jan 2015 17:19:15 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
 QT_SHARED is not selected
In-Reply-To: <20150123160644.GC19129@free.fr>
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
 <20150120174507.1d11ab61@free-electrons.com>
 <CACQ1gAhMPLWkod2SRKjDDS8mnDa6DknZnT0EHY5SZx_ENpg8mw@mail.gmail.com>
 <20150123160644.GC19129@free.fr>
Message-ID: <CACQ1gAiuC=XNbx1NLSW6Ehbu2FiWS3BKCBfQuqKD52MOR6agvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-01-23 17:06 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Richard, All,
>
> On 2015-01-23 17:00 +0100, Richard Genoud spake thusly:
>> 2015-01-20 17:45 GMT+01:00 Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com>:
>> > Dear Richard Genoud,
>> >
>> > On Tue, 20 Jan 2015 11:17:28 +0100, Richard Genoud wrote:
>> >> If Qt is compile as a static library, there's no point compiling qwt as
>> >> a shared library, otherwise, we will have a huge qwt lib and a huge Qt
>> >> application.
>> >>
>> >> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> >> ---
>> >>  package/qwt/qwt.mk | 6 ++++++
>> >>  1 file changed, 6 insertions(+)
>> >>
>> >> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
>> >> index a92d6b4b1540..d783314f7e40 100644
>> >> --- a/package/qwt/qwt.mk
>> >> +++ b/package/qwt/qwt.mk
>> >> @@ -32,6 +32,12 @@ else
>> >>       QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
>> >>  endif
>> >>
>> >> +ifeq ($(BR2_PACKAGE_QT_SHARED),y)
>> >> +     QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/QWT_CONFIG += QwtDll/'
>> >> +else
>> >> +     QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\# QWT_CONFIG += QwtDll/'
>> >> +endif
>> >
>> > I think we should get rid of BR2_PACKAGE_QT_SHARED completely, and use
>> > BR2_STATIC_LIBS here instead.
>> you mean BR2_PREFER_STATIC_LIB, right ?
>
> No, the option has been renamed in the tree, see:
>     http://git.buildroot.org/buildroot/commit/?id=665e13c85e1fd216499cdd335a88a4d1c20f175f
>
> Please, use the master branch when hacking, you'll avoid surprises
> later! ;-)

yep ! Thanks for the heads up !

regards,
Richard.
