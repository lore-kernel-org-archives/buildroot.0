From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Sat, 28 Mar 2009 12:53:23 -0700
Subject: [Buildroot] Lighttpd with -pcre support
Message-ID: <49CE8033.6080403@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello List:

I want to use mod_redirect with lighttpd to redirect any normal http 
request to secure https.
I get this error message:

Starting HTTP Server...
can't handle '$HTTP[host] =~ ...' as you compiled without pcre support.

I made sure -prce support was enabled in the menuconfig. Still no go.
I hard coded the lighttpd.mk file to force --with pcre support. Still no go.
I deleted both lighttpd and pcre-7.7 and watched buildroot re-configure 
and make them again. I still can't make lighttpd compile with pcre support.

Here is the output from lighttpd -V:

# lighttpd -V
lighttpd-1.4.20 (ssl) - a light and fast webserver
Build-Date: Feb 13 2009 00:04:10

Event Handlers:

        + select (generic)
        + poll (Unix)
        + rt-signals (Linux 2.4+)
        + epoll (Linux 2.6)
        - /dev/poll (Solaris)
        - kqueue (FreeBSD)

Network handler:

        + writev
        + mmap support

Features:

        + IPv6 support
        - zlib support
        - bzip2 support
        + crypt support
        + SSL Support
        - PCRE support
        - mySQL support
        - LDAP support
        - memcached support
        - FAM support
        - LUA support
        - xml support
        - SQLite support
        - GDBM support


What am I doing wrong?

Best Regards,
Dan Pattison
