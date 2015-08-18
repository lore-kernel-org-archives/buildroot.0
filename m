From: James Knight <james.knight@rockwellcollins.com>
Date: Tue, 18 Aug 2015 12:36:05 -0400
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <20150818160332.GX2765@tarshish>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
 <20150818114453.05e19fae@free-electrons.com>
 <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
 <20150818160332.GX2765@tarshish>
Message-ID: <CALe+oY9u6XjFDnOurT7ELboULh6C3OUh+CiHxSS8toMPMD5atw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Tue, Aug 18, 2015 at 12:03 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> An alternative solution would be to switch Buildroot to rpm 4.x (latest
> version is 4.12.0). The 4.x series seems to be more actively maintained than
> rpm5, and is the version of choice for most distros using rpm

Hmm... did not think of "downgrading". I guess if rpm4 was integrated
into Buildroot I would not have this issue (at this point in time).
After reading a bit of the upgrade-fork of rpm5, maybe it would be
better to provide an rpm4 and rpm5 package. This would allow a builder
to choose either the common variant over the "latest-greatest"
variant. I'd be worried to just transition from rpm5 down to rpm4 in
case any other developer would prefer using rpm5.

That being said, I'm wondering if its best to just drop the attempt to
support a host rpm build. If its rare capability that no one really
needs, I'll just apply it to my own variant and there will be less
maintenance for the official Buildroot source.
