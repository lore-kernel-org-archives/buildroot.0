From: Brad House <brad@mainstreetsoftworks.com>
Date: Wed, 15 Aug 2007 07:51:55 -0400
Subject: [Buildroot] [patch] kernel-headers: lzma causing issues
In-Reply-To: <1187165518.4942.6.camel@elrond.sweden.atmel.com>
References: <46C24F7F.1020203@mainstreetsoftworks.com>
	<1187165518.4942.6.camel@elrond.sweden.atmel.com>
Message-ID: <46C2E8DB.5020309@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> +config BR2_KERNEL_HEADERS_LZMA
>> +	bool "use lzma initramfs kernel patches"
>> +	default y
>> +	help
>> +	  Apply patches which allow for lzma compressed
>> +	  initramfs filesystems.  This requires the lzma
>> +	  program in your development environment.	
>> +
> 
> Since it also breaks unless you have lzma causing headache, 
> I think the default should be to not use the lzma patch...

ok, yeah, I'd agree with that ... I was just maintaining
compatibility for those who are using it by defaulting to y.

> I am working on a new scheme where the target/linux and
> toolchain/kernel-headers are integrated, but this
> needs a lot more testing and will (as agreed with Bernhard
> be reviewed before applied, but it seems reasonable
> to do this as an intermediate fix.

Ah, yeah, it would definitely make sense for those to be
integrated. It took me a minute to realize the kernel
headers version is what determined which release of the
kernel got built ;)

Thanks.
-Brad
