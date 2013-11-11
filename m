From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 11 Nov 2013 13:47:28 +0100
Subject: [Buildroot] [PATCH v8 RESEND 5/8] glibc: add support for
 top-level parallel make
In-Reply-To: <52685258.1030807@mind.be>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-6-git-send-email-fabio.porcedda@gmail.com>
 <52685258.1030807@mind.be>
Message-ID: <CAHkwnC_hK=MMkb2R8=65G9Mpz=iWhNUWHkrSAUpYwHVX2Yk-Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 24, 2013 at 12:48 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 18/10/13 11:34, Fabio Porcedda wrote:
>>
>> To be able to use top-level parallel make we must not depend in a rule
>> on the order of evaluation of the prerequisites, so instead of relyng on
>> the left to right ordering of evaluation of the prerequisites add
>> an explicit rule to describe the dependencies.
>>
>> The glibc-install-target depends on glibc-install-staging so add a rule
>> for it.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Added, thanks.

>
>> ---
>>   package/glibc/glibc.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
>> index e89c12a..838fb8c 100644
>> --- a/package/glibc/glibc.mk
>> +++ b/package/glibc/glibc.mk
>> @@ -130,3 +130,5 @@ define GLIBC_INSTALL_TARGET_CMDS
>>   endef
>>
>>   $(eval $(autotools-package))
>> +
>> +$(GLIBC_TARGET_INSTALL_TARGET): $(GLIBC_TARGET_INSTALL_STAGING)
>>
>
>  Nitpick: I would have added a comment why this is needed.
>  Regards,
>  Arnout

I've added:
# The glic-install-target use files from glibc-install-staging

Thanks and best regards
-- 
Fabio Porcedda
