From: Stefan Nickl <stefan.nickl@gmail.com>
Date: Sun, 16 Oct 2016 22:57:36 +0200
Subject: [Buildroot] [PATCH] pppd: Provide error() implementation in
	pppoe-discovery
In-Reply-To: <20161015223315.47f04e55@free-electrons.com>
References: <1476555914-22201-1-git-send-email-Stefan.Nickl@gmail.com>
 <20161015223315.47f04e55@free-electrons.com>
Message-ID: <CAFOMc=SKjm5J-hn=+qexzeRqqNWJEXKWUUQnckX3ei8c6BMTkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 15, 2016 at 10:33 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Thanks for this patch. Could you submit this as a Buildroot patch? I.e
> a patch that adds a patch to package/pppd/ ?
>

That was my original intention hadn't I messed up :)

However yesterday's autobuild showed that the issue I had in mind did not
actually break uclibc (which really does provide the error() facility) but
just caused a warning right before things went south.

The real breakage seems due to 4.8 kernel headers, see also
https://github.com/paulusmack/ppp/pull/69.

I think things aren't as simple at the patch proposed there suggests, will
investigate...

-- 
Stefan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161016/61a62910/attachment.html>
