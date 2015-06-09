From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 10:15:08 +0200
Subject: [Buildroot] Option for debug support in DirectFB package
In-Reply-To: <ea9e1bad9d8e6c95d8611537b5224ccc@openmailbox.org>
References: <55760F79.8080501@openmailbox.org>
 <20150609001953.1c241187@free-electrons.com>
 <ea9e1bad9d8e6c95d8611537b5224ccc@openmailbox.org>
Message-ID: <20150609101508.034c93f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric Marie,

On Tue, 09 Jun 2015 09:29:00 +0200, C?dric Marie wrote:

> But then, since it is already commited, is your removal of DirectFB 
> specific debug option still relevant?

Well, maybe no.

> Or should we create another global option to enable debug (i.e. traces) 
> in autotools packages (and similar things in other types of packages 
> when possible)?
> This is just a question, I have no personal need for this debug 
> option...

A global option is a bit problematic, because we have discovered that
--enable-debug is clearly not used for the same thing in all packages.
Some packages add -Werror, some add some other funky stuff, some simply
enable debugging symbols. --enable-debug is not a standard, formalized
option with a well-defined meaning. So I don't think a global option
that applies to all autotools packages make sense here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
