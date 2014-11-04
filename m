From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 04 Nov 2014 11:01:54 -0300
Subject: [Buildroot] Samba4 build issue
In-Reply-To: <20141104082623.33a2136e@free-electrons.com>
References: <20141101233957.7ca9aabd@free-electrons.com>	<545577D9.1040405@zacarias.com.ar>	<20141102103811.16e499df@free-electrons.com>	<545628BF.2030101@zacarias.com.ar>
 <20141104082623.33a2136e@free-electrons.com>
Message-ID: <5458DC52.6020706@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/04/2014 04:26 AM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Sun, 02 Nov 2014 09:51:11 -0300, Gustavo Zacarias wrote:
>> On 11/02/2014 06:38 AM, Thomas Petazzoni wrote:
>>
>>> Ok, so it's libcap causing issues. Have those issues reported upstream?
>>> While reverting to an older version libcap being an acceptable
>>> temporary workaround, it's not going to be nice on the long run;
>>
>> They're fixed, revised patch sent.
>> Let's just hope it doesn't break other stuff.
> 
> Great, thanks for having worked on this.

D'oh!
http://autobuild.buildroot.net/results/992/9928a251e5cfcf6e574a447221e938135eeb69f9/build-end.log
Seems the new libcap version requires 3.1+ kernel headers.
I'm not a big fan of those ppc toolchains since they're old, but what's
the linux headers baseline we're looking for?

Mandatory use of libcap:
cdrkit - ouch
lxc - probably not that much
squid - probably not that much
systemd - irrelevant, needs newer headers by itself

We could propagate the headers dep, it's just that it will look silly on
cdrkit.
Opinions?

Regards.
