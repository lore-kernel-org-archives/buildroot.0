From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Feb 2012 23:02:34 +0100
Subject: [Buildroot] [PATCH v2 fbdirect] Font handling in directfb
	requires libbz2
In-Reply-To: <1328824580-28004-1-git-send-email-twoerner@gmail.com> (Trevor
 Woerner's message of "Thu, 9 Feb 2012 16:56:20 -0500")
References: <1328824580-28004-1-git-send-email-twoerner@gmail.com>
Message-ID: <87vcnf3bt1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trevor" == Trevor Woerner <twoerner@gmail.com> writes:


 Trevor> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
 Trevor> ---
 Trevor>  package/bzip2/bzip2.mk       |    3 ++-
 Trevor>  package/directfb/directfb.mk |    2 +-
 Trevor>  2 files changed, 3 insertions(+), 2 deletions(-)

 Trevor> diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
 Trevor> index d3bb2b0..8e6ae92 100644
 Trevor> --- a/package/bzip2/bzip2.mk
 Trevor> +++ b/package/bzip2/bzip2.mk
 Trevor> @@ -60,6 +60,7 @@ define BZIP2_INSTALL_TARGET_CMDS
 Trevor>  	(cd $(TARGET_DIR)/usr/lib; \
 Trevor>  		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1.0; \
 Trevor>  		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so; \
 Trevor> +		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1; \

Could you please split this out in a seperate patch (and put .so.1
before .so?)

Thanks.

-- 
Bye, Peter Korsgaard
