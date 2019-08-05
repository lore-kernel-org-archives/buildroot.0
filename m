From: Alexander Dahl <post@lespocky.de>
Date: Mon, 5 Aug 2019 09:32:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/collectd: security bump to
 version 5.9.0
In-Reply-To: <lclj1gx1nl.ln2@ID-313208.user.individual.net>
References: <20190804150957.7844-1-bernd.kuhls@t-online.de>
 <20190804150957.7844-2-bernd.kuhls@t-online.de>
 <20190804171845.xvwkh7un7hyvk4fj@falbala.home.lespocky.de>
 <lclj1gx1nl.ln2@ID-313208.user.individual.net>
Message-ID: <20190805073229.yd7wf3feqfbigfen@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun, Aug 04, 2019 at 08:39:49PM +0200, Bernd Kuhls wrote:
> Am Sun, 04 Aug 2019 19:18:45 +0200 schrieb Alexander Dahl:
> > 5.9.1 has been released few days ago:
> > 
> > https://github.com/collectd/collectd/releases
> 
> Hi,
> 
> https://collectd.org/files/ only has 5.9.0.
> 
> 5.9.1 does not include any security patches, shall I wait for 5.9.1 to be 
> released on collectd.org or should we switch to the github helper? In 
> this case we need to autoreconf the package...

I'm not familiar with how upstream collectd publishes their packages
and I did not look into changes between 5.9.0 and 5.9.1 in detail.

At fli4l one developer was affected by build problems with 5.9.0 on
32bit targets, which were "solved" by introducing a snprintf wrapper,
see this PR: https://github.com/collectd/collectd/pull/3153

That was cherry picked from collectd master to their 5.9.x branch,
which got a tag in Git, I noticed when looking for a solution to that
specific build failure.

From a quick glance on changes between 5.9.0 and 5.9.1 now, I would
consider most of them build issues, and only some fixing other stuff.
I can not say if anything has security impact.

HTH & Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190805/f78c9597/attachment.asc>
