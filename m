From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 May 2020 12:29:05 +0200
Subject: [Buildroot] Fwd:
 buildroot/outputsupport/dependencies/dependencies.mk:21: target
 'dependencies' does not exist
In-Reply-To: <7D678328-3BF7-40D5-B2A5-C7E8CF806B52@gmail.com>
References: <5ec45209.1c69fb81.c65a5.11fa@mx.google.com>
 <7D678328-3BF7-40D5-B2A5-C7E8CF806B52@gmail.com>
Message-ID: <20200520122905.345b4b05@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 May 2020 22:36:23 -0400
Todd Sampson <sampsonats@gmail.com> wrote:

> > I?m trying to cross-compile MariaDB-connector-c-3.1.8 for use with MySQL 8.19.  I?ve inherited this buildroot environment so I?m not an expert at all.  I?m doing an out of tree build.  In buildroot/packages/usi/MariaDB-connector-c directory are:

Which version of Buildroot are you using ?

> > When I do a build, I get the following: 
> > dfr at cmake:~/m9k/buildroot$ make -w --trace mariadb-connector-c-build
> > make: Entering directory '/home/dfr/m9k/buildroot'
> > Makefile:84: target '_all' does not exist
> > umask 0022 && \
> >            make -C /home/dfr/m9k/buildroot --no-print-directory \
> >                       mariadb-connector-c-build O=/home/dfr/m9k/buildroot/output
> > support/dependencies/dependencies.mk:21: target 'dependencies' does not exist
> > MAKE="/usr/bin/make -j3" DL_TOOLS="bzcat gzip svn xzcat" \
> >            /home/dfr/m9k/buildroot/support/dependencies/dependencies.sh
> > Makefile:81: update target 'mariadb-connector-c-build' due to: _all
> > :
> > make: Leaving directory '/home/dfr/m9k/buildroot'
> >  
> >  
> > If I build MARIADB_CONNECTOR_C_VERSION = 2.3.7, it works
> >  
> > If anyone could give me any hints, I?d appreciate it!

Not clear what is happening here. The error log you have suggest that
there is something fundamentally wrong in your Buildroot
setup/installation, but the fact that your build works with
MARIADB_CONNECTOR_C_VERSION = 2.3.7 invalidates that.

So let's take a step back:

 * What is your Buildroot version ?

 * Without your changes, when you do "make clean all", does it build
   successfully ?

 * Then, when you do your changes, and rebuild just the
   mariadb-connector-c package (make mariadb-connector-c-dirclean all)
   what is the complete log ?

Note: you don't need to use make -w --trace, just "make" will give
enough details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
