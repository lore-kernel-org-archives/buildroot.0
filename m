From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 22:04:11 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/ninja: invoke python3
 explicitly to configure the package
In-Reply-To: <20191111213154.19409-1-avraham.shukron@gmail.com>
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
Message-ID: <20191112220411.2f96ef5c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Nov 2019 23:31:45 +0200
Avi Shukron <avraham.shukron@gmail.com> wrote:

> ninja depends on python3 specifically, but the configure.py file
> simply uses "env python". Where no python is selected for the target
> you simply won't get a python symlink in $(HOST_DIR)/usr/bin, so the
> configure.py script fails to run since it can't find "python".
> 
> Notice that in order to reproduce the issue, you must not have
> python2 installed on your host machine.
> 
> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
> ---
>  package/ninja/ninja.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
