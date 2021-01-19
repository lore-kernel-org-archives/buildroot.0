From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 23:06:35 +0100
Subject: [Buildroot] [PATCH/next v1 1/5] package/python3-jinja2: add
 special host variant
In-Reply-To: <20201117223436.24036-1-ps.report@gmx.net>
References: <20201117223436.24036-1-ps.report@gmx.net>
Message-ID: <20210119230635.096c0506@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Nov 2020 23:34:32 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/python-jinja2/python-jinja2.mk     |  1 +
>  package/python3-jinja2/python3-jinja2.hash |  5 +++++
>  package/python3-jinja2/python3-jinja2.mk   | 18 ++++++++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 package/python3-jinja2/python3-jinja2.hash
>  create mode 100644 package/python3-jinja2/python3-jinja2.mk

So, despite Arnout's disagreement, I have applied the series. Indeed,
what you're doing in this series is what we do today with host Python
packages when they must be available with Python 3. My view is that
there is not much point in changing how we do things today until we get
rid of Python 2.x altogether.

However, in your series, I changed a few things:

 * The patch for jinja2 should have been after the patch for
   markupsafe, as jinja2 uses markupsafe

 * You duplicated the hash files of the packages between the
   python-<foo> package and the corresponding python3-<foo> package,
   while we normally use a symlink for the hash file, so I've done that.

 * Due to other changes since then on the Git downloading, the change
   in the libcamera hash file was no longer correct, I fixed that.

So, entire series applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
