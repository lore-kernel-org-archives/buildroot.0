From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Jun 2013 23:48:06 +0200
Subject: [Buildroot] [PATCH] sconeserver: fix autouild failure
In-Reply-To: <CAHt8ZCOT2bj=-5C6Y34ULOoqV-YN74-N+hV9gYdsDBB8h8W=-w@mail.gmail.com>
References: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
 <20130608174904.0559f1be@skate>
 <CAHt8ZCOT2bj=-5C6Y34ULOoqV-YN74-N+hV9gYdsDBB8h8W=-w@mail.gmail.com>
Message-ID: <51B8EC96.8030007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/13 20:40, Simon Dawson wrote:
> Hi Thomas,
>
> On 8 June 2013 16:49, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> There are still build failures related to sconeserver and MySQL. See
>> http://autobuild.buildroot.org/results/a16/a162fbd8977faa561a76f76072ec3335fb8e8d1f/build-end.log.
>
> I've been unable to reproduce this using the defconfig from the failed
> autobuild. I'm struggling to understand what exactly is causing the
> failures; would appreciate any suggestions that you may have...

  mysql.h is in $(STAGING_DIR)/usr/include/mysql, but that doesn't get 
included in the CXXFLAGS.

  Peter, can you reproduce the autobuilder error and extract the 
config.log and $(STAGING_DIR)/usr/bin/mysql_config?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
