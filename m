From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Oct 2019 14:59:35 +0200
Subject: [Buildroot] [PATCH v2 5/9] package/libnetconf2: add package
In-Reply-To: <CAEyMn7Z8AkpQjH0v5M_2gPg8h6DaK+boSqxbaY7VYbmRDShvfQ@mail.gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-6-heiko.thiery@gmail.com>
 <20191009141504.37bf7928@windsurf>
 <CAEyMn7Z8AkpQjH0v5M_2gPg8h6DaK+boSqxbaY7VYbmRDShvfQ@mail.gmail.com>
Message-ID: <20191009145935.1503e01a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 9 Oct 2019 14:54:33 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > I thought libssh was now an optional dependency ?  
> 
> This has to be removed from here and has to be added to the sysrepo
> package that enables it.

Correct, if sysrepo needs libnetconf2 with libssh support, then sysrepo
should select BR2_PACKAGE_LIBSSH and BR2_PACKAGE_LIBSSH_SERVER.

> Is the normal way to make it configurable at the place where it is
> needed. In this example the sysrepo has to be select the dependencies?

From the point of view of netconf2, libssh and openssl are optional, so
they be treated as such in the netconf2 package.

However, if sysrepo's use of netconf2 requires some specific features
in netconf2 that are normally optional, then indeed, it is up to
sysrepo's package to forcefully select the necessary options.

A quick word: thanks for your patience and persistence in working on
this patch series. For your first (?) Buildroot contribution, you are
definitely not doing the easiest possible new package!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
