From: Christian Stewart <christian@paral.in>
Date: Wed, 29 Jul 2015 22:28:04 +0000
Subject: [Buildroot] [PATCH] package/golang: new package
In-Reply-To: <20150729233725.60512298@free-electrons.com>
References: <1438202101-5106-1-git-send-email-yann.morin.1998@free.fr>
 <20150729231228.0a59fcde@free-electrons.com> <20150729212003.GB3722@free.fr>
 <20150729233725.60512298@free-electrons.com>
Message-ID: <CA+h8R2pvaeQ4K7szq+Dr7dYT1cjGTW3QhB4jRNhKj6NY7P289w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

We're not doing this for any other package, so why should we be doing
> this for golang?
>

Because it's very critical that Go have the exact same src, include, and
pkg tree in that location. If we don't ensure any previous files have been
cleared out it WILL cause major problems down the line.

Also, the empty variable declaration was because GOLANG_ARCH is set further
down in the file. Sure, the line itself is technically useless, but the
idea was to make sure it existed before setting it further down the line. I
know that's not necessary in Make. It could be removed.

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150729/365957ab/attachment.html>
