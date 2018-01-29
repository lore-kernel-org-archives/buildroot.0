From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:19:08 +0100
Subject: [Buildroot] [RFC] scanpypi: handle packages with wrong metadata
In-Reply-To: <1516973570-7732-1-git-send-email-yegorslists@googlemail.com>
References: <1516973570-7732-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20180129231908.4bf07275@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Jan 2018 14:32:50 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Some packages like python-adafruit-ads1x15 have different values in
> PyPI metadata and setup.py or tar file name.
> 
> Use package name (self.pkg_name) derived from tar file name instead
> of metadata_name taken from JSON.
> 
> Also output the missing key when trying to setup arguments.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Do we really want to do this? Shouldn't we instead ask the upstream
maintainers to fix their Python package? I have the feeling that this
is a slippery road, and we could start adding lots and lots of weird
logic to support packages with wrong metadata.

If it's only fixing one specific package, I'd say the script should
instead detect the inconsistency, and bail out.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
