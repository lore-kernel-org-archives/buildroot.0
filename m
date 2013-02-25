From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 25 Feb 2013 11:31:36 +0100
Subject: [Buildroot] [PATCH] qt: install QML imports on target
In-Reply-To: <1361355531-2909-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1361355531-2909-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <CAHQn0kg71pmwYCTo9EbGZOFF-PO2s99pZ4GrSC2gDbuy31QUqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 20, 2013 at 11:18 AM, Daniel Nystr?m <
daniel.nystrom@timeterminal.se> wrote:

> When selecting the Qt declarative module, all the QML imports was
> built and installed to staging, but never installed to the target.
>
> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
>

Bumping this patch as I think this is a good candidate for the 2013.02
release. Currently QtDeclarative is supported by Buildroot, but the QML
imports are not installed to target. The current imports are:

./QtWebKit/libqmlwebkitplugin.so
./Qt/labs/folderlistmodel/libqmlfolderlistmodelplugin.so
./Qt/labs/gestures/libqmlgesturesplugin.so
./Qt/labs/particles/libqmlparticlesplugin.so

(note that the webkitplugin is built even when "WebKit Module" is unchecked
in menuconfig!)

Maybe imports installation should be optional in the future, but right now
many QML examples and demos depends on their existance.

Best regards
Daniel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130225/fe1720cb/attachment.html>
