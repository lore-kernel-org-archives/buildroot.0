From: Erwan Gautron <erwan.gautron@bertin.fr>
Date: Mon, 11 May 2020 15:02:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add option to
 enable some features
In-Reply-To: <20200511144711.04ae03e0@windsurf.home>
References: <20200511112840.634268-1-erwan.gautron@bertin.fr>
 <20200511112840.634268-2-erwan.gautron@bertin.fr>
 <20200511144711.04ae03e0@windsurf.home>
Message-ID: <9274c787-c39e-1f27-114c-6a9debce36d3@bertin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

?



On 11/05/2020 14:47, Thomas Petazzoni wrote:
> Hello Erwan,
> 
> On Mon, 11 May 2020 13:28:40 +0200
> Erwan GAUTRON <erwan.gautron@bertin.fr> wrote:
> 
>>  package/libopenssl/Config.in     | 151 +++++++++++++++++++++++++++++++
>>  package/libopenssl/libopenssl.mk |  25 +++++
>>  2 files changed, 176 insertions(+)
> 
> Thanks for this new iteration!
welcome
> 
>> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
>> +	bool "enable openssl CHACHA "
>> +	default y
>> +	help
>> +	  Enable CHACHA cipher in libopenssl.
> 
> The "in openssl" part of each help text is not really useful, as these
> are suboptions of libopenssl already.
> 
I'll update
>> +config BR2_PACKAGE_LIBOPENSSL_UNSECURE
>> +	bool "enable unit test, debug, backtrace"
>> +	default y
>> +	help
>> +	  Enable unit-test crypto-mdebug-backtrace crypto-mdebug autoerrinit mode in libopenssl.
> 
> This line is too long, "make check-package" most likely complains about
> this.
> 
ok
>> +config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
>> +	bool "enable openssl dynamic engine"
>> +	default y
>> +	help
>> +	  Enable dynamic engine in libopenssl.
>> +
>> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_IPV6
>> +	bool "enable openssl IPV6"
>> +	default y
>> +	help
>> +	  Enable IPV6 in libopenssl.
> 
> Is it really useful to make IPv6 optional? Is that necessary for your
> certification? IPv6 used to be optional in Buildroot in general, and we
> got rid of that several years ago, so reintroducing IPv6 options will
> really need some good jusitification.
> 
I can understand. Anyway my certification needs to disable all Ipv6
options. But I can do that by patching my local copy of buildroot in
post build process. I'll remove the option

>> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
>> +	bool "enable openssl compression"
>> +	default y
>> +	help
>> +	  Enable compression in libopenssl.
> 
> So you dropped the zlib option? Why?
I remove it because I've found a case where this option causes some
problems.

> 
> Best regards,
> 
> Thomas
> 
 I'll send the new patch soon

Regards
Erwan
