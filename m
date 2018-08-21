From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 19:36:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Add new package
In-Reply-To: <CAMw6YJ+FS=z0MQqWj3K-21QYR5m-20wE2RbfFHQnc1WdgrYwLA@mail.gmail.com>
References: <20180821142226.2309-1-vadim4j@gmail.com>
 <87r2irvljb.fsf@tkos.co.il> <20180821172913.1a7eb830@windsurf>
 <CAMw6YJ+FS=z0MQqWj3K-21QYR5m-20wE2RbfFHQnc1WdgrYwLA@mail.gmail.com>
Message-ID: <20180821193616.5634b4dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 18:51:00 +0300, Vadim Kochan wrote:

> I got the point, so it is not really useful to add gettext-tiny just as a
> package but integrate it
> as gettext alternative. So let me clarify - you expect to see this at least
> as series:
> 1) add package
> 2) integrate it as gettext alternative

Yes, exactly. And as Baruch suggested, it would be excellent if we
could also use host-gettext-tiny as an alternative to host-gettext.

This will raise a few questions:

 - There are a few packages that unconditionally need host-gettext. Is
   this really true ?

 - Some packages need host-gettext because of the AM_ICONV m4 macro
   provided by gettext.m4. Is gettext-tiny also providing the
   gettext-related m4 macros ?

Overall, I believe it's not an easy task and it may take some time, but
it is definitely worth the effort, and I'll be happy to support this
effort.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
