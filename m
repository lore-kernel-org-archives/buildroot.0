From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 16 May 2013 21:02:31 +0200
Subject: [Buildroot] [PATCH 1/1] libtirpc: requires toolchain with
	threads support
In-Reply-To: <20130211091837.6fd77a1c@skate>
References: <1360448834-21507-1-git-send-email-gilles.talis@gmail.com>
 <20130211091837.6fd77a1c@skate>
Message-ID: <CAHXCMM+4H-G4wpwG=uKN-76HcDu0aDEx6hQUhh-BjE+TC86OYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

2013/2/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Gilles Talis,
>
> On Sat,  9 Feb 2013 14:27:14 -0800, Gilles Talis wrote:
>> Fixes:
>> http://autobuild.buildroot.org/results/8ba720f47f74df94b8c70ac4befd47c47ce65f2f
>>
>> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>
> I believe libtirpc pthread usage could be made optional, and that would
> probably be an useful contribution upstream, and avoid us from having
> to add this toolchain dependency.

Some of the recent libtirpc build failures are also caused by this.

Looking at the source, it seems that's a bug the AC_CHECK_LIB call that does not
do anything when pthead is not found; though it unconditionally
include pthread.h
in many source files, and does not use at all the HAVE_LIBPTHREAD symbol.

Regards,

-- 
Samuel
