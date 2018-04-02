From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 2 Apr 2018 18:41:41 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: add optional libmpdclient
 dependency
In-Reply-To: <874lktois3.fsf@dell.be.48ers.dk>
References: <20180402111134.23776-1-fontaine.fabrice@gmail.com>
 <874lktois3.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W80xVMC0BuVvYLKwXJnMTcHV2Zpo7w_gnnAihBhhBpwvDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

2018-04-02 15:11 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  > ---
>  >  package/mpd/mpd.mk | 7 +++++++
>  >  1 file changed, 7 insertions(+)
>
>  > diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
>  > index f50e3d90c7..e1569b64cf 100644
>  > --- a/package/mpd/mpd.mk
>  > +++ b/package/mpd/mpd.mk
>  > @@ -31,6 +31,13 @@ else
>  >  MPD_CONF_OPTS += --disable-icu
>  >  endif
>
>  > +ifeq ($(BR2_PACKAGE_LIBMPDCLIENT),y)
>  > +MPD_DEPENDENCIES += libmpdclient
>
> All other optional dependencies are handled by a BR2_PACKAGE_MPD_<foo>
> suboption. Any specific reason why you are not doing that here?
>
Yes, you're right that all dependencies except icu have an option.
I'll add also it for libmpdclient, I was just thinking that the best
practice was to avoid adding an option.

>
> --
> Bye, Peter Korsgaard
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180402/049dc221/attachment-0001.html>
