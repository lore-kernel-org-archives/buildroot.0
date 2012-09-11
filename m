From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 12 Sep 2012 02:39:37 +0300
Subject: [Buildroot] [PATCH 2/9] firefox: valgrind dependency needs
 --enable-tls for debug build
In-Reply-To: <504FB55F.60408@mind.be>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-3-git-send-email-stefan.froberg@petroprogram.com>
 <504FB55F.60408@mind.be>
Message-ID: <504FCBB9.1000803@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

12.9.2012 1:04, Arnout Vandecappelle kirjoitti:
> On 09/05/12 16:28, Stefan Fr?berg wrote:
>> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)&&  ($(BR2_GCC_ENABLE_TLS),y)
>> +VALGRIND_CONF_OPT = --enable-tls
>> +else
>>   VALGRIND_CONF_OPT = --disable-tls
>> +endif
>
>  I don't like this because it only works for internal toolchains.
>
>  Is it possible to remove the --en/disable-tls and let configure
> discover it by
> itself?  I tried a few configs and it seems to work correctly...  The
> --disable-tls was introduced by a version bump 7 years ago, without any
> comment why it is needed.  It may have caused runtime problems, but those
> may have disappeared by now too.  So I'd risk removing it completely.
>

Firefox  did not complain about missing valgrind.h file ???
Strange...
I have to try to make a debug build of FF again  and valgrind with
--disable-tls and see

Stefan

>  Regards,
>  Arnout
