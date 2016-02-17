From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 16:02:57 +0100
Subject: [Buildroot] [PATCH 1/1] fix host-openssl binary installation
In-Reply-To: <1455705686-20822-1-git-send-email-matthew.shyu.amlogic@gmail.com>
 (Matthew Shyu's message of "Wed, 17 Feb 2016 18:41:26 +0800")
References: <1455705686-20822-1-git-send-email-matthew.shyu.amlogic@gmail.com>
Message-ID: <8737sr1ise.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Shyu <matthew.shyu.amlogic@gmail.com> writes:

 > From: Matthew Shyu <matthew.shyu@amlogic.com>
 > The Configure script in openssl takes install_prefix from env by default
 > $install_prefix= "$ENV{'INSTALL_PREFIX'}"
 > However, the INSTALL_PREFIX points to *TARGET* folder instead of
 > *HOST* folder.
 > This is fixed by intentionally setting install_prefix to blank.

Sorry, I'm not following you here. Do you mean that you have exported
INSTALL_PREFIX=<something> in your environment outside Buildroot? We do
indeed pass INSTALL_PREFIX to make install when we install the target
version to staging/target, but I don't see the relation to the host
variant?


> Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
 > ---
 >  package/openssl/openssl.mk |    1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
 > index b7498a7..c35e93f 100644
 > --- a/package/openssl/openssl.mk
 > +++ b/package/openssl/openssl.mk
 > @@ -63,6 +63,7 @@ define HOST_OPENSSL_CONFIGURE_CMDS
 >  		$(HOST_CONFIGURE_OPTS) \
 >  		./config \
 >  		--prefix=$(HOST_DIR)/usr \
 > +		--install_prefix= \
 >  		--openssldir=$(HOST_DIR)/etc/ssl \
 >  		--libdir=/lib \
 >  		shared \
 > -- 
 > 1.7.9.5

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
