From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Jan 2015 23:20:55 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
	QT_SHARED is not selected
In-Reply-To: <20150120174507.1d11ab61@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 20 Jan 2015 17:45:07 +0100")
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
 <20150120174507.1d11ab61@free-electrons.com>
Message-ID: <87siey4i48.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Richard Genoud,
 > On Tue, 20 Jan 2015 11:17:28 +0100, Richard Genoud wrote:
 >> If Qt is compile as a static library, there's no point compiling qwt as
 >> a shared library, otherwise, we will have a huge qwt lib and a huge Qt
 >> application.
 >> 
 >> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> 
 >> +ifeq ($(BR2_PACKAGE_QT_SHARED),y)
 >> +	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/QWT_CONFIG += QwtDll/'
 >> +else
 >> +	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\# QWT_CONFIG += QwtDll/'
 >> +endif

 > I think we should get rid of BR2_PACKAGE_QT_SHARED completely, and use
 > BR2_STATIC_LIBS here instead.

I agree that it would be cleaner, but the reason the explicit QT_SHARED
stuff was added was afaik a lot of systems only needed Qt in a single
application / that application only used a subset of the Qt
functionality, so having a static libQt while everything else was shared
was quite a big win in size / startup time.

It does complicate LGPL compliance and I don't know if the disk space
concerns are as big these days though.

-- 
Bye, Peter Korsgaard
