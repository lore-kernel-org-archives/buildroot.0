From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 May 2013 08:19:25 +0200
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <20130520192543.3b61d666@skate>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <20130520165204.0269d05a@skate>
 <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
 <20130520192543.3b61d666@skate>
Message-ID: <519C636D.9010805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/05/13 19:25, Thomas Petazzoni wrote:
>> >Also, regarding the static library, the output of the package is always a
>> >shared object since it needs to be loaded dynamically by Lua scripts. The
>> >default target of the package is a test so I need to specifically specify
>> >the target.
> Ok. Then maybe your package needs to depend on !BR2_PREFER_STATIC_LIB.
> Or maybe more of the Lua stuff, if it requires shared libraries.

  We currently probably have many packages that generate .so files even 
if PREFER_STATIC_LIB is true - that's why it is "prefer", right?

  That said, I'm certainly in favour of making the STATIC stuff more strict.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
