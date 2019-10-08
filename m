From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:57:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-snmpclitools: new package
In-Reply-To: <20191008072801.3745-3-asafka7@gmail.com>
References: <20191008072801.3745-1-asafka7@gmail.com>
 <20191008072801.3745-3-asafka7@gmail.com>
Message-ID: <20191008225704.2547dffe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Oct 2019 10:28:01 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> For now, we use PKG-INFO as license file, since LICENSE.rst isn't
> provided with the tarball.
> A pull request was sent upstream:
> https://github.com/etingof/snmpclitools/pull/11
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

I am wondering if this package shouldn't be named just "snmpclitools",
like upstream. In fact, contrary to the Python modules named
python-<something>, here the fact that it is Python is just an
implementation detail. Look at package/circus or package/crudini for
example.

And then of course, instead of being in the Python modules section, it
should be in the Networking tools section. And have a proper depends on
BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 (depending on which one is
applicable, or both).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
