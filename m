From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Thu, 10 Jan 2013 20:27:03 +0100
Subject: [Buildroot] [PATCH] dvbsnoop: new package dvbsnoop
In-Reply-To: <20130109210728.6a51c9c9@skate>
References: <201301091834.38893.yann.morin.1998@free.fr>
 <1357757772-10661-1-git-send-email-c.schoenert@gmail.com>
 <1357757772-10661-2-git-send-email-c.schoenert@gmail.com>
 <20130109210728.6a51c9c9@skate>
Message-ID: <50EF1607.5010806@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 09.01.2013 21:07, schrieb Thomas Petazzoni:
>> +	  DVB analyzer / MPEG analyzer program to monitor, analyze, debug,
>> +	  dump or view dvb/mpeg/dsm-cc/mhp stream information (TS, PES,
>> +	  SECTION) (e.g. digital television) send via satellite, cable or
>> +	  terrestrial.
> 
> Could you include a bit more details here? You have a lot of nice
> details in your commit log, what about copy/pasting them here?

I don't know what you exactly mean. Do you want more details in the
commit message or more explanation here on the mailing list?

I thought while everybody can read the commit message I don't have to
explain it twice. :-/
And the webpage of dvbsnoop is written very well and the author can
explain it's work better than me (I think).

So what is dvbsnoop?
Dvbsnoop is just a simple tool to analyze, view or debug a transport
stream (TS), program elementary stream (PES) or even a program stream
(PS). This input comes mostly direct from a frontend (satellite or cable
tuner inside a set-top box for example) via DVB APIv3 to view into a TS,
a demux to view PES or PS (also mostly inside the set-top box or even
PCI Card) or even from a file (recorded TS).
The device files are differ from hardware to hardware this can be given
as parameter to dvbsnoop.

Dvbsnoop itself doesn?t do the tuning on the frontend, this has to be
done by external helpers or manually driver call. It just takes the data
from it an do the parsing.

The dvbsnoop tool was written while developing the software Neutrino on
the set-top box DBox2 [1]. It was useful to see if the GUI Neutrino was
working correct with the digital data from the frontend or from a NFS Share.
In the last time Rainer Scherg doesn't has worked on dvbsnoop because
it's doing what it should. Some parts are re workable, the complete
latest standards for integrating the MPEG4 standards (DVB-[S,C,T]*2*)
are just "it works". Some flags for this dvbsnoop don?t know right now.

> Should be _LICENSE_FILES even if there is only one file.

O.K. Will rework this.

[1] http://en.wikipedia.org/wiki/DBox2

Regards
Carsten
