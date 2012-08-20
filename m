From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 20 Aug 2012 15:01:22 +0100
Subject: [Buildroot] [PATCH v3] at91bootstrap3: new package
In-Reply-To: <20120817195807.344c1efc@skate>
References: <1345192583-5115-1-git-send-email-spdawson@gmail.com>
 <20120817180324.23f1e328@skate>
 <CAHt8ZCMsyiVSv0Mg5SVDZCiGXWmTCh9eTD-tQxeRsXRtXbBM9Q@mail.gmail.com>
 <20120817195807.344c1efc@skate>
Message-ID: <CAHt8ZCND-suW9vD-21MDM_2c75Dj03jWCdY7mqQr79-HJ-1aMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 August 2012 18:58, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> And will you get a chance to work on the remaining gpsd build problem
> (see autobuilder results) ? :-)

Hi Thomas. I have been thinking about this, but I don't really know
enough Python to properly understand what the problem is.

From what I've read, it may be that the gps/__init__.py module
initialisation file is to blame: if my understanding is correct, then
this file ought perhaps *not* to include the following lines.

from gps import *
from misc import *

Indeed, commenting out these lines, gpsd still builds correctly on my
machine (with local Python version 2.7).

Beyond this observation, I have made no further progress with fixing
the build problem.

Any thoughts or suggestions?

Simon.
