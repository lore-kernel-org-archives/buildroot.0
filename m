From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 09:23:57 +0100
Subject: [Buildroot] [PATCH v4 4/4] lttng-babeltrace: add debug info
 support
In-Reply-To: <CAB4xu_3SxjOQ-KV=46wNR0PqO1PmW8XticcqstaW6hJJyUD8cA@mail.gmail.com>
References: <20161102065508.3162-1-eeppeliteloop@gmail.com>
 <20161102065508.3162-5-eeppeliteloop@gmail.com>
 <20161102231023.392100c6@free-electrons.com>
 <CAB4xu_3SxjOQ-KV=46wNR0PqO1PmW8XticcqstaW6hJJyUD8cA@mail.gmail.com>
Message-ID: <20161103092357.2ba4cd29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Nov 2016 19:01:24 -0400, Philippe Proulx wrote:

> > This stuff is really complicated, so I've instead removed the
> > sub-option, and simply made lttng-babeltrace.mk enable debug info
> > support when BR2_PACKAGE_ELFUTILS=y.  
> 
> But then, if BR2_PACKAGE_ELFUTILS=n, you don't know that you could have
> debug info support in Babeltrace if BR2_PACKAGE_ELFUTILS=y.

We have such automatic dependencies in a large number of packages, we
simply can't add sub-options for each and every features. Since this
one is not necessarily trivial, I've added in the commit an additional
paragraph in the Config.in help text to hint the user about the need to
enable elfutils to get debug info support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
