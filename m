From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 00:28:48 +0100
Subject: [Buildroot] [PATCH] uClibc: install libc.so even if
 BR2_PREFER_STATIC_LIB is enabled
In-Reply-To: <20121102231708.7d28d857@skate>
References: <50924B99.5080605@mind.be>
 <1351764953-24251-1-git-send-email-arnout@mind.be>
 <20121102231708.7d28d857@skate>
Message-ID: <5095A8B0.9070106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/12 23:17, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle (Essensium/Mind),
>
> On Thu,  1 Nov 2012 11:15:53 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> >  BR2_PREFER_STATIC_LIB_prefers_  static linking, but doesn't force it
>> >  for all packages.  So some binaries may still be built without
>> >  -static, and they will need libc.so on the target.
>> >
>> >  Therefore, put libc.so.0 in the target unconditionally.
>> >
>> >  Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>> >  ---
>> >  Untested!
> This is an exact revert of c95174a8dfb6f72b80768b73b8f04448f846c122. Do
> we really want to make circles and redo/undo our changes?:-)

  If they break things, yes.  The alternative is to disable all packages that
don't support static linking of executables if BR2_PREFER_STATIC_LIB is
selected.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
