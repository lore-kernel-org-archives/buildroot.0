From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Mar 2012 12:52:04 -0300
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <20120319163011.27d669d2@skate>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
 <20120319163011.27d669d2@skate>
Message-ID: <d393625cf8a0f0af32c086413b19b091@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-19 12:30, Thomas Petazzoni wrote:

> Le Sun, 11 Mar 2012 22:58:49 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  package/intltool/intltool.mk |    2 --
>>  1 files changed, 0 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/intltool/intltool.mk 
>> b/package/intltool/intltool.mk
>> index 6d13cc1..1e749ea 100644
>> --- a/package/intltool/intltool.mk
>> +++ b/package/intltool/intltool.mk
>> @@ -9,8 +9,6 @@ INTLTOOL_SOURCE = 
>> intltool-$(INTLTOOL_VERSION).tar.bz2
>>  INTLTOOL_SITE = 
>> http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
>>
>>  HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
>> -HOST_INTLTOOL_CONF_OPT = \
>> -  PERLLIB=$(HOST_DIR)/usr/lib/perl
> So this commit should be reverted, in my opinion, unless 
> host-microperl
> becomes a dependency of host-intltool which I am not really in favor 
> of.
>
> Best regards,
>
> Thomas Petazzoni

Reverted? It was never applied.
We've already discussed this on IRC and i stand on my position about 
it.
A cold host-microperl build takes roughly 2 minutes on my quite mundane 
desktop with it's slow hard drive.
So please someone else(s) fix it as they see fit, i'm not submitting 
anything else perl-related.
Future-proof doesn't seem to be the rule which is what i aimed at so 
i'll just quit doing anything perl-related which was mostly as a favour 
since i don't use it even though i code in perl for other purposes.
Regards.
