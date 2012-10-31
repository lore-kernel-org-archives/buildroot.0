From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 31 Oct 2012 09:48:52 +0100
Subject: [Buildroot] [PATCH] grantlee: new package
In-Reply-To: <50906999.9000002@mind.be>
References: <508EFA6D.7000404@gmail.com> <50906999.9000002@mind.be>
Message-ID: <5090E5F4.6040903@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thx for the detailed comments, i'll resend it. And as i realized in the 
debian/ubuntu repos the package called libgrantlee,
so maybe it would be better to call it so also in buildroot, as it's 
more logical name for a library :) What do you think?


On 10/31/2012 12:58 AM, Arnout Vandecappelle wrote:
> On 10/29/12 22:51, Zoltan Gyarmati wrote:
>> Support for the Grantlee library
>
>  This sentence is redundant.
>
>> Grantlee is a Qt implementation of the Django template system, see 
>> here: http://www.gitorious.org/grantlee/pages/Home
>
>  Word-wrap the commit message at +- 75 characters.  But actually, this
> part of the commit message is redundant because it's already in the 
> help text.
>
>>
>> (it's my first patch to buildroot, so please let me know any notes, thx)
>
>  Doing that :-)
>
>  Something like this (a note that shouldn't be part of the final 
> commit message)
> should go below your SOB, separated by --- on a line by itself. Then
> git-am will strip it off while applying the patch.
>
>>
>> Signed-off-by: "Zoltan Gyarmati" <mr.zoltan.gyarmati@gmail.com>
> [snip]
>> diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
>> new file mode 100644
>> index 0000000..6e3b80d
>> --- /dev/null
>> +++ b/package/grantlee/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_GRANTLEE
>> + bool "grantlee"
>
>  Config.in indentation should be one tab.
>
>> + depends on BR2_PACKAGE_QT
>
>  This is redundant, because it's already inside an
> if BR2_PACKAGE_QT (in package/Config.in).
>
>> + select BR2_PACKAGE_QT_STL
>
>  It looks like BR2_PACKAGE_QT_SCRIPT and BR2_PACKAGE_QT_GUI_MODULE
> are also required.  I didn't continue testing, so maybe even that
> is not enough.
>
>
>> + help
>> + Qt implemantation of the Django template framework
>> +
>> + http://www.grantlee.org/apidox
>
>  And the help text indentation: one tab + 2 spaces.
>
>  Also I think http://grantlee.org is a more appropriate URL, even
> if it just redirects to gitorious.
>
>> diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
>> new file mode 100644
>> index 0000000..9264f80
>> --- /dev/null
>> +++ b/package/grantlee/grantlee.mk
>> @@ -0,0 +1,14 @@
>> +#############################################################
>> +#
>> +# grantlee
>> +#
>> +#############################################################
>> +
>> +GRANTLEE_VERSION = 0.2.0
>> +GRANTLEE_SITE = http://downloads.grantlee.org/
>
>  Trailing / is redundant.
>
>> +GRANTLEE_INSTALL_STAGING = YES
>> +GRANTLEE_INSTALL_TARGET = YES
>
>  INSTALL_TARGET defaults to YES, so can be removed.
>
>> +GRANTLEE_DEPENDENCIES = host-pkg-config qt
>
>  pkgconf just got committed, so should be host-pkgconf.  But AFAICS it 
> isn't
> using pkg-config for anything.
>
>
>  Also, your mailer messed up the whitespace in your patch.  Use
> git-send-email, that works well.  The man page explains how to use it 
> with
> gmail.
>
>  Regards,
>  Arnout
>
>
>> +
>> +$(eval $(cmake-package))
>> +
>
