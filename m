From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 22:53:18 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/openresolv: update to fix
 install location
In-Reply-To: <20190117150542.13062-1-jared.bents@rockwellcollins.com> (jared
 bents's message of "Thu, 17 Jan 2019 09:05:42 -0600")
References: <20190117150542.13062-1-jared.bents@rockwellcollins.com>
Message-ID: <87imyjxagh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jared" == jared bents <jared.bents@rockwellcollins.com> writes:

 > From: Jared Bents <jared.bents@rockwellcollins.com>
 > Update to install in /sbin as expected by other applications
 > such as strongswan instead of /usr/sbin

 > Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

I've verified that strongswan indeed uses:

src/libcharon/plugins/resolve/resolve_handler.c:#define RESOLVCONF_EXEC "/sbin/resolvconf"

And E.G. Debian also installs into /sbin, so committed, thanks.

-- 
Bye, Peter Korsgaard
