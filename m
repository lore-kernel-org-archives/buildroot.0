From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Oct 2014 07:45:07 -0300
Subject: [Buildroot] [PATCH 1/2] automake: update gtk-doc.m4 to serial 2
In-Reply-To: <20141010124101.0388b2b3@free-electrons.com>
References: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
 <20141010124101.0388b2b3@free-electrons.com>
Message-ID: <5437B8B3.7070105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/2014 07:41 AM, Thomas Petazzoni wrote:

> I'm not sure exactly, but shouldn't depending on host-pkgconf be the
> responsibility of each individual package that uses the gtk-doc.m4
> stuff?
> 
> Even though I agree pkgconf is fairly quick to build, I find it odd to
> have host-automake depend on host-pkgconf if it's only a very limited
> number of packages that actually use the gtk-doc.m4 stuff that need the
> host-pkgconf dependency.

The problem is it wasn't the case for gtk-doc.m4 serial 1, the check and
need for pkgconfig is done after gtk-doc is enabled, but for serial 2
some of the checks are done before that.
So we'd need to find all packages that use gtk-doc.m4 and add it there
(well, for those that autoreconf, but that would be sloppy since an
added autoreconf would trigger the need).
As stated i prefer to keep it simple without patching gtk-doc.m4 for
when serial 3 comes around.
Regards.
