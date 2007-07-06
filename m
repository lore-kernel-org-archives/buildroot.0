From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 6 Jul 2007 14:35:32 +0200
Subject: [Buildroot] What is the proper procedure to commit a patch?
Message-ID: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now, when I have access, I would like to understand the proper
procedure to add patches.

After checking out and applying a patch, I can do:

svn commit -F <file> 
with <file> containing a log message.
or 
svn commit -m "log message" 

I tried a real simple patch first and after the commit,
the svn server automatically sent out a mail with the change,
adding the log message.

The patches I'd like to add are mainly:
* BSP patch ,discussed and approved by Eric.
* moving package/customize to topdir and rename "local", also discussed before
* Support for AT91 boot monitors 
        Dataflashboot
        AT91-Bootstrap
        U-boot
        Generate U-Boot initialization scripts
* Add AVR32 support.
* A few extra packages.
* Update mtdutils (which is really old)
* Clean up the linux support (move into a separate dir in package)
* Bump versions on a number of packages which has disappeared from their download location.
        (dash, rmp, l2tp, mpfr,mrouted, openntpd, portage, pppd,udev)
* Add TARGET_CFLAGS to all packages not having this
        Would like to know if they lack TARGET_CFLAGS for a reason.
        (acpid,berkleydb, hdparm, iostat,ltp-testsuite,memtester,netkitbase,
         procps, python, sysklogd, tinyx,udhcp)
* Introduce concept of distributions  (did not do any work there yet though)
--------------
        Both the version bump and TARGET_CFLAGS lists are a month old, so 
        maybe the svn already is updated.

        Is it OK to bump version if something disappears from internet, or do we need a review.
        Sometimes you find new versions of a package, Is it OK to bump the version
        without previous review by peers?

        Anything else to think about (except golden rule: do not break the build)?

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                ftp://at91dist:distrib at 81.80.104.162/
