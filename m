From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Sep 2012 07:49:50 +0200
Subject: [Buildroot] [PATCH 2/9] firefox: valgrind dependency needs
 --enable-tls for debug build
In-Reply-To: <504FCBB9.1000803@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-3-git-send-email-stefan.froberg@petroprogram.com>
 <504FB55F.60408@mind.be> <504FCBB9.1000803@petroprogram.com>
Message-ID: <505173FE.6040605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/12 01:39, Stefan Fr?berg wrote:
> 12.9.2012 1:04, Arnout Vandecappelle kirjoitti:
>> On 09/05/12 16:28, Stefan Fr?berg wrote:
>>> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)&&   ($(BR2_GCC_ENABLE_TLS),y)
>>> +VALGRIND_CONF_OPT = --enable-tls
>>> +else
>>>    VALGRIND_CONF_OPT = --disable-tls
>>> +endif
>>
>>   I don't like this because it only works for internal toolchains.
>>
>>   Is it possible to remove the --en/disable-tls and let configure
>> discover it by
>> itself?  I tried a few configs and it seems to work correctly...  The
>> --disable-tls was introduced by a version bump 7 years ago, without any
>> comment why it is needed.  It may have caused runtime problems, but those
>> may have disappeared by now too.  So I'd risk removing it completely.
>>
>
> Firefox  did not complain about missing valgrind.h file ???

  No, I meant that valgrind's configure seems to discover by itself if TLS is
available or not, i.e. removing the --disable-tls will default to --enable.

  So my suggestion is: instead of making the --en/disable-tls conditional,
just remove the --disable-tls completely.

  I haven't actually tried building with any of your patches.



  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
