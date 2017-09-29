From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Sep 2017 21:51:51 +0200
Subject: [Buildroot] Private mirror repository for Python package
 dependencies -- howto?
In-Reply-To: <CAF7SrrG6-FgUdN3HESU_vGX4+HEfrU8hfFQc9VzH9wh2GugxBQ@mail.gmail.com>
References: <CAF7SrrG6-FgUdN3HESU_vGX4+HEfrU8hfFQc9VzH9wh2GugxBQ@mail.gmail.com>
Message-ID: <20170929215151.35dea574@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Sep 2017 09:53:25 -0700, Robert Lerche wrote:
> Buildroot provides a simple and effective means to specify a private mirror
> for package source code components (BR2_PRIMARY_SITE).  This is essential
> for a company basing an embedded system product on Buildroot.
> 
> Is there an equivalent mechanism to support a private repository for Python
> package dependencies?  Otherwise distutils and setuptools will fetch from
> public sources even though the package base comes from the private mirror.

This should never happen. If a Python package downloads its
dependencies by itself without going through Buildroot's download
mechanism, it's a bug.

Could you give a more specific example of a problematic Python package ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
