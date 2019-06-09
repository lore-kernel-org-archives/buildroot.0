From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 10 Jun 2019 00:34:56 +0200
Subject: [Buildroot] [PATCH 4/4] package/iputils: fix build without
 setcap
In-Reply-To: <CAPi7W80ms+GTYwC9Q6usykCFxWjA7+1FSy2-KR3qW16RFdEBPA@mail.gmail.com>
References: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
 <20190609093814.14169-4-fontaine.fabrice@gmail.com>
 <dd4f00c5-f8ae-1758-48e4-bab512adb2a2@mind.be>
 <20190609214531.GA17515@x230>
 <CAPi7W80ms+GTYwC9Q6usykCFxWjA7+1FSy2-KR3qW16RFdEBPA@mail.gmail.com>
Message-ID: <20190609223456.GA26152@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

...
> > >  So, three questions:
> > > 1. Shouldn't we do the same with an IPUTILS_PERMISSIONS setting?
> > I removed IPUTILS_PERMISSIONS in 9ffcd9279e ("package/iputils: bump to version s20190515"),
> > but it looks like it's better to use it (thus we don't depend on /sbin/setcap).

> > > 2. Does this interact in any way with USE_CAP?
> > No.
Sorry, yes, in a sense that if setcap binary is on host and USE_CAP defined
than setcap-setuid.sh script would set cap_net_raw+ep.

> > > > + if get_option('NO_SETCAP_OR_SUID')

> > > 3. Shouldn't we set this option, since we probably don't want to use
> > > /sbin/setcap, ever?
> > IMHO yes.
> Thanks for your help in answering those questions.
> Could you send the patch setting back IPUTILS_PERMISSIONS and using
> NO_SETCAP_OR_SUID?
> From my understanding, permissions should be set to ping and
> traceroute6 as done before the dump but also to clockdiff and arping.
Thanks, good point. Yes, it's in meson.build, socket permission requires that.

Kind regards,
Petr
