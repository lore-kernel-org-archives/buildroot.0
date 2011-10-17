From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2011 12:50:59 +0200
Subject: [Buildroot] buildroot noob help!
In-Reply-To: <CAFo83mEQUkMazfnZLAu=UPn+xgyjY-g4qkYMTmqZDr0JC99vKQ@mail.gmail.com>
References: <CAFo83mG5Gx+LoZHP3j8-avDGXoKiHQxKLUcAM2y4rc8Ok1M_rg@mail.gmail.com>
 <201110151606.35102.minimod@morethan.org>
 <CAFo83mEQUkMazfnZLAu=UPn+xgyjY-g4qkYMTmqZDr0JC99vKQ@mail.gmail.com>
Message-ID: <201110171251.00254.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Saturday 15 October 2011 23:59:07, Jed Evnull wrote:
> Sorry, I was probably incoherent. My goal is to produce arm binaries for my
> tablet. I want them as small as possible, so I want statically linked
> packages with uclibc, rather than glibc.

 If you want them as small as possible, you should _not_ link them statically...

 However, I guess the real problem is that you don't have access to the cross-compilation shared libraries and headers for your tablet.  In that case linking statically is indeed a good solution.  Follow Grant's suggestion to use crosstool-NG.  Keep in mind though that for quite a few existing packages, linking statically doesn't work well (GStreamer and it's dependents, for instance).


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
