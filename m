From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 20:03:55 +0200
Subject: [Buildroot] [PATCH] package/zstd: Install tools into /usr/bin,
	not /usr/local/bin
In-Reply-To: <20170916002712.19851-1-andrew.smirnov@gmail.com> (Andrey
 Smirnov's message of "Fri, 15 Sep 2017 17:27:12 -0700")
References: <20170916002712.19851-1-andrew.smirnov@gmail.com>
Message-ID: <877ewtxn5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Smirnov <andrew.smirnov@gmail.com> writes:

 > Install tools into /usr/bin, not /usr/local/bin, since /usr/local/bin
 > is not in PATH by deafault.

 > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 > ---

 >  package/zstd/zstd.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
 > index 475079dbfe..9a6e286954 100644
 > --- a/package/zstd/zstd.mk
 > +++ b/package/zstd/zstd.mk
 > @@ -43,7 +43,7 @@ endef
 
 >  define ZSTD_INSTALL_TARGET_CMDS
 >  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 > -		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
 > +		DESTDIR=$(TARGET_DIR) PREFIX= -C $(@D)/programs install

PREFIX='' would install into /bin, so I've changed this to PREFIX=/usr
and committed, thanks.

-- 
Bye, Peter Korsgaard
