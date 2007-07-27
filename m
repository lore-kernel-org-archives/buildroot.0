From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 12:42:28 +0200
Subject: [Buildroot] sqlite failure
In-Reply-To: <1185518077.12803.8.camel@elrond.sweden.atmel.com>
References: <1185517759.12803.3.camel@elrond.sweden.atmel.com>
	<1185518077.12803.8.camel@elrond.sweden.atmel.com>
Message-ID: <20070727104228.GD22789@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 27, 2007 at 08:34:37AM +0200, Ulf Samuelsson wrote:
>fre 2007-07-27 klockan 08:29 +0200 skrev Ulf Samuelsson:
>
>Sorry, mixup, I meant stunnel
>
>sed -i s/sqlite/stunnel/ <this>
>
>
>> Trying to build sqlite, which fails.
>> 
>> 
>
>
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++
>> checking for getaddrinfo... yes
>> checking for broken poll() implementation... no
>> configure: **************************************** SSL
>> checking for SSL directory... Not found
>> 
>> Couldn't find your SSL library installation dir
>> Use --with-ssl option to fix this problem
>> -----------------------------------------------------
>> 
>> Does that mean that "sqlite" depends on openssl
>> and we should select that in the Config.in

I'd say yes.

>> 
>> If so, it is imaginable that another SSL package could
>> be made available, so maybe "sqlite" should depend
>> on "BR2_SSL" and "openssl" and other SSL packages, would
>> select "BR2_SSL".

i wouldn't do that unless there is a sensible request for it, fwiw.
