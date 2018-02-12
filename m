From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Feb 2018 14:48:55 +0100
Subject: [Buildroot] [PATCH v2 1/5] python-psycopg2: new package
In-Reply-To: <CAFSsvmrjmriHVyu4NMyNCHeB1U7VymCmJUYckuZ-HGU+TvBLPQ@mail.gmail.com>
References: <20180206132506.30389-1-aduskett@gmail.com>
 <20180210162230.136b9627@windsurf.lan>
 <CAGm1_ktNRN88kAztD=7owBB6LK1ShVexTwpqf8Ykhj14YjTYKQ@mail.gmail.com>
 <CAFSsvmrjmriHVyu4NMyNCHeB1U7VymCmJUYckuZ-HGU+TvBLPQ@mail.gmail.com>
Message-ID: <20180212144855.59b7b0df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 07:06:13 -0500, Adam Duskett wrote:

> This patch is from yocto actually.  pg_config is called by setup.py to
> get the PostgreSQL server version.
> There are two problems with this:
> 
> 1) There is no way to specify a path to pg_config, so it uses the
> hosts pg_config (if it's not available it causes an error)
> 2) Even if you do use pg_config, the one generated during
> cross-compilation doesn't print out the version information
>     that setup.py is looking for.

Did you notice that Buildroot has its own pg_config in
package/postgresql/postgresql.mk ? Indeed, the pg_config built/installed
by PostgreSQL didn't work properly in a cross-compilation context, so
we simply implemented a simplified shell-based version. Perhaps it just
needs to be extended to support what python-psycopg2 needs ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
