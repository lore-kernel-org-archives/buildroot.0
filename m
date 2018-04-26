From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Thu, 26 Apr 2018 10:11:50 +0200
Subject: [Buildroot] [PATCH v3 1/1] reaver: fix build errors with static
 lib
In-Reply-To: <20180425223236.1cf3befe@windsurf>
References: <1524412319-6836-1-git-send-email-guillaume.bressaix@gmail.com>
 <20180425223236.1cf3befe@windsurf>
Message-ID: <CAJe0E3d8PtUfTTcs02aGC_zE4RnB=UKvpuYtJX7F_rn-uwLZnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-04-25 22:32 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Sun, 22 Apr 2018 17:51:59 +0200, Guillaume W. Bres wrote:
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>
> This commit log was way too short, and lacked a reference to the
> autobuilder failure being fixed. I've fixed that when applying.
>
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +REAVER_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static
> --additional-libs`"
> > +REAVER_CONF_OPTS += LDFLAGS="`$(STAGING_DIR)/usr/bin/pcap-config
> --static --additional-libs`"
>
> Other issues/improvements here:
>
>  - We generally pass such variables in <pkg>_CONF_ENV
>
>  - A single <pkg>_CONF_ENV assignment is enough
>
>  - LDFLAGS shouldn't be overridden entirely: $(TARGET_LDFLAGS) still
>    needs to be passed.
>
> I've fixed those different problems, and applied. See the final commit
> at:
>
>   https://git.buildroot.org/buildroot/commit/?id=
> 559416ffe2039d1cac94e348bd28e963adf008a4
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


Hello,

- LDFLAGS shouldn't be overridden entirely: $(TARGET_LDFLAGS) still  needs
> to be passed.


yes  you're right, I should have done it

  - We generally pass such variables in <pkg>_CONF_ENV


I did not know what would work, in the sense the configure command is

$CONF_ENV ./configure $CONF_OPTS

I thought these flags had to be passed after "./configure"

This commit log was way too short,


I agree & my first commits were confusing

and lacked a reference to the autobuilder failure being fixed. I've fixed
> that when applying.


honestly my first 2 versions included it, I "forgot" to add it to my last
submission


Guillaume W. Bres
Software engineer - Noise XT
10a Rue Blaise Pascal,
78990 Elancourt
<guillaume.bressaix@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180426/cdda2ec6/attachment.html>
