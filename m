From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 00:01:35 +0200
Subject: [Buildroot] [PATCH 4/4] package/iputils: fix build without
 setcap
In-Reply-To: <20190609214531.GA17515@x230>
References: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
 <20190609093814.14169-4-fontaine.fabrice@gmail.com>
 <dd4f00c5-f8ae-1758-48e4-bab512adb2a2@mind.be>
 <20190609214531.GA17515@x230>
Message-ID: <CAPi7W80ms+GTYwC9Q6usykCFxWjA7+1FSy2-KR3qW16RFdEBPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr,

Le dim. 9 juin 2019 ? 23:45, Petr Vorel <petr.vorel@gmail.com> a ?crit :
>
> Hi,
>
> > On 09/06/2019 11:38, Fabrice Fontaine wrote:
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/711718ecf20d6cc28953e089a6e5516cfb4b9031
>
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> >  All four applied to master, thanks.
>
> >  I have a question about this one though...
>
> ...
> > > ++++ b/meson.build
> > > +@@ -221,10 +221,13 @@ config_h = configure_file(
> > > + setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
>
> >  Clearly, the setcap from the host is not relevant for us...
>
> >  I haven't checked, but I assume this would be used to give the executables the
> > appropriate capabilities for non-root usage at installation time.
>
> >  So, three questions:
>
> > 1. Shouldn't we do the same with an IPUTILS_PERMISSIONS setting?
> I removed IPUTILS_PERMISSIONS in 9ffcd9279e ("package/iputils: bump to version s20190515"),
> but it looks like it's better to use it (thus we don't depend on /sbin/setcap).
>
> > 2. Does this interact in any way with USE_CAP?
> No.
>
> > > + if get_option('NO_SETCAP_OR_SUID')
>
> > 3. Shouldn't we set this option, since we probably don't want to use
> > /sbin/setcap, ever?
> IMHO yes.
Thanks for your help in answering those questions.
Could you send the patch setting back IPUTILS_PERMISSIONS and using
NO_SETCAP_OR_SUID?
From my understanding, permissions should be set to ping and
traceroute6 as done before the dump but also to clockdiff and arping.
>
> >  Regards,
> >  Arnout
>
> Kind regards,
> Petr
Best Regards,

Fabrice
