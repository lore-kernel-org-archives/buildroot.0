From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Sat, 21 Apr 2018 10:28:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] reaver: add missing dependency on
 non static lib.
In-Reply-To: <20180420205635.4dc1958d@windsurf.numericable.fr>
References: <1524248835-4552-1-git-send-email-guillaume.bressaix@gmail.com>
 <20180420205635.4dc1958d@windsurf.numericable.fr>
Message-ID: <CAJe0E3dFPMersauTKG+PTBT38ji=8t3Usq064ULMzQxKEHt=aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-04-20 20:56 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Fri, 20 Apr 2018 20:27:15 +0200, Guillaume W. Bres wrote:
>
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +REAVER_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static
> --additional-libs`"
> > +REAVER_CONF_OPTS += LDFLAGS="`$(STAGING_DIR)/usr/bin/pcap-config
> --static --additional-libs`"
> > +endif
>
> Are you sure you need both LIBS and LDFLAGS ?
>
>
yes I confirm this configuration does not build without these two lines.
"LIBS+=" caused "./configure" to pass, but then "make" failed with missing
reference to -ldbus-1.
"LDFLAGS+=" caused "make" to pass. LDFLAGS on its own does not solve the
"./configure" issue
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180421/7f4bbc88/attachment.html>
