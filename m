From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 19 Jun 2008 13:13:43 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <485A3ABF.90707@cetrtapot.si>
References: <485A3396.80701@cetrtapot.si> <485A3ABF.90707@cetrtapot.si>
Message-ID: <20080619111343.GC6874@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 19, 2008 at 12:53:51PM +0200, Hinko Kocevar wrote:
>Hinko Kocevar wrote:
>> Hello,
>> 
>> I'm new to the uclibc buildroot. I've noticed that there are two repositories: GIT and SVN. GIT looks more up2date. Is GIT the tree to use?
>> 
>> Also, I'm trying to create a uclibc toolchain for cris architecture. 

Thanks for noticing my typo and correcting the URL. Applied.

I didn't try to build cris. Please use 4.3.1 and disable libgomp:
$ grep gomp .config
BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-libgomp --disable-libssp"
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS="--disable-libgomp --disable-libssp"

I'm trying to build such a cris compiler now and will let you know how
it goes.

Thanks again,
Bernhard
