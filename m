From: Robert Urban <urban@unix-beratung.de>
Date: Mon, 17 May 2010 17:21:13 +0200
Subject: [Buildroot] Login troubles
In-Reply-To: <4B961D89.6090106@iwtech.com.au>
References: <4B93A1AE.8070406@iwtech.com.au>
	<20100307160402.09f0825a@surf>	<A88EA622BD87C74AB5D6195ECDD53AB4035F163A@iwt-server.iwt.local>
	<4B961D89.6090106@iwtech.com.au>
Message-ID: <4BF15EE9.9070303@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I seem to have the same problem...

I built with WCHAR support, and although there is no password for either 'root'
or 'default' in /etc/shadow, I can only log in as 'default'.  Here are the entries:

[shadow]
root::10933:0:99999:7:::
default::10933:0:99999:7:::

[passwd]
root:x:0:0:root:/root:/bin/sh
default:x:1000:1000:Default non-root user:/home/default:/bin/sh

I did not test with WCHAR support turned off.

cheers,

Rob Urban

On 03/09/2010 11:06 AM, Paul Jones wrote:
> I've narrowed down the problem.
> When I compile without WCHAR I login as root and never get asked for a
> password.
> When I compile with WCHAR I get the password prompt and pressing enter
> does not work.
> That is using buildroot from git.
> 
> I'm still using the kernel binary that was supplied with the board,
> 2.6.32.x Could that be causing the problem?
> 
> 
> Paul.
> 
> On 8/03/2010 10:13 AM, Paul Jones wrote:
>> I thought it might be something I did so I downloaded buildroot again
>> and recompiled without changing anything except ARCH and the serial
>> console port and got the same result.
>>
>>
>> -----Original Message-----
>> From: buildroot-bounces at busybox.net
>> [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
>> Sent: Monday, 8 March 2010 2:04 AM
>> To: buildroot at busybox.net
>> Subject: Re: [Buildroot] Login troubles
>>
>> Hi Paul,
>>
>> On Sun, 07 Mar 2010 23:53:02 +1100
>> Paul Jones<paul.jones@iwtech.com.au>  wrote:
>>
>>   
>>> I've just built a basic buildroot for my mini2440 ARM board and it
>>> successfully boots to the buildroot login: prompt.
>>> My problem is that I can't seem to login - I haven't touched any of
>>> the config files and looking at /etc/passwd|shadow the login should be
>>>      
>>   
>>> root with a blank password?
>>>      
>> Right, no password, just press enter.
>>
>>   
>>> I've tried to login both from the serial console (which I set in the
>>> buildroot menu to /dev/ttySAC0) and the normal console with a usb
>>> keyboard - no luck.
>>>      
>>   
>>> buildroot login: root
>>> Password:
>>> Login incorrect
>>>      
>> Are you sure that you haven't made any change to /etc/securetty ? It
>> must contain at least /dev/ttySAC0 to allow login as root from this
>> console. The default target skeleton has a /etc/securetty that contains
>> /dev/ttySAC0, so it should be ok, unless you made any change to the
>> skeleton, of course, or used a different skeleton.
>>
>> Regards,
>>
>> Thomas
>> -- 
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux development, consulting,
>> training and support.
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>    
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
