From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 12 Apr 2020 20:31:57 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-04-07
In-Reply-To: <CANQCQpaNbCvEsGiNF4OSvJ=TTFcU80Mu-taNWwnXMYdL3m3a3A@mail.gmail.com>
References: <20200408062758.36846203D2@silver.osuosl.org>
 <ar56mgx44j.ln2@ID-313208.user.individual.net>
 <CANQCQpaNbCvEsGiNF4OSvJ=TTFcU80Mu-taNWwnXMYdL3m3a3A@mail.gmail.com>
Message-ID: <CANQCQpZ2OquL89n6MYr6URSJnMuihTRMOohG24h9kLBw8r9D=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brend,

On Sat, Apr 11, 2020 at 3:19 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Bernd,
>
> On Fri, Apr 10, 2020 at 7:41 AM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> >
> > Am Wed, 08 Apr 2020 06:27:51 +0000 schrieb Thomas Petazzoni:
> >
> > >     arm      |          bcg729-1.0.4          | NOK |
> > >     http://autobuild.buildroot.net/results/
> > 71914706e3d96d6366e89c4528693bae2ab32d06
> >
>
> I'll take a look, looks like it was on my 18.04 builder

I did a test build on Ubuntu 16.04 and 18.04. I only observed the
configure stage error of "arm-linux-gcc.br_real: error: unrecognized
command line option ?-rdynamic?" on 18.04.   I've traced it so far to
the fact that on my older ubuntu 16.04 it requires buildroot to build
a host cmake 3.15 vs on 18.04 the cmake is 3.10 (from apt).

The last notable rdynamic change I found so far was related to export
assumption of rdynamic around version 3.3 so that can't be it.

Regards,
Matt
