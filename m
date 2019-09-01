From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 01 Sep 2019 09:46:18 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/libnice: add optional
 dependency to openssl
References: <20190831130417.7725-1-bernd.kuhls@t-online.de>
 <20190831130417.7725-2-bernd.kuhls@t-online.de> <87ftlhayk8.fsf@tarshish>
Message-ID: <aj9s3gx121.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 31 Aug 2019 23:07:35 +0300 schrieb Baruch Siach:

>> -	select BR2_PACKAGE_GNUTLS
>> +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
> 
> Is there a reason to change the default selected crypto library from
> Gnutls to Openssl?

Hi Baruch,

yes, if

	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL

is used, menuconfig throws this warning:

package/openssl/Config.in:4:error: recursive dependency detected!
package/openssl/Config.in:4:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_GNUTLS
package/gnutls/Config.in:1:	symbol BR2_PACKAGE_GNUTLS is selected by BR2_PACKAGE_OPENSSL

Regards, Bernd
