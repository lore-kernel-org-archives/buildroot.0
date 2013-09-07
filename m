From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat, 7 Sep 2013 18:52:06 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
In-Reply-To: <20130902150405.GB6918@pc-eric>
References: <CALdGskLJPNgZ+iRokvubyE0FdG=miQHTHsdC56q84pQGcZE7Zw@mail.gmail.com>
 <20130902150405.GB6918@pc-eric>
Message-ID: <CALdGskLxtMn7uZi1OvXKBS_MMjoCCfnp0ZZNDipDfUESA3Q0-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric

Attached is the systemd build log for failure with AUTORECONF enabled for
systemd.

I first tried to apply your patch to buildroot 2013.08.  Only when I
comment out 'SYSTEMD_AUTORECONF = YES' and not apply
'systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch'
do I get it to build successfully.

patch
'systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch'
causes below error because of configure.ac being updated by patch.
/home/olivier/Buildroot-test/output/build/systemd-206/build-aux/missing:
line 81: aclocal-1.13: command not found
WARNING: 'aclocal-1.13' is missing on your system.
         You should only need it if you modified 'acinclude.m4' or
         'configure.ac' or m4 files included by 'configure.ac'.
         The 'aclocal' program is part of the GNU Automake package:
         <http://www.gnu.org/software/automake>
         It also requires GNU Autoconf, GNU m4 and Perl in order to run:
         <http://www.gnu.org/software/autoconf>
         <http://www.gnu.org/software/m4/>
         <http://www.perl.org/>
make[1]: *** [aclocal.m4] Error 127

Regards
Olivier Schonken


On Mon, Sep 2, 2013 at 5:04 PM, Eric Le Bihan <eric.le.bihan.dev@free.fr>wrote:

> On Sun, Sep 01, 2013 at 06:54:48PM +0200, Olivier Schonken wrote:
> > I have started to test building the new version(Using Codesourcery for
> > ARM).  One thing I noticed is that with the SYSTEMD_AUTORECONF=YES,
> > autotools complains about undefined macro AM_PATH_LIBGCRYPT if libgcrypt
> or
> > libgcrypt-devel is not present on the build system.  Not sure how to go
> > about pleasing autotools without the additional system dependency.  Maybe
> > someone on the buildroot mailing list will know...?
>
> I removed libgcrypt11-dev from my development machine and built an image
> for
> QEMU arm-versatile using Code Sourcery 2013.05, but I have not seen this
> issue.
> Can you send me a log file of the build with the error?
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130907/305dfcdc/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: systemd-206.log
Type: application/octet-stream
Size: 1006 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130907/305dfcdc/attachment-0003.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: master-config
Type: application/octet-stream
Size: 30789 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130907/305dfcdc/attachment-0004.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 2013.08-config
Type: application/octet-stream
Size: 30306 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130907/305dfcdc/attachment-0005.obj>
