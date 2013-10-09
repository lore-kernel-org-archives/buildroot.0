From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 09:29:14 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAHt8ZCNVeoNRPxn0A7CX_NjEdQPh+f42P66=6xJWB-oMU+saHQ@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
 <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
 <524D9DE2.7090509@mind.be>
 <CAAXf6LUTTX0OFNaP4NxVWXKC4OFBROXK-PFiumL8zYrumkbtog@mail.gmail.com>
 <20131004110704.78f5b1a6@skate>
 <OFD293F65F.D1285988-ON86257BFA.00549871-86257BFA.0055339A@rockwellcollins.com>
 <20131004173452.4f93d1c3@skate>
 <CAHt8ZCPpVROvLJ8Fb1TrtwMTLKfBcdCBDwH0k4m-QNfisPnugg@mail.gmail.com>
 <5253392E.8060000@mind.be>
 <CAHt8ZCNVeoNRPxn0A7CX_NjEdQPh+f42P66=6xJWB-oMU+saHQ@mail.gmail.com>
Message-ID: <20131009092914.6d9ba36c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Wed, 9 Oct 2013 08:23:27 +0100, Simon Dawson wrote:

> >  Ideally, such an external license should be downloaded already with 'make
> > source'. Though that is perhaps stretching it a little...
> 
> This can now be achieved by using Thomas P's new <pkg>_EXTRA_DOWNLOADS
> mechanism to download the license file(s); I wonder if that would be
> an acceptable idiom in this situation...?

Potential problems:

 * <pkg>_EXTRA_DOWNLOADS downloads from the same <pkg>_SITE that is
   used to download <pkg>_SOURCE. So if your tarball and license files
   are not at the same location, it won't work. This could be fixed by
   having <pkg>_EXTRA_DOWNLOADS use a full path rather than relying on
   <pkg>_SITE.

 * <pkg>_EXTRA_DOWNLOADS = foo will download the file as "foo" in the
   download directory. However, I do expect many of the license files
   that you would download this way to have relatively similar names:
   COPYING, LICENSE, Copyright, or something like that. And therefore,
   if two different packages have <pkg>_EXTRA_DOWNLOADS =
   http://someplace/COPYING, the COPYING files would overwrite each
   other in the download directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
