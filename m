From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 21:29:54 +0100
Subject: [Buildroot] [PATCH] python-beautifulsoup4: new package
In-Reply-To: <1452806460-9045-1-git-send-email-yegorslists@googlemail.com>
 (Yegor Yefremov's message of "Thu, 14 Jan 2016 22:21:00 +0100")
References: <1452806460-9045-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87lh7m637h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/Config.in                                        |  1 +
 >  package/python-beautifulsoup4/Config.in                  |  6 ++++++
 >  package/python-beautifulsoup4/python-beautifulsoup4.hash |  4 ++++
 >  package/python-beautifulsoup4/python-beautifulsoup4.mk   | 14 ++++++++++++++
 >  4 files changed, 25 insertions(+)
 >  create mode 100644 package/python-beautifulsoup4/Config.in
 >  create mode 100644 package/python-beautifulsoup4/python-beautifulsoup4.hash
 >  create mode 100644 package/python-beautifulsoup4/python-beautifulsoup4.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 89b23db..5d24527 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -618,6 +618,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 >  menu "External python modules"
 >  	source "package/python-alsaaudio/Config.in"
 >  	source "package/python-backports-abc/Config.in"
 > +	source "package/python-beautifulsoup4/Config.in"
 >  	source "package/python-bottle/Config.in"
 >  	source "package/python-can/Config.in"
 >  	source "package/python-certifi/Config.in"
 > diff --git a/package/python-beautifulsoup4/Config.in b/package/python-beautifulsoup4/Config.in
 > new file mode 100644
 > index 0000000..1011536
 > --- /dev/null
 > +++ b/package/python-beautifulsoup4/Config.in
 > @@ -0,0 +1,6 @@
 > +config BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4
 > +	bool "python-beautifulsoup4"
 > +	help
 > +	  Screen-scraping library

While this matches the pypi description, I don't find it very nice. When
I hear screen scraping I think of technologies like VNC instead.

I've replaced it with the first sentence from
http://www.crummy.com/software/BeautifulSoup/bs4/doc/ instead and
committed, thanks.

-- 
Bye, Peter Korsgaard
