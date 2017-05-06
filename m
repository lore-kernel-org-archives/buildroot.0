From: Martin Bark <martin@barkynet.com>
Date: Sat, 6 May 2017 10:14:57 +0100
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <20170505132423.3602e294@free-electrons.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
 <20170505132423.3602e294@free-electrons.com>
Message-ID: <CAFGQKxefZ5eA+aQ9WqWR9J8GN_4oOoPApUPBOGebuC7YeHSONQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 5 May 2017 at 12:24, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

<snip>


> >       x86_64 |                   nodejs-7.9.0 | NOK |
> http://autobuild.buildroot.net/results/0e4fb1a615ab9654ad2b4b1274a345
> 83e02aa44e |
>
> Network issue while downloading the nodejs coffee script/express stuff.
>
> Martin, do you have an idea what we can do about this ? Should we stop
> testing coffee script/express in the autobuilders ?
>

I had been thinking for a while about removing
BR2_PACKAGE_NODEJS_MODULES_EXPRESS
and BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT given you can just set them
with BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL.  They are also not that useful
since they choose the latest version meaning builds are not even
reproducible.  BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL allows you to install
them and choose the exact version you want.

Since they also cause build errors i think they should go.  Node 7.10.0 was
just released so i'll submit a patch set to upgrade node and remove the
express and coffee script settings.

Thanks

Martin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170506/177c574d/attachment.html>
