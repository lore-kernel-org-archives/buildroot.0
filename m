From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 1 Oct 2013 11:09:37 +0800
Subject: [Buildroot] [PATCH] diffutils: set gnu99 C mode
In-Reply-To: <20130930230808.030cdd45@skate>
References: <1380511689.20480.1.camel@phoenix> <20130930230808.030cdd45@skate>
Message-ID: <CAFRkauAWFktPkG=cS6m1LQUiFJyzQkeb7TRB5qNDCwhvRkDfYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/10/1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Axel Lin,
>
> On Mon, 30 Sep 2013 11:28:09 +0800, Axel Lin wrote:
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>> Fix below build error:
>>
>>   CC       dir.o
>> dir.c: In function 'find_dir_file_pathname':
>> dir.c:345:8: error: 'for' loop initial declarations are only allowed in C99 mode
>> dir.c:345:8: note: use option -std=c99 or -std=gnu99 to compile your code
>> make[3]: *** [dir.o] Error 1
>> make[3]: *** Waiting for unfinished jobs....
>>
>>  package/diffutils/diffutils.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
>> index 6934532..38b1ccd 100644
>> --- a/package/diffutils/diffutils.mk
>> +++ b/package/diffutils/diffutils.mk
>> @@ -10,6 +10,7 @@ DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
>>  DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
>>  DIFFUTILS_LICENSE = GPLv3+
>>  DIFFUTILS_LICENSE_FILES = COPYING
>> +DIFFUTILS_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>>
>>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>>  DIFFUTILS_DEPENDENCIES += busybox
>
> Hum, seems strange that this is needed. I see that the configure.ac of
> diffutils 3.2 (currently in Buildroot) has AM_PROG_CC_STDC, it has been
> removed since then. If diffutils uses C99 constructs, then it should be
> specifying AC_PROG_CC_C99 in its configure.ac, I guess.
>
> Of course, what you propose is a relatively simple workaround, but I
> believe the real fix is in diffutils itself.

Hi Thomas,
Thanks for the review and please ignore this patch.
I have no idea why I cannot reproduce this issue now.
I can build diffutils without this patch today.

Regards,
Axel
