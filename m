From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Tue, 02 Apr 2013 23:56:28 +0200
Subject: [Buildroot] [PATCH 1/4] directfb: bumping version to 1.6.3
In-Reply-To: <20130321201352.6b9455c2@skate>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
 <20130310113224.4e3dbb2a@skate> <513C7DF2.9090005@googlemail.com>
 <5145CC2D.5020103@googlemail.com> <514AAF05.80104@mind.be>
 <514B4C15.7080702@googlemail.com> <20130321201352.6b9455c2@skate>
Message-ID: <515B540C.6070905@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Hello Arnout,

Am 21.03.2013 20:13, schrieb Thomas Petazzoni:
> No, I think Arnout means that we should leave as few options
> "automatically" detected as possible.
> 
> For example, we really like to have:
> 
> ifeq ($(BR2_PACKAGE_FOO_FEATURE_BAR),y)
> FOO_CONF_OPT += --enable-bar
> else
> FOO_CONF_OPT += --disable-bar
> endif
> 
> and for all options that are not explicitly --enable-<bleh> somewhere,
> have a global:
> 
> FOO_CONF_OPT += \
> 	--disable-<bleh> \
> 	--disable-<blah>
> 
> this avoids the configure script from automatically detecting things on
> the host machine that we don't want it to detect.

some little status info on that.
The last days I worked on the "new" Config.in and the directfb.mk
Makefile with your suggestions. Until now I would say the most options
are implemented and I can also build the most of them.
But I found some issues inside the directfb archive (missing headers :)
and some code errors). I found one patch to fix the code errors and cook
one other to fix a configure problem, but the missing headers are just
to fix if the package would switch to a git checkout.

I wrote up to upstream to fix the header and the code error. I will wait
for response and in the between time I will more clean up my current
work. Some of the new options have new dependencies like libsvg-cairo,
linotyp, mng or jasper for jpeg2000. The libsvg-cairo package I will try
to implement if I find some free time for it, the other dependencies
have to find some other person. ;)

Regards
Carsten
