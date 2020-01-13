From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jan 2020 11:46:18 +0100
Subject: [Buildroot] What do we want to do with Python2?
In-Reply-To: <f0badb1d-2bf7-fb3b-6564-65f1f8c6a4b0@railnova.eu>
References: <CALFsTFUYfPhOaJTei-sGrbNNY1WBP1TG55UyZywPys_3R3E=Kw@mail.gmail.com>
 <20200112210849.0e300c45@windsurf>
 <f0badb1d-2bf7-fb3b-6564-65f1f8c6a4b0@railnova.eu>
Message-ID: <20200113114618.6f2480e3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jan 2020 11:03:26 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> I did not had so much time to continue on the Py2 deprecation track 
> since the ELCE developer meeting, but I intend to continue at the next 
> one (FOSDEM).
> 
> In my opinion, we should strive for a Python3 only Buildroot for the 
> 2021.02 release, and use the year 2020 to either remove Py2-only 
> packages, or wait for an upstream update. I would like to prioritize the 
> packages that use Python at compile time, because that would allow us to 
> get rid of host-python2 first (maybe even for the 2020.05 ?).

Unfortunately, you can't get rid of host-python2 if you still have
python2 available as a target package, because building the target
Python interpreter requires having the matching host Python interpreter
available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
