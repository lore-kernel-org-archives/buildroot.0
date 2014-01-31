From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 31 Jan 2014 11:13:50 +0100
Subject: [Buildroot] [PATCH v3 1/6] Makefile: introduce BR2_PATH
In-Reply-To: <20140131092519.787a1f4d@skate>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
 <1391114333-28001-2-git-send-email-s.martin49@gmail.com>
 <20140131092519.787a1f4d@skate>
Message-ID: <CAHXCMM+3k3erS-PRoCp8F=u4rajU5xS9Hcgtkvc9g=Uw1s1xkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, all,

On Fri, Jan 31, 2014 at 9:25 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Samuel Martin,
>
> On Thu, 30 Jan 2014 21:38:48 +0100, Samuel Martin wrote:
> > Since the HOST_PATH and TARGET_PATH variables almost contain the same
> > things, let's factorize this in a single BR2_PATH.
>
> I am wondering about the name BR2_PATH. Normally, BR2_<something> is
> used for variables coming from Kconfig options.

Yup, I also had some concerns about its name, I naively thought this would
have been raised earlier... ;-)

Introducing the
> BR2_PATH variable, which doesn't come from a Kconfig option seems to
> violate this unwritten rule.
>

> That being said, we can't call the variable just PATH, so I'm not sure
> which name we should choose. BR_PATH ? BUILDROOT_PATH ? PKG_PATH ?
>
Well, it's a kind of mess (no offense)!
- BR_ prefix seems being used mostly for internal toolchain (wrapper) stuff;
- BR2_ prefix: widely used in all Config.in;
- BUILDROOT_ prefix: for things that can be set from the environment;
- PKG_ prefix: in my mind it's to close to what we can set for pkg-config -
I don't really like this one.

Maybe it's time to write down the rules for the prefixes?

Anyway, I'll wait to get more inputs before repost the series.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140131/a6e25b5b/attachment.html>
