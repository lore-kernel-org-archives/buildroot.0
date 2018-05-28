From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 14:41:57 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/nss-mdns: Fix hook from
 post-install to finalize
In-Reply-To: <1527496298-29730-1-git-send-email-vincent.prince.fr@gmail.com>
 (Vincent Prince's message of "Mon, 28 May 2018 10:31:37 +0200")
References: <1527496298-29730-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <87r2lwymsq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Prince <vincent.prince.fr@gmail.com> writes:


Please describe _WHY_ this is done and not just state what the change is
you are making - Thanks.

> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
 > ---
 >  package/nss-mdns/nss-mdns.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
 > index 407b942..ee666c7 100644
 > --- a/package/nss-mdns/nss-mdns.mk
 > +++ b/package/nss-mdns/nss-mdns.mk
 > @@ -17,6 +17,6 @@ define NSS_MDNS_INSTALL_CONFIG
 >  		$(TARGET_DIR)/etc/nsswitch.conf
 >  endef
 
 > -NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
 > +NSS_MDNS_TARGET_FINALIZE_HOOKS += NSS_MDNS_INSTALL_CONFIG
 
 >  $(eval $(autotools-package))
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
