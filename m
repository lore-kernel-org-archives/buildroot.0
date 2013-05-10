From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 May 2013 23:52:58 +0200
Subject: [Buildroot] Bizarre things on the allyespackageconfig build
In-Reply-To: <20130510175133.13d3fc6f@skate>
References: <20130510175133.13d3fc6f@skate>
Message-ID: <518D6C3A.1090400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/05/13 17:51, Thomas Petazzoni wrote:
>   * qt installs its demos and examples in usr/share/qt/{demos,examples},
>     but it installs both the source code and binaries. It would probably
>     make sense to get rid of the source code of the examples.

  Since the demos/examples are typically not installed in a production 
system but just during development or to showcase things, I don't think 
it is worth the effort to hack the makefiles or to do explicit 
post-processing to remove the source code. If the user wants it, it can 
still be done in a post-build script.

  Same goes for qt5, edje, etc.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
