From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Oct 2012 07:39:52 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <20121014193849.019347dd@skate>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <20121014160547.09c493d7@skate> <201210141631.29399.yann.morin.1998@free.fr>
 <20121014193849.019347dd@skate>
Message-ID: <507CF328.5090505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/12 19:38, Thomas Petazzoni wrote:
> In other words: we can assume the user knows about big subsystems
> (X.org, Python, Perl, etc.), but we don't want him to know the fine
> details of the dependencies on sub-options.

  Someone (I don't remember who) proposed to stop doing that, because it adds
little value.  Indeed, it's not as if 9 extra entries in the Scripting
Languages menu will suddenly make it more difficult to navigate.  Maybe X.org
is an exception, but even there most packages are collected in the x11r7 menus
(and those could still be kept in a conditional).

  Originally I was in favour of having the BR2_PACKAGE_PYTHON conditionals,
but it _would_ probably make life simpler if we only had dependencies on
toolchain options...

  Yann, what do you think, would it make suboption handling simpler if there
was no 'depends on BR2_PACKAGE_PYTHON'?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
