From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 17 Apr 2014 12:45:18 +0100
Subject: [Buildroot] [PATCH 3/3] package/zile: add Zile is Lossy Emacs
	editor
In-Reply-To: <20140412002423.3e6bcd0c@skate>
References: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
 <1397225156-23112-4-git-send-email-alex.bennee@linaro.org>
 <20140412002423.3e6bcd0c@skate>
Message-ID: <877g6ouqlt.fsf@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

<snip>
>> +diff --git a/Makefile.am b/Makefile.am
>
> You're patching Makefile.am here...
>
>
>> +ZILE_VERSION = 2.4.11
>> +ZILE_SITE = http://ftp.gnu.org/gnu/zile/
>> +ZILE_LICENSE = GPLv1+
>> +ZILE_LICENSE_FILES = COPYING
>> +ZILE_CONF_OPT += --without-help2man
>> +ZILE_DEPENDANCIES += libgc
>
> but you never mark zile as requiring autoreconf using ZILE_AUTORECONF =
> YES. How can this work?

I assume the make machinery picked it up, will fix.

>
> Also, use '=' instead of '+=' above.
>
> And use $(BR2_GNU_MIRROR) for the download URL.
>
> Thanks!

Will send v3 once I've re-built and tested.

>
> Thomas

-- 
Alex Benn?e
