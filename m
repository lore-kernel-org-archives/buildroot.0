From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 06 Dec 2012 11:59:06 +0100
Subject: [Buildroot] [PATCH] pkg-download.mk: Fix shallow clone
In-Reply-To: <50C0432E.2080005@mind.be>
References: <1354445767-15308-1-git-send-email-sho@relinux.de>
 <8738zo7835.fsf@dell.be.48ers.dk>
 <CANxTyt74ytgBNHb8koKuVTjei5sQP2FpUrwawMuG17=fAK3bXw@mail.gmail.com>
 <50C0432E.2080005@mind.be>
Message-ID: <50C07A7A.2070204@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 06.12.2012 08:03, schrieb Arnout Vandecappelle:
> On 06/12/12 03:14, Danomi Manchego wrote:
>> So I'm wondering why the recent changes in this area used grep at
>> all, rather than asking ls-remote directly.  I.e.:
>>
>> ((test `git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION) | cut -f
>> 2-` && \
>>
>> If there is feedback that the above is desirable, then I can send in
>> the patch.
>
>  The argument of test should be quoted to avoid getting the same
> problem again
> when the ref matches more than once for some reason.
>
>  Or even better: use the exit code:
>
> git ls-remote --exit-code $($(PKG)_SITE) $($(PKG)_DL_VERSION) >
> /dev/null 2>&1 && \
>
> (hopefully the --exit-code option exists in older gits as well...)
Hi,

sorry to say, but my git 1.7.0 does not know anything about a
--exit-code option and ls-remote always gives a exit code of 0 as long
as the repository can be connected.

Maybe its worth to think about adding a host-git to buildroot to
overcome such compatibility issues?

Kind regards

Stephan
>
>  Regards,
>  Arnout
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
