From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Sep 2013 16:23:35 +0200
Subject: [Buildroot] [RFC] Effective Patchwork Use and Patch Review
In-Reply-To: <20130914074740.424283aa@skate>
References: <OFD77E15AC.FCFBC1CA-ON86257BE5.005BB4D9-86257BE5.005BB4FE@rockwellcollins.com>
 <20130914074740.424283aa@skate>
Message-ID: <CAAXf6LWLmdBcOh5q9YvLtzHaSmfeeZbG-yjkfzZMdTeAVDC+zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Sep 14, 2013 at 7:47 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ryan Barnett,
>
> On Fri, 13 Sep 2013 11:41:41 -0500, Ryan Barnett wrote:
>
>
> patchwork is really not here to help with the reviewing process. It's
> mainly of use for the Buildroot maintainer to keep track of which
> patches remain to be merged/rejected.
>
> All the reviewing process takes place on the mailing list, using e-mail
> clients. We don't use patchwork at all for this.

Agreed. When I wrote that patchwork improved the situation, I meant
that patchwork provided a good overview of outstanding patches, both
for reviewers as for maintainers.

>
> The only use of patchwork you may be interested in is to apply patches
> locally in order to be able to test them. But you don't even need
> pwclient for that. You can simply do:
>
> wget -O - http://patchwork.ozlabs.org/patch/274867/mbox/ | git am
>
> This will fetch a patch from patchwork and apply it to the current
> branch.

This is also how I use patchwork.
As I wrote before, I'm using Mercurial for my buildroot development,
and specifically the mq extension that is similar to git's quilt, in
which case I can simply do:

hg qimport http://patchwork.ozlabs.org/patch/274867/mbox/

which does the same as:

wget -O - http://patchwork.ozlabs.org/patch/274867/mbox/ | hg qimport

but with less typing.

Best regards,
Thomas
