From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Sep 2012 08:06:47 +0200
Subject: [Buildroot] [PATCH] jimsh: new package
In-Reply-To: <1346778052-31923-1-git-send-email-gustavo@zacarias.com.ar>
References: <1346778052-31923-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <50483D77.40902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/12 19:00, Gustavo Zacarias wrote:
> Add new jimsh package - a lightweight tclsh alternative.
> Useful for a lighter footprint usb_modeswitch installation.

  I guess a patch that installs usb_modeswitch's tcl script will follow
then?

  You'll probably want to add a hidden BR2_NEEDS_TCLSH which selects
JIMSH if TCL is not defined.  And/or a HAS_TCLSH that is selected by
jimsh and tcl.  Or should those symbols only be introduced when a
package actually selects or depends on them?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
