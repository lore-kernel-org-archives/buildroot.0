From: No One <justanotheraccount863494@yahoo.com>
Date: Wed, 22 Nov 2006 19:01:36 -0800 (PST)
Subject: [Buildroot] trylink causes build errors
Message-ID: <20061123030136.75516.qmail@web90309.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried
$ function foo () { echo bar ; }
and it worked correctly.  I am using the bash shell within a virtual terminal.

----- Original Message ----
From: Bernhard Fischer <rep.nop@aon.at>
To: No One <justanotheraccount863494@yahoo.com>
Cc: buildroot at uclibc.org
Sent: Wednesday, November 22, 2006 5:27:42 PM
Subject: Re: [Buildroot] trylink causes build errors

On Wed, Nov 22, 2006 at 02:05:01PM -0800, No One wrote:
>
>Picked up the latest via svn (16637), did a default configuration with make menuconfig, ran make and got the following errors:
>
>
>make[1]: Entering directory `/home/will/box/buildroot/build_i686/busybox'
>  LINK    busybox_unstripped
>/home/will/box/buildroot/build_i686/busybox/scripts/trylink: 5: function: not found
>/home/will/box/buildroot/build_i686/busybox/scripts/trylink: 11: Syntax error: "}" unexpected

What shell are you using?
does 
$ function foo () { echo bar ; }
$ foo
bar
$ unset foo

work? (note the parentheses)
If so, then bug vda resp. the busybox list or fix it upstream.

HTH,
