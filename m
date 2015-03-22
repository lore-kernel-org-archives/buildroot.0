From: Alex Suykov <alex.suykov@gmail.com>
Date: Sun, 22 Mar 2015 15:23:58 +0200
Subject: [Buildroot] [RFC 00/11] common init infrastructure
In-Reply-To: <20150322112807.GA4724@free.fr>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <20150322112807.GA4724@free.fr>
Message-ID: <20150322132358.GC21403@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sun, Mar 22, 2015 at 12:28:07PM +0100, Yann E. MORIN wrote:

> How do you handle conditional creation of users/groups? Let's take a
> supposed package that can install a server and/or a client (like a SQL
> related package, for example). The server (sqld) needs a specific
> user+group, but the client (sql-cli) does not. Currently, this is easily
> done by emclosing the user defintion between a 'if server' block.
I think it makes sense to install users unconditionally.
Mostly because not installing them is a minor optimization of the resulting
rootfs image and I see no good way to handle it.

If necessary, perhaps listing .users to be included in the project .mk
file may be an option, the same way it is done with .run files.

> Otherwise, I have a feeling this is pushing things a bit too far. I'm
> usually very happy with "abstraction" and I more than once have pushed
> for such changes. However, in this area, I'm a bit sceptic as to whether
> we should introduce our own "initscript" format (the '.run' files).
That's a valid point, but I think buildroot already uses its own
initscript format, namely its sysv(-style) initscripts.

They are supplied with buildroot, they are non-standard, and they are
nearly useless outside of buildroot.

So I see it a choice between different formats for buildroot-specific
service description, and the one currently in use does not look like
a good data storage format at all.
