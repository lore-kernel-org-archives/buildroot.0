From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Apr 2019 16:23:03 +0200
Subject: [Buildroot] [PATCH] package/libglib2: disable compiler warnings
In-Reply-To: <1556024465-7928-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556024465-7928-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20190423162303.2683abfb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Apr 2019 15:01:05 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> This flag is not set by default which yields in a
> compilation error when host-qemu package is enabled.
> The build fails at libglib2 package because -Werror
> is activated which stops the compilation process.
> Adding this flag corrects the issue.

Could you be more specific about the build failure you encounter ?
Also, what is the relationship with host-qemu ? host-libglib2 is build
as a dependency for tons of things, including libglib2 itself, i.e it
is built many times a day in our autobuilders. So what is different in
your situation that requires disabling compiler warnings ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
