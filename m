From: Heiko Zuerker <heiko@zuerker.org>
Date: Fri, 24 Dec 2010 07:33:23 -0600
Subject: [Buildroot] [PATCH] add syslog-ng 3.0.9,
 including required eventlog lib
In-Reply-To: <20101224082110.419580d3@surf>
References: <7c61f61e277949a18b471ee5297d03062ced6083.1293153003.git.smiley73@users.sourceforge.net>
	<73a045889e438229d8d9dd10da05a8585acb46d6.1293153206.git.smiley73@users.sourceforge.net>
	<20101224082110.419580d3@surf>
Message-ID: <20101224073323.161130mqscpjbqck@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Thu, 23 Dec 2010 19:26:22 -0600
> heiko at zuerker.org wrote:
>
>> From: Heiko Zuerker <smiley73@users.sourceforge.net>
>>
>>
>> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
>> ---
>>  package/Config.in              |    1 +
>>  package/eventlog/eventlog.mk   |   13 +++++++++++++
>
> You'll need a Config.in file for eventlog as well.

Will do

>> --- /dev/null
>> +++ b/package/syslog-ng/Config.in
>> @@ -0,0 +1,19 @@
>> +config BR2_PACKAGE_SYSLOG_NG
>> +    bool "syslog-ng"
>> +    depends on BR2_PACKAGE_LIBNET
>
> For library dependencies, we generally use "select".

Okay

>> +    help
>> +      The syslog-ng application supports reliable and encrypted transport
>> +      using TCP and TLS, and offers powerful message filtering, sorting,
>> +      pre-processing and log normalization capabilities. Utilizing message
>> +      parsing and classification, syslog-ng is able to correlate  
>> log messages
>> +      both real-time and offline, making it especially suited to  
>> implement the
>> +      artificial ignorance principle. This high-performance tool handles
>> +      extreme loads easily, and is extensible with various plug-ins to best
>> +      suit your requirements.
>
> And we generally add the main website of the package here, at the end
> of the help text.

Will do

>> +config BR2_PACKAGE_SYSLOG_NG_LINK_DYN
>> +    bool "dynamic linking"
>> +    depends on BR2_PACKAGE_SYSLOG_NG
>
> I haven't checked what --enable-dynamic-linking does. But if it's
> dynamic linking against libraries, then you don't need a separate
> option for that, just use BR2_PREFER_STATIC_LIB.

--enable-dynamic-linking        Link glib and eventlog dynamically  
instead of statically.
--enable-static-linking         Link everything statically.
--enable-mixed-linking          Link 3rd party libraries statically,  
system libraries dynamically

> Is syslog-ng a complete replacement for sysklogd ?

Yes it is. It has a lot more features.

I'll be sending in a newer patch in a little bit.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
