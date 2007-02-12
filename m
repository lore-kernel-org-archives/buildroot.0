From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:05 -0800
Subject: [Buildroot] [buildroot 0001103]: Ruby compile breaks on the
	"socket" routine
Message-ID: <6a9b2c8dc262f0f5e1d8a91989f65497@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1103 
====================================================================== 
Reported By:                znmeb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1103
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-25-2006 22:08 PST
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    Ruby compile breaks on the "socket" routine
Description: 
When compiling on an IPV6 aware system, Ruby's configure step enables use
of IPV6 in compiling "socket.c". However, on the Buildroot system, this
compile fails:

make[2]: Leaving directory
`/data1/GenericBuildroot/buildroot/build_i386/ruby-1.8.5/ext/sdbm'
compiling socket

Fatal: --enable-ipv6 is specified, and your OS seems to support IPv6
feature.
But your getaddrinfo() and getnameinfo() are appeared to be broken. 
Sorry,
you cannot compile IPv6 socket classes with broken these functions.
You can try --enable-wide-getaddrinfo.
compiling stringio
make[2]: Entering directory
`/data1/GenericBuildroot/buildroot/build_i386/ruby-1.8.5/ext/stringio'


Adding the line

    --disable-ipv6 \

in the configure step of buildroot/package/ruby/ruby.mk fixes this.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-25-06 22:08  znmeb          New Issue                                    
11-25-06 22:08  znmeb          Status                   new => assigned     
11-25-06 22:08  znmeb          Assigned To               => uClibc          
11-25-06 22:08  znmeb          Issue Monitored: znmeb                       
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
