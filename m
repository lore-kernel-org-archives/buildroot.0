From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 20:48:40 +0200
Subject: [Buildroot] [PATCH v3] package/mono: new package
In-Reply-To: <1412951017-6769-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1412951017-6769-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20141010204840.4ec4d5d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 10 Oct 2014 16:23:37 +0200, Angelo Compagnucci wrote:

> I tried to merge mono-managed and mono-native in a single package,
> but crosscompiling and compiling in the same folder without a clean
> makes a big mess, so I think these packages should remain splitted.
> Any hint appreciated!

I still don't understand why you think the build takes place in the
same folder: the host and target variants of the same package are built
in separate directories.

I'm working on the patches that use a single mono package. There are
other issues with your patch: host-mono-managed automatically downloads
monolite, which is bad, as it circumvents the download infrastructure
of Buildroot. I'll show you an approach to fix that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
