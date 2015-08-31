From: =?UTF-8?B?Q8OpZHJpYyBNYXJpZQ==?= <cedric.marie@openmailbox.org>
Date: Mon, 31 Aug 2015 14:35:05 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <20150831092822.521c2c72@free-electrons.com>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>	<5578B394.1010503@mind.be>	<a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>	<5579E9EF.4070402@mind.be>	<0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>	<55870F2F.4080700@mind.be>	<4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>	<CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>	<7f746aa9c68a301002cdca28b6cb3f51@openmailbox.org>	<CAHXCMM+-eyJRSa5c8WAtqptC0MTbJNBb4bZdhBBaY3yxYvAauw@mail.gmail.com>	<0494936f4284565201a58a70d0a3c08d@openmailbox.org>	<ae20692cc561152ac16a33820206a599@openmailbox.org>	<55D9016F.5080602@mind.be>
 <20150831092822.521c2c72@free-electrons.com>
Message-ID: <55E449F9.90407@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 31/08/2015 09:28, Thomas Petazzoni a ?crit :
> Arnout, C?dric,
>
> On Sun, 23 Aug 2015 01:10:39 +0200, Arnout Vandecappelle wrote:
>
>>   For autotools it depends a lot on the version. Relatively recent automake (at
>> least 1.15) has the V=0/1 option, but it defaults to 1 I think.
>
> It actually depends on how AM_SILENT_RULES is used:
>
>   * If it's not used, then the build is verbose, and V=0/1 has no effect.
>
>   * If AM_SILENT_RULES is used, with no special argument, then it
>     defaults to verbose (V=1), but can be made quiet by passing V=0
>
>   * If AM_SILENT_RULES([yes]) is used, then it defaults to quiet (V=0)
>     and can be made verbose by passing V=1.


So I think the best way to manage it is to be explicit: "V=0" when 
nothing is specified (because we want the default to be silent), and 
"V=1" when V=1 from the command line.
In worst case, it is not taken into account.
Otherwise, it is correctly managed, whatever the default setting of 
AM_SILENT_RULE.

NB: I said that the behaviour was kept unchanged, but in fact there is 
one case that seems to be better handled with my modification: when 
AM_SILENT_RULES is used without argument (i.e. the default is verbose). 
Now we turn it to quiet by forcing explicit V=0.


-- 
C?dric
