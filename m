From: Frank Bergmann <bergmann@rosho.de>
Date: Fri, 08 Nov 2013 15:09:51 +0100
Subject: [Buildroot] running gtk programs fail
In-Reply-To: <20131108111148.640ce383@skate>
References: <52330AFB.1050204@rosho.de>	<527CB831.7060806@rosho.de>
 <20131108111148.640ce383@skate>
Message-ID: <527CF0AF.5070306@rosho.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 08.11.2013 11:11, schrieb Thomas Petazzoni:
> Dear Frank Bergmann,
>
> On Fri, 08 Nov 2013 11:08:49 +0100, Frank Bergmann wrote:
>
>>> Did I miss something or is libgtk broken ?
>>
>> I did a step down and wrote a small glib program (in attachment). But
>> it does not work in buildroot-2013.08.1 ! The glib main loop seems to
>> get no events from timer nor from input source. On my host system the
>> program works with no issues.
>>
>> Can anybody verify this behaviour or have a working example for me ?
>>
>> In attachment I send the source of the test program and my buildroot
>> config.
>
> Are you testing against uClibc? If so, can you test against (e)glibc?

I tested against (out-of-the-box selected) uClibc.

So as you suggested I tested against eglibc and it seems to work. I also 
did a test against buildroot git-repository. The git version seems also 
to work even with uClibc. It has the same version of uClibc but more 
patches than 2013.08.1. So I guess one (or more) of these patches make 
glib2 happy.

Thanks,
Frank.
