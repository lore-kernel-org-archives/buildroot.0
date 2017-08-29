From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 29 Aug 2017 17:02:33 -0500
Subject: [Buildroot] [PATCH 1/1] package/strongswan: Install libraries
	to /usr/lib
In-Reply-To: <20170829215144.GA3684@scaer>
References: <1504042220-54681-1-git-send-email-sam.voss@rockwellcollins.com>
 <20170829215144.GA3684@scaer>
Message-ID: <CAH=K+6nip-5u+jh7dDhZWHuu58c60MA83k_KNqZTb-SR6amaRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Tue, Aug 29, 2017 at 4:51 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Sam, All,
[..]
>> --- a/package/strongswan/strongswan.mk
>> +++ b/package/strongswan/strongswan.mk
>> @@ -36,7 +36,8 @@ STRONGSWAN_CONF_OPTS += \
>>       --enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no) \
>>       --enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no) \
>>       --enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>> -     --enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)
>> +     --enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>> +     --with-ipseclibdir=/usr/lib
>
> The issue behind that, is that this directory is also used to derive the
> location where to store plugins and the "IMC and IMV dynamic librariers"
> (typo not mine for once!).
>
> So, the plugins would end up in /usr/lib/plugins and the libs in
> /usr/lib/imcvs.

Good point, I didn't realize this propagates that way!

> This is not satifactory (at least the plugins stuff), so I'd suggest we
> also force those locations (to their original values):
>
>     --with-plugindir=/usr/lib/ipsec/plugins
>     --with-imcvdir=/usr/lib/ipsec/imcvs
>
> Could you check that, please? ;-)

Absolutely, I will submit a v2 after testing
