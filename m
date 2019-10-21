From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:33:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-more-itertools: drop
 Python 2 support
In-Reply-To: <20191020134203.11282-2-asafka7@gmail.com>
References: <20191020134203.11282-1-asafka7@gmail.com>
 <20191020134203.11282-2-asafka7@gmail.com>
Message-ID: <20191021193346.4a90d2a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 16:42:03 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Since version 6.0.0, the package supports only Python 3, and will
> lead to syntax errors when in use with Python 2.
> In addition, the dependency of python-six is no longer needed.
> 
> The reursive reverse dependencies were updated accordingly.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-cheroot/Config.in          | 3 +--
>  package/python-cherrypy/Config.in         | 7 +++----
>  package/python-jaraco-functools/Config.in | 3 +--
>  package/python-more-itertools/Config.in   | 2 +-
>  package/python-portend/Config.in          | 1 +
>  package/python-tempora/Config.in          | 1 +
>  package/python-webpy/Config.in            | 2 +-
>  7 files changed, 9 insertions(+), 10 deletions(-)

Applied to master, thanks. It would be good to add some test in
support/testing/ for one of the high-level packages (webpy and/or
cherrypy), so that we have some runtime testing of those packages and
dependencies.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
