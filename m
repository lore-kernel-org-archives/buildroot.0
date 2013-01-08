From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 08 Jan 2013 23:10:00 +0200
Subject: [Buildroot] [PATCH] new package: proxychains
In-Reply-To: <50EC7403.9010309@petroprogram.com>
References: <1356222029-6290-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130108180957.30c9f629@skate> <50EC6C03.2040504@petroprogram.com>
 <20130108201808.7ee86751@skate> <50EC7403.9010309@petroprogram.com>
Message-ID: <50EC8B28.6090207@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All.

This is something that I susbect most of you already know but I repeat
it here anyway:

Newer completely trust those free public proxies that are listed outside
in the Net.
Ever.

Some of them like https://hidemyass.com/proxy-list will offer free
"anonymous" proxies for your use.
I did some testing and found out that not single one of those so called
free high "anonymous" proxies in
that list did what it was suppose to do but happily revealed your true
IP-address.

Some free anonymous proxy sites on the other hand do what they promise
for example: http://www.freeproxylists.net/?pr=HTTPS&a[]=2&s=rs

Bottom line is this:
If you are using this proxychains program to bybass censorhip
(a' la Great Firewall of China, so that you can watch Youtube) of your
country then please take care
and *always test your proxy or proxies beforehand!!!*

There are plenty of sites like http://www.whatsmyip.org and others that
can show if your IP is the same
as proxy or if the proxy(proxies) will reveal your true IP.
(I even made one IP sniffing page myself
http://www.petroprogram.com/ProxyCheckSimple2.php )

So always remember to test those free proxies beforehand and newer do
any e-mail checking or online bank
stuff throught those proxies. Even if it's HTTPS enabled proxy.
Ever!

Regards
Stefan


8.1.2013 21:31, Stefan Fr?berg kirjoitti:
> Hi Thomas
>
> 8.1.2013 21:18, Thomas Petazzoni kirjoitti:
>> Dear Stefan Fr?berg,
>>
>> On Tue, 08 Jan 2013 20:57:07 +0200, Stefan Fr?berg wrote:
>>
>>> Hmmm... could this be a some weird parallel compiling problem ????
>> No. proxychains is a program that LD_PRELOAD a library to overload some
>> of the C library functions. So it reimplements some functions of the C
>> library, but in this case, it reimplements getnameinfo() with a
>> prototype that doesn't match the one of the C library.
> That's really strange because it did match my headers and I had no problem.
>
>> Maybe an idea would be to upgrade to proxychains 4.4:
>> http://sourceforge.net/projects/proxychains/forums/forum/644747/topic/6519406.
>>
>> The main page of proxychains mentions 3.1 as the latest version, but it
>> is not the case. The official Git repo at
>> https://github.com/rofl0r/proxychains contains many more recent
>> versions. Most likely the problem is already fixed in a more recent
>> version than 3.1.
>>
>> Could you test a more recent version and submit the corresponding patch?
>>
>> Thanks!
>>
>> Thomas
> Ok, Ill take a look and try a newer version.
>
> Stefan
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
