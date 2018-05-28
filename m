From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 28 May 2018 21:08:43 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/nss-mdns: Fix hook from
 post-install to finalize
In-Reply-To: <87r2lwymsq.fsf@dell.be.48ers.dk>
References: <1527496298-29730-1-git-send-email-vincent.prince.fr@gmail.com>
 <87r2lwymsq.fsf@dell.be.48ers.dk>
Message-ID: <CAB2nKc9vFwp_E1RSJ=GVLo2isqXdOFCE7qmhsKgy8RpnhYRNsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I though it was obvious without explication :)

I'll send a V3 to explain the _why_.

2018-05-28 14:41 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Vincent" == Vincent Prince <vincent.prince.fr@gmail.com> writes:
>
>
> Please describe _WHY_ this is done and not just state what the change is
> you are making - Thanks.
>
> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
>  > ---
>  >  package/nss-mdns/nss-mdns.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/
> nss-mdns.mk
>  > index 407b942..ee666c7 100644
>  > --- a/package/nss-mdns/nss-mdns.mk
>  > +++ b/package/nss-mdns/nss-mdns.mk
>  > @@ -17,6 +17,6 @@ define NSS_MDNS_INSTALL_CONFIG
>  >              $(TARGET_DIR)/etc/nsswitch.conf
>  >  endef
>
>  > -NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
>  > +NSS_MDNS_TARGET_FINALIZE_HOOKS += NSS_MDNS_INSTALL_CONFIG
>
>  >  $(eval $(autotools-package))
>  > --
>  > 2.7.4
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180528/3ba3d30f/attachment.html>
