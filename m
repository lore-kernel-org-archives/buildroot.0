From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 Aug 2018 10:42:01 +0200
Subject: [Buildroot] [PATCH v2,1/1] qt: fix build on powerpc_e500mc
In-Reply-To: <20180831100951.1f66c797@windsurf>
References: <20180830163146.4952-1-fontaine.fabrice@gmail.com>
 <20180831100951.1f66c797@windsurf>
Message-ID: <CAPi7W83HUM9wpHtP11N0UoS4-QPWPSWHjyArYRrnXyXSn8s=mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le ven. 31 ao?t 2018 ? 10:10, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fabrice,
>
> Thanks for this new iteration!
>
> On Thu, 30 Aug 2018 18:31:46 +0200, Fabrice Fontaine wrote:
> > gcc bug internal compiler error: in validate_condition_mode, at
> > config/rs6000/rs6000.c:180744. Bug is fixed since gcc 7.
> > Workaround is to set -mno-isel, see
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818 and
> > https://gcc.gnu.org/ml/gcc-patches/2016-02/msg01036.html
> >
> > This bug is also raised on BR2_powerpc_8540, BR2_powerpc_8548 and
> > BR2_powerpc_e5500.
>
> Just curious, how did you figure out that list of affected platforms ?
>
As mentioned in your last email, the link was giving this list:
Target: e500v2 (I was able to reproduce with e500mc, e5500 targets as well).

So I tested these additional architectures and I confirm that they're
affected by this bug.
I also checked e500v1 (8540) and it failed.
There was no issue with e6500 so I think the bug is only affecting e5xxx
but I haven't tested all the powerpc architectures.


> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180831/ae3ed4bc/attachment.html>
