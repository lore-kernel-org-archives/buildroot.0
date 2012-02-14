From: Spenser Gilliland <spenser309@gmail.com>
Date: Tue, 14 Feb 2012 11:54:22 -0600
Subject: [Buildroot] [git commit branch/next] DOWNLOAD_WGET: use -O
 instead of -P to set output file
In-Reply-To: <87k43pv0mi.fsf@macbook.be.48ers.dk>
References: <20120214115140.4C70390A99@busybox.osuosl.org>
 <CA+appbOppm780+jAe6LKqGR9mendwqdtvfTEB=Cntrz=5RynSQ@mail.gmail.com>
 <CAM+bi4uo_s_xMy-XVfNhSBwwm70jMxmz5UXB71fbV+=pROYdNQ@mail.gmail.com>
 <87sjidv1yx.fsf@macbook.be.48ers.dk>
 <CA+appbNv_c0r_uDZWw=x3WiHtykt3xX9qrQUTA4YMFq-AUgZ4w@mail.gmail.com>
 <87k43pv0mi.fsf@macbook.be.48ers.dk>
Message-ID: <CA+appbOf=yN3pWw_HC12BL3sy=SUbMK2CE7pa6MeaQMvLwO6fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

After greping through the source the enormity of that patch and the
potential for out of tree breakage suggest a different course of
action.  A possible solution may be to scan the SITE var for a
question mark and only change to non-slash mode on that occasion.
Would this be reasonable?

Spenser

On Tue, Feb 14, 2012 at 10:30 AM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Spenser" == Spenser Gilliland <spenser309@gmail.com> writes:
>
> ?Spenser> This workaround works; however, the default is to prepend a / to the
> ?Spenser> front of the source name. ?This leads to the following being
> ?Spenser> downloaded.
>
> ?Spenser> Without the slash the download should work. Peter should the patch
> ?Spenser> remove the prepended slash as well?
>
> I guess so. We would need to audit that all <blah>_SITE have a trailing
> space though, and this could potentially break out-of-tree stuff.
>
> --
> Bye, Peter Korsgaard



-- 
Spenser Gilliland
Computer Engineer
Illinois Institute of Technology
