From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 04 Jan 2013 18:44:15 +0100
Subject: [Buildroot] [PATCH] gnuplot : new package
In-Reply-To: <20130104172643.72321640@skate>
References: <1357311193-31887-1-git-send-email-viallard@syscom-instruments.com>
 <50E6F604.4000401@relinux.de> <20130104172643.72321640@skate>
Message-ID: <50E714EF.4090102@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.01.2013 17:26, schrieb Thomas Petazzoni:
> Dear Stephan Hoffmann,
>
> On Fri, 04 Jan 2013 16:32:20 +0100, Stephan Hoffmann wrote:
>
>>> +GNUPLOT_CONF_OPT = --without-x \
>> is there a special reason for this? Why not build with x, when X11 is
>> configured in buildroot?
> I guess because Anthony didn't need X support. It is not because a
> given software component can potentially support feature Y or Z that we
> require the package submitter to support all those features Y or Z. It
> would put way too much load on the initial package submitter.
Hello Thomas,

maybe my question was not clear enough. I just wanted to know if this
option is really required.
> Instead, we prefer having small packages that only support the features
> that have been tested by the submitter, and that carefully disables all
> the unsupported features. And then, as features are needed by other
> people, they can submit additional patches to make those additional
> features work.
O.K., I didn't realize that even when configure finds out that no X11 is
present --without-x is needed for this reason.

For the records: I made a quick test without X11 and it fails to compile
without this option.
> Anthony: a gnuplot patch without the X support is perfectly acceptable.
Of course, this is my opinion, too! I really like seeing it included!

Kind regards

Stephan
>
> Best regards,
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
