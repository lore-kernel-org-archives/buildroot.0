From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Tue, 08 Apr 2014 11:19:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/zile: add Zile is Lossy Emacs
	editor
In-Reply-To: <20140407203338.GC3215@free.fr>
References: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
 <1396868422-5757-3-git-send-email-alex.bennee@linaro.org>
 <20140407203338.GC3215@free.fr>
Message-ID: <87y4zg3yyj.fsf@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Yann E. MORIN <yann.morin.1998@free.fr> writes:

> Alex, All,
>
> On 2014-04-07 12:00 +0100, Alex Benn?e spake thusly:
<snip>
>> +	  http://www.gnu.org/software/zile/
>
> There is space damage above:
>   - use one tab in front of options parameters (type, select, depends...)
>   - use one tab and two spaces in front of the help text
>
> The above mixes spaces and tabs.

I'll get that cleaned up

>> diff --git a/package/zile/remove-help2man.patch b/package/zile/remove-help2man.patch
>> new file mode 100644
>> index 0000000..c1a63f4
>> --- /dev/null
>> +++ b/package/zile/remove-help2man.patch
>> @@ -0,0 +1,28 @@
>> +Upstream-Status: Inappropriate [configuration]
>
> Please add a complete commit log, and your SoB lines too, in this patch.
>
> Could you also add a pointer to the upstream refusal (bug -tracker or ML
> archive), please?

I'll see if I can find it. 

>
>> diff --git a/package/zile/zile.mk b/package/zile/zile.mk
>> new file mode 100644
>> index 0000000..024595c
>> --- /dev/null
>> +++ b/package/zile/zile.mk
>> @@ -0,0 +1,13 @@
>> +################################################################################
>> +#
>> +# Zile
>> +#
>> +################################################################################
>> +
>> +ZILE_VERSION = 2.4.11
>> +ZILE_SITE = http://ftp.gnu.org/gnu/zile/
>> +ZILE_LICENSE = GPLv1+
>> +ZILE_LICENSE_FILES = COPYING
>> +ZILE_CONF_OPT += --without-help2man
>
> In the previous patch, you added libgc, stating that it was a dependency
> of Zile, but you forgot to add it here.

Ahh I thought it was enforced by the Config.in select but of course you
need to ensure it's built as well. I'll fix that up.

>
> Probably it is working for you since libgz sorts alphabetically before
> zile, but that's not guaranteed with parallel builds.
>
> Regards,
> Yann E. MORIN.

-- 
Alex Benn?e
