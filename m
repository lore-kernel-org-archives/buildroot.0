From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Nov 2011 08:49:00 +0100
Subject: [Buildroot] systemd
In-Reply-To: <4ECA1B28.50907@free-electrons.com>
References: <CAAfyv34FVf5V-ZH4-xapeG8F+2VSgXOWMsf+5O03m9wimRx1Ug@mail.gmail.com>
 <4ECA1B28.50907@free-electrons.com>
Message-ID: <201111230849.07277.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 21 November 2011 10:34:32 Maxime Ripard wrote:
> Hi,
> 
> On 18/11/2011 21:02, Belisko Marek wrote:
> > Hi,
> > 
> > when looking for ELCE 2011 videos one video was very
> > interesting:http://events.linuxfoundation.org/events/embedded-linux-conference-europe/kooi
> > There is a lot of discussion about decreasing boot time for embedded
> > systems and systemd seems not yet included in buildroot (OE have it
> > also angstrom).
> > 
> > Is there anybody who working on this or can I start integration to buildroot?
> 
> After attending this exact talk, I've begun to work on some integration
> of systemd in Buildroot.
> 
> This has been stalled lately because I didn't have time to improve my
> initial implementation, but basically, I have for now :
>   - Made the systemd package
>   - Added new package variables to define both Sys-V and systemd-format
> init scripts
>   - Added the needed logic so that you can only select one of the init
> systems available in Buildroot (sysvinit, Busybox, systemd)
>   - Migrated the existing packages to use the mentionned variables.
> 
> I still have some issues that I need to address, that explains why I
> haven't yet posted the patches :
>   - I have a bug that adds the sysv init scripts to the target even if
> it shouldn't
>   - I have not tested it "live" yet

 If you post the patches already as an RFC, perhaps you will get some 
comments that help you overcome these issues... Especially with a user
that is willing to test them.

 Marek, if you test the eventual patches (and they work), can you give
them your Tested-by: tag?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111123/b16af227/attachment-0001.html>
