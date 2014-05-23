From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 23 May 2014 09:56:08 +0300
Subject: [Buildroot] [PATCH] ruby: fix build with recent openssl versions
In-Reply-To: <537E41C3.8030904@zacarias.com.ar>
References: <1400594769-31393-1-git-send-email-fatih.asici@gmail.com>
 <20140522155243.5137c174@free-electrons.com>
 <537E41C3.8030904@zacarias.com.ar>
Message-ID: <201405230956.08531.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 22 May 2014 21:28:19 Gustavo Zacarias wrote:
> On 05/22/2014 10:52 AM, Thomas Petazzoni wrote:
> > Dear Fatih A??c?,
> > 
> > On Wed, 21 May 2014 08:22:52 +0300, Fatih A??c? wrote:
> >> OpenSSL version on my system (Debian Wheezy) is 1.0.1e-2+deb7u9. When
> > 
> >> building host-ruby it fails because of an undefined macro:
> > Then we should either:
> >  1) Build host-ruby without openssl support, if it's possible and not
> >  
> >     necessary.
> >  
> >  2) Make host-ruby depend on host-openssl, but that wouldn't be really
> >  
> >     nice.
> > 
> > No? I don't think we have OpenSSL development files as part of the
> > mandatory requirements to run Buildroot, so we shouldn't rely on them.
> > I believe option (1) above is possible, because my autobuilders don't
> > have the openssl development files installed IIRC, but we don't see any
> > ruby issue.
> 
> Patch sent to disable openssl for host-ruby (option 1) since there's
> really no need for it at the moment.
> Fatih can you give it a shot and report back?

Tested your patch. It fixes the issue.

Thanks,
Fatih
