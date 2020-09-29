From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 29 Sep 2020 16:17:36 +0200
Subject: [Buildroot] Ruby support in Buildroot
In-Reply-To: <87pn79kgxv.fsf@dell.be.48ers.dk>
References: <87pn79kgxv.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRsvd_MsgLQ+v3=Ru4xJ4ff3VODorTZ-ceupSdxfhrY7Zag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 29 ao?t 2020 ? 10:14, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> Hi,
>
> Our ruby package could use some love. We have no DEVELOPERS entry for
> it, and the package has only seen small (security) fixes since 2017 or
> so:
>
> https://git.buildroot.net/buildroot/log/package/ruby
>
> We are currently using ruby 2.4.x, which has been EOL since April:
>
> https://www.ruby-lang.org/en/news/2020/04/05/support-of-ruby-2-4-has-ended/
>
> I personally do not have the time or interest to update and maintain
> ruby, so unless someone steps up to support it I think the best solution
> is to drop the package before 2021.02.
>
> Anyone interested in helping support ruby?
>
>
we need at least host-ruby, because host-ruby is a dependency for WebKit :
    package/qt5/qt5webkit/qt5webkit.mk:11: host-bison host-flex host-gperf
host-python host-ruby \
    package/webkitgtk/webkitgtk.mk:15:WEBKITGTK_DEPENDENCIES = host-ruby
host-python host-gperf \
    package/wpewebkit/wpewebkit.mk:15:WPEWEBKIT_DEPENDENCIES = host-gperf
host-python host-ruby \

Fran?ois

-- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200929/4de1f25d/attachment.html>
