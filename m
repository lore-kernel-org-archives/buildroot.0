From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 22:47:39 +0200
Subject: [Buildroot] [PATCH v2 2/3] support/scripts/pkg-stats: use
 aiohttp for upstream URL checking
In-Reply-To: <d35bc046-1cde-02a0-1c80-6b460c207b1f@railnova.eu>
References: <20200804195248.1238754-1-thomas.petazzoni@bootlin.com>
 <20200804195248.1238754-3-thomas.petazzoni@bootlin.com>
 <d35bc046-1cde-02a0-1c80-6b460c207b1f@railnova.eu>
Message-ID: <20200805224739.673a8b80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 5 Aug 2020 22:37:35 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> > -import requests  # URL checking
> > +import requests  # NVD database download  
> 
> Shouldn't we migrate the NVD downloads to aiohttp as well ? So we do not 
> need 2 different HTTP client libs.

Yes, we could, but I consider that a separate enhancement. We're not
using multiprocessing for the NVD database download, so it's less
urgent to convert the NVD database download.

(Of course: ACK for all your other comments.)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
