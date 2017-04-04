From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 4 Apr 2017 22:29:33 +0200
Subject: [Buildroot] [PATCH 1/2] mosquitto: bump to version 1.4.11
In-Reply-To: <20170404220136.53846968@free-electrons.com>
References: <1491334650-15708-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170404220136.53846968@free-electrons.com>
Message-ID: <CAPi7W82izo61-GAHts23q4x+ZHQoPgZTC9=XRbrQpVha21Zvyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2017-04-04 22:01 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Tue,  4 Apr 2017 21:37:29 +0200, Fabrice Fontaine wrote:
> >  - This version requires a patch (sent upstream) to remove -lanl from
> > all Linux builds as this library is only needed for adns support
>
> And so how does it work when adns support is enabled, by your PATCH
> 2/2 ?
>
When WITH_ADNS is set, the following lines of config.mk will add -lanl
ifeq ($(WITH_ADNS),yes)
    BROKER_LIBS:=$(BROKER_LIBS) -lanl
    BROKER_CFLAGS:=$(BROKER_CFLAGS) -DWITH_ADNS
endif

The issue in the current config.mk was the following lines (removed by my
patch):
ifeq ($(UNAME),Linux)
    BROKER_LIBS:=$(BROKER_LIBS) -lanl
endif

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170404/12478c83/attachment.html>
