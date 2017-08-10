From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 01:40:29 +0200
Subject: [Buildroot] [Patch v7 07/10] libssh2: add host variant
In-Reply-To: <20170723081935.5zrcwe5djywrucbi@sapphire.tkos.co.il>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-8-eric.le.bihan.dev@free.fr>
 <20170723081935.5zrcwe5djywrucbi@sapphire.tkos.co.il>
Message-ID: <f9744b00-9b42-25df-4e1d-b6f9193c1e2f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:19, Baruch Siach wrote:
> Hi Eric,
> 
> On Sun, Jul 23, 2017 at 10:12:03AM +0200, Eric Le Bihan wrote:
>> Allow build of host variant of libssh2, which depends on host-openssl.
>>
>> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>> ---
>>  package/libssh2/libssh2.mk | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
>> index 338f5b4..64c59bc 100644
>> --- a/package/libssh2/libssh2.mk
>> +++ b/package/libssh2/libssh2.mk
>> @@ -40,4 +40,10 @@ else
>>  LIBSSH2_CONF_OPTS += --without-libz
>>  endif
>>  
>> +HOST_LIBSSH2_DEPENDENCIES += host-openssl
>> +HOST_LIBSSH2_CONF_OPTS += --with-openssl \

 If you use one line per option, leave the first one empty:

HOST_LIBSSH2_CONF_OPTS += \
	--with-openssl \
	...

>> +	--with-libssl-prefix=$(HOST_DIR)/usr \
>> +	--without-libgcrypt
> 
> You should probably also add --without-mbedtls.

 And --without-libz --disable-examples-build

 Regards,
 Arnout

> 
> baruch
> 
>> +
>>  $(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
