From: QuickX <quickx@hotmail.com>
Date: Fri, 6 Feb 2009 12:01:20 -0800
Subject: [Buildroot] BR-2009.02-rc3 Make Error (./makedepend: 1: Syntax
	error: Unterminated quoted string)
In-Reply-To: <87wsc49cg5.fsf@macbook.be.48ers.dk>
References: <BAY124-DS4F2AA8AFF4C9516A055FDD2C20@phx.gbl><87d4dyck50.fsf@macbook.be.48ers.dk><1233865636.4148.8.camel@elrond.atmel.com>
	<87wsc49cg5.fsf@macbook.be.48ers.dk>
Message-ID: <BAY124-DS65E8E0F5826810A82D719D2C10@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ok, it seems to build for me - E.G. I cannot reproduce the problem.
Hmm.  I uploaded online the uncompressed log (15MB), and the compressed log 
in 7z (480KB).

UnCompressed : http://www.mediafire.com/file/mhzjfyylqiw/at91sam9261ek.log
Compressed: http://www.mediafire.com/file/vlmztnnulyy/at91sam9261ek.7z

My Computer is a Vanilla Kubuntu 8.10 Machine fully updated and added only
the following packages (mainly for buildroot).  ssh subversion wget patch
build-essential libncurses-dev bison flex texinfo zlib1g-dev gettext
libssl-dev autoconf libacl1-dev liblzo2-dev libpng12-dev libtool
libglib2.0-dev libgtk2.0-bin libgtk2.0-dev apt-file.  I also installed
emacs, eclipse, java.

The exact commands I used to create the attached log are as follows:
$ svn co svn://uclibc.org/trunk/buildroot
$ cd buildroot
$ ln -s /home/dustin/buildroot_dl dl
$ make menuconfig ((SAVE EXIT))
$ make at91sam9261ek_defconfig
$ make menuconfig ((Turned off / change "copy to /tftpboot" in
kernel/bootstrap sections))
$ make make > at91sam9261ek.log 2>&1


Maybe it's Kubuntu 8.10, or maybe it's a package I need that isn't installed
on the machine.  I'm sure the problem is easy to fix by disabling a few of
the packages since the previous at91sam9261ek_defconfig used to compile for
me.  The buildroot-2009.02-rc3.tar.gz does the same as the latest revision
(Revision 25258). 
