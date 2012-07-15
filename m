From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 12:33:09 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <20120715010542.1a23ba0f@skate>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
 <20120713165557.1b39651c@skate>
 <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
 <20120714182555.4b7b267d@jl-desk-LL>
 <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
 <20120715010542.1a23ba0f@skate>
Message-ID: <50029C65.9010004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/12 01:05, Thomas Petazzoni wrote:
> Le Sat, 14 Jul 2012 15:00:18 -0700,
> Charles Krinke<charles.krinke@gmail.com>  a ?crit :
>
>> You were right as usual. It was an environment variable. It was
>> QMAKESPEC which was set by my installation of the TI SDK a week ago. I
>> should have checked my  .bashrc after installing the SDK, but I did
>> not expect any environment changes as a result of installing a
>> toolchain and u-boot source.
>
> Then we should probably unset this environment variable in the main
> Makefile. It seems like a lot of environment variables are causing
> various issues in the build. Is there any way to simply unset all
> environments variables, except the few we are actually interested in?

  Not really I'm afraid...

  We could define MAKE as env -i $(MAKE), but there are some environment
variables that are passed to sub-makes that you loose this way.  Maybe
better is to define SHELL as env -i sh, but that could have huge side
effects...


  But maybe we shouldn't exaggerate here.  Putting a QMAKESPEC in your
environment would make any qt build fail, so it's not really a
buildroot problem.  Maybe a better idea is to put in the documentation
that the safe way is to use 'env -i make' to start a build...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
