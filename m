From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 12:58:40 +0200
Subject: [Buildroot] patch for file package
In-Reply-To: <5d75f4610707052141s1bdcee26r980881e518b23ae9@mail.gmail.com>
References: <5d75f4610707052141s1bdcee26r980881e518b23ae9@mail.gmail.com>
Message-ID: <20070707105840.GR4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 06, 2007 at 11:41:30AM +0700, BuraphaLinux Server wrote:
>Attached is a patch for the file package for subversion version 19006
>that creates a missing directory so that packages after file can build.
>File was creating a file for the 'include' instead of a file inside of the
>include because it didn't have the mkdir -p

No, this is wrong. There is no $(STAGING_DIR)/include and this is
expected. The include is in $(STAGING_DIR)/usr/include
