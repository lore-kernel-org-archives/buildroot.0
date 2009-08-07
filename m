From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 07 Aug 2009 10:43:27 +0200
Subject: [Buildroot] [Bug 331] Update MPlayer to version 1.0rc2
In-Reply-To: <20090807072228.092c0837@hcegtvedt.norway.atmel.com>
References: <bug-331-163@https.bugs.busybox.net/>	<20090727151733.33260777EC@busybox.osuosl.org>	<4A7B6261.2030509@atmel.com>
	<4A7B6D2A.8020206@atmel.com>
	<20090807072228.092c0837@hcegtvedt.norway.atmel.com>
Message-ID: <4A7BE92F.9070700@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hans-Christian Egtvedt skrev:
> On Fri, 07 Aug 2009 01:54:18 +0200
> Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> 
>> Ulf Samuelsson skrev:
> 
> <snipp>
> 
>> Could this mean that OE uses a fixed point MP3 decoder
>> while Buildroot mplayer uses a floating point decoder?
>>
> 
> Is MPlayer compiled with libmad support and is libmad used as audio
> codec?
> 
> Please post the entire output from a playback, I use
> a /etc/mplayer.conf to override some basic stuff.
> 

Thanks, I checked the output already, and OE is using libmad,
while Buildroot is using the builtin mp3lib.

I have tried configuring with --disable-mp3lib.
With that mplayer uses ffmpeg [ffmp3].
This plays OK, but it takes about 60 seconds to start the song :-(.

I looked at ~/stk100x/target_skeleton/etc/mplayer.conf
and created a file /etc/mplayer.conf containing

ac=mad

and now it starts immediately and plays OK!

Thanks a bundle...

BR
Ulf
