From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 4 Mar 2012 17:03:34 -0200
Subject: [Buildroot] [PATCHv2] qt: Add option to build and install tools
 on the target
In-Reply-To: <201203041613.48008.arnout@mind.be>
References: <1330830287-1502-1-git-send-email-ismael.luceno@gmail.com>
 <201203041613.48008.arnout@mind.be>
Message-ID: <20120304170334.0c443251@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 4 Mar 2012 16:13:47 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:
> This is annoying...  SQL is only needed for assistant and designer,
> not for qtconfig or qmlplugindump.

Indeed, it requires touching tools.pro :/.

> Is there a possibility to tell qt to just build the selected tools?
> That probably requires hacking tools/tools.pro...

It is also required by qmlviewer.

> > +
> > +if BR2_PACKAGE_QT_TOOLS
> > +
> > +config BR2_PACKAGE_QT_TOOLS_QTCONFIG
> > +       bool "qtconfig"
> > +       depends on BR2_PACKAGE_QT_GUI_X11
> 
>  Doesn't qtconfig work in qws?

I guess it should work, but it's excluded for embedded systems...
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120304/fb6ca797/attachment.asc>
