From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 11:34:28 +0200
Subject: [Buildroot] [PATCH] audiofile: does not build with static-only
In-Reply-To: <5381278F.9040209@zacarias.com.ar>
References: <1400941494-29900-1-git-send-email-luca@lucaceresoli.net>
 <20140524184541.47d3f8f9@free-electrons.com>
 <5381278F.9040209@zacarias.com.ar>
Message-ID: <20140526113428.0d1e94a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 24 May 2014 20:13:19 -0300, Gustavo Zacarias wrote:

> As we discussed with Thomas on IRC i've been digging and testing a bit
> and promised to write about my assorted notes for the static dilemma:
> 
> 1) --static isn't the documented way to do it, not for libtool, ld or
> gcc. Just reverting it makes audiofile happy (patch done).
> 
> 2) --static (or the correct -static IMHO) is just added to LDFLAGS, that
> won't help generic packages that link directly so it should live in
> CFLAGS/CXXFLAGS as well (patch done).

--static or -static ?

> 3) BR2_PREFER_STATIC_LIB should be renamed and it's description changed
> accordingly, we don't prefer, we want.
> There's no configuration granularity possible to say "A, B, C dyn and D
> static" and we really don't want to walk that path (Thomas mentioned he
> has something done about this already).

Yes. But it needs some testing. I'll post this for 2014.08.

> 7) toolchain-external seems to be copying .so files to staging and
> causing confusion for a mpd w/audiofile project: /usr/bin/mpd results in
> a static binary, however some accesory binaries are not (example: gdbus,
> gettext, others).

Hum, ok, I think I should have a look at this one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
