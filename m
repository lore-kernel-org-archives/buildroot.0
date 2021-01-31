From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 13:55:57 +0100
Subject: [Buildroot] [PATCH 07/10] support/scripts/pkg-stats: check CPE
 existence in CPE dictionnary
In-Reply-To: <CANQCQpb1HyQ=LmJNm5J2jAmNJuJuKE+_RteKAMucQMAanb-MUg@mail.gmail.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
 <20210107133948.2997849-8-thomas.petazzoni@bootlin.com>
 <CANQCQpb1HyQ=LmJNm5J2jAmNJuJuKE+_RteKAMucQMAanb-MUg@mail.gmail.com>
Message-ID: <20210131135557.3d2102c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 7 Jan 2021 13:37:59 -0600
Matthew Weber via buildroot <buildroot@busybox.net> wrote:

> > +def check_package_cpes(nvd_path, packages):
> > +    cpedb = CPEDB(nvd_path)
> > +    cpedb.get_xml_dict()
> > +    for p in packages:
> > +        if not p.cpeid:
> > +            continue
> > +        if cpedb.find(p.cpeid):
> > +            p.status['cpe'] = ("ok", "verified CPE identifier")
> > +        else:
> > +            p.status['cpe'] = ("error", "CPE identifier unknown in CPE database")  
> 
> I noticed in the pkgstats output that busybox which has an exact match
> was coming up as the following.
> 
> cpe:2.3:a:busybox:busybox:1.32.0:*:*:*:*:*:*:*
> CPE identifier unknown in CPE database

As discussed on IRC, I think this was due to the .pkl being empty to
due XML parsing issue with an older Python version. Gr?gory has worked
on this, and solved the problem. This will be in the v2 of the patch
series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
