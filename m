From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 21 Aug 2007 00:42:15 +0100
Subject: [Buildroot] [PATCH] Fix sed fail when building qtopia
In-Reply-To: <d6cda7730708201136t24339015u271d512ccdc864a5@mail.gmail.com>
References: <d6cda7730708201100l732f3131hc0eb086da6cb5ee2@mail.gmail.com>
	<20070820181151.GR11697@aon.at>
	<d6cda7730708201136t24339015u271d512ccdc864a5@mail.gmail.com>
Message-ID: <d6cda7730708201642l7af3899o3478f1ef552117f8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ops, didn't send the msg to the list, sorry. Perhaps one could
consider changing the default reply to the list rather than to the
poster.

Oh, btw, this patch fixes bug 0001457, please apply and close the
issue on the bugtracker. Thanks :)

---------- Forwarded message ----------
From: Thiago A. Corr?a <thiago.correa@gmail.com>
Date: Aug 20, 2007 7:36 PM
Subject: Re: [Buildroot] [PATCH] Fix sed fail when building qtopia
To: Bernhard Fischer <rep.dot.nop@gmail.com>


Yes, much better indeed. And it works fine now. At least that part so far :)

After that, I get a link error building moc, haven't figured that one yet.

I have attached the patch updated, thanks.

Cheers,
    Thiago A. Correa


On 8/20/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Mon, Aug 20, 2007 at 07:00:17PM +0100, Thiago A. Corr?a wrote:
> >Hi there,
> >
> >   This patch should fix the error:
> >   sed: -e expression #1, char 21: unknown option to `s'
> >
> >   I am sure there is a better way to do this, but I'm not comfortable
> >with shell scripts enough, so, if someone has a better solution, by
> >all means :)
>
> ergh, that's rather ugly.
> Please try to use this instead and let me know if that works for you:
> $(SED) 's,-O2,$(TARGET_CFLAGS),' \
> $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>
> (i.e. use ',' instead if '/'.
>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-qtopia.patch
Type: application/octet-stream
Size: 1425 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070821/456632e0/attachment.obj 
