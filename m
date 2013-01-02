From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Jan 2013 07:37:41 +0100
Subject: [Buildroot] inittab for different systems
In-Reply-To: <CAGm1_kucdX-CyXwmxN_A_pBO0qqX5+Z2gS=CrsiYsJ-f4XsxAQ@mail.gmail.com>
References: <CAGm1_kucdX-CyXwmxN_A_pBO0qqX5+Z2gS=CrsiYsJ-f4XsxAQ@mail.gmail.com>
Message-ID: <50E3D5B5.9020903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/21/12 16:36, Yegor Yefremov wrote:
> I have two systems that use DT and thus can share one uImage. I'd like
> to use one rootfs image for both. How do I configure console in
> inittab, so that it can deal with different systems (one has ttyO2 the
> other ttyO3 as console)?

  I think the simplest way is to have a custom inittab that opens a getty 
on both ttyO2 and ttyO3.

  I _think_ you can also use /dev/console (assuming console is set up in 
your DT) - but I guess strange things will happen if you have multiple 
consoles.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
