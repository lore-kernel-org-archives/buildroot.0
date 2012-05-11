From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 May 2012 21:42:21 +0200
Subject: [Buildroot] [PATCH 2/2] sam-ba: only propose it if the host is
 x86 or x86_64
In-Reply-To: <20120507155726.GC10138@game.jcrosoft.org>
References: <1334675140-20303-1-git-send-email-plagnioj@jcrosoft.com>
 <1334675140-20303-2-git-send-email-plagnioj@jcrosoft.com>
 <20120423065000.GL20601@game.jcrosoft.org>
 <20120427101956.GA2992@game.jcrosoft.org>
 <20120504050148.GD20123@game.jcrosoft.org>
 <20120507134551.GB10138@game.jcrosoft.org>
 <87d36gcb5y.fsf@macbook.be.48ers.dk>
 <20120507155726.GC10138@game.jcrosoft.org>
Message-ID: <4FAD6B9D.9080604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/12 17:57, Jean-Christophe PLAGNIOL-VILLARD wrote:
>> >    Jean-Christophe>  did I need to understand that noe one care of non x86 host?
>> >
>> >  To me it is more of a question of tradeoffs. Either we do it really
>> >  right and use this kind of infrastructure for the external toolchains as
>> >  well (where it really matters), or we decide the extra complexity isn't
>> >  worth it for the few non-x86 users.
>> >
>> >  I haven't made up my mind about this yet, but am leaning towards the
>> >  2nd.
> as a non x86 user I really care
>
> and as the ARM A15 will come soon on the market for serer as example it will
> be more and more problematic for binary package

  ... except that it's not really problematic.  The only problem is that you can
configure buildroot to download something that won't actually run on your
system.  This problem is a lot worse for external toolchains than for sam-ba.

  That said, the patch is really simple and doesn't create a maintenance burden.
Having it in paves the way for disallowing other downloaded host binaries, and
for downloading host binaries for the correct platform.  Therefore:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Jean-Christophe, maybe it's worthwhile to resend and perhaps add
a patch for external toolchains as well?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
