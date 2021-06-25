From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Jun 2021 15:57:01 +0200
Subject: [Buildroot] [PATCH v6 1/5] package/bmap-tools: new package
In-Reply-To: <20210625125447.GH104638@scaer>
References: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
 <20210621210111.363433-2-thomas.petazzoni@bootlin.com>
 <20210625123514.GB104638@scaer> <20210625144509.5b5ea897@windsurf>
 <20210625125447.GH104638@scaer>
Message-ID: <20210625155701.54680d19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Jun 2021 14:54:47 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Ah, bmap-tool is really just about skipping holes. And it is assumed
> that the image has no hole where the data is relevant, even if only
> zeroes.

Absolutely. For example, if I build an image on my build server, and
run bmaptool create there, it finds the holes and is able to generate a
correct bmap file. If however, I first scp that image file locally, and
then run bmaptool create, it finds no holes because scp-ing the file
has replaced the holes with actual data.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
