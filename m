From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Mar 2013 07:14:36 -0300
Subject: [Buildroot] [PATCH] quota: util-linux libmount is needed to
 build mount
In-Reply-To: <1363753355-27054-1-git-send-email-gilles.talis@gmail.com>
References: <y> <1363753355-27054-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <51498C0C.5040202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/2013 01:22 AM, Gilles Talis wrote:

> quota configuration explicitly selects util-linux mount package,
> but mount requires libmount to build.
> 
> Explicitly select libmount to fix this.

But it's not the proper fix realy, see line 92 of util-linux.mk - it
won't build ANY util-linux binary unless BR2_PACKAGE_UTIL_LINUX_BINARIES
is set, hence it may pass in the autobuilders but you'll never get
util-linux mount (and quota will cry when used).
The proper fix is the one i've sent before.
Regards.
