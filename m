From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:00:45 +0100
Subject: [Buildroot] [PATCH valijson v2] valijson: new package
In-Reply-To: <CAHXCMMLLWARxc+urGRMRy1KrQEb4rH4MFuc+0fQUc6DsPONGPQ@mail.gmail.com>
References: <1457613052-3865-1-git-send-email-santosh.multhalli@rockwellcollins.com>
 <CAHXCMMLLWARxc+urGRMRy1KrQEb4rH4MFuc+0fQUc6DsPONGPQ@mail.gmail.com>
Message-ID: <20160310230045.5f1b0bfe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 21:53:32 +0100, Samuel Martin wrote:

> > diff --git a/package/valijson/Config.in b/package/valijson/Config.in
> > new file mode 100644
> > index 0000000..4adbe76
> > --- /dev/null
> > +++ b/package/valijson/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_VALIJSON
> > +       bool "valijson"
> > +        select BR2_PACKAGE_BOOST
> > +        select BR2_PACKAGE_BOOST_REGEX
> Indentation seems broken on these 2 lines.

And also, since boost is selected, the dependencies of boost must be
replicated here.

> 
> > +       help
> > +         Valijson is a header-only JSON Schema Validation library for
> > +         C++. Valijson provides a simple validation API that allows you
> > +         load JSON Schemas, and validate documents loaded by one of
> > +         several supported parser libraries like boost, jsoncpp,
> > +         rapidjson and picoJSON.
> > +
> > +         https://github.com/tristanpenman/valijson

And a comment be added here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
