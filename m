From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 18:27:30 +0200
Subject: [Buildroot] [PATCH 1/1] openlayers: do not rely on install -D -t
In-Reply-To: <20191024100559.23415-1-thomas.claveirole@green-communications.fr>
References: <20191024100559.23415-1-thomas.claveirole@green-communications.fr>
Message-ID: <20191025182730.4ae6ccda@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 12:05:58 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> The Buildroot autobuild's install binary seems to incorrectly handle
> install -D -t ...  Thus, use mkdir and avoid install -t.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

You forgot to put a reference to the autobuilder failure, so I've added
that. Also, implementation wise, our typical way of doing installation
is:

	$(INSTALL) -D -m XYZ $(@D)/file $(TARGET_DIR)/destination/path/to/file

so I changed to use that kind of standard best practice.

Finally, last minor detail: the commit title prefix should have been
"package/openlayers", not just "openlayers".

I fixed up those details, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
