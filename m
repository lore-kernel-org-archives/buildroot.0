From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Jul 2012 22:56:46 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
Message-ID: <5001DD0E.5010909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/13/12 15:51, Charles Krinke wrote:
> I downloaded buildroot-2011.05 and ran several tests, each with "make
> clean&&  make" and each with C++ support checked, both with powerpc
> and arm and the results are the same, so either my understanding of
> what to click in xconfig is faulty (probable) or there is an issue in
> the Qt package scripts. In both cases, I can compile successfully
> without Qt checked and in both cases, I get into problems with Qt
> checked. I would have expected one of powerpc or arm to successfully
> compile and wonder if a suggestion could be made.
>
> You have asked to use pkg-config and are cross-compiling.
> Please make sure you have a correctly set-up pkg-config
> environment!

  Take a look at output/build/qt-4.8.2/qmake/Makefile.  Near the top you
should find
CXX = @g++
but you probably have 'CXX = @' instead.

  The question is where this comes from.  Can you check your environment if
CXX is defined?  'env | grep CXX'

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
