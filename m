From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2016 21:00:10 +0200
Subject: [Buildroot] Stripping kernel modules for ARC
In-Reply-To: <1473852437.3766.15.camel@synopsys.com>
References: <1473852437.3766.15.camel@synopsys.com>
Message-ID: <6675ca2c-ef21-9de1-9728-b71a99807b3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 14-09-16 13:29, Alexey Brodkin wrote:
> Hello,
>
> This is a follow-up of discussion started here
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/86
>
> The problem in hand is kernel stack unwinding on ARC historically was done
> with use of debug_frame instead of more common eh_frame. And if stripping
> of target binaries is enabled in Buildroot invocation of strip with
> "--strip-unneeded" gets rid of debug_frame section effectively making
> kernel unwinder helpless.
>
> I'm wondering what would be a better way to strip modules on ARC in Buildroot?
>
> I may see at least following solutions:
>  1. Empty STRIP_STRIP_UNNEEDED or even KSTRIPCMD for ARC
>     This together with
> http://lists.infradead.org/pipermail/linux-snps-arc/2016-September/001483.html
>     will still produce pretty compact .ko files on target

 How about using --keep-symbol to keep the debug_frame? Or is it not a symbol?

>  2. Use objdump instead of strip with explicitly mentioned sections to keep or
> remove
 strip also has --remove-section.

 Regards,
 Arnout


>
> Any thoughts are much appreciated.
>
> -Alexey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
