From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 21:13:18 +0200
Subject: [Buildroot] [PATCH] package/dbus: disable systemd for host build
In-Reply-To: <20200728104519.3328479-1-john@metanate.com> (John Keeping's
 message of "Tue, 28 Jul 2020 11:45:19 +0100")
References: <20200728104519.3328479-1-john@metanate.com>
Message-ID: <875z9m4awh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > This fixes an issue if host-dbus happens to be rebuilt after systemd, in
 > which case it autodetects systemd support but then ignored the prefix
 > when installing unit files.  That means that is tries to write to the
 > host system's /usr/lib/ which fails.

 > There is no reason to build and install systemd support in the host
 > build, so disable it explicitly.

 > Signed-off-by: John Keeping <john@metanate.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
