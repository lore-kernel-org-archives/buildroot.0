From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 08 Dec 2013 16:25:08 -0300
Subject: [Buildroot] [PATCH] php: bump to version 5.5.6
In-Reply-To: <20131208201249.2f3e89a5@skate>
References: <1386528934-28676-1-git-send-email-gustavo@zacarias.com.ar>
 <20131208201249.2f3e89a5@skate>
Message-ID: <52A4C794.7070301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/08/2013 04:12 PM, Thomas Petazzoni wrote:
>> -config BR2_PACKAGE_PHP_EXT_SQLITE
>> -	bool "SQLite"
>> -	help
>> -	  Legacy SQLite2 support
>> -
>> -config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
>> -	bool "sqlite UTF8 support"
>> -	depends on BR2_PACKAGE_PHP_EXT_SQLITE
>> -	help
>> -	  UTF8 support for sqlite
> 
> Config.in.legacy maybe?

That's a language extension/construct that's been thrown out.
Unfortunately there are other builtins that aren't options that suffer
the same fate, so anyone migrating code from an older php series will
have to check/adapt their code as usual, i don't see much point in just
warning the user for a rarely used extension.
I think it'll just give the impression that everything else is the same
and it's not.
They'll have to read http://www.php.net/migration55 and
http://www.php.net/migration54 and check their code anyway (where it's
already mentioned).

>>  config BR2_PACKAGE_PHP_EXT_SOCKETS
>>  	bool "sockets"
>> +	depends on BR2_INET_IPV6
>>  	help
>>  	  Sockets support
> 
> New comment ?

True, i'll fix it in v2.
Regards.
