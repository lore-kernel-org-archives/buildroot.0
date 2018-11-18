From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Nov 2018 22:37:24 +0100
Subject: [Buildroot] [PATCH v2 1/2] c-ares: support host build
In-Reply-To: <8b5155dd-c5e5-570f-69ca-6f3a9ecc149c@mind.be>
References: <20181118211942.28839-1-robertroyrose@gmail.com>
 <8b5155dd-c5e5-570f-69ca-6f3a9ecc149c@mind.be>
Message-ID: <1b557238-e153-5b9c-646f-e188deb8e41b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?D'oh

On 18/11/2018 22:33, Arnout Vandecappelle wrote:
>  Hi Robert,
>
> On 18/11/2018 22:19, Robert Rose wrote:
>> Signed-off-by: Robert Rose <robertroyrose@gmail.com>
>> ---
>>  package/c-ares/c-ares.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
>> index 67254244a1..76e9687b37 100644
>> --- a/package/c-ares/c-ares.mk
>> +++ b/package/c-ares/c-ares.mk
>> @@ -15,3 +15,4 @@ C_ARES_LICENSE = MIT
>>  C_ARES_LICENSE_FILES = ares_mkquery.c
>>  
>>  $(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
>  We only include host packages if there is a justification for it. That means
> either:
>
> - it is needed for building some other package; in this case, you should submit
> the patch adding the host package in a series together with the other package; or

?Sorry, patch 2/2 hadn't arrived yet when I was writing this, and I hadn't
noticed the 1/2 in the subject. Obviously it's this situation.


?So:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


?I'd like to add that there is no need to specify the --with-random option for
the host like we do for the target, because for the host it can be autodiscovered.


?Regards,
?Arnout


>
> - it is used in a post-{build,fakeroot,image} script; in that case, there should
> be a Config.in.host option for it so it can be selected, and the commit log
> should have some explanation of why it could be useful in a post-* script.
>
>
>  Regards,
>  Arnout
