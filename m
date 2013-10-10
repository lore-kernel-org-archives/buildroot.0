From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Oct 2013 07:46:38 -0300
Subject: [Buildroot] [PATCH 5/7] mongoose: needs mmu
In-Reply-To: <5256543B.6090005@mind.be>
References: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
 <1381350348-25751-5-git-send-email-gustavo@zacarias.com.ar>
 <5256543B.6090005@mind.be>
Message-ID: <5256858E.9050005@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/2013 04:16 AM, Arnout Vandecappelle wrote:

>> --- a/package/mongoose/Config.in
>> +++ b/package/mongoose/Config.in
>> @@ -1,6 +1,7 @@
>>   config BR2_PACKAGE_MONGOOSE
>>       bool "mongoose"
>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>> +    depends on BR2_USE_MMU # fork()
>>       help
>>         Mongoose is a small and easy to use web server
> 
>  Note that fork() is only needed for CGI, so you could instead build
> with -DNO_CGI. It would be a pity to remove mongoose for NOMMU platforms
> since it is ideally suited for them...

Right, but there's still a catch, it's explicitly linking to libdl which
is a big no-no for FLAT nommu.
You seem to be involved with it upstream, care to cook up a patch to fix
the Makefile and maybe bump it bump a notch while at it? :)
Regards.
