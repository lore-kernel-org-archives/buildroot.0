From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:26:02 +0100
Subject: [Buildroot] [PATCH] package/pkg-python: fixing wrong root an
 prefix
In-Reply-To: <20181124232139.14782-1-angelo@amarulasolutions.com>
References: <20181124232139.14782-1-angelo@amarulasolutions.com>
Message-ID: <20181125092602.05a43b3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Nov 2018 00:21:39 +0100, Angelo Compagnucci wrote:
> Some python software refers to setuptool/distutils options
> to install files in python root directory (like data_files option).
> To use this type of option, python root should point to the real python
> root in buildroot folder and not to the guest os /.
> Prefix path is always built starting from the python root, so it should
> be simply /usr.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/pkg-python.mk | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Even though this is really a fix, it's quite late to apply this to
master, so close to the release. So I erred on the same side, and
applied it to the next branch. If everything goes well, we can still
put it back on master before or after the release.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
