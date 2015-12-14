From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 14:16:01 -0300
Subject: [Buildroot] [PATCH] gnutls: needs argp-standalone for
	musl/uclibc
In-Reply-To: <20151213223250.77e3dbfb@free-electrons.com>
References: <1449248499-2852-1-git-send-email-gustavo@zacarias.com.ar>
 <20151213223250.77e3dbfb@free-electrons.com>
Message-ID: <566EF951.3010500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/12/15 18:32, Thomas Petazzoni wrote:

>>   config BR2_PACKAGE_GNUTLS_TOOLS
>>   	bool "install tools"
>> +	select BR2_PACKAGE_ARGP_STANDALONE \
>> +		if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>>   	help
>>   	  Install GnuTLS command line tools for various cryptographic tasks.
>
> Seems like BR2_PACKAGE_GNUTLS needs argp.h as well, not only
> BR2_PACKAGE_GNUTLS_TOOLS. See
> http://autobuild.buildroot.org/results/d86/d8604fe448bb11395e8443726d09b041eb34c6d5//.

Hi.
It's still crywrap failing, hence tools.
Probably --disable-crywrap isn't doing it's job efficently, i'll take a 
look.
Regards.
