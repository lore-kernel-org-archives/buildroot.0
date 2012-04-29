From: Nigel Sollars <nsollars@gmail.com>
Date: Sun, 29 Apr 2012 10:36:10 -0400
Subject: [Buildroot] Buildroot fails to build when selecting build
	packages
In-Reply-To: <4F9D4BED.4050001@mind.be>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
 <201204291144.26712.arnout@mind.be>
 <CAG6aBkVmLoN-fHkGWUiOfjRM7k2swUvzNQ38p=schi+Y2Ug1hg@mail.gmail.com>
 <4F9D4BED.4050001@mind.be>
Message-ID: <CAG6aBkVUgOkv5kvPZkY+YgysDQ274FdaW+0vtVU-Vk1rBudJZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

ok the command you gave shows that the configuration is reading from my
/usr/lib/pkgconfig/dbus-1.pc file.

So thats obviously the cause to this one.

Nige

On Sun, Apr 29, 2012 at 10:10 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 04/29/12 15:27, Nigel Sollars wrote:
>
>> Hello,
>>
>> I dont have either of those set for environment vars, ( went through
>> profile / profile.d and env )
>>
>> here is the output:
>>
>> configure:28819: checking for DBUS1
>> configure:28826: $PKG_CONFIG --exists --print-errors "dbus-1 >= 1.2.14"
>> configure:28829: $? = 0
>> configure:28842: $PKG_CONFIG --exists --print-errors "dbus-1 >= 1.2.14"
>> configure:28845: $? = 0
>> configure:28882: result: yes
>>
>
>  So pkg-config incorrectly claims that dbus is available.  Is there really
> a dbus-1.pc file in output/staging/usr/lib/**pkgconfig?  Can you run
> "output/host/usr/bin/pkg-**config --debug --modversion dbus-1" ?
>
>  Regards,
>  Arnout
>
>
>


-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120429/4b921475/attachment.html>
