From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Wed, 25 Feb 2015 19:55:10 -0600
Subject: [Buildroot] Driver for C-Media Electronics,
 Inc. CM106 based usb audio device?
In-Reply-To: <CAFGceHEEh=LW4oMFYvdYqDLc88mNyoHGN28DDymWoTTWrzXQkA@mail.gmail.com>
References: <trinity-9a0e3213-0146-4b49-b930-a78ba9819e21-1424893333834@3capp-gmx-bs41>
 <CAFGceHEEh=LW4oMFYvdYqDLc88mNyoHGN28DDymWoTTWrzXQkA@mail.gmail.com>
Message-ID: <CAFGceHGbRQ7Rk-OJ-8F04AVOt5mnrbJ2Z3v3AiYbkYTPYXtegg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh, I also forgot to mention I am playing mplayer in the buildroot setup in
the console, as I still don't have a gui yet.

On Wed, Feb 25, 2015 at 7:53 PM, Lou Crittenden <loucrittenden63@gmail.com>
wrote:

> >I was able to compile and run a rockbox version on RPi/buildroot, but
> still
> > without audio file playing...
>
> Awesome! Can I see it?
>
> I was able to run mplayer with no options in a terminal within the
> raspbian image that came with my waveshare device and it didn't have a bit
> of problems with the audio. It sounded great actually.
>
> You're probably right on the resource part, and I believe the buildroot
> kernel has a lot to do with it, but the raspbian kernel didn't have that
> issue at all, but of course it just takes a long time to boot compared to
> buildroot. I want to use the isolator to isolate the usb sound device from
> the background zipper noises, pops, buzzes, whining, and other garbage from
> the main computer board that happens when for example you are scrolling a
> page or leds on the board blink.
>
> I have included a sample of what I am running into as far as the audio.
> This was with the commands:
>
> # cd /media/usb0 (this thumbdrive is where my music is located)
> # mplayer *
>
> and with my usb sound device plugged in. It doesn't do that with the
> onboard card, though (even though it sounds like poo, as I have heard it
> was only 11-bit audio). When I'm running:
>
> # mplayer -quiet *
>
> it plays normally through the usb card even with other processes running,
> but still doesn't sound near as good as either my ubuntu system or the
> raspbian image.
>
> I also found out that the snd-usb-audio driver indeed does work with all
> of the channels when I input the command
>
> # speaker-test -Dplug:surround51 -c6
>
> to test all of the speaker channels. The woman's voice came through on all
> the appropriate channels, plus they are adjustable in alsamixer. I just
> can't get mplayer to use them all when using alsa as the backend (I haven't
> gotten pulseaudio to work in buildroot) and it outputs through the front
> only. I have the same issue when using alsa as the backend on this card in
> the raspbian image as well (but good sound) yet it uses the same
> snd-usb-audio driver, same with my ubuntu system.
>
> Would you recommend pulseaudio in my situation?
>
>
> On Wed, Feb 25, 2015 at 1:42 PM, Peter Seiderer <ps.report@gmx.net> wrote:
>
>> Hello Lou,
>>
>> On Tue, Feb 24, 2015 at 05:58:45PM -0600, Lou Crittenden wrote:
>> > Good news, I found a workaround to the garbled audio issue on use of
>> > mplayer when using my USB card. What I have to do is pass the -quiet
>> option
>> > when running mplayer. For example: mplayer -quiet test.mp3. It turns out
>> > that activity on the lcd screen was the culprit, and it interferes with
>> the
>> > audio and it ONLY does that when using the usb audio card. When no
>> options
>> > are passed, the display continually scrolls the time and whatnot of the
>> > audio playback every millisecond.
>> >
>> > mpg123 has much less terminal activity, and thus doesn't have the issue.
>> >
>> > I was wondering if this is a power issue and if it would work if I used
>> an
>> > isolator that allowed the device to receive its own power independent of
>> > the Raspberry Pi board? Something like this:
>> >
>> >
>> http://www.ebay.com/itm/ADUM4160-USB-Isolator-Board-ADI-USB-Port-Isolator-Protection-/191303685123?pt=LH_DefaultDomain_0&hash=item2c8a969403
>> >
>> > that electronically isolates the usb audio and power from the pi, but
>> > allows the pi to talk to the device so the sound improves and improves
>> > power stability.
>> >
>>
>> Hard to tell without hearing a sample of what you describe as 'garbled
>> audio',
>> but I would less suspect a electrical/decouple problem, more suspect a
>> pure
>> resource problem of the mplayer aplication doing audio and display
>> updates...
>>
>> Maybe you can stress mplayer -quiet and/or mpg123 doing some concurrent
>> work/
>> testbench running (e.g. untar a huge file (kernel source)), etc. and get
>> the
>> same audio defects?
>>
>> I was able to compile and run a rockbox version on RPi/buildroot, but
>> still
>> without audio file playing...
>>
>> Regards,
>> Peter
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150225/821e2a3f/attachment.html>
