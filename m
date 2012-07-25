From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jul 2012 19:01:48 +0200
Subject: [Buildroot] [PATCH] tcl: replace option to install library only
 with positive option to install tclsh
In-Reply-To: <20120715233713.609720f8@skate>
References: <201202150046.57364.arnout@mind.be>
 <1329263337-14994-1-git-send-email-arnout@mind.be>
 <20120715233713.609720f8@skate>
Message-ID: <5010267C.4070605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/12 23:37, Thomas Petazzoni wrote:
> Le Wed, 15 Feb 2012 00:48:57 +0100,
> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>  a ?crit :
>
>> From: "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>
>>
>> Without this patch, it was impossible for a package that relies on
>> the tclsh interpreter to select it.  This patch replaces the
>> negative BR2_PACKAGE_TCL_SHLIB_ONLY config with the positive
>> BR2_PACKAGE_TCL_TCLSH config.
>>
>> Also a few minor fixes to the mk-file:
>>
>> - Stripping the library didn't work because it was installed read-only.
>>
>> - Create a symlink tclsh ->  tclsh8.4.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> Is this still needed?
>

  It's a prerequisite for the usb_modeswitch_data package by J.C. Woltz.

  Regards,
  Arnout
-- 

Arnout Vandecappelle             arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . +32-16-286540 . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 31BB CF53 8660 6F88 345D 54CC A836 5879 20D7 CF43
