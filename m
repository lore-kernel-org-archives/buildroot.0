From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Tue, 16 Feb 2016 11:38:35 +0530
Subject: [Buildroot] [PATCH v2 1/1] cgroupsfs: new package
In-Reply-To: <56BE04EA.7070401@mind.be>
References: <1455286842-11540-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <20160212161722.48c9a703@free-electrons.com>
 <56BE04EA.7070401@mind.be>
Message-ID: <CAMshMJbkdPfhsTmXtYvvd_h-hiyQuTRWtV39q_+pPpBWGwzbNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout & Thomas,

updated all your comments and sent new version (v3) of Patch.

Thanks,
Niranjan Reddy

On Fri, Feb 12, 2016 at 9:44 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 12-02-16 16:17, Thomas Petazzoni wrote:
> > Hello,
> >
> > Thanks for this new iteration! See some comments below.
> >
> > On Fri, 12 Feb 2016 19:50:42 +0530, Niranjan Reddy wrote:
> >> From: Niranjan <niranjan.reddy@rockwellcollins.com>
> [snip]
> >> +    status)
> >> +            if mountpoint -q /sys/fs/cgroup; then
> >> +                    # TODO decide whether to detect "partial mounted"
> status (ie, whether all available subsystems are mounted correctly)
> >
> > This comment needs to be wrapped. Or handled :)
>
>  Actually, we don't need status, only very old init scripts (or init
> scripts
> delivered by the package) have that.
>
>
>  Regards,
>  Arnout
>
> >
> >> +                    echo "cgroupfs hierarchy is mounted"
> >> +                    exit 0
> >> +            else
> >> +                    echo "cgroupfs hierarchy is not mounted"
> >> +                    exit 1
> >> +            fi
> >> +            ;;
> >> +
> >> +    *)
> >> +            echo "Usage: $0 {start|stop|restart|status}"
> >> +            exit 1
> >> +            ;;
> >> +esac
> >
> > Also, we often put the start(), stop() and status() code in functions,
> > so that the indentation remains more reasonable. Again, see S50dropbear
> > for a pretty good example.
> >
> [snip]
>
> --
> Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
> Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
> Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160216/8713ce6c/attachment.html>
