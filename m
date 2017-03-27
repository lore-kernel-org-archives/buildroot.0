From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Mar 2017 17:16:10 +0200
Subject: [Buildroot] Issue performing switch_root to a UBIFS partition
In-Reply-To: <CAGm1_ksp-PGMVE69feTDgSMdZDsyzMuYCPkwc75UWy-PhWasvg@mail.gmail.com>
References: <CAGm1_kuAPosDi1Wc89_oKYr3J=t5py3nFL9F4bO3dZM+N54Ncw@mail.gmail.com>
 <efffdb66-2095-29cc-05ee-db25625c8371@mind.be>
 <CAGm1_ksp-PGMVE69feTDgSMdZDsyzMuYCPkwc75UWy-PhWasvg@mail.gmail.com>
Message-ID: <ad3b2e98-dd3b-66e6-afcd-741bbbdfde56@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-03-17 14:59, Yegor Yefremov wrote:
> getpid()                                = 915

 PID must be 1. Forgot to mention that in the script representation :-) Of
course, here it's due to the strace... To avoid, you could use "strace -fp 1 &"
but I'm not sure how that would behave across the exec.

> write(2, "BusyBox v1.26.2 (2017-03-24 16:3"..., 41BusyBox v1.26.2
> (2017-03-24 16:39:44 CET)) =
> write(2, " multi-call binary.\n", 20 multi-call binary.
> )   = 20
> write(2, "\nUsage: ", 8
> Usage: )                = 8

 Did this Usage: part also come out when running without strace? It's very weird
that the rest of the usage output is not appearing. Or perhaps that's because
you get a kernel panic immediately afterwards because PID 1 exits?

> can't open /dev/ttyO0: No such file or directory

 Still no explanation where this comes from...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
