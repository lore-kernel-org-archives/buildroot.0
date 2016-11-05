From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 11:29:28 +0100
Subject: [Buildroot] [PATCH 6/8] python-libxml2: new host package
In-Reply-To: <cc97f194-ec81-9b44-fe2f-a1467873a279@mind.be>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
 <1476321239-13894-6-git-send-email-gustavo@zacarias.com.ar>
 <20161028153255.5c0e15d3@free-electrons.com>
 <b36b76d3-1267-b583-1ec5-8884a68f8eac@zacarias.com.ar>
 <cc97f194-ec81-9b44-fe2f-a1467873a279@mind.be>
Message-ID: <20161105112928.73a588b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 Nov 2016 00:47:04 +0100, Arnout Vandecappelle wrote:

> >>  * The libxml2 package gains a sub-option
> >>    BR2_PACKAGE_HOST_LIBXML2_PYTHON, which allows to enable python
> >>    support. Of course, later we could add BR2_PACKAGE_HOST_LIBXML2 as
> >>    well, and fix the packages that depend on host-libxml2, but it can
> >>    be done later.  
> > 
> > We currently have no BR2_PACKAGE_HOST_LIBXML2 option so we should add that and
> > make host-libxml2 depend on host-python when the python option is enabled, and
> > make packages select host-libxml2 as well (+ python for host-itstool).
> > It's basically a half-way to achieving the first point, even though quick i'm
> > not a big fan.  
> 
>  I'm also no big fan. Especially because the first one is where we want to go
> eventually, so this would really just be a stop-gap measure.

Well, between option (1) and (2) that I proposed, it's the same debate
between "implicit dependencies" and "explicit dependencies", which we
already have for target packages:

 - Option 1 is: the host-libxml2 package automatically enables its
   Python binding if host-python is enabled.

 - Option 2 is: the host-libxml2 has a sub-option that allows to
   explicitly enable/disable its Python binding

Just like we have a mix of (1) and (2) for target packages depending on
the situation, I guess we might have a similar mix for host packages,
no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
