From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 6 Jul 2015 17:54:52 +0200
Subject: [Buildroot] [PATCH 4/4] squid: add gnutls support
In-Reply-To: <20150706175039.42b404dd@free-electrons.com>
References: <1436169725-26108-1-git-send-email-Vincent.Riera@imgtec.com>	<1436169725-26108-4-git-send-email-Vincent.Riera@imgtec.com>
 <20150706175039.42b404dd@free-electrons.com>
Message-ID: <559AA4CC.1090009@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 06/07/15 17:50, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Mon, 6 Jul 2015 10:02:05 +0200, Vicente Olivert Riera wrote:
>
>> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
>> index 469fb1b..80235a4 100644
>> --- a/package/squid/squid.mk
>> +++ b/package/squid/squid.mk
>> @@ -62,6 +62,13 @@ SQUID_CONF_OPTS += --with-openssl
>>   SQUID_DEPENDENCIES += openssl
>>   endif
>>
>> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
>> +SQUID_CONF_OPTS += --with-gnutls
>> +SQUID_DEPENDENCIES += gnutls
>> +else
>> +SQUID_CONF_OPTS += --without-gnutls
>> +endif
>
> So presumably there is also a --without-openssl option that could be
> used to explicitly disable openssl support when BR2_PACKAGE_OPENSSL !=
> y.
>
> It could be handled as a separate patch since it's not related.

Done:

http://patchwork.ozlabs.org/patch/491688/

Regards,

Vincent

>
> Thanks,
>
> Thomas
>
