From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Dec 2019 22:40:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/lirc-tools: use single quote
 with SETUPTOOLS_ENV
In-Reply-To: <20191209171027.22631-1-ryan.barnett@rockwellcollins.com> (Ryan
 Barnett's message of "Mon, 9 Dec 2019 11:10:26 -0600")
References: <20191209171027.22631-1-ryan.barnett@rockwellcollins.com>
Message-ID: <871rtdi3e1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:

 > With the change to pkg-python to use TARGET_CONFIGURE_OPTS in
 > PKG_PYTHON_SETUPTOOLS_ENV in commit 1745fcde74, the
 > LIRC_TOOLS_MAKE_ENV is incorrect as it sets the SETUPTOOLS_ENV using
 > double quotes. This causes issues because the
 > PKG_PYTHON_SETUPTOOLS_ENV contain double quotes as well. This causes a
 > build error such as:

 >   /bin/sh: -I/home/naourr/work/instance-0/output-1/host/include
 >           CXXFLAGS_FOR_BUILD=-O2: No such file or directory

 > Fix this by using single quotes with PKG_PYTHON_SETUPTOOLS_ENV instead
 > of double quotes.

 > Fixes:
 >   http://autobuild.buildroot.net/results/f7a9c02add9bde563c7289f7c0be2cb7aefd96b8

 > Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
