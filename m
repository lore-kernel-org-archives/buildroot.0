From: Pascal =?ISO-8859-1?Q?H=FCrst?= <pascal.huerst@gmail.com>
Date: Thu, 24 Apr 2014 09:52:24 +0200
Subject: [Buildroot] Adding google-breakpad to buildroot
In-Reply-To: <53582D0A.2030302@mind.be>
References: <1398262906.30640.4.camel@mbpro.localhost>
 <5357DC41.6020608@mind.be>
 <CAHXCMMKSGHSvYLr9JALDr0YzD4uTshQrNZYm46-0kgGpUP4Ptw@mail.gmail.com>
 <1398269552.30640.13.camel@mbpro.localhost> <53582D0A.2030302@mind.be>
Message-ID: <1398325944.3669.2.camel@mbpro.localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mit, 2014-04-23 at 23:13 +0200, Arnout Vandecappelle wrote:
> On 23/04/14 18:12, Pascal H?rst wrote:
> > On Mit, 2014-04-23 at 17:52 +0200, Samuel Martin wrote:
> >> Hi Pascal, Arnout, all,
> >>
> >> On Wed, Apr 23, 2014 at 5:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> >>> On 23/04/14 16:21, Pascal H?rst wrote:
> [snip]
> >>>  It is easier to add it to the target-finalize target. Then you can be
> >>> sure that the ordering is correct (target-finalize already has all the
> >>> needed dependencies). You can also easily use conditions there (it's not
> >>> inside a define).
> >>>
> >>>  However, I think it will be more appropriate to implement breakpad as an
> >>> additional strip alternative. You probably don't want to combine strip
> >>> with breakpad...
> >>
> >> I think breakpad is more like a pre-strip hook, that one can enable or
> >> not. But in the end, the target image will be stripped most of the
> >> time (at least, this is the way I would use such a feature).
> > 
> > I agree, since the extraction of the symbols should always happen, when
> > breakpad is used, no mater what strip alternative is selected
> 
>  OK, I thought breakpad did stripping already.
> 
>  In that case, I think it's best to put it in target-finalize just before
> strip.

Ok, I'll do it that way, then.

Thanks!

>  Regards,
>  Arnout

Regards
Pascal

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140424/990dae1f/attachment.asc>
