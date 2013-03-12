From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 00:32:33 +0100
Subject: [Buildroot] IOzone license questions
In-Reply-To: <CAKcgs2yfYVyZHbBVno+u4uLLkfNeL8iLqXmqgtF4+9xv12akgQ@mail.gmail.com>
References: <CAKcgs2yfYVyZHbBVno+u4uLLkfNeL8iLqXmqgtF4+9xv12akgQ@mail.gmail.com>
Message-ID: <513FBB11.8070900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 19:10, Gilles Talis wrote:
> Hi all,
>
> These questions are for the license experts out there.
> I would like to add IOzone as a new package to buildroot. Problem is
> that IOzone license is quite restrictive.
> Here's the main part:
>
> License to freely use and distribute this software is hereby granted
>    by the author, subject to the condition that this copyright notice
>    remains intact.  The author retains the exclusive right to publish
>    derivative works based on this work, including, but not limited to,
>    revised versions of this work.
>
>
> My questions are the following:
> - Is it OK to add this package to buildroot, despite its restrictive license?

  Yes. But it means that we are not allowed to add cross-compilation 
patches... So we'll probably have to add a bunch of 'depends on' conditions.

  I propose something like

IOZONE_LICENSE = IOZone license (NO DERIVED WORKS ALLOWED)

> - The text of the license is not provided with the source code, but is
> available on IOzone website.
> Should I point to the website link in the package makefile?
> e.g. IOZONE_LICENSE_FILES = http://www.iozone.org/docs/Iozone_License.txt
> Or should I leave it to the user to go and find it on his own?

  Unfortunately, URLs don't work for LICENSE_FILES. So just add a comment 
in the .mk file pointing to the URL.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
