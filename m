From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Oct 2013 08:46:17 +0200
Subject: [Buildroot] [PATCH 1/1] ccache: expose control interface via
 'make ccache-options'
In-Reply-To: <CAEvN+1iBLh_Kr25EQTJPXn2-hh2KdeGQ1nhagT3haHMB=Jx1-A@mail.gmail.com>
References: <1339991408-25620-1-git-send-email-tjlee@ambarella.com>
 <CAEvN+1jCAvFYsOkbv4Rf4g7YqZJe4Ty9cwpFMiAUTTAvh7mvQg@mail.gmail.com>
 <CAEvN+1iBLh_Kr25EQTJPXn2-hh2KdeGQ1nhagT3haHMB=Jx1-A@mail.gmail.com>
Message-ID: <5253AA39.1090908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/13 00:09, Tzu-Jung Lee wrote:
> # Response to patchwork cleanup of week #1
>
> This patch provides an easy way to operate on buildroot ccache such as
> changing the cache limit or showing statistics.
>
> Without it, users would have to explicitly specify both the environment variable
> and the path of patched ccache, for example:
>
>    BUILDROOT_CACHE_DIR=~/.buildroot-ccache/ $PWD/host/usr/bin/ccache -s
> .
> Thanks.
>
> Roy
>
> On Fri, Jun 22, 2012 at 7:55 PM, Tzu-Jung Lee <roylee17@gmail.com> wrote:
>> ---------- Forwarded message ----------
>> From: Tzu-Jung Lee <roylee17@gmail.com>
>> Date: Mon, Jun 18, 2012 at 11:50 AM
>> Subject: [PATCH 1/1] ccache: expose control interface via 'make ccache-options'
>> To: buildroot at busybox.net
>> Cc: roylee17 at gmail.com, Tzu-Jung Lee <tjlee@ambarella.com>
>>
>>
>> usage:
>>         # set cache limit size
>>         make CCACHE_OPTIONS="--max-size=5G" ccache-options
>>
>>         # zero statistics counters
>>         make CCACHE_OPTIONS="--zero-stats" ccache-options

  You should add this text to the documentation in
docs/manual/ccache-support.txt

>>
>> Change-Id: I0162a2612a9aa4afd49f6d93c9c36dce3e0c8228

  Missing Signed-off-by line.

  Otherwise looks good to me.

  Regards,
  Arnout

>> ---
>>   package/ccache/ccache.mk |    4 ++++
>>   1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
>> index d7106ee..d46fbb9 100644
>> --- a/package/ccache/ccache.mk
>> +++ b/package/ccache/ccache.mk
>> @@ -50,3 +50,7 @@ ccache-stats: host-ccache
>>         $(Q)$(CCACHE) -s
>>   endif
>>
>> +ifeq ($(BR2_CCACHE),y)
>> +ccache-options: host-ccache
>> +       $(Q)$(CCACHE) $(CCACHE_OPTIONS)
>> +endif
>> --
>> 1.7.8.6
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
