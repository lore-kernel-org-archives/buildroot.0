From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 26 Oct 2016 13:35:00 -0400
Subject: [Buildroot] [PATCH 4/4] mfgtools: new package
In-Reply-To: <CAAMH-ytjN5TC4tG7A7y_R0f7DpOnEHN33u8wgCJDqLk+kDCCug@mail.gmail.com>
References: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
 <20161019142309.15628-5-gary.bisson@boundarydevices.com>
 <CA+-urNRE0tx7RL-5WQCVqbiywUxu8eW1AJDP4vjPoWadkhN+xQ@mail.gmail.com>
 <CAAMH-ysyagimdb6+rk1Nq5JpYUkqwsBKAoRoRsz_E3c1i-yO0g@mail.gmail.com>
 <CA+-urNRFcDDP-s6KO7XWO_hrW6YNYLWBknEg6Dsb=GeeBS5Vqg@mail.gmail.com>
 <CAAMH-ytjN5TC4tG7A7y_R0f7DpOnEHN33u8wgCJDqLk+kDCCug@mail.gmail.com>
Message-ID: <CA+-urNSigaUCdEaxYWB4gdyoyUroFeuUF=aQveoY7ORjrb1PmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, Oct 26, 2016 at 4:56 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> Hi Frank,
>
> On Mon, Oct 24, 2016 at 5:58 PM, Frank Hunleth
> <fhunleth@troodon-software.com> wrote:
>> <snip>
>>> What happens exactly? I've generated an initramfs for the target that
>>> includes uuc and it was ok. Actually I had to do one thing manually
>>> which was to modprobe the g_mass_storage module manually. I need to
>>> add it to the init scripts but I'm not sure how to do that in the
>>> systemd service file, I need to look at it.
>>
>> I'm using a pre-existing 'ucl2.xml' that came with binaries for the
>> loader versions of U-Boot and Linux. I'm including it below since it's
>> not too long. The "BootStrap" stsps appeared to work. The "Updater"
>> steps hung at the "Sending U-Boot" command. I'm not convinced that the
>> other steps really worked, though, since it took them quite a while to
>> run like they may have just timed out. Since I rarely need to run this
>> script, I wasn't planning on debugging it. Maybe this will give you
>> some hints, though?
>
> When you say the bootstrap steps are working, do you mean that you can
> see on the serial console that U-Boot, Kernel and initramfs are
> properly loaded and booted from?
>
> Then the tool is actually going back to the "Sending U-Boot" state as
> long as it doesn't recognize a UTP linux image booted up. If you're
> system properly booted (1st question), it is most likely due to bad
> permissions. Are you sure you have a udev rule for the UTP VID/PID? If
> not, please add it (or use sudo, but it's evil).

I actually ran it as sudo out of desperation when it wasn't working,
and now due to unrelated issues, that particular board is no longer of
interest. Sorry that I can't be of more help. If I get back to it in
the future, I'll try some more. I don't think my experience should
hold up your patch, since it clearly builds and runs (at least a
little). I really appreciate you trying to help figure out what went
wrong for me.

Thanks,
Frank
