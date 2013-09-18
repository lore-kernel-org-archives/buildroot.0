From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 00:48:39 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
 from the URL address
In-Reply-To: <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
Message-ID: <523A2DC7.7010202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/09/13 17:34, Thomas De Schampheleire wrote:
> Hi Jerzy,
>
> Op 18-sep.-2013 17:25 schreef "Jerzy Grzegorek"
> <jerzy.grzegorek at trzebnica.net <mailto:jerzy.grzegorek@trzebnica.net>>
> het volgende:
>  >
>  > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net
> <mailto:jerzy.grzegorek@trzebnica.net>>
>  > ---
>
> Could you clarify why this is desirable? Note that urls with our without
> trailing slash are not identical: the web server needs to properly
> support this. For example, the autobuild website does not properly do it
> (something very annoying ;) )
>
> So, with a change like this, every changed url needs to be tested.

  Well, with the trailing slash is stripped by pkg-generic.mk:

$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))

  So functionally it doesn't matter if the / is there or not.

  I'm pretty much in favour of removing the /.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
