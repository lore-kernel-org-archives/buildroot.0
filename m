From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:21:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/gettext-tiny.hash: remove hash
 value for gettext-gnu
In-Reply-To: <20200722145417.2195-1-heiko.thiery@gmail.com>
References: <20200722145417.2195-1-heiko.thiery@gmail.com>
Message-ID: <20200723162142.2aca3ea9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 16:53:48 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The gettext-tiny hash file holds a value that belongs to the gettext-gnu.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

No, it does belong to gettext-tiny as well: gettext-tiny downloads
gettext-gnu:

HOST_GETTEXT_TINY_EXTRA_DOWNLOADS = $(GETTEXT_GNU_SITE)/$(GETTEXT_GNU_SOURCE)

I don't think gettext-tiny can build after you apply this change, it
should complain that one file that it downloads does not have a hash.
Are you sure you tested this ? If you did, then we have a bug in
Buildroot :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
