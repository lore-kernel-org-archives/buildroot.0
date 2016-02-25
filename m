From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:34:34 +0100
Subject: [Buildroot] [PATCH v2 0/4] Add file capability/xattr support
In-Reply-To: <56CF7247.2060500@free-electrons.com>
References: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20160225215003.5886d69d@free-electrons.com>
 <56CF6B75.10604@free-electrons.com>
 <20160225221004.26bb337b@free-electrons.com>
 <56CF7247.2060500@free-electrons.com>
Message-ID: <20160225223434.78aa35b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Thu, 25 Feb 2016 18:29:43 -0300, Gustavo Zacarias wrote:

> > Can we imagine an extension to the makedevs syntax where you could give
> > some additional properties for a given file, as following lines, e.g:
> >
> > /usr/bin/foo f 755 0 0 - - - - -
> > |XATTR blabla extended attribute
> > |XATTR blabla extended attribute
> > |ACL blabla ACL
> >
> > Or something like this?
> 
> My only concern with extending the format to multi lines is that the 
> data file will likely be incompatible with previous versions of makedevs.

Indeed. But is this really a concern? makedevs is built by Buildroot,
so we are sure which version is being used, right?

> > Yes, if we make it part of makedevs, then having an option would be a
> > bit weird, but still reasonable since this stuff is pretty advanced, so
> > people who need that quite certainly know what they are doing.
> 
> I'd go for homogeneous syntax in makedevs if that's the chosen way, just 
> make it skip those ops when it's not enabled.

OK.

> > Right. This is IMO a good reason to make this optional. makedevs could
> > have an option to accept (or not) the extended properties, and then if
> > we have not enabled xattr/capability in Buildroot, this option is not
> > passed, which guarantees that makedevs will bail out if an extended
> > property is used.
> 
> Might be worth CCing rockwellcollins guys that are working in selinux, 
> they're definitely interested in this since selinux loves xattrs.

Seems like a good idea. Can you do that when you post your next
patches? Or maybe you can send a short summary of an initial proposal,
and Cc them?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
