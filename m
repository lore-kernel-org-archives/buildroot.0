From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 22:44:12 +0100
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <CAKbGBLhc8Wftu8pSVM8jNvRRpoSV=e0p5eomh4=+u8wg1VxVxA@mail.gmail.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <CAKbGBLj66AmB6kxrp1utLmZ+AhWN+-0aDERdD=4FtAi=UHT_ig@mail.gmail.com>
 <CANPyyuO9hfyObgWWPjh7m=oghSs=qWWvsG28q+P=7F8W4NQnYg@mail.gmail.com>
 <CAKbGBLhc8Wftu8pSVM8jNvRRpoSV=e0p5eomh4=+u8wg1VxVxA@mail.gmail.com>
Message-ID: <550B432C.9060100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/15 20:50, Steven Noonan wrote:
> On Thu, Mar 19, 2015 at 12:43 PM, Mike Williams <mike@mikebwilliams.com> wrote:
>>> I come from the Arch Linux world, so I made a new skeleton that
>>> matches the Arch base filesystem layout: with /bin, /sbin, /usr/bin,
>>> and /usr/sbin all unified (likewise with /lib and /usr/lib). I haven't
>>> convinced myself to post the series because I can't think of a
>>> particularly good justification for it in the Buildroot context.
>>
>> I'm working that way myself, I don't know what use cases in Buildroot
>> still require the split.
> 
> We could consider offering it as an experimental alternative to the
> default skeleton (just add another "choice" in kconfig, as I did in my
> patch series). And open a discussion about unifying the directory
> structure. It's certainly possible to support both use cases, though
> it does require more testing.

 I've also started using a unified /bin /sbin /usr/bin /usr/sbin and unified
/lib /usr/lib /lib64 /usr/lib64, and it really simplifies things a lot. I yet
have to find a disadvantage.

 Make it it a choice sounds like a great idea! Please Cc me on the patch :-)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
