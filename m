From: Jens Zettelmeyer <zettelmeyerj@gmail.com>
Date: Sat, 7 Mar 2015 12:27:13 +0000
Subject: [Buildroot] [PATCH 1/1] Fix batctl for static builds
In-Reply-To: <20150307130153.3fed78de@free-electrons.com>
References: <1425672948-1668-1-git-send-email-zettelmeyerj@goooglemail.com>
 <20150307130153.3fed78de@free-electrons.com>
Message-ID: <CAFNoKavbHT--DMvePP6KJvCddT3ydvSKRN-UMUnbhQHa4EiQMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

Thank you. I had a look at the libnl pkg-config patch. That makes a lot
more sense than what i did.

Thank you
Jens

2015-03-07 12:01 GMT+00:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Jens Zettelmeyer,
>
> On Fri,  6 Mar 2015 20:15:48 +0000, Jens Zettelmeyer wrote:
> > Signed-off-by: Jens Zettelmeyer <zettelmeyerj@goooglemail.com>
> > ---
> >  package/batctl/batctl.mk | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
>
> Thanks for working on this. However, this isn't the right fix for the
> problem: batctl uses pkg-config to discover how to link with libnl.
> It's just that the libnl .pc files were not correct in terms of static
> linking handling. Fixing those .pc files is a better solution, as it 1/
> can be upstreamed to libnl, 2/ avoids hacks in batctl.mk, and 3/ allows
> to also removes hacks in other Buildroot packages.
>
> See the series I have sent at
> http://lists.busybox.net/pipermail/buildroot/2015-March/121180.html.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150307/9626da09/attachment.html>
