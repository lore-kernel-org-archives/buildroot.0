From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:23:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/kmod: fix build with python 3.8
In-Reply-To: <CADvTj4rAdZzCi5u2qBeGqjyiWPVM92TeNsBXPDRiY7ZmptLLag@mail.gmail.com>
References: <20191020193818.85518-1-james.hilliard1@gmail.com>
 <20191021205609.57122e8c@windsurf>
 <CADvTj4rAdZzCi5u2qBeGqjyiWPVM92TeNsBXPDRiY7ZmptLLag@mail.gmail.com>
Message-ID: <20191021212326.5bd4642d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 21:12:44 +0200
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Reading this, I am not sure your fix is correct (though I am not sure
> > what the correct fix is).  
> Yeah, not entirely sure but I saw other projects use this same fix effectively.

Yes, it "works", but it's quite weird, because the whole point of
Victor Stinner's work was to make sure Python extensions were not
linked with libpython.

> > What do you think ?  
> Yeah, it's not very clear, this fix is the same as these essentially however:
> https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14/diffs

This is indeed a Python binding.

> https://gitlab.com/ita1024/waf/merge_requests/2236/diffs

This is a generic build system, and it only adds --embed when the
"pyembed" flag is used. It could simply be that this flag is used for
applications/libraries than embed Python, and not for Python
extensions. Indeed, the original entry in the Python issue tracker
mentioned that waf had "pyext" for Python extensions and "pyembed" for
apps/libs embedding Python.

It turns out that Victor Stinner (the author of the changes) is a
former colleague of mine from university times. I'll try to get some
feedback from him about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
