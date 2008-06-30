From: Micha Nelissen <micha@neli.hopto.org>
Date: Tue, 01 Jul 2008 00:02:34 +0200
Subject: [Buildroot] libgtk2 configure
Message-ID: <g4bl9h$1o5$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When libgtk2 is configuring it dynamically determines the variable
sys_lib_search_path_spec by using -print-search-dirs. These contain the
staging_dir correctly.

However, afterwards it overwrites it with a default "/usr/lib /lib" in a
"case $host_os" of "linux* | k*bsd*-gnu".

Problem is that when linking it will look at host installed libglib2 etc
which is linked with glibc. It does not look at the cross system root
(staging_dir/ etc.). glibc will conflict with uclibc, so I get all kinds
of strange compile errors (can't find glibc symbols).

Where is the problem? autoconf? libgtk2?

Regards,

Micha
