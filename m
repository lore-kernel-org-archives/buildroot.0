From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jun 2012 14:48:34 +0200
Subject: [Buildroot] Buildroot and top-level parallel make
In-Reply-To: <CA+wH296drhV6yie5+79Y38qLmo_5cE1=3qaOrw5jbyCJ5mEMog@mail.gmail.com>
References: <CA+wH296drhV6yie5+79Y38qLmo_5cE1=3qaOrw5jbyCJ5mEMog@mail.gmail.com>
Message-ID: <4FEEF5A2.7060506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/28/12 14:34, Alex Bradbury wrote:
> As I understand it, buildroot will allow parallelism while building
> individual packages yet does not support "top-level parallel make".
> i.e. it is not possible to build multiple packages in parallel. I
> found a reference to this problem at http://lwn.net/Articles/416916/
> and it was also listed as a WIP in the "cross build systems: present
> and future" slides from 2010.
>
> I was wondering what the outcome of experiments to allow top-level
> parallelism were? What are the major barriers to allowing this? Is it
> still something seen as feasible to add to buildroot, or is it looking
> like it would add too much complexity?

  AFAIK nobody is actually working on this.  Myself I have had a little
thought about it before, and the main problem seems that there are a few
targets in the top-level Makefile that depend on the left-to-right
evaluation order of dependencies.

  It would of course be difficult to verify that a top-level parallel make
works, but now we have the autobuild system it can be done...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
